class DeadZone_GFxMenu_Trader extends KFGFxMenu_Trader
	dependsOn(DeadZone_GFxTraderContainer_Store);

defaultproperties
{
	SubWidgetBindings.Remove((WidgetName="shopContainer",WidgetClass=class'KFGFxTraderContainer_Store'))
	SubWidgetBindings.Add((WidgetName="shopContainer",WidgetClass=class'DeadZone_GFxTraderContainer_Store'))
}
