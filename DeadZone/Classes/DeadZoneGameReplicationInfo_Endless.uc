class DeadZoneGameReplicationInfo_Endless extends KFGameReplicationInfo_Endless;

// Переменные для репликации скина оружия AA12 для третьего лица и DroppedPickup
var repnotify MaterialInstanceConstant AA12ThirdPersonMIC;
var repnotify MaterialInstanceConstant AA12PickupMIC;

replication
{
    if (bNetDirty)
        AA12ThirdPersonMIC, AA12PickupMIC;
}

simulated event ReplicatedEvent(name VarName)
{
    if (VarName == 'AA12ThirdPersonMIC' || VarName == 'AA12PickupMIC')
    {
        ApplyCustomAA12Textures();
    }
    else
    {
        super.ReplicatedEvent(VarName);
    }
}

simulated function ApplyCustomAA12Textures()
{
    local KFWeap_Shotgun_AA12_DZ AA12Weapon;
    local KFDroppedPickup DroppedPickup;

    foreach WorldInfo.AllActors(class'KFWeap_Shotgun_AA12_DZ', AA12Weapon)
    {
        if (AA12Weapon != none)
        {
            AA12Weapon.ThirdPersonMIC = AA12ThirdPersonMIC;
            AA12Weapon.ApplyCustomTextures();
        }
    }

    foreach WorldInfo.AllActors(class'KFDroppedPickup', DroppedPickup)
    {
        if (DroppedPickup != none && DroppedPickup.Inventory != none && DroppedPickup.Inventory.IsA('KFWeap_Shotgun_AA12_DZ'))
        {
            AA12Weapon = KFWeap_Shotgun_AA12_DZ(DroppedPickup.Inventory);
            AA12Weapon.ThirdPersonMIC = AA12ThirdPersonMIC;
            AA12Weapon.PickupMIC = AA12PickupMIC;
            AA12Weapon.ApplyCustomTextures();
        }
    }
}

// открывем все двери торговца
simulated function OpenTrader(optional int Time)
{
    local KFTraderTrigger Trader;

    super.OpenTrader(Time);

    // Открываем все двери торговца
    foreach DynamicActors(Class'KFGame.KFTraderTrigger', Trader)
    {
        if (Trader != none)
        {
            Trader.OpenTrader();
            Trader.HideTraderPath();
        }
    }
}

// закрываем все двери торговца
simulated function CloseTrader()
{
    local KFTraderTrigger Trader;

    super.CloseTrader();

    // Закрываем все двери торговца
    foreach DynamicActors(Class'KFGame.KFTraderTrigger', Trader)
    {
        if (Trader != none)
        {
            Trader.CloseTrader();
        }
    }
}

simulated function NotifyAllowSeasonalSkins(int AllowSeasonalSkinsIndex)
{
	bAllowSeasonalSkins = (AllowSeasonalSkinsIndex == 0);
	bNetDirty = true;
}

defaultproperties
{
    bAlwaysRelevant=true
	SeasonalSkinsIndex=1
	bAllowSeasonalSkins=true
	
	/*
	Значения:

    -1: Автоматический выбор сезонных скинов (система выбирает скины в зависимости от текущего сезона).

    0: Хэллоуинские скины.

    1: Рождественские скины.

    2: Весенние скины.

    3: Летние скины.

    4: Осенние скины.
	*/
	
	    // Инициализация материала для скина AA12 для третьего лица
    AA12ThirdPersonMIC=MaterialInstanceConstant'WEP_SkinSetPSN01_MAT.fleshpounder_aa12.Fleshpounder_AA12_3P_Mint_MIC'
    AA12PickupMIC=MaterialInstanceConstant'WEP_SkinSetPSN01_MAT.fleshpounder_aa12.Fleshpounder_AA12_3P_Pickup_MIC'
}