class DeadZone_KFPawn_Customization extends KFPawn_Customization;


simulated function PlayEmoteAnimation(optional bool bNewCharacter)
{
	local name AnimName;
	local float BlendInTime;

	AnimName = class'DeadZone_KFEmoteList'.static.GetUnlockedEmote(class'DeadZone_KFEmoteList'.static.GetEquippedEmoteId(DeadZone_PlayerController(Controller)), DeadZone_PlayerController(Controller));

	BlendInTime = (bNewCharacter) ? 0.f : 0.4;

	// Briefly turn off notify so that PlayCustomAnim won't call OnAnimEnd (e.g. character swap)
	BodyStanceNodes[EAS_FullBody].SetActorAnimEndNotification(FALSE);

	BodyStanceNodes[EAS_FullBody].PlayCustomAnim(AnimName, 1.f, BlendInTime, 0.4, false, true);
	BodyStanceNodes[EAS_FullBody].SetActorAnimEndNotification(TRUE);
}



defaultproperties
{
//	bCollideActors=false
//	bBlockActors=false
}