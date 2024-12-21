class DeadZone_PlayerReplicationInfo extends KFPlayerReplicationInfo;

var Controller OwnerController;

defaultproperties
{
////	TaggedPlayerName="Player"

	// Playable characters from archetypes

	// Mr. Foster is first because he is the only playable character during console installation
	CharacterArchetypes.Add(KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_MrFoster_archetype')

	CharacterArchetypes.Add(KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_Alberts_archetype')
	CharacterArchetypes.Add(KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_Knight_Archetype')
	CharacterArchetypes.Add(KFCharacterInfo_Human'CHR_Playable_ARCH.chr_briar_archetype')
	CharacterArchetypes.Add(KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_Mark_archetype')
 	CharacterArchetypes.Add(KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_Jagerhorn_Archetype')
	CharacterArchetypes.Add(KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_Ana_Archetype')
    CharacterArchetypes.Add(KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_Masterson_Archetype')
 	CharacterArchetypes.Add(KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_Alan_Archetype')
 	CharacterArchetypes.Add(KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_Coleman_archetype')
	CharacterArchetypes.Add(KFCharacterInfo_Human'CHR_Playable_ARCH.chr_DJSkully_archetype')
	CharacterArchetypes.Add(KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_Strasser_Archetype')
	CharacterArchetypes.Add(KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_Tanaka_Archetype')
	CharacterArchetypes.Add(KFCharacterInfo_Human'CHR_Playable_ARCH.chr_rockabilly_archetype')
	CharacterArchetypes.Add(KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_DAR_archetype')
	CharacterArchetypes.Add(KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_MrsFoster_archetype')
	CharacterArchetypes.Add(KFCharacterInfo_Human'CHR_Playable_ARCH.CHR_BadSanta_Archetype')
}