class DeadZone_KFPawn_Human extends KFPawn_Human;

var SkeletalMeshComponent FPBodyMesh;
var bool bFPLegsAttached, bFPLegsInit, bOnFirstPerson;

// Добавляем переменную для управления включением/выключением ног
var repnotify bool bShowFPLegs;

// Переменные для механики превращения в зомби
var DeadZone_PlayerReplicationInfo EPRI; // Замена ExtPlayerReplicationInfo на DeadZone_PlayerReplicationInfo
var DeadZone_PlayerController EPC; // Замена ExtPlayerController на DeadZone_PlayerController
var bool bRedeadMode, bPendingRedead;

// Переменная для состояния "фейковой смерти"
var repnotify bool bFeigningDeath;

// Ссылка на GameReplicationInfo
var DeadZoneGameReplicationInfo_Endless GRI;

var bool bPendingRespawn;

// Forrest's backpack weapon.
var SkeletalMeshComponent AttachedBackItem; // Компонент для отображения оружия на спине
var repnotify class<KFWeapon> BackpackWeaponClass; // Класс оружия, которое будет отображаться на спине
var KFWeapon PlayerOldWeapon; // Последнее оружие, которое было у игрока

replication
{
	if (bNetDirty)
		bShowFPLegs;
	if (bNetDirty)
		bRedeadMode, bPendingRedead, bFeigningDeath;
		    if (true)
        BackpackWeaponClass;
}

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	EPC = DeadZone_PlayerController(Controller);
	EPRI = DeadZone_PlayerReplicationInfo(PlayerReplicationInfo);
	GRI = DeadZoneGameReplicationInfo_Endless(WorldInfo.GRI);
}

// Функция для получения GameReplicationInfo
simulated function DeadZoneGameReplicationInfo_Endless GetGRI()
{
    if (GRI == none)
    {
        GRI = DeadZoneGameReplicationInfo_Endless(WorldInfo.GRI);
    }
    return GRI;
}

simulated function ApplyWeaponTextures()
{
//    local DeadZoneGameReplicationInfo_Endless GRI;

    GRI = GetGRI();
    if (GRI != none)
    {
        GRI.ApplyCustomAA12Textures();
        GRI.ApplyCustomMB500Textures();
        GRI.ApplyCustomSealSquealTextures();
        GRI.ApplyCustomSeeker6Textures();
        GRI.ApplyCustomCompoundBowTextures();
        GRI.ApplyCustomFlamethrowerTextures();
    }
}

simulated function Destroyed()
{
	Super.Destroyed();
	NotifyLevelChange();
}

simulated final function NotifyLevelChange(optional bool bMapswitch)
{
	// Clear any delegates or references if needed
}

simulated event ReplicatedEvent(name VarName)
{

    switch (VarName)
    {
        case 'BackpackWeaponClass':
            SetBackpackWeapon(BackpackWeaponClass); // Обновляем отображение оружия на спине при изменении класса
            break;
        default:
            Super.ReplicatedEvent(VarName);
    }
	
	if (VarName == 'bShowFPLegs')
	{
		UpdateFPLegs();
	}
	else if (VarName == 'bFeigningDeath')
	{
		PlayFeignDeath(bFeigningDeath);
	}
    else if (VarName == 'Weapon')
    {
        // При изменении оружия применяем текстуры
        ApplyWeaponTextures();
    }
	else
	{
		Super.ReplicatedEvent(VarName);
	}
}

