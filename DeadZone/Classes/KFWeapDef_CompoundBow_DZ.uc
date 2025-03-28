//=============================================================================
// KFWeapDef_CompoundBow
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients).
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//	- Tulio Beloqui (Saber Interactive)
//=============================================================================

class KFWeapDef_CompoundBow_DZ extends KFWeaponDefinition
	abstract;
	
	
static function string GetItemLocalization(string KeyName)
{
    switch(KeyName)
    {
        case "ITEMNAME":
            return "CompoundBow DZ";
        case "ITEMCATEGORY":
            return Class'KFWeapDef_M16M203'.static.GetItemLocalization(KeyName);
        case "ITEMDESCRIPTION":
            return "More Ammo and DLC Skin";
        default:
            return ""; // Возвращаем пустую строку для неизвестных ключей
    }
}

defaultproperties
{
	WeaponClassPath="DeadZone.KFWeap_Bow_CompoundBow_DZ"

	BuyPrice=2000

	AmmoPricePerMag=16

	ImagePath="WEP_UI_CompoundBow_TEX.UI_WeaponSelect_Compound_Bow"

	IsPlayGoHidden=true;

	EffectiveRange=80

	SharedUnlockId  = SCU_None
	
	
}

