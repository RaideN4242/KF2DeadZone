class DeadZone_WeeklySurvival extends KFGameInfo_WeeklySurvival;

const GIC = "KFGameContent.KFGameInfo_WeeklySurvival";

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
        DrawLocalizedMessage("ALL TRADERS ARE OPENED!", 5.0000000);
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

defaultproperties
{
	KFGFxManagerClass = class'DeadZone_GFxMoviePlayer_Manager'
	
	    
    // Normal Wave
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
    
    SpawnManagerClasses(0)=class'KFGame.KFAISpawnManager_Short'
    SpawnManagerClasses(1)=class'DeadZone.KFAISpawnManager_Normal_DZ'
    SpawnManagerClasses(2)=class'KFGame.KFAISpawnManager_Long'
    GameReplicationInfoClass=class'DeadZoneGameReplicationInfo'
//	DefaultPawnClass=class'KFGame.KFPawn_Human'
//	CustomizationPawnClass=class'DeadZone.KFPawn_Customization_DZ'
	
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