// Функция для установки оружия на спину
simulated final function SetBackpackWeapon(class<KFWeapon> WC)
{
    local KFCharacterInfo_Human MyCharacter;
    local Rotator MyRot;
    local Vector MyPos;
    local name WM, B;


    BackpackWeaponClass = WC; // Устанавливаем класс оружия
    if (WorldInfo.NetMode == NM_DedicatedServer)
        return; // На сервере не нужно отображать оружие на спине

    if (WC != None)
    {
        if (AttachedBackItem == None)
        {
            // Создаем компонент для отображения оружия на спине, если он еще не создан
            AttachedBackItem = new(Self) class'SkeletalMeshComponent';
            AttachedBackItem.SetHidden(false);
            AttachedBackItem.SetLightingChannels(PawnLightingChannel);
            AttachedBackItem.SetShadowParent(Mesh); // Устанавливаем родительский компонент для теней
            AttachedBackItem.SetOwnerNoSee(true); // Оружие не видно в первом лице
            AttachedBackItem.SetDepthPriorityGroup(SDPG_World); // Устанавливаем приоритет отрисовки
            AttachedBackItem.SetScale(1.0); // Сбрасываем масштаб до стандартного
            AttachedBackItem.bCastDynamicShadow = true; // Включаем динамические тени
            AttachedBackItem.bUseAsOccluder = true; // Используем для окклюзии
        }

        // Устанавливаем скелетную сетку для оружия на спине
        AttachedBackItem.SetSkeletalMesh(WC.Default.AttachmentArchetype.SkelMesh);
        Mesh.DetachComponent(AttachedBackItem); // Отсоединяем компонент от текущего положения

        // Получаем информацию о персонаже для корректного позиционирования оружия
        MyCharacter = KFPlayerReplicationInfo(PlayerReplicationInfo).CharacterArchetypes[KFPlayerReplicationInfo(PlayerReplicationInfo).RepCustomizationInfo.CharacterIndex];
        WM = WC.Default.AttachmentArchetype.SkelMesh.Name;

        // Позиционирование оружия на спине в зависимости от типа оружия
        switch (WM)
        {
            case 'Wep_3rdP_Welder_Rig':
            case 'Wep_3rdP_Healer_Rig':
            case 'Wep_3rdP_Medic_SMG_Rig':
            case 'Wep_3rdP_9mm_Rig':
            case 'Wep_3rdP_Medic_Pistol_Rig':
                MyPos = vect(0, 0, 10);
                MyRot = rot(0, 0, 16384);
                B = 'LeftUpLeg';
                break;
            case 'Wep_3rdP_Katana_Rig':
            case 'Wep_3rdP_Crovel_Rig':
            case 'Wep_3rdP_Pulverizer_Rig':
                MyPos = vect(-5, 15, 0);
                MyRot = rot(0, 0, 0);
                if (WM == 'Wep_3rdP_Katana_Rig')
                    MyPos.Z = -20;
                B = 'Spine';
                break;
            case 'Wep_3rdP_CommandoKnife_Rig':
                MyPos = vect(0, 0, 10);
                MyRot = rot(-16384, -8192, 0);
                B = 'LeftUpLeg';
                break;
            default:
                MyPos = vect(-18.5, 16.5, -18);
                MyRot = rot(0, 0, 0);
                if (MyCharacter == KFCharacterInfo_Human'CHR_Playable_ARCH.chr_DJSkully_archetype')
                    MyRot.Roll = 8192;
                switch (WM)
                {
                    case 'Wep_3rdP_MB500_Rig':
                        MyPos.X = -45;
                        break;
                    case 'Wep_3rdP_M4Shotgun_Rig':
                        MyPos.X = -25;
                        break;
                    case 'Wep_3rdP_SawBlade_Rig':
                        MyPos.X = -75;
                        MyRot.Roll = 16384;
                        break;
                }
                B = 'Spine2';
        }

        // Устанавливаем позицию и вращение оружия на спине
        AttachedBackItem.SetTranslation(MyPos);
        AttachedBackItem.SetRotation(MyRot);
        Mesh.AttachComponent(AttachedBackItem, B); // Прикрепляем компонент к скелету персонажа



        // Настройка масштаба
        AttachedBackItem.SetScale(0.7); // Уменьшаем масштаб оружия (можно настроить под ваш случай)
        AttachedBackItem.SetHidden(bOnFirstPerson); // Скрываем оружие в первом лице
    }
    else if (AttachedBackItem != None)
    {
        // Если оружие не задано, скрываем компонент
        AttachedBackItem.SetHidden(true);
    }
}

simulated function Tick( float Delta )
{
	Super.Tick(Delta);

	if( WorldInfo.NetMode!=NM_Client && BackpackWeaponClass!=none && (PlayerOldWeapon==None || PlayerOldWeapon.Instigator==None) )
	{
		PlayerOldWeapon = None;
		SetBackpackWeapon(None);
	}
}

simulated function SetMeshVisibility(bool bVisible)
{
	Super.SetMeshVisibility(bVisible);

	if (Health > 0)
	{
		bOnFirstPerson = !bVisible;
		        if (AttachedBackItem != None)
            AttachedBackItem.SetHidden(bOnFirstPerson); // Скрываем оружие в первом лице
		UpdateFPLegs();
	}
}

// Функция для обновления оружия на спине при смене оружия
simulated function PlayWeaponSwitch(Weapon OldWeapon, Weapon NewWeapon)
{
    Super.PlayWeaponSwitch(OldWeapon, NewWeapon);

    if (WorldInfo.NetMode != NM_Client)
    {
        PlayerOldWeapon = KFWeapon(OldWeapon); // Сохраняем старое оружие
        SetBackpackWeapon(PlayerOldWeapon != None ? PlayerOldWeapon.Class : None); // Устанавливаем его на спину
    }
}

