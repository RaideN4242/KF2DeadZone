class DeadZone_GFxMenu_Perks extends KFGFxMenu_Perks
	dependson(DeadZone_GFxPerksContainer_Selection);

function PerkChanged(byte NewPerkIndex, bool bClickedIndex)
{
	local KFGameReplicationInfo KFGRI;
	local DeadZone_PlayerController DeadZonePC;

	if (KFPC == None) return;

	KFGRI = KFGameReplicationInfo(KFPC.WorldInfo.GRI);
	DeadZonePC = DeadZone_PlayerController(KFPC);
	
	if (KFGRI == None || DeadZonePC == None) return;

	if (!DeadZonePC.IsPerkAllowed(DeadZonePC.PerkList[NewPerkIndex])) return;

	UpdateSkillsHolder(DeadZonePC.PerkList[NewPerkIndex].PerkClass);
	
	bChangesMadeDuringLobby = !IsMatchStarted();
		
	if (bClickedIndex)
	{
		LastPerkIndex = NewPerkIndex;
		bModifiedPerk = true;

		if (DeadZonePC.Pawn == None || !DeadZonePC.Pawn.IsAliveAndWell() || KFGRI.bTraderIsOpen)
		{
			SavePerkData();
			SelectionContainer.SavePerk( NewPerkIndex );
			Manager.CachedProfile.SetProfileSettingValueInt( KFID_SavedPerkIndex, NewPerkIndex );
		}
	}
	
	PreviewPerkIndex = NewPerkIndex; 
	
	UpdateContainers(DeadZonePC.PerkList[NewPerkIndex].PerkClass, bClickedIndex);
}

defaultproperties
{
	SubWidgetBindings.Remove((WidgetName="SelectionContainer",WidgetClass=class'KFGFxPerksContainer_Selection'))
	SubWidgetBindings.Add((WidgetName="SelectionContainer",WidgetClass=class'DeadZone_GFxPerksContainer_Selection'))
}
