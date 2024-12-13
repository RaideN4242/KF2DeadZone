class DeadZone_GFxMoviePlayer_Manager extends KFGFxMoviePlayer_Manager
	dependson(DeadZone_GFxMenu_Perks);
	
	var DeadZone_KFGFxMenu_Gear EGearMenu;
	
	event bool WidgetInitialized(name WidgetName, name WidgetPath, GFxObject Widget)
{
	local PlayerController PC;

	switch (WidgetName)
	{
	case 'gearMenu':
		PC = GetPC();
		if (PC.PlayerReplicationInfo.bReadyToPlay && PC.WorldInfo.GRI.bMatchHasBegun)
			return true;
		if (EGearMenu == none)
		{
			EGearMenu = DeadZone_KFGFxMenu_Gear(Widget);
			EGearMenu.InitializeMenu(self);
		}
		OnMenuOpen(WidgetPath, EGearMenu);
		return true;
	default:
		return Super.WidgetInitialized(WidgetName,WidgetPath,Widget);
	}
}
	
function TextureMovie GetBackgroundMovie()
{
	local int EventIndex;

	// Если игра была запущена в режиме частичного установки, показываем только дефолтный фильм
	if (class'GameEngine'.static.WasLaunchedOnPartialInstall())
	{
		return BackgroundMovies[0];
	}

	// Получаем текущий сезон
	EventIndex = class'KFGameEngine'.static.GetSeasonalEventId();

	// Если текущий сезон не является зимним (EventIndex != 1), устанавливаем EventIndex в 1
	if (EventIndex != 1)
	{
		EventIndex = 1;
	}

	// Проверяем, что EventIndex находится в пределах массива BackgroundMovies
	if (EventIndex != INDEX_NONE && EventIndex < BackgroundMovies.Length)
	{
		return BackgroundMovies[EventIndex];
	}

	// Если что-то пошло не так, возвращаем дефолтный фильм
	return BackgroundMovies[0];
}

defaultproperties
{
	WidgetBindings.Remove((WidgetName="PerksMenu",WidgetClass=class'KFGFxMenu_Perks'))
	WidgetBindings.Add((WidgetName="PerksMenu",WidgetClass=class'DeadZone_GFxMenu_Perks'))
	
	WidgetBindings.Remove((WidgetName="traderMenu",WidgetClass=class'KFGFxMenu_Trader'))
	WidgetBindings.Add((WidgetName="traderMenu",WidgetClass=class'DeadZone_GFxMenu_Trader'))
	
	WidgetBindings.Remove((WidgetName="serverBrowserMenu",WidgetClass=class'KFGFxMenu_ServerBrowser'))
	WidgetBindings.Add((WidgetName="serverBrowserMenu",WidgetClass=class'DeadZone_KFGFxMenu_ServerBrowser'))
	
	WidgetBindings.Remove((WidgetName="startMenu",WidgetClass=class'KFGFxMenu_StartGame')) // меняем ивент
	WidgetBindings.Add((WidgetName="startMenu",WidgetClass=class'DeadZone_KFGFxMenu_StartGame'))
	
	WidgetBindings.Remove((WidgetName="gearMenu",WidgetClass=class'KFGFxMenu_Gear'))// попытка разблокировать скины и эмоции
	WidgetBindings.Add((WidgetName="gearMenu",WidgetClass=class'DeadZone_KFGFxMenu_Gear'))

///	BackgroundMovies(SEI_None)=TextureMovie'UI_Managers.MenuBG'
	BackgroundMovies(SEI_None)=TextureMovie'UI_Managers.Menu_Winter'
	BackgroundMovies(SEI_Spring)=TextureMovie'UI_Managers.MenuBG_Cyberpunk'
	BackgroundMovies(SEI_Summer)=TextureMovie'UI_Managers.SummerSideShowBGMovie'
	BackgroundMovies(SEI_Fall)=TextureMovie'UI_Managers.MenuBG_Halloween'
	BackgroundMovies(SEI_Winter)=TextureMovie'UI_Managers.Menu_Winter'
}
