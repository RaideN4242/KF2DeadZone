class DeadZone_KFGFxServerBrowser_ServerList extends KFGFxServerBrowser_ServerList;

function bool SetSelectedServerFavorited(bool bFavorited)
{
    local PlayfabInterface PlayfabInter;
    local OnlineGameSearch LatestGameSearch;

    PlayfabInter = class'GameEngine'.static.GetPlayfabInterface();
    if (bFavorited)
    {
        if (IsSelectedServerFavorited(SelectedServerIndex))
        {
            return false; // Server is already favorited
        }

        if (class'WorldInfo'.static.IsEOSBuild() && PlayfabInter != none)
        {
            LatestGameSearch = SearchDataStore.GetActiveGameSearch();
            return PlayfabInter.AddSearchResultToFavorites(LatestGameSearch, SelectedServerIndex);
        }
        else
        {
            return GameInterface.AddSearchResultToFavorites(SelectedServerIndex);
        }
    }
    else
    {
        if (class'WorldInfo'.static.IsEOSBuild() && PlayfabInter != none)
        {
            LatestGameSearch = SearchDataStore.GetActiveGameSearch();
            return PlayfabInter.RemoveSearchResultFromFavorites(LatestGameSearch, SelectedServerIndex);
        }
        else
        {
            return GameInterface.RemoveSearchResultFromFavorites(SelectedServerIndex);
        }
    }
}

function bool IsSelectedServerFavorited(int ServerSearchIndex)
{
    local PlayfabInterface PlayfabInter;
    local OnlineGameSearch LatestGameSearch;

    PlayfabInter = class'GameEngine'.static.GetPlayfabInterface();
    if (class'WorldInfo'.static.IsEOSBuild() && PlayfabInter != none)
    {
        LatestGameSearch = SearchDataStore.GetActiveGameSearch();
        return PlayfabInter.IsSearchResultInFavoritesList(LatestGameSearch, ServerSearchIndex);
    }
    else
    {
        return GameInterface.IsSearchResultInFavoritesList(ServerSearchIndex);
    }
}

defaultproperties
{
    // Default properties
	
}