class DeadZone_PlayerController extends KFPlayerController;

var public  DeadZone_RepInfo RepInfo;
var public  byte MinLevel, MaxLevel;
var public  int  DisconnectTimer;
var public  String HexColorInfo;
var public  String HexColorWarn;
var public  String HexColorError;

var globalconfig int SelectedEmoteIndex;
var globalconfig bool bShowFPLegs;
var private KFGameReplicationInfo KFGRI;

var private bool StatsInitialized;
var private KFGFxWidget_PartyInGame PartyInGameWidget;
var private bool bChatMessageRecieved;

//var private KFOnlineStatsWrite StatsWrite;

replication
{
	if (bNetInitial && Role == ROLE_Authority)
		RepInfo, MinLevel, MaxLevel, DisconnectTimer,
		HexColorInfo, HexColorWarn, HexColorError;
}
/*
state PlayerWalking
{
ignores SeePlayer, HearNoise, Bump;

	function PlayerMove(float DeltaTime)
	{
		local vector			X,Y,Z, NewAccel;
		local eDoubleClickDir	DoubleClickMove;
		local rotator			OldRotation;
		local bool				bSaveJump;

		if (Pawn == None)
		{
			GotoState('Dead');
		}
		else
		{
			GetAxes(Pawn.Rotation,X,Y,Z);
			if (VSZombie(Pawn)!=None)
				VSZombie(Pawn).ModifyPlayerInput(Self,DeltaTime);

			// Update acceleration.
			NewAccel = PlayerInput.aForward*X + PlayerInput.aStrafe*Y;
			NewAccel.Z	= 0;
			NewAccel = Pawn.AccelRate * Normal(NewAccel);

			if (IsLocalPlayerController())
			{
				AdjustPlayerWalkingMoveAccel(NewAccel);
			}

			DoubleClickMove = PlayerInput.CheckForDoubleClickMove(DeltaTime/WorldInfo.TimeDilation);

			// Update rotation.
			OldRotation = Rotation;
			UpdateRotation(DeltaTime);
			bDoubleJump = false;

			if (bPressedJump && Pawn.CannotJumpNow())
			{
				bSaveJump = true;
				bPressedJump = false;
			}
			else
			{
				bSaveJump = false;
			}

			if (Role < ROLE_Authority) // then save this move and replicate it
			{
				ReplicateMove(DeltaTime, NewAccel, DoubleClickMove, OldRotation - Rotation);
			}
			else
			{
				ProcessMove(DeltaTime, NewAccel, DoubleClickMove, OldRotation - Rotation);
			}
			bPressedJump = bSaveJump;
		}
	}
}
*/
simulated function PostBeginPlay()
{
    Super.PostBeginPlay();
    // Добавляем бинд клавиши "O" на команду Camera
    ConsoleCommand("setbind O Camera NewMode");
}

exec function ToggleBehindview()
{
    Camera(PlayerCamera.CameraStyle == 'FirstPerson' ? 'ThirdPerson' : 'FirstPerson');
}

reliable server function ServerCamera(name NewMode)
{
    if (NewMode == '1st')
        NewMode = 'FirstPerson';
    else if (NewMode == '3rd')
        NewMode = 'ThirdPerson';
    SetCameraMode(NewMode);
}

exec function Camera(name NewMode)
{
    ServerCamera(PlayerCamera.CameraStyle == 'FirstPerson' ? 'ThirdPerson' : 'FirstPerson');
}

function AddDefaultCommand(name Key, string Command)
{
    local int i;
    local PlayerInput IN;

    IN = PlayerInput;

    // Проверяем, есть ли уже бинд для этой клавиши
    for (i = 0; i < IN.Bindings.Length; ++i)
    {
        if (IN.Bindings[i].Name == Key)
        {
            IN.Bindings[i].Command = Command;
            return;
        }
    }

    // Если бинда нет, добавляем новый
    IN.Bindings.Add(1);
    IN.Bindings[IN.Bindings.Length - 1].Name = Key;
    IN.Bindings[IN.Bindings.Length - 1].Command = Command;
}

simulated final function ToggleFPBody(bool bEnable)
{
	bShowFPLegs = bEnable;
	Class'DeadZone_PlayerController'.Default.bShowFPLegs = bEnable;

	if (DeadZone_KFPawn_Human(Pawn)!=None)
		DeadZone_KFPawn_Human(Pawn).UpdateFPLegs();
}

public simulated event PreBeginPlay()
{
	super.PreBeginPlay();
}

private simulated function KFGameReplicationInfo GetKFGRI()
{
	if (KFGRI == None)
	{
		KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
	}
	
	return KFGRI;
}

private simulated function SetPartyInGameWidget()
{
	if (MyGFxManager == None) return;
	if (MyGFxManager.PartyWidget == None) return;
	
	PartyInGameWidget = KFGFxWidget_PartyInGame(MyGFxManager.PartyWidget);
}

private simulated function bool CheckPartyInGameWidget()
{
	if (PartyInGameWidget == None)
	{
		SetPartyInGameWidget();
	}
	
	return (PartyInGameWidget != None);
}

private simulated function HideReadyButton()
{
	if (CheckPartyInGameWidget())
	{
		PartyInGameWidget.SetReadyButtonVisibility(false);
	}
}

private simulated function ShowReadyButton()
{
	if (CheckPartyInGameWidget())
	{
		PartyInGameWidget.SetReadyButtonVisibility(true);
		PartyInGameWidget.UpdateReadyButtonText();
		PartyInGameWidget.UpdateReadyButtonVisibility();
	}
}

