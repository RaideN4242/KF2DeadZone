class WeapDef_AutoTurret_DZ extends KFWeapDef_AutoTurret
	abstract;

static function String GetItemLocalization(String KeyName)
{
	return class'KFGame.KFWeapDef_AutoTurret'.static.GetItemLocalization(KeyName);
}

defaultproperties
{
	SharedUnlockId  = SCU_None
	WeaponClassPath = "DeadZone.Weap_AutoTurret_DZ"
}