class DeadZone_KFPawn_Human extends KFPawn_Human;

var SkeletalMeshComponent FPBodyMesh;
var bool bFPLegsAttached, bFPLegsInit, bOnFirstPerson, bPlayingFeignDeathRecovery;

// Добавляем переменную для управления включением/выключением ног
var repnotify bool bShowFPLegs;

replication
{
	if (bNetDirty)
		bShowFPLegs;
}

simulated event ReplicatedEvent(name VarName)
{
	if (VarName == 'bShowFPLegs')
	{
		UpdateFPLegs();
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

defaultproperties
{

	Begin Object Name=SpecialMoveHandler_0
		SpecialMoveClasses(SM_Emote)=class'DeadZone_SM_Player_Emote'
	End Object
	
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
}