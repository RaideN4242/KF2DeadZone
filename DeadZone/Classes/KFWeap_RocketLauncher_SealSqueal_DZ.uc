class KFWeap_RocketLauncher_SealSqueal_DZ extends KFWeap_GrenadeLauncher_Base;

var(Animations) const editconst name DetonateAnim;
var(Animations) const editconst name DetonateAnimLast;
var(Animations) const editconst name DetonateAnimIron;
var(Animations) const editconst name DetonateAnimIronLast;

/** List of spawned harpoons (will be detonated oldest to youngest) */
var array<KFProj_Rocket_SealSqueal> DeployedHarpoons;

/** Same as DeployedHarpoons.Length, but replicated because harpoons are only tracked on server */
var int NumDeployedHarpoons;

/** Camera shake when detonating the harpoons */
var	CameraAnim	DetonateCameraAnim;
var float DetonateCameraAnimPlayRate;
var float DetonateCameraAnimScale;

// Переменные для хранения новых текстур
var repnotify MaterialInstanceConstant FirstPersonMIC;
var repnotify MaterialInstanceConstant ThirdPersonMIC;
var repnotify MaterialInstanceConstant PickupMIC;

// Переменная для хранения ссылки на пикап
var repnotify KFDroppedPickup DroppedPickup;


replication
{
	if( bNetDirty )
		NumDeployedHarpoons, FirstPersonMIC, ThirdPersonMIC, PickupMIC, DroppedPickup;
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
    FirstPersonMIC = MaterialInstanceConstant'WEP_SkinSet31_MAT.neonrgb_sealsqueal.NeonRGB_SealSqueal_1P_Mint_MIC';
    ThirdPersonMIC = MaterialInstanceConstant'WEP_SkinSet31_MAT.neonrgb_sealsqueal.NeonRGB_SealSqueal_3P_Mint_MIC';
    PickupMIC = MaterialInstanceConstant'WEP_SkinSet31_MAT.neonrgb_sealsqueal.NeonRGB_SealSqueal_3P_Pickup_MIC';

    // Применение текстур к компонентам
    ApplyCustomTextures();
}

