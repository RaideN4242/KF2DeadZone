class Weap_AutoTurret_DZ extends KFWeap_AutoTurret;

defaultproperties
{
   	AssociatedPerkClasses(0)=class'KFPerk_Support'
	InventorySize=1
	
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Ballistic_AutoTurret_DZ'
	InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'KFDT_Ballistic_AutoTurret_DZ'
	
	WeaponProjectiles(ALTFIRE_FIREMODE)=class'KFProj_Bullet_Pellet'	
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Bullet_Pellet'
	
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_Projectile
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_Projectile
	
	NumPellets(DEFAULT_FIREMODE)=7
	NumPellets(ALTFIRE_FIREMODE)=7
	
}