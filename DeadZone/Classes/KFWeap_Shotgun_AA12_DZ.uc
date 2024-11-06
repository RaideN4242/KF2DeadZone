class KFWeap_Shotgun_AA12_DZ extends KFWeap_Shotgun_AA12; // config(DeadZone_weapons);

// ID скина, который мы хотим применить
var int SkinId;

// Функция для применения скина
simulated function ApplySkin()
{
    local array<MaterialInterface> SkinMaterials;
    local int i;

    // Проверяем, есть ли скин с таким ID
    if (SkinId > 0)
    {
        // Получаем материалы для первого лица
        SkinMaterials = class'KFWeaponSkinList'.static.GetWeaponSkin(SkinId, WST_FirstPerson);

        // Применяем материалы к оружию для первого лица
        if (SkinMaterials.Length > 0)
        {
            for (i = 0; i < SkinMaterials.Length; i++)
            {
                WeaponMICs[i].SetParent(SkinMaterials[i]);
            }
        }

        // Получаем материалы для третьего лица
        SkinMaterials = class'KFWeaponSkinList'.static.GetWeaponSkin(SkinId, WST_ThirdPerson);

        // Применяем материалы к оружию для третьего лица
        if (SkinMaterials.Length > 0 && AttachmentArchetype != none)
        {
            for (i = 0; i < SkinMaterials.Length; i++)
            {
                AttachmentArchetype.WeapMesh.SetMaterial(i, SkinMaterials[i]);
            }
        }
	////	 SetWeaponSkin(SkinId);///// игра крашится, поэтому отключаем параметр здесь.
    }
}

// Вызываем функцию при инициализации оружия
simulated event PostBeginPlay()
{
    super.PostBeginPlay();

    // Устанавливаем ID скина
    SkinId = 3058;
}

// Переопределяем функцию для присоединения оружия к персонажу
simulated function AttachWeaponTo(SkeletalMeshComponent MeshCpnt, optional Name SocketName)
{
    super.AttachWeaponTo(MeshCpnt, SocketName);

    // Применяем скин после присоединения оружия к персонажу
    ApplySkin();
}

simulated function AttachTo(KFPawn P)
{
    local KFWeaponAttachment AttachmentTemplate;

    // Получаем шаблон оружия
    AttachmentTemplate = GetWeaponAttachmentTemplate();

    // Проверяем, что шаблон оружия доступен
    if (AttachmentTemplate != none)
    {
        // Вызываем функцию AttachTo из KFWeaponAttachment
        AttachmentTemplate.AttachTo(P);
    }

    // Применяем скин
    ApplySkin();
}

// Переопределяем функцию для присоединения третьего лица оружия к персонажу
simulated function AttachThirdPersonWeapon(KFPawn P)
{
    super.AttachThirdPersonWeapon(P);

    // Применяем скин после присоединения третьего лица оружия к персонажу
    ApplySkin();
}

// Переопределяем функцию для получения шаблона оружия
simulated function KFWeaponAttachment GetWeaponAttachmentTemplate()
{
    local KFWeaponAttachment AttachmentTemplate;

    AttachmentTemplate = super.GetWeaponAttachmentTemplate();

    // Применяем скин к шаблону оружия
    if (AttachmentTemplate != none)
    {
        AttachmentTemplate.SetWeaponSkin(SkinId);
    }

    ApplySkin();

    return AttachmentTemplate;
}

simulated event SetWeapon()
{
	super.SetWeapon();
	  ApplySkin();
}

reliable client function ClientWeaponSet(bool bOptionalSet, optional bool bDoNotActivate)
{
	if (WeaponContentLoaded)
	{
		SetWeapon();
		ApplySkin();
	}
	SetOnContentLoad = true;

	Super.ClientWeaponSet(bOptionalSet, bDoNotActivate);

	if (MedicComp != none)
	{
		MedicComp.OnClientWeaponSet();
	}
}

simulated function SetWeaponSkin(int ItemId, optional bool bFinishedLoading = false)
{
    local KFWeaponAttachment AttachmentTemplate;

    // Получаем шаблон оружия
    AttachmentTemplate = GetWeaponAttachmentTemplate();

    // Проверяем, что шаблон оружия доступен
    if (AttachmentTemplate != none)
    {
        // Вызываем функцию SetWeaponSkin из KFWeaponAttachment
        AttachmentTemplate.SetWeaponSkin(ItemId, bFinishedLoading);
    }
	 ApplySkin();
}

// Переопределяем функцию для изменения видимости оружия
simulated function ChangeVisibility(bool bIsVisible)
{
    super.ChangeVisibility(bIsVisible);

    // Применяем скин после изменения видимости оружия
    ApplySkin();
}

simulated function Timer_UpdateWeaponSkin()
{
	super.Timer_UpdateWeaponSkin();
	ApplySkin();
}

// Реплицируем событие при изменении SkinId
replication
{
    if (bNetDirty && Role == ROLE_Authority)
        SkinId;		    
}

