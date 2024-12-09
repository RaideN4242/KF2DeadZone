class DeadZoneGameReplicationInfo extends KFGameReplicationInfo;

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

defaultproperties
{
    bAlwaysRelevant=true
}