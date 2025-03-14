class KFWeapDef_MB500_DZ extends KFWeapDef_MB500
	abstract;
	
	static function string GetItemLocalization(string KeyName)
{
    switch(KeyName)
    {
        case "ITEMNAME":
            return "Shotgun MB500 DZ";
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
	WeaponClassPath="DeadZone.KFWeap_Shotgun_MB500_DZ"

	BuyPrice=200
	AmmoPricePerMag=30 //32
	ImagePath="ui_weaponselect_tex.UI_WeaponSelect_Mossberg"

	EffectiveRange=20

	UpgradePrice[0]=500
	UpgradePrice[1]=600
	UpgradePrice[2]=700
	UpgradePrice[3]=1500

	UpgradeSellPrice[0]=375
	UpgradeSellPrice[1]=825
	UpgradeSellPrice[2]=1350
	UpgradeSellPrice[3]=2475
}
