class KFWeapDef_SealSqueal_DZ extends KFWeaponDefinition
	abstract;
	
		
	static function string GetItemLocalization(string KeyName)
{
    switch(KeyName)
    {
        case "ITEMNAME":
            return "Seal Squeal DZ";
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
	WeaponClassPath="DeadZone.KFWeap_RocketLauncher_SealSqueal_DZ"

	BuyPrice=1100
	AmmoPricePerMag=35
	ImagePath="WEP_UI_Seal_Squeal_TEX.UI_WeaponSelect_SealSqueal"

	EffectiveRange=80

	UpgradePrice[0]=700
	UpgradePrice[1]=900
	UpgradePrice[2]=1200

	UpgradeSellPrice[0]=525
	UpgradeSellPrice[1]=1200
	UpgradeSellPrice[2]=1500
}
