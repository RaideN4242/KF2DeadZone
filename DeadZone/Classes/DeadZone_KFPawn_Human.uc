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

var bool bPendingRespawn;

replication
{
	if (bNetDirty)
		bShowFPLegs;
	if (bNetDirty)
		bRedeadMode, bPendingRedead, bFeigningDeath;
}

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	EPC = DeadZone_PlayerController(Controller);
	EPRI = DeadZone_PlayerReplicationInfo(PlayerReplicationInfo);
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
	if (VarName == 'bShowFPLegs')
	{
		UpdateFPLegs();
	}
	else if (VarName == 'bFeigningDeath')
	{
		PlayFeignDeath(bFeigningDeath);
	}
	else
	{
		Super.ReplicatedEvent(VarName);
	}
}

simulated function SetMeshVisibility(bool bVisible)
{
	Super.SetMeshVisibility(bVisible);

	if (Health > 0)
	{
		bOnFirstPerson = !bVisible;
		UpdateFPLegs();
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
}