class KFWeapDef_Seeker6_DZ extends KFWeaponDefinition
	abstract;
	
	static function string GetItemLocalization(string KeyName)
{
    switch(KeyName)
    {
        case "ITEMNAME":
            return "Seeker Six DZ";
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
	WeaponClassPath="DeadZone.KFWeap_RocketLauncher_Seeker6_DZ"

	BuyPrice=1500
	AmmoPricePerMag=20 //40
	ImagePath="WEP_UI_SeekerSix_TEX.UI_WeaponSelect_SeekerSix"

	EffectiveRange=100

	UpgradePrice[0]=1100
	UpgradePrice[1]=1300

	UpgradeSellPrice[0]=1125
	UpgradeSellPrice[1]=1500
}