private simulated function NoPerkDisconnect()
{
	if (CheckPartyInGameWidget())
	{
		if (!bChatMessageRecieved)
		{
			RepInfo.WriteToChatLocalized(
				DeadZone_NoPerksDisconnect,
				HexColorError,
				String(DisconnectTimer));
			bChatMessageRecieved = true;
		}
		
		if (DisconnectTimer-- <= 0)
		{
			ClearTimer(nameof(HideReadyButton));
			ClearTimer(nameof(NoPerkDisconnect));
			ClientWasKicked();
		}
	}
}

private simulated function PerksLocked()
{
	if (CheckPartyInGameWidget() && !bChatMessageRecieved)
	{
		ClearTimer(nameof(PerksLocked));
		RepInfo.WriteToChatLocalized(
			DeadZone_UnsuitablePerksLocked,
			HexColorWarn);
		bChatMessageRecieved = true;
	}
}

public simulated function OnStatsInitialized(bool bWasSuccessful)
{
	Super.OnStatsInitialized(bWasSuccessful);
	StatsInitialized = true;
	RequestPerkChange(CheckCurrentPerkAllowed());
}

public reliable server function ServerHidePerks()
{
	HidePerks();
	ClientHidePerks();
}

private reliable client function ClientHidePerks()
{
	HidePerks();
}

private simulated function HidePerks()
{
	local int Index;

	if (GetKFGRI() == None)
	{
		SetTimer(0.1f, false, nameof(HidePerks));
		return;
	}

	for (Index = PerkList.length - 1; Index >= 0; --Index)
	{
		if (!KFGRI.IsPerkAllowed(PerkList[Index].PerkClass))
		{
			PerkList.Remove(Index, 1);
		}
	}
	
	SavedPerkIndex = CheckCurrentPerkAllowed();
}

public simulated function byte CheckCurrentPerkAllowed()
{
	local PerkInfo Perk;
	
	if (SavedPerkIndex >= PerkList.length || !IsPerkAllowed(PerkList[SavedPerkIndex]))
	{
		SavedPerkIndex = 0;
		for (SavedPerkIndex = 0; SavedPerkIndex < PerkList.length; SavedPerkIndex++)
		{
			if (IsPerkAllowed(PerkList[SavedPerkIndex]))
			{
				break;
			}
		}
	}

	if (SavedPerkIndex >= PerkList.length)
	{
		SavedPerkIndex = 0;
		if (StatsInitialized && ROLE < ROLE_Authority)
		{
			SetTimer(0.1f, true, nameof(HideReadyButton));
			SetTimer(1.0f, true, nameof(NoPerkDisconnect));
		}
	}
	else if (StatsInitialized && ROLE < ROLE_Authority)
	{
		foreach PerkList(Perk)
		{
			if (!IsPerkAllowed(Perk))
			{
				SetTimer(1.0f, true, nameof(PerksLocked));
				break;
			}
		}
	}

	return SavedPerkIndex;
}

public simulated function bool IsPerkAllowed(PerkInfo Perk)
{
	local bool PerkAllowed;

	PerkAllowed = true;
	
	if (GetKFGRI() != None)
	{
		PerkAllowed = KFGRI.IsPerkAllowed(Perk.PerkClass);
	}
	
	return (PerkAllowed && Perk.PerkLevel >= MinLevel && Perk.PerkLevel <= MaxLevel);
}

public simulated function InitPerkLoadout()
{
	if (CurrentPerk == None) // Problem here: it is NONE for some reason
	{
		CurrentPerk = GetPerk(); // even after that
		// dunno where and how it is initialized
		// and why it dont happened now
	}
		
	Super.InitPerkLoadout();
}

simulated event name GetSeasonalStateName()
{
    local int EventId, MapModifiedEventId;
	local KFMapInfo KFMI;

	MapModifiedEventId = SEI_Winter; 
	
	KFMI = KFMapInfo(WorldInfo.GetMapInfo());
	if (KFMI != none)
	{
		KFMI.ModifySeasonalEventId(MapModifiedEventId);
	}
	
    // Принудительно устанавливаем режим ивента "Зима"
    EventId = SEI_Winter;

    switch (EventId % 10)
    {
        case SEI_Summer:
            `Log("GetSeasonalStateName: Summer");
            return 'Summer_Sideshow';
        case SEI_Fall:
            `Log("GetSeasonalStateName: Fall");
            return 'Fall';
        case SEI_Winter:
            `Log("GetSeasonalStateName: Winter");
            return 'Winter';
        case SEI_Spring:
            `Log("GetSeasonalStateName: Spring");
            return 'Spring';
        default:
            `Log("GetSeasonalStateName: No Event");
            return 'No_Event';
    }

    return 'No_Event';
}

static function int GetSeasonalEventIDForZedSkins()
{
    // Принудительно возвращаем зимний ивент
    return SEI_Winter;
}
/*
simulated function CheckSpecialEventID()
{
    //Don't cache the actual value until we have all the right set of valid data
    if( class'KFGameEngine'.static.GetSeasonalEventID() >= 1 )
    {
        StatsWrite.UpdateSpecialEventState();
    }
	else
	{
		SetTimer(RefreshObjectiveUITime, false, 'CheckSpecialEventID');
	}
}
*/
defaultproperties
{
	StatsInitialized     = false
	bChatMessageRecieved = false
	bAllowSeasonalSkins = true
	DisconnectTimer      = 15
	MinLevel             = 0
	MaxLevel             = 25
	
	HexColorInfo         = "0000FF"
	HexColorWarn         = "FFFF00"
	HexColorError        = "FF0000"
}