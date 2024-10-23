class DeadZone_GFxMoviePlayer_Manager extends KFGFxMoviePlayer_Manager
	dependson(DeadZone_GFxMenu_Perks);

defaultproperties
{
	WidgetBindings.Remove((WidgetName="PerksMenu",WidgetClass=class'KFGFxMenu_Perks'))
	WidgetBindings.Add((WidgetName="PerksMenu",WidgetClass=class'DeadZone_GFxMenu_Perks'))
	
	WidgetBindings.Remove((WidgetName="traderMenu",WidgetClass=class'KFGFxMenu_Trader'))
	WidgetBindings.Add((WidgetName="traderMenu",WidgetClass=class'DeadZone_GFxMenu_Trader'))
}
