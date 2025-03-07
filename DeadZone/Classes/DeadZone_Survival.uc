class DeadZone_Survival extends KFGameInfo_Survival;

const GIC = "KFGameContent.KFGameInfo_Survival";

var public IDeadZone_GameInfo GI;
var public IDeadZone          DeadZone;
var public E_LogLevel      LogLevel;

var config bool bThrowAllWeaponsOnDead;
/*
function RespawnDeadPlayers()
{
    local DeadZone_KFPawn_Human KFPH;

    foreach WorldInfo.AllPawns(class'DeadZone_KFPawn_Human', KFPH)
    {
        if (KFPH.bPendingRespawn && KFPH.Health <= 0)
        {
            // Оживляем игрока
            KFPH.Health = KFPH.HealthMax;
            KFPH.bPendingRespawn = false;
        }
    }
}

function int GetLivingPlayerCount()
{
    local Controller P;
    local int UsedLivingHumanPlayersCount;

`if(`notdefined(ShippingPC))
    if ( ForcedNumLivingPlayers != 0 )
    {
        return ForcedNumLivingPlayers;
    }
`endif

    foreach WorldInfo.AllControllers(class'Controller', P)
    {
        if( P != none && 
            P.Pawn != none && 
            P.Pawn.IsAliveAndWell() && 
            P.GetTeamNum() != 255 && 
            !IsRecentZed(P.Pawn)) // Добавлено условие для игнорирования VS_ZedRecentZed, VS_ZedClotBase и VSZombie
        {
            UsedLivingHumanPlayersCount++;
        }
    }

    //`log(GetFuncName()$" Player alive count: "$UsedLivingHumanPlayersCount);

    return UsedLivingHumanPlayersCount;
}

function int NumPlayers()
{
    local int Count;
    local Controller C;

    Count = 0;
    foreach WorldInfo.AllControllers(class'Controller', C)
    {
        if (C.bIsPlayer && C.PlayerReplicationInfo != None && !C.PlayerReplicationInfo.bOutOfLives && C.Pawn != None && !IsRecentZed(C.Pawn))
        {
            Count++;
        }
    }

    return Count;
}

// Функция для проверки, является ли перерожденный игрок
function bool IsRecentZed(Pawn P)
{
    return VS_ZedRecentZed(P) != None || VS_ZedClotBase(P) != None || VSZombie(P) != None;
}

*/

simulated function PostBeginPlay()
{
    Super.PostBeginPlay();
    // Добавляем бинд клавиши "O" на команду Camera
    ConsoleCommand("setbind O Camera NewMode");
}


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

protected function DistributeMoneyAndXP(class<KFPawn_Monster> MonsterClass, const out Array<DamageInfo> DamageHistory, Controller Killer)
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

    // Проверка на DeadZoneGameReplicationInfo(MyKFGRI)
    if (DeadZoneGameReplicationInfo(MyKFGRI) != none)
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
	

    
    // Normal Wave /// деньги для опоздавших игроков
    LateArrivalStarts(1)={(
        StartingDosh[0]=1500, //450
        StartingDosh[1]=1700, //600
        StartingDosh[2]=1800, //750
        StartingDosh[3]=2000, //800
        StartingDosh[4]=2200, //1100
        StartingDosh[5]=2400, //1400
        StartingDosh[6]=2600, //1500
        StartingDosh[7]=3000  //1600
    )}
    
    MaxRespawnDosh(0)=2000.f // Normal
    MaxRespawnDosh(1)=2500.f // Hard
    MaxRespawnDosh(2)=3000.f // Suicidal  //1550
    MaxRespawnDosh(3)=3500.f // Hell On Earth //1000.0
	
	AllowSeasonalSkinsIndex=0 // 0 - enable
	SeasonalSkinsIndex=1
    
    SpawnManagerClasses(0)=class'KFGame.KFAISpawnManager_Short'
    SpawnManagerClasses(1)=class'DeadZone.KFAISpawnManager_Normal_DZ'
    SpawnManagerClasses(2)=class'KFGame.KFAISpawnManager_Long'
    GameReplicationInfoClass=class'DeadZoneGameReplicationInfo'
	PlayerReplicationInfoClass=Class'DeadZone_PlayerReplicationInfo'
	DefaultPawnClass=class'DeadZone_KFPawn_Human'
	CustomizationPawnClass=class'DeadZone.DeadZone_KFPawn_Customization'
	PlayerControllerClass=class'DeadZone.DeadZone_PlayerController'
	
//	HUDType=class'KFGame.KFGFXHudWrapper' //HUD в игре
	
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