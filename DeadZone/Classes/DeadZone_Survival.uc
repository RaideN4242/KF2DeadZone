class DeadZone_Survival extends KFGameInfo_Survival;

const GIC = "KFGameContent.KFGameInfo_Survival";

var public IDeadZone_GameInfo GI;
var public IDeadZone          DeadZone;
var public E_LogLevel      LogLevel;

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
/*
simulated function PostBeginPlay()
{
    Super.PostBeginPlay();

    // Подмена значения в дефолте исходников игры
    class'KFGame.KFPerk_Support'.default.PrimaryWeaponDef = class'DeadZone.KFWeapDef_MB500_DZ';
}
*/
defaultproperties
{
	KFGFxManagerClass = class'DeadZone_GFxMoviePlayer_Manager'
	
		// Normal Wave
	LateArrivalStarts(1)={(
		StartingDosh[0]=1500,	//450
		StartingDosh[1]=1700,	//600
		StartingDosh[2]=1800,	//750
		StartingDosh[3]=2000,	//800
		StartingDosh[4]=2200,	//1100
		StartingDosh[5]=2400,	//1400
		StartingDosh[6]=2600,	//1500
		StartingDosh[7]=3000	//1600
	)}
	
	MaxRespawnDosh(0)=2000.f // Normal
	MaxRespawnDosh(1)=2500.f // Hard
	MaxRespawnDosh(2)=3000.f // Suicidal  //1550
	MaxRespawnDosh(3)=3500.f // Hell On Earth //1000.0
	
	SpawnManagerClasses(0)=class'KFGame.KFAISpawnManager_Short'
	SpawnManagerClasses(1)=class'DeadZone.KFAISpawnManager_Normal_DZ'
	SpawnManagerClasses(2)=class'KFGame.KFAISpawnManager_Long'
}
