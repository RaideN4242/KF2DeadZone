class DeadZone_Endless extends KFGameInfo_Endless;

const GIC = "KFGameContent.KFGameInfo_Endless";

var public IDeadZone_GameInfo GI;
var public IDeadZone          DeadZone;
var public E_LogLevel      LogLevel;

var config bool bThrowAllWeaponsOnDead;

public simulated function ExileServerUsingKickBan()
{
	`Log_Trace();
	
	return;
}

public function UpdateGameSettings()
{
	`Log_Trace();
	
	if (GI != None)
	{
		GI.UpdateGameSettings(Self, GIC, DeadZone, bIsCustomGame, !IsUnrankedGame());
	}
}

protected function DistributeMoneyAndXP(class<KFPawn_Monster> MonsterClass, const out array<DamageInfo> DamageHistory, Controller Killer)
{
	`Log_Trace();
	
	Super.DistributeMoneyAndXP(DeadZone == None ? MonsterClass : DeadZone.PickProxyZed(MonsterClass), DamageHistory, Killer);
}

function PlayerController GetLocalPlayerController()
{
    local PlayerController PC;

    foreach WorldInfo.AllControllers(class'PlayerController', PC)
    {
        if (PC.IsLocalPlayerController())
        {
            return PC;
        }
    }

    return None;
}
/// выбрасываем всё оружие из инвентаря после смерти
function bool PreventDeath(Pawn Killed, Controller Killer, class<DamageType> DamageType, Vector HitLocation)
{
    local KFPawn_Human KFPH;
    local KFWeapon KFW;

    if (super(GameInfo).PreventDeath(Killed, Killer, DamageType, HitLocation))
    {
        return true;
    }

    KFPH = KFPawn_Human(Killed);

    if (bThrowAllWeaponsOnDead)
    {
        if (Role == ROLE_Authority && KFPH != none && KFPH.InvManager != none)
        {
            foreach KFPH.InvManager.InventoryActors(class'KFGame.KFWeapon', KFW)
            {
                if (KFW != none && KFW.bDropOnDeath && KFW.CanThrow())
                {
                    KFPH.TossInventory(KFW);
                }
            }
        }
    }

    return false;
}
// сигнализируем о том, что открыты все двери торговца
function NotifyTraderOpened()
{
    local KFTraderTrigger Trader;

    super.NotifyTraderOpened();

    // Открываем все двери торговца
    foreach DynamicActors(Class'KFGame.KFTraderTrigger', Trader)
    {
        if (Trader != none)
        {
            Trader.OpenTrader();
            Trader.HideTraderPath();
        }
    }

    // Проверка на DeadZoneGameReplicationInfo_Endless(MyKFGRI)
    if (DeadZoneGameReplicationInfo_Endless(MyKFGRI) != none)
    {
        DrawLocalizedMessage("ALL TRADERS ARE OPENED!", 5.0000000); // сообщение появляется на 5 секунд.
    }
}

function DrawLocalizedMessage(coerce string Message, float DisplayTime)
{
    local KFPlayerController KFPC;

    foreach WorldInfo.AllControllers(Class'KFGame.KFPlayerController', KFPC)
    {
        KFPC.DrawLocalizedTextOnHud(Message, DisplayTime);
    }
}

unreliable client simulated function ClientDrawLocalizedMessage(KFPlayerController KFPC, coerce string Message, float DisplayTime)
{
    KFPC.DrawLocalizedTextOnHud(Message, DisplayTime);
}


/**
 * Override the GetSeasonalEventIDForZedSkins method to always return SEI_Winter.
 */
static function int GetSeasonalEventIDForZedSkins()
{
    return SEI_Winter;
}

/**
 * Set EventId to 1 if the current seasonal event is not winter.
 */
function int GetEventId()
{
    local int SeasonalEventID;

    SeasonalEventID = class'KFGameEngine'.static.GetSeasonalEventIDForZedSkins();

    if (SeasonalEventID != SEI_Winter)
    {
        return 1;
    }

    return SeasonalEventID;
}


defaultproperties
{
	KFGFxManagerClass = class'DeadZone_GFxMoviePlayer_Manager'
	
	bIsEndlessGame = true
	bIsInHoePlus=true
	
	    // Normal Wave
    LateArrivalStarts(1)={(
        StartingDosh[0]=2500,
        StartingDosh[1]=2500,
        StartingDosh[2]=2500,
        StartingDosh[3]=2500,
        StartingDosh[4]=2500,
        StartingDosh[5]=2500,
        StartingDosh[6]=2500,
        StartingDosh[7]=2500 
    )}
    
    MaxRespawnDosh(0)=2000.f // Normal
    MaxRespawnDosh(1)=2500.f // Hard
    MaxRespawnDosh(2)=3000.f // Suicidal  //1550
    MaxRespawnDosh(3)=3500.f // Hell On Earth //1000.0
    MaxRespawnDosh(4)=3500.f // Hell On Earth Plus //1000.0
	
	GameReplicationInfoClass=class'DeadZone.DeadZoneGameReplicationInfo_Endless'
	PlayerReplicationInfoClass=Class'DeadZone.DeadZone_PlayerReplicationInfo'
	DefaultPawnClass=class'DeadZone.DeadZone_KFPawn_Human'
	CustomizationPawnClass=class'DeadZone.DeadZone_KFPawn_Customization'
	PlayerControllerClass=class'DeadZone.DeadZone_PlayerController'	
	
	

	SpawnManagerClasses(0)=class'KFGameContent.KFAISpawnManager_Endless'

	OutbreakEventClass=class'KFOutbreakEvent_Endless'

	TraderVoiceGroupClass=class'KFGameContent.KFTraderVoiceGroup_Patriarch' //plays patty VO for trader

	DifficultyInfoClass = class'DeadZone_KFGameDifficulty_Endless'
	DifficultyInfoConsoleClass = class'KFGameDifficulty_Endless_Console'

	SpecialWaveStart=6
	OutbreakWaveStart=6

	SpecialWaveTypes(0)=AT_Clot
	SpecialWaveTypes(1)=AT_SlasherClot
	SpecialWaveTypes(2)=AT_Crawler
	SpecialWaveTypes(3)=AT_Stalker
	SpecialWaveTypes(4)=AT_Siren
	SpecialWaveTypes(5)=AT_Husk
	SpecialWaveTypes(6)=AT_Scrake
	SpecialWaveTypes(7)=AT_AlphaClot
	SpecialWaveTypes(8)=AT_GoreFast
	SpecialWaveTypes(9)=AT_Bloat
	SpecialWaveTypes(10)=AT_FleshPound

	bSplitBossDoshReward=false

 	`if(`__TW_)
	// @note: this could be be done in the config (GameInfoClassAliases is normally config),
	// but then we have to mess with ini patching, etc... so just do it here.
	GameInfoClassAliases.Add((ShortName="BenchMark", GameClassName="KFGameContent.KFGameInfo_BenchMark"))
	GameInfoClassAliases.Add((ShortName="Survival", GameClassName="DeadZone.DeadZone_Survival"))
	GameInfoClassAliases.Add((ShortName="Versus", GameClassName="DeadZone.DeadZone_VersusSurvival"))
    GameInfoClassAliases.Add((ShortName="Weekly", GameClassName="DeadZone.DeadZone_WeeklySurvival"))
	GameInfoClassAliases.Add((ShortName="Tutorial", GameClassName="KFGameContent.KFGameInfo_Tutorial"))
	GameInfoClassAliases.Add((ShortName="Endless", GameClassName="DeadZone.DeadZone_Endless"))
	GameInfoClassAliases.Add((ShortName="Objective", GameClassName="DeadZone.DeadZone_Objective"))
`endif
}
