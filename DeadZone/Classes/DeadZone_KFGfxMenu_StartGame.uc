class DeadZone_KFGfxMenu_StartGame extends KFGfxMenu_StartGame;

function SetSeasonalEventClass()
{
    local GFXWidgetBinding MyWidgetBinding;

    // Принудительно устанавливаем зимний ивент
    MyWidgetBinding.WidgetName ='specialEventContainerMC';
    MyWidgetBinding.WidgetClass=GetSpecialEventClass(SEI_Spring);

    SubWidgetBindings[8]=MyWidgetBinding;
}

static function class<KFGFxSpecialeventObjectivesContainer> GetSpecialEventClass(int SpecialEventID)
{
	switch (SpecialEventID)
	{
		case SEI_Spring:
			return class'KFGFxSpecialEventObjectivesContainer_Spring2025';
		case SEI_Summer:
			return class'KFGFxSpecialEventObjectivesContainer_Summer2023';
		case SEI_Fall:
			return class'KFGFxSpecialEventObjectivesContainer_Fall2023';
		case SEI_Winter:
			return class'KFGFXSpecialEventObjectivesContainer_Xmas2022';
	}

	return class'KFGFxSpring2019ObjectivesContainer';
}

function string MakeMapURL(KFGFxStartGameContainer_Options InOptionsComponent)
{
	local string MapName;
	local int LengthIndex, ModeIndex, AllowSeasonalSkins, WeeklySelectorIndex, IntendedWeeklyIndex;
	local string MapURL;
	local byte CurrentMenuState;
	local int SeasonalEventID;

	MapName = "";

	// this is ugly, but effectively makes sure that the player isn't solo with versus selected
	// or other error cases such as when the game isn't fully installed
	ModeIndex = InOptionsComponent.GetNormalizedGameModeIndex(Manager.GetModeIndex(true));
	LengthIndex = InOptionsComponent.GetLengthIndex();

	CurrentMenuState = GetStartMenuState();

	// In Find a Match we can't choose map, so don't use the options dropwdown
	if (CurrentMenuState != EMatchmaking)
	{
		MapName = InOptionsComponent.GetMapName();
	}

	if (MapName == "" || MapStringList.Find(MapName) == INDEX_NONE)
	{
		if (CurrentConnectMap != "" && MapStringList.Find(CurrentConnectMap) != INDEX_NONE)
		{
			MapName = CurrentConnectMap;
		}
		else if( class'WorldInfo'.static.IsConsoleBuild() )
		{
			// Pick a random map is game is fully installed
			if( class'GameEngine'.static.IsGameFullyInstalled() )
			{
				MapName = MapStringList[rand(MapStringList.Length)];
			}
			// evacuation point is the only map available if still installing
			else
			{
				MapName = "KF-EvacuationPoint";
			}
		}
		else
		{
			// Biotics Lab doesn't support objective mode yet, so that needs a different default
			if (ModeIndex == EGameMode_Objective)
			{
				MapName = "KF-SteamFortress";
			}
			else
			{
				MapName = "KF-BioticsLab";
			}
		}
	}

	// Get the current seasonal event ID
	SeasonalEventID = class'KFGameEngine'.static.GetSeasonalEventIDForZedSkins();

	// Set AllowSeasonalSkins based on the current seasonal event
	if (SeasonalEventID == 1) // Spring
	{
		AllowSeasonalSkins = 1;
	}
	else if (InOptionsComponent.GetAllowSeasonalSkinsIndex() == 0)
	{
		AllowSeasonalSkins = 1;
	}
	else
	{
		AllowSeasonalSkins = 0;
	}

	if (CurrentMenuState == EMatchmaking
		|| SeasonalEventID == SEI_Spring)
	{
		AllowSeasonalSkins = 1; // Default if we don't have a season or it's find a match menu
	}

	MapURL = MapName$"?Game="$class'KFGameInfo'.static.GetGameModeClassFromNum( ModeIndex )
	       $"?Difficulty="$class'KFGameDifficultyInfo'.static.GetDifficultyValue( InOptionsComponent.GetDifficultyIndex() )
		   $"?GameLength="$LengthIndex
		   $"?AllowSeasonalSkins="$AllowSeasonalSkins;

	if (ModeIndex == 1) // Only when mode is Weekly
	{
		WeeklySelectorIndex = -1;

		// Depending on StartMenu State we takeover with different weekly index selection

		Switch (CurrentMenuState)
		{
			case EMatchmaking:
				// always default on "Find Game"
				WeeklySelectorIndex = 0;
				break;

			case ECreateGame:
			case ESoloGame:
				// use your selection on "Create Game" and "Play Solo"
				WeeklySelectorIndex = InOptionsComponent.GetWeeklySelectorIndex();

				// IF index matches default, set to 0 (default)
				if (WeeklySelectorIndex > 0)
				{
					IntendedWeeklyIndex = class'KFGameEngine'.static.GetIntendedWeeklyEventIndexMod();
					if (IntendedWeeklyIndex == (WeeklySelectorIndex - 1))
					{
						WeeklySelectorIndex = 0;
					}
				}

				break; 
		}

		if (WeeklySelectorIndex >= 0)
		{
			MapURL $= "?WeeklySelectorIndex="$WeeklySelectorIndex;
		}
	}

	return MapURL;
}

defaultproperties
{
    // Default properties
 	SubWidgetBindings.Remove((WidgetName="specialEventContainerMC",WidgetClass=class'KFGFxSpecialeventObjectivesContainer'))
 	SubWidgetBindings.Add((WidgetName="specialEventContainerMC",WidgetClass=class'KFGFxSpring2019ObjectivesContainer')) ///меняем ивент
 //	SubWidgetBindings.Add((WidgetName="specialEventContainerMC",WidgetClass=class'KFGFxSpecialEventObjectivesContainer_Spring2025')) ///меняем ивент
//	bIsLeader = true
}