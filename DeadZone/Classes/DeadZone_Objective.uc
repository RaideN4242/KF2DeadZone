class DeadZone_Objective extends KFGameInfo_Objective;

const GIC = "KFGameContent.KFGameInfo_Objective";

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

protected function DistributeMoneyAndXP(class<KFPawn_Monster> MonsterClass, const out array<DamageInfo> DamageHistory, Controller Killer)
{
	`Log_Trace();
	
	Super.DistributeMoneyAndXP(DeadZone == None ? MonsterClass : DeadZone.PickProxyZed(MonsterClass), DamageHistory, Killer);
}

defaultproperties
{
	KFGFxManagerClass = class'DeadZone_GFxMoviePlayer_Manager'
}