// Обрабатываем реплицированное событие
simulated event ReplicatedEvent(name VarName)
{
    if (VarName == 'SkinId')
    {
        ApplySkin();
    }
    else
    {
        super.ReplicatedEvent(VarName);
    }
}

defaultproperties
{
	// Inventory
	InventorySize=8
	GroupPriority=100
	WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_AA12'
	
    NetUpdateFrequency=100.0 /// для SkinID
	
	// Shooting Animations
	FireSightedAnims[0]=Shoot_Iron
	FireSightedAnims[1]=Shoot_Iron2
	FireSightedAnims[2]=Shoot_Iron3

     // FOV
 	MeshFOV=86
	MeshIronSightFOV=52
    PlayerIronSightFOV=70

	// Depth of field
	DOF_FG_FocalRadius=85
	DOF_FG_MaxNearBlurSize=3.5

	// Zooming/Position
	PlayerViewOffset=(X=15.0,Y=8.5,Z=0.0)
	IronSightPosition=(X=8,Y=0,Z=0)

	// Content
	PackageKey="AA12"
	FirstPersonMeshName="Wep_1P_AA12_MESH.Wep_1stP_AA12_Rig"
	FirstPersonAnimSetNames(0)="Wep_1P_AA12_ANIM.Wep_1stP_AA12_Anim"
	PickupMeshName="WEP_3P_AA12_MESH.Wep_AA12_Pickup"
	AttachmentArchetypeName="WEP_AA12_ARCH.Wep_AA12_3P"
	MuzzleFlashTemplateName="WEP_AA12_ARCH.Wep_AA12_MuzzleFlash"

	// DEFAULT_FIREMODE
	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_ShotgunAuto'
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_Projectile
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Bullet_Pellet'
	InstantHitDamage(DEFAULT_FIREMODE)=20.0 //25 //20
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_AA12Shotgun'
	PenetrationPower(DEFAULT_FIREMODE)=2.0
	FireInterval(DEFAULT_FIREMODE)=0.2 // 300 RPM
	FireOffset=(X=30,Y=5,Z=-4)
	// Shotgun
	NumPellets(DEFAULT_FIREMODE)=7

	// ALT_FIREMODE
	FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_ShotgunSingle'
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_Projectile
	WeaponProjectiles(ALTFIRE_FIREMODE)=class'KFProj_Bullet_Pellet'
	InstantHitDamage(ALTFIRE_FIREMODE)=20.0 //25 //20
	InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'KFDT_Ballistic_AA12Shotgun'
	PenetrationPower(ALTFIRE_FIREMODE)=2.0
	FireInterval(ALTFIRE_FIREMODE)=0.2 // 300 RPM
	Spread(ALTFIRE_FIREMODE)=0.07

	// Shotgun
	NumPellets(ALTFIRE_FIREMODE)=7


	// BASH_FIREMODE
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_AA12Shotgun'
	InstantHitDamage(BASH_FIREMODE)=30

	// Fire Effects
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_AA12.Play_WEP_SA_AA12_Fire_3P', FirstPersonCue=AkEvent'WW_WEP_SA_AA12.Play_WEP_SA_AA12_Fire_1P')
    WeaponFireSnd(ALTFIRE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_AA12.Play_WEP_SA_AA12_Fire_3P', FirstPersonCue=AkEvent'WW_WEP_SA_AA12.Play_WEP_SA_AA12_Fire_1P')

	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_AA12.Play_WEP_SA_AA12_Handling_DryFire'
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_SA_AA12.Play_WEP_SA_AA12_Handling_DryFire'

	// Attachments
	bHasIronSights=true
	bHasFlashlight=false

	// Ammo
	MagazineCapacity[0]=30
	SpareAmmoCapacity[0]=180 //120
	InitialSpareMags[0]=1
	bCanBeReloaded=true
	bReloadFromMagazine=true
	bHasFireLastAnims=false

	// Recoil
	maxRecoilPitch=250
	minRecoilPitch=225
	maxRecoilYaw=125
	minRecoilYaw=-125
	RecoilRate=0.075
	RecoilBlendOutRatio=0.25
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=900
	RecoilMinPitchLimit=64785
	RecoilISMaxYawLimit=75
	RecoilISMinYawLimit=65460
	RecoilISMaxPitchLimit=375
	RecoilISMinPitchLimit=65460
	RecoilViewRotationScale=0.7
	FallingRecoilModifier=1.5
	HippedRecoilModifier=1.75
    
	AssociatedPerkClasses(0)=class'KFPerk_Support'

	WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Heavy_Recoil'

	// Weapon Upgrade stat boosts
	//WeaponUpgrades[1]=(IncrementDamage=1.15f,IncrementWeight=1)

	WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.15f), (Stat=EWUS_Damage1, Scale=1.15f), (Stat=EWUS_Weight, Add=0)))
	WeaponUpgrades[2]=(Stats=((Stat=EWUS_Damage0, Scale=1.50f), (Stat=EWUS_Damage1, Scale=1.50f), (Stat=EWUS_Weight, Add=0)))
}
