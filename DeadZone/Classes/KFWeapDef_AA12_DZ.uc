class KFWeapDef_AA12_DZ extends KFWeapDef_AA12
	abstract;
	
/*	static function string GetItemName()
{
	return GetItemLocalization("ItemName");
}
	*/
static function string GetItemLocalization(string KeyName)
{
    switch(KeyName)
    {
        case "ITEMNAME":
            return "AA12 DZ";
        case "ITEMCATEGORY":
            return Class'KFWeapDef_M16M203'.static.GetItemLocalization(KeyName);
        case "ITEMDESCRIPTION":
            return "More Magazine Capacity and DLC Skin";
        default:
            return ""; // Возвращаем пустую строку для неизвестных ключей
    }
}

DefaultProperties
{
	WeaponClassPath="DeadZone.KFWeap_Shotgun_AA12_DZ"

	BuyPrice=1500
	AmmoPricePerMag=50 //110 //82
	ImagePath="ui_weaponselect_tex.UI_WeaponSelect_AA12"

	EffectiveRange=40

	UpgradePrice[0]=1100
	UpgradePrice[1]=1100

	UpgradeSellPrice[0]=1125
	UpgradeSellPrice[1]=1200
}