simulated final function UpdateFPLegs()
{
	if (FPBodyMesh != None)
	{
		if (!bFPLegsAttached && Physics != PHYS_RigidBody && bOnFirstPerson && bShowFPLegs)
		{
			bFPLegsAttached = true;
			AttachComponent(FPBodyMesh);

			if (!bFPLegsInit && CharacterArch != None)
				InitFPLegs();
		}
		FPBodyMesh.SetHidden(!bOnFirstPerson || !bShowFPLegs);
	}
}

simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
	if (SkelComp == Mesh) // Do not allow first person legs to eat up animation slots.
		Super.PostInitAnimTree(SkelComp);
}

simulated final function InitFPLegs()
{
	local int i;

	bFPLegsInit = true;

	FPBodyMesh.AnimSets = CharacterArch.AnimSets;
	FPBodyMesh.SetAnimTreeTemplate(CharacterArch.AnimTreeTemplate);
	FPBodyMesh.SetSkeletalMesh(Mesh.SkeletalMesh);

	FPBodyMesh.SetActorCollision(false, false);
	FPBodyMesh.SetNotifyRigidBodyCollision(false);
	FPBodyMesh.SetTraceBlocking(false, false);

	for (i = 0; i < Mesh.Materials.length; i++)
		FPBodyMesh.SetMaterial(i, Mesh.Materials[i]);

	FPBodyMesh.HideBoneByName('neck', PBO_None);
	FPBodyMesh.HideBoneByName('Spine2', PBO_None);
	FPBodyMesh.HideBoneByName('RightShoulder', PBO_None);
	FPBodyMesh.HideBoneByName('LeftShoulder', PBO_None);
}

simulated function SetCharacterAnimationInfo()
{
	Super.SetCharacterAnimationInfo();

	if (!bFPLegsInit && bFPLegsAttached)
		InitFPLegs();
}

simulated function SetMeshLightingChannels(LightingChannelContainer NewLightingChannels)
{
	Super.SetMeshLightingChannels(NewLightingChannels);

	if (AttachedBackItem != none)
        AttachedBackItem.SetLightingChannels(NewLightingChannels);
	AttachedBackItem.SetLightingChannels(NewLightingChannels);
	FPBodyMesh.SetLightingChannels(NewLightingChannels);
}

// Метод для включения/выключения ног
simulated function ToggleFPLegs(bool bEnable)
{
	bShowFPLegs = bEnable;
	UpdateFPLegs();
}

simulated function PlayDying(class<DamageType> DamageType, vector HitLoc)
{
	FPBodyMesh.SetHidden(true);
	Super.PlayDying(DamageType,HitLoc);
}

// механика превращения в зомби как в оригинале рпг мода

simulated function bool Died(Controller Killer, class<DamageType> damageType, vector HitLocation)
{
	if (bRedeadMode && WorldInfo.NetMode != NM_Client && damageType != None && Killer != None && Killer != Controller && Killer.GetTeamNum() != 0)
	{
		if (bDeleteMe || WorldInfo.Game == None || WorldInfo.Game.bLevelChange)
			return FALSE;

		bPendingRedead = true;
		if (WorldInfo.Game.PreventDeath(self, Killer, damageType, HitLocation))
		{
			bPendingRedead = false;
			Health = max(Health, 1);
			return false;
		}

		Health = 0;
		GoToState('TransformZed');
		return true;
	}

	return Super.Died(Killer, DamageType, HitLocation);
}

// Механика превращения в зомби с включенным условием 1 живой игрок
/*
simulated function bool Died(Controller Killer, class<DamageType> damageType, vector HitLocation)
{
	local int AlivePlayerCount;
	local KFPawn_Human KFPH;

	// Подсчитываем количество живых игроков
	foreach WorldInfo.AllPawns(class'KFPawn_Human', KFPH)
	{
		if (KFPH.IsAliveAndWell())
		{
			AlivePlayerCount++;
		}
	}

	// Если остался только один живой игрок, отключаем режим превращения в зомби
	if (AlivePlayerCount <= 1)
	{
		bRedeadMode = false;
	}

	if (bRedeadMode && WorldInfo.NetMode != NM_Client && damageType != None && Killer != None && Killer != Controller && Killer.GetTeamNum() != 0)
	{
		if (bDeleteMe || WorldInfo.Game == None || WorldInfo.Game.bLevelChange)
			return FALSE;

		bPendingRedead = true;
		if (WorldInfo.Game.PreventDeath(self, Killer, damageType, HitLocation))
		{
			bPendingRedead = false;
			Health = max(Health, 1);
			return false;
		}

		Health = 0;
		GoToState('TransformZed');
		return true;
	}

	return Super.Died(Killer, DamageType, HitLocation);
}
*/
state TransformZed
{
	ignores FaceRotation, SetMovementPhysics, Tick, TakeDamage, Died;

	simulated event BeginState(name PreviousStateName)
	{
		bCanPickupInventory = false;
		bNoWeaponFiring = true;

		// Убираем вызов EnterRagdollMode, так как он не нужен
		SetTimer(2, false, 'TransformToZed');
	}

	simulated function EndState(name NextStateName)
	{
		// Cleanup if needed
	}

	function bool CanBeRedeemed()
	{
		return false;
	}
	
	

	function TransformToZed()
{
    local VS_ZedRecentZed Z;

    if (Controller == None)
    {
        Destroy();
        return;
    }

    PlayFeignDeath(false);
    SetCollision(false, false);

    Z = Spawn(class'VS_ZedRecentZed',,, Location, Rotation,, true);
	
	
    if (Z == None)
    {
        Super.Died(None, Class'DamageType', Location);
        return;
    }
    else
    {
        Z.SetPhysics(PHYS_Falling);
        Z.LastStartTime = WorldInfo.TimeSeconds;
        Controller.Pawn = None;
        Controller.Possess(Z, false); // Передаём управление зомби
        WorldInfo.Game.ChangeTeam(Controller, 255, true); // Убедимся, что команда правильно установлена
        WorldInfo.Game.SetPlayerDefaults(Z);
        Z.WakeUp();
        if (EPRI != None)
        {
            EPRI.PlayerHealth = Min(Z.Health, 255);
            EPRI.PlayerHealthPercent = FloatToByte(float(Z.Health) / float(Z.HealthMax));
        }
    }
    Controller = None;
    Destroy();
}
	}



simulated function PlayFeignDeath(bool bEnable, optional bool bForce, optional bool bTransformMode)
{
	if (Health <= 0 && WorldInfo.NetMode != NM_Client)
		return; // If dead, don't do it.

	bFeigningDeath = bEnable;
	if (bEnable)
	{
		GotoState('FeigningDeath');
		PrepareRagdoll();
		InitRagdoll();
	}
	else
	{
		// Cleanup ragdoll and return to normal state
		GotoState('Auto');
	}
}

defaultproperties
{
/*
	Begin Object Name=SpecialMoveHandler_0
		SpecialMoveClasses(SM_Emote)=class'DeadZone_SM_Player_Emote'
	End Object
*/	
	Begin Object Class=SkeletalMeshComponent Name=FP_BodyComp
		MinDistFactorForKinematicUpdate=0.0
		bSkipAllUpdateWhenPhysicsAsleep=True
		bIgnoreControllersWhenNotRendered=True
		bHasPhysicsAssetInstance=False
		bUpdateKinematicBonesFromAnimation=False
		bPerBoneMotionBlur=True
		bOverrideAttachmentOwnerVisibility=True
		bChartDistanceFactor=True
		DepthPriorityGroup=SDPG_Foreground
		RBChannel=RBCC_Pawn
		RBDominanceGroup=20
		HiddenGame=True
		bOnlyOwnerSee=True
		bAcceptsDynamicDecals=True
		bUseOnePassLightingOnTranslucency=True
		Translation=(X=-65.876999,Y=0.900000,Z=-95.500000)
		Scale=1.210000
		ScriptRigidBodyCollisionThreshold=200.000000
		PerObjectShadowCullDistance=4000.000000
		bAllowPerObjectShadows=True
		bAllowPerObjectShadowBatching=True
	End Object
	FPBodyMesh=FP_BodyComp

	bShowFPLegs=true
	bRedeadMode=False
//	bCanBecomeRagdoll=true
//	InventoryManagerClass=class'ExtInventoryManager'

    // Инициализация компонента для оружия на спине
    Begin Object Class=SkeletalMeshComponent Name=BackpackWeaponComp
        MinDistFactorForKinematicUpdate=0.0
        bSkipAllUpdateWhenPhysicsAsleep=True
        bIgnoreControllersWhenNotRendered=True
        bHasPhysicsAssetInstance=False
        bUpdateKinematicBonesFromAnimation=False
        bPerBoneMotionBlur=True
        bOverrideAttachmentOwnerVisibility=True
        bChartDistanceFactor=True
        DepthPriorityGroup=SDPG_Foreground
        RBChannel=RBCC_Pawn
        RBDominanceGroup=20
        HiddenGame=True
        bOnlyOwnerSee=True
        bAcceptsDynamicDecals=True
        bUseOnePassLightingOnTranslucency=True
        Translation=(X=-65.876999, Y=0.900000, Z=-95.500000)
        Scale=1.210000
        ScriptRigidBodyCollisionThreshold=200.000000
        PerObjectShadowCullDistance=4000.000000
        bAllowPerObjectShadows=True
        bAllowPerObjectShadowBatching=True
    End Object
    AttachedBackItem=BackpackWeaponComp
}