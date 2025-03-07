class KFWeap_Shotgun_MB500_DZ extends KFWeap_Shotgun_MB500;

// Переменные для хранения новых текстур
var repnotify MaterialInstanceConstant FirstPersonMIC;
var repnotify MaterialInstanceConstant ThirdPersonMIC;
var repnotify MaterialInstanceConstant PickupMIC;
// Переменная для хранения ссылки на пикап
var KFDroppedPickup DroppedPickup;

replication
{
    if (bNetDirty)
        FirstPersonMIC, ThirdPersonMIC, PickupMIC;
}

simulated event ReplicatedEvent(name VarName)
{
    if (VarName == 'FirstPersonMIC' || VarName == 'ThirdPersonMIC' || VarName == 'PickupMIC')
    {
        ApplyCustomTextures();
    }
    else
    {
        super.ReplicatedEvent(VarName);
    }
}

simulated event PostBeginPlay()
{
    super.PostBeginPlay();

    // Загрузка новых текстур
    FirstPersonMIC = MaterialInstanceConstant'WEP_SkinSet03_MAT.emergencyissue_mb500.EmergencyIssue_MB500_1P_Mint_MIC';
    ThirdPersonMIC = MaterialInstanceConstant'WEP_SkinSet03_MAT.emergencyissue_mb500.EmergencyIssue_MB500_3P_Mint_MIC';
    PickupMIC = MaterialInstanceConstant'WEP_SkinSet03_MAT.emergencyissue_mb500.EmergencyIssue_MB500_3P_Pickup_MIC';

    // Применение текстур к компонентам
    ApplyCustomTextures();
}

simulated function ApplyCustomTextures()
{
 //   local SkeletalMeshComponent TempMeshComp;

    // Применение текстур для первого лица
    if (FirstPersonMIC != none)
    {
        Mesh.SetMaterial(0, FirstPersonMIC);
    }

    // Применение текстур для третьего лица
    if (ThirdPersonMIC != none && AttachmentArchetype != none)
    {
        AttachmentArchetype.WeapMesh.SetMaterial(0, ThirdPersonMIC);
    }

    // Применение текстур для пикапа
    if (PickupMIC != none && DroppedPickup != none)
    {
        DroppedPickup.SetPickupSkin(0, true); // Используем существующую функцию для применения скина
    }
}
// Функция для инициализации DroppedPickup
simulated function SetDroppedPickup(KFDroppedPickup NewDroppedPickup)
{
    DroppedPickup = NewDroppedPickup;
	ApplyCustomTextures();
}


simulated function AttachWeaponTo(SkeletalMeshComponent MeshCpnt, optional Name SocketName)
{
    super.AttachWeaponTo(MeshCpnt, SocketName);

    // Применение текстур для третьего лица
    if (ThirdPersonMIC != none && AttachmentArchetype != none)
    {
        AttachmentArchetype.WeapMesh.SetMaterial(0, ThirdPersonMIC);
    }
}


defaultproperties
{
    NetUpdateFrequency=100.0 /// для SkinID
	// Inventory
	InventorySize=5
	GroupPriority=25
	WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_Mossberg'
    // FOV
	MeshIronSightFOV=52
    PlayerIronSightFOV=70

	// Depth of field
	DOF_FG_FocalRadius=95
	DOF_FG_MaxNearBlurSize=3.5

	// Zooming/Position
	PlayerViewOffset=(X=8.0,Y=8.0,Z=-3.5)
	IronSightPosition=(X=9.5,Y=-0.29,Z=0)

	// Content
	PackageKey="MB500"
	FirstPersonMeshName="WEP_1P_MB500_MESH.Wep_1stP_MB500_Rig"
	FirstPersonAnimSetNames(0)="WEP_1P_MB500_ANIM.Wep_1st_MB500_Anim_New"
	PickupMeshName="WEP_3P_MB500_MESH.Wep_MB500_Pickup"
	AttachmentArchetypeName="WEP_MB500_ARCH.Wep_MB500_3P"
	MuzzleFlashTemplateName="WEP_MB500_ARCH.Wep_MB500_MuzzleFlash"

	// DEFAULT_FIREMODE
	FireModeIconPaths(DEFAULT_FIREMODE)="ui_firemodes_tex.UI_FireModeSelect_ShotgunSingle"
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_Projectile
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Bullet_Pellet'
	InstantHitDamage(DEFAULT_FIREMODE)=20.0
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_MB500'
	PenetrationPower(DEFAULT_FIREMODE)=2.0
	FireInterval(DEFAULT_FIREMODE)=0.77 // 78 RPM
	FireOffset=(X=30,Y=3,Z=-3)
	// Shotgun
	NumPellets(DEFAULT_FIREMODE)=7

	// ALT_FIREMODE
	FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_ShotgunSingle'
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_None

	// BASH_FIREMODE
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_MB500'
	InstantHitDamage(BASH_FIREMODE)=25

	// Fire Effects
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_MB500.Play_WEP_SA_MB500_Fire_M', FirstPersonCue=AkEvent'WW_WEP_SA_MB500.Play_WEP_SA_MB500_Fire_S')
    WeaponFireSnd(ALTFIRE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_MB500.Play_WEP_SA_MB500_Fire_M', FirstPersonCue=AkEvent'WW_WEP_SA_MB500.Play_WEP_SA_MB500_Fire_S')

    // using M4 dry fire sound. this is intentional.
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_M4.Play_WEP_SA_M4_Handling_DryFire'
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_SA_M4.Play_WEP_SA_M4_Handling_DryFire'

	// Attachments
	bHasIronSights=true
	bHasFlashlight=true

	// Ammo
	MagazineCapacity[0]=12
	SpareAmmoCapacity[0]=78
	InitialSpareMags[0]=3
	bCanBeReloaded=true
	bReloadFromMagazine=false

	// Recoil
	maxRecoilPitch=900
	minRecoilPitch=775
	maxRecoilYaw=500
	minRecoilYaw=-500
	RecoilRate=0.085
	RecoilBlendOutRatio=0.35
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=1500
	RecoilMinPitchLimit=64785
	RecoilISMaxYawLimit=50
	RecoilISMinYawLimit=65485
	RecoilISMaxPitchLimit=500
	RecoilISMinPitchLimit=65485
	RecoilViewRotationScale=0.8
	FallingRecoilModifier=1.5
	HippedRecoilModifier=1.25

	AssociatedPerkClasses(0)=class'KFPerk_Support'

	WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Heavy_Recoil_SingleShot'

	// Weapon Upgrade stat boosts
	//WeaponUpgrades[1]=(IncrementDamage=1.25f,IncrementWeight=1)
	//WeaponUpgrades[2]=(IncrementDamage=1.5f,IncrementWeight=2)
	//WeaponUpgrades[3]=(IncrementDamage=1.75f,IncrementWeight=3)
	//WeaponUpgrades[4]=(IncrementDamage=2.0f,IncrementWeight=4)

	WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.25f), (Stat=EWUS_Weight, Add=1)))
	WeaponUpgrades[2]=(Stats=((Stat=EWUS_Damage0, Scale=1.5f), (Stat=EWUS_Weight, Add=2)))
	WeaponUpgrades[3]=(Stats=((Stat=EWUS_Damage0, Scale=1.75f), (Stat=EWUS_Weight, Add=3)))
	WeaponUpgrades[4]=(Stats=((Stat=EWUS_Damage0, Scale=2.0f), (Stat=EWUS_Weight, Add=4)))
}