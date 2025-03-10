class DeadZone_KFGFxMenu_Gear extends KFGFxMenu_Gear dependson(DeadZone_KFEmoteList);

//var array<Emote> EmoteList;

function InitializeMenu(KFGFxMoviePlayer_Manager InManager)
{
	super(KFGFxObject_Menu).InitializeMenu(InManager);

	EmoteList = class'DeadZone_KFEmoteList'.static.GetEmoteArray();

}

function UpdateEmoteList()
{
	local int ItemIndex, i;
	local GFxObject DataProvider, SlotObject;
	local string TexturePath;

	ItemIndex = 0;
	DataProvider = CreateArray();

	for (i = 0; i < EmoteList.length; i++)
	{
		if (class'DeadZone_KFEmoteList'.static.GetUnlockedEmote(EmoteList[i].Id, DeadZone_PlayerController(GetPC())) != 'NONE')
		{
			SlotObject = CreateObject("Object");
			SlotObject.SetInt("ItemIndex", i);
			SlotObject.SetString("label", Localize(EmoteList[i].ItemName, "EmoteName", class'KFGFxMenu_Gear'.Default.KFCharacterInfoString));
			TexturePath = "img://"$EmoteList[i].IconPath;
			SlotObject.SetBool("enabled", true);
			SlotObject.SetString("source", TexturePath);
			DataProvider.SetElementObject(ItemIndex, SlotObject);
			ItemIndex++;
		}
		else
		{
			//`log(MyKFPRI.EmoteList[i] @ "is not purchased.");
		}
	}

	SetObject("emoteArray", DataProvider);
}

function SetEmoteButton()
{
	local GFxObject DataObject;
	local int EmoteIndex;

	EmoteIndex = class'DeadZone_KFEmoteList'.static.GetEmoteIndex(class'DeadZone_KFEmoteList'.static.GetEquippedEmoteId(DeadZone_PlayerController(GetPC())));

	DataObject = CreateObject("Object");
	if (EmoteIndex == 255)
	{
		DataObject.SetString("selectedEmote", "");
		DataObject.SetInt("selectedEmoteIndex", 0);
	}
	else
	{
		DataObject.SetString("selectedEmote", Localize(EmoteList[EmoteIndex].ItemName, "EmoteName", class'KFGFxMenu_Gear'.Default.KFCharacterInfoString));
		DataObject.SetInt("selectedEmoteIndex", 0);
	}


	SetObject("selectedEmote", DataObject);
}

//==============================================================
// ActionScript Callbacks
//==============================================================

function Callback_Emote(int Index)
{
	local KFPlayerController KFPC;

	KFPC = KFPlayerController(GetPC());
	if (KFPC != none)
	{
		class'DeadZone_KFEmoteList'.static.SaveEquippedEmote(EmoteList[Index].ID, DeadZone_PlayerController(KFPC));

		if (DeadZone_KFPawn_Customization(KFPC.Pawn) != none)
		{
			DeadZone_KFPawn_Customization(KFPC.Pawn).PlayEmoteAnimation();
		}
	}

	SetEmoteButton();
}

defaultproperties
{

}