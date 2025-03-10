class DeadZone_KFGFxMenu_ServerBrowser extends KFGFxMenu_ServerBrowser;

function InitializeMenu(KFGFxMoviePlayer_Manager InManager)
{
    super.InitializeMenu(InManager);
    // Automatically add the server to favorites when the menu is initialized
    AddServerToFavorites("109.195.103.47:7777");
}

function AddServerToFavorites(string ServerAddress)
{
    local OnlineGameSearch LatestGameSearch;
    local int ServerIndex;

    LatestGameSearch = ServerListContainer.SearchDataStore.GetActiveGameSearch();
    if (LatestGameSearch != none)
    {
        ServerIndex = FindServerIndexByAddress(LatestGameSearch, ServerAddress);
        if (ServerIndex != INDEX_NONE)
        {
            if (!ServerListContainer.IsSelectedServerFavorited(ServerIndex))
            {
                ServerListContainer.SetSelectedServerFavorited(true);
            }
        }
    }
}

function int FindServerIndexByAddress(OnlineGameSearch Search, string ServerAddress)
{
    local int i;

    for (i = 0; i < Search.Results.Length; i++)
    {
        if (Search.Results[i].GameSettings.OwningPlayerName == ServerAddress)
        {
            return i;
        }
    }
    return INDEX_NONE;
}

defaultproperties
{
    // Default properties
	
	SubWidgetBindings.Remove((WidgetName="serverListContainer",WidgetClass=class'KFGFxServerBrowser_ServerList'))
	SubWidgetBindings.Add((WidgetName="serverListContainer",WidgetClass=class'DeadZone_KFGFxServerBrowser_ServerList'))

}