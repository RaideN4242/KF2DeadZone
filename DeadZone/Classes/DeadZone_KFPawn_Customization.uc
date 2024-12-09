class DeadZone_KFPawn_Customization extends KFPawn_Customization;

simulated function PlayEmoteAnimation(optional bool bNewCharacter)
{
    local name AnimName;
    local float BlendInTime;

    if (bPlayingEmote)
    {
        return;
    }

    bPlayingEmote = true;
    AnimName = Class'DeadZone_EmoteList'.static.GetUnlockedEmote(Class'DeadZone_EmoteList'.static.GetEquippedEmoteId(DeadZone_PlayerController(Controller)), DeadZone_PlayerController(Controller));
    BlendInTime = (bNewCharacter) ? 0.0 : 0.4;

    BodyStanceNodes[0].SetActorAnimEndNotification(false);
    BodyStanceNodes[0].PlayCustomAnim(AnimName, 1.0, BlendInTime, 0.4, false, true);
    BodyStanceNodes[0].SetActorAnimEndNotification(true);
}


defaultproperties
{
    bCollideActors=false
    bBlockActors=false
    CollisionComponent=CollisionCylinder
}