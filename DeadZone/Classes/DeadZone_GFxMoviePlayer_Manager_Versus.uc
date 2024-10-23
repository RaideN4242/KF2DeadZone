class DeadZone_GFxMoviePlayer_Manager_Versus extends KFGFxMoviePlayer_Manager_Versus
	dependson(DeadZone_GFxMenu_Perks, DeadZone_GFxMenu_Trader);

defaultproperties
{
	WidgetBindings.Remove((WidgetName="PerksMenu",WidgetClass=class'KFGFxMenu_Perks'))
	WidgetBindings.Add((WidgetName="PerksMenu",WidgetClass=class'DeadZone_GFxMenu_Perks'))
	
	WidgetBindings.Remove((WidgetName="traderMenu",WidgetClass=class'KFGFxMenu_Trader'))
	WidgetBindings.Add((WidgetName="traderMenu",WidgetClass=class'DeadZone_GFxMenu_Trader'))
}