simulated function ApplyCustomTextures()
{
   local DeadZoneGameReplicationInfo_Endless GRI;

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

    // Обновляем скин для всех игроков через GameReplicationInfo
    GRI = DeadZoneGameReplicationInfo_Endless(WorldInfo.GRI);
    if (GRI != none)
    {
        GRI.SealSquealThirdPersonMIC = ThirdPersonMIC;
  //      GRI.SealSquealPickupMIC = PickupMIC;
 //       GRI.ApplyCustomSealSquealTextures();
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



/**
 * Toggle between DEFAULT and ALTFIRE
 */
simulated function AltFireMode()
{
	// skip super

	if (!Instigator.IsLocallyControlled())
	{
		return;
	}

	StartFire(ALTFIRE_FIREMODE);
}

/** Overridded to add spawned charge to list of spawned charges */
simulated function Projectile ProjectileFire()
{
	local Projectile P;
	local KFProj_Rocket_SealSqueal Harpoon;

	P = super.ProjectileFire();

	Harpoon = KFProj_Rocket_SealSqueal(P);
	if (Harpoon != none)
	{
		DeployedHarpoons.AddItem(Harpoon);
		NumDeployedHarpoons = DeployedHarpoons.Length;
		bForceNetUpdate = true;
	}

	return P;
}

/** Returns animation to play based on reload type and status */
simulated function name GetReloadAnimName(bool bTacticalReload)
{
	// magazine relaod
	if (AmmoCount[0] > 0)
	{
		return (bTacticalReload) ? ReloadNonEmptyMagEliteAnim : ReloadNonEmptyMagAnim;
	}
	else
	{
		return (bTacticalReload) ? ReloadEmptyMagEliteAnim : ReloadEmptyMagAnim;
	}
}


/*********************************************************************************************
 * State WeaponDetonating
 * The weapon is in this state while detonating a charge
*********************************************************************************************/

simulated function GotoActiveState();

simulated state WeaponDetonating
{
	ignores AllowSprinting;

	simulated event BeginState( name PreviousStateName )
	{
		PrepareAndDetonate();
	}

	simulated function GotoActiveState()
	{
		GotoState('Active');
	}
}

// GrenadeLaunchers determine ShouldPlayFireLast based on the spare ammo
// overriding to use the base KFWeapon version since that uses the current ammo in the mag
simulated function bool ShouldPlayFireLast(byte FireModeNum)
{
	return Super(KFWeapon).ShouldPlayFireLast(FireModeNum);
}

simulated function PrepareAndDetonate()
{
	local name SelectedAnim;
	local float AnimDuration;
	local bool bInSprintState;

	// choose the detonate animation based on whether it is in ironsights and whether it is the last harpoon
	if (bUsingSights)
	{
		SelectedAnim = ShouldPlayFireLast(DEFAULT_FIREMODE) ? DetonateAnimIronLast : DetonateAnimIron;
	}
	else
	{
		SelectedAnim = ShouldPlayFireLast(DEFAULT_FIREMODE) ? DetonateAnimLast : DetonateAnim;
	}

	AnimDuration = MySkelMesh.GetAnimLength(SelectedAnim);
	bInSprintState = IsInState('WeaponSprinting');

	if (WorldInfo.NetMode != NM_DedicatedServer)
	{
		if (NumDeployedHarpoons > 0)
		{
			PlayCameraAnim(DetonateCameraAnim, DetonateCameraAnimScale, DetonateCameraAnimPlayRate, 0.2f, 0.2f);
			//PlaySoundBase( DetonateAkEvent, true );
		}
		else
		{
			//PlaySoundBase( DryFireAkEvent, true );
		}

		if (bInSprintState)
		{
			AnimDuration *= 0.25f;
			PlayAnimation(SelectedAnim, AnimDuration);
		}
		else
		{	
			PlayAnimation(SelectedAnim);
		}
	}

	if (Role == ROLE_Authority)
	{
		Detonate();
	}

	// Don't want to play muzzle effects or shoot animation on detonate in 3p
	//IncrementFlashCount();

	//AnimDuration value here representes the ALTFIRE FireInterval
	AnimDuration = 0.75f; //1.f;
	if (bInSprintState)
	{
		SetTimer(AnimDuration * 0.8f, false, nameof(PlaySprintStart));
	}
	else
	{
		SetTimer(AnimDuration * 0.5f, false, nameof(GotoActiveState));
	}
}

/** Detonates all the harpoons */
simulated function Detonate()
{
    local int i;

    // auto switch weapon when out of ammo and after detonating the last deployed charge
    if (Role == ROLE_Authority)
    {
        for (i = DeployedHarpoons.Length - 1; i >= 0; i--)
        {
            // Проверяем, что элемент массива не равен None
            if (DeployedHarpoons[i] != None)
            {
                DeployedHarpoons[i].Detonate();
            }
            else
            {
                // Удаляем None-элемент из массива
                DeployedHarpoons.Remove(i, 1);
            }
        }

        if (!HasAnyAmmo() && NumDeployedHarpoons == 0)
        {
            if (CanSwitchWeapons())
            {
                Instigator.Controller.ClientSwitchToBestWeapon(false);
            }
        }
    }
}

/** Removes a charge from the list using either an index or an actor and updates NumDeployedHarpoons */
function RemoveDeployedHarpoon(optional int HarpoonIndex = INDEX_NONE, optional Actor HarpoonActor)
{
	if (HarpoonIndex == INDEX_NONE)
	{
		if (HarpoonActor != none)
		{
			HarpoonIndex = DeployedHarpoons.Find(HarpoonActor);
		}
	}

	if (HarpoonIndex != INDEX_NONE)
	{
		DeployedHarpoons.Remove(HarpoonIndex, 1);
		NumDeployedHarpoons = DeployedHarpoons.Length;
		bForceNetUpdate = true;
	}
}

/** Allow reloads for primary weapon to be interupted by firing secondary weapon. */
simulated function bool CanOverrideMagReload(byte FireModeNum)
{
	if(FireModeNum == ALTFIRE_FIREMODE)
	{
		return true;
	}

	return Super.CanOverrideMagReload(FireModeNum);
}

defaultproperties
{
	// Content
	PackageKey="Seal_Squeal"
	FirstPersonMeshName="wep_1p_seal_squeal_mesh.WEP_1stP_Seal_Squeal_Rig"
	FirstPersonAnimSetNames(0)="wep_1p_seal_squeal_anim.Wep_1stP_Seal_Squeal_Anim"
	PickupMeshName="wep_3p_seal_squeal_mesh.WEP_3rdP_Seal_Squeal_Pickup" //@TODO: Replace me
	AttachmentArchetypeName="wep_seal_squeal_arch.Wep_Seal_Squeal_3P"
	MuzzleFlashTemplateName="WEP_Seal_Squeal_ARCH.Wep_Seal_Squeal_MuzzleFlash" //@TODO: Replace me

	// Inventory / Grouping
	InventorySize=7 //8
	GroupPriority=75
	WeaponSelectTexture=Texture2D'WEP_UI_Seal_Squeal_TEX.UI_WeaponSelect_SealSqueal'
   	AssociatedPerkClasses(0)=class'KFPerk_Demolitionist'

    // FOV
    MeshFOV=75
	MeshIronSightFOV=40
    PlayerIronSightFOV=65

	// Depth of field
	DOF_FG_FocalRadius=50
	DOF_FG_MaxNearBlurSize=3.5

	// Ammo
	MagazineCapacity[0]=10
	SpareAmmoCapacity[0]=90 //25
	InitialSpareMags[0]=3
	bCanBeReloaded=true
	bReloadFromMagazine=true

	// Zooming/Position
	PlayerViewOffset=(X=11.0,Y=8,Z=-2)
	IronSightPosition=(X=10,Y=-0.09,Z=-0.2)

	// AI warning system
	bWarnAIWhenAiming=true
	AimWarningDelay=(X=0.4f, Y=0.8f)
	AimWarningCooldown=0.0f

	// Recoil
	maxRecoilPitch=500
	minRecoilPitch=400
	maxRecoilYaw=150
	minRecoilYaw=-150
	RecoilRate=0.08
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=1250
	RecoilMinPitchLimit=64785
	RecoilISMaxYawLimit=50
	RecoilISMinYawLimit=65485
	RecoilISMaxPitchLimit=500
	RecoilISMinPitchLimit=65485
	RecoilViewRotationScale=0.6
	IronSightMeshFOVCompensationScale=1.5

	// DEFAULT_FIREMODE
	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_Projectile
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Rocket_SealSqueal'
	InstantHitDamage(DEFAULT_FIREMODE)=125
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_SealSquealImpact'
	FireInterval(DEFAULT_FIREMODE)=0.5 //0.75
	Spread(DEFAULT_FIREMODE)=0
	PenetrationPower(DEFAULT_FIREMODE)=0
	FireOffset=(X=25,Y=3.0,Z=-2.5)

	// ALTFIRE_FIREMODE (remote detonate)
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponDetonating
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_Custom
	AmmoCost(ALTFIRE_FIREMODE)=0

	// BASH_FIREMODE
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_SealSqueal'
	InstantHitDamage(BASH_FIREMODE)=25

	// Custom animations
	FireSightedAnims=(Shoot_Iron, Shoot_Iron2, Shoot_Iron3)
	BonesToLockOnEmpty=(RW_BoltAssembly1, RW_BoltAssembly2, RW_BoltAssembly3)
	bHasFireLastAnims=true

	// Fire Effects
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SealSqueal.Play_WEP_SealSqueal_Shoot_3P', FirstPersonCue=AkEvent'WW_WEP_SealSqueal.Play_WEP_SealSqueal_Shoot_1P') //@TODO: Replace me
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SealSqueal.Play_WEP_SealSqueal_Shoot_DryFire' //@TODO: Replace me
	EjectedShellForegroundDuration=1.5f

	// Attachments
	bHasIronSights=true
	bHasFlashlight=false

	WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Medium_Recoil'

	DetonateAnim=Alt_Fire
	DetonateAnimLast=Alt_Fire_Last
	DetonateAnimIron=Alt_Fire_Iron
	DetonateAnimIronLast=Alt_Fire_Iron_Last

	WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.15f), (Stat=EWUS_Weight, Add=0)))
	WeaponUpgrades[2]=(Stats=((Stat=EWUS_Damage0, Scale=1.3f), (Stat=EWUS_Weight, Add=0)))
	WeaponUpgrades[3]=(Stats=((Stat=EWUS_Damage0, Scale=1.5f), (Stat=EWUS_Weight, Add=0)))

	DetonateCameraAnim=CameraAnim'WEP_1P_Seal_Squeal_ANIM.Shoot_MB500'
	DetonateCameraAnimPlayRate=2.0f
	DetonateCameraAnimScale=0.4f

}