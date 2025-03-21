class DeadZone_Endless extends KFGameInfo_Endless;

const GIC = "KFGameContent.KFGameInfo_Endless";

var public IDeadZone_GameInfo GI;
var public IDeadZone          DeadZone;
var public E_LogLevel      LogLevel;

var config bool bThrowAllWeaponsOnDead;

function InitGame(string Options, out string ErrorMessage)
{
    local string SeasonDescription;

    Super.InitGame(Options, ErrorMessage);

    // Устанавливаем случайное значение для SeasonalSkinsIndex (от 1 до 4)
    SeasonalSkinsIndex = Rand(4) + 1; // Rand(4) возвращает значение от 0 до 3, поэтому добавляем 1

    // Определяем текстовое описание для SeasonalSkinsIndex
    switch (SeasonalSkinsIndex)
    {
        case 1:
            SeasonDescription = "classic";
            break;
        case 2:
            SeasonDescription = "summer";
            break;
        case 3:
            SeasonDescription = "halloween";
            break;
        case 4:
            SeasonDescription = "xmas";
            break;
        default:
            SeasonDescription = "unknown";
            break;
    }

    // Логируем выбранный индекс и его описание
    `Log("DeadZone_Endless SeasonalSkinsIndex set to:" @ SeasonalSkinsIndex @ "(" $ SeasonDescription $ ")");
}

function InitSpawnManager()
{
	SpawnManager = new(self) SpawnManagerClasses[0];
	SpawnManager.Initialize();
	WaveMax = INDEX_NONE;
	MyKFGRI.WaveMax = WaveMax;
}

static function bool GetShouldShowLength()
{
	return false;
}

public simulated function ExileServerUsingKickBan()
{
	`Log_Trace();
	
	return;
}

public function UpdateGameSettings()
{
	`Log_Trace();
	
	if (GI != None)
	{
		GI.UpdateGameSettings(Self, GIC, DeadZone, bIsCustomGame, !IsUnrankedGame());
	}
}

protected function DistributeMoneyAndXP(class<KFPawn_Monster> MonsterClass, const out array<DamageInfo> DamageHistory, Controller Killer)
{
	`Log_Trace();
	
	Super.DistributeMoneyAndXP(DeadZone == None ? MonsterClass : DeadZone.PickProxyZed(MonsterClass), DamageHistory, Killer);
}

function PlayerController GetLocalPlayerController()
{
    local PlayerController PC;

    foreach WorldInfo.AllControllers(class'PlayerController', PC)
    {
        if (PC.IsLocalPlayerController())
        {
            return PC;
        }
    }

    return None;
}
/// выбрасываем всё оружие из инвентаря после смерти
function bool PreventDeath(Pawn Killed, Controller Killer, class<DamageType> DamageType, Vector HitLocation)
{
    local KFPawn_Human KFPH;
    local KFWeapon KFW;

    if (super(GameInfo).PreventDeath(Killed, Killer, DamageType, HitLocation))
    {
        return true;
    }

    KFPH = KFPawn_Human(Killed);

    if (bThrowAllWeaponsOnDead)
    {
        if (Role == ROLE_Authority && KFPH != none && KFPH.InvManager != none)
        {
            foreach KFPH.InvManager.InventoryActors(class'KFGame.KFWeapon', KFW)
            {
                if (KFW != none && KFW.bDropOnDeath && KFW.CanThrow())
                {
                    KFPH.TossInventory(KFW);
                }
            }
        }
    }

    return false;
}
// сигнализируем о том, что открыты все двери торговца
function NotifyTraderOpened()
{
    local KFTraderTrigger Trader;

    super.NotifyTraderOpened();

    // Открываем все двери торговца
    foreach DynamicActors(Class'KFGame.KFTraderTrigger', Trader)
    {
        if (Trader != none)
        {
            Trader.OpenTrader();
            Trader.HideTraderPath();
        }
    }

    // Проверка на DeadZoneGameReplicationInfo_Endless(MyKFGRI)
    if (DeadZoneGameReplicationInfo_Endless(MyKFGRI) != none)
    {
        DrawLocalizedMessage("ALL TRADERS ARE OPENED!", 5.0000000); // сообщение появляется на 5 секунд.
    }
}

function DrawLocalizedMessage(coerce string Message, float DisplayTime)
{
    local KFPlayerController KFPC;

    foreach WorldInfo.AllControllers(Class'KFGame.KFPlayerController', KFPC)
    {
        KFPC.DrawLocalizedTextOnHud(Message, DisplayTime);
    }
}

unreliable client simulated function ClientDrawLocalizedMessage(KFPlayerController KFPC, coerce string Message, float DisplayTime)
{
    KFPC.DrawLocalizedTextOnHud(Message, DisplayTime);
}


/**

static function int GetSeasonalEventIDForZedSkins()
{
    return SEI_Spring;
}


function int GetEventId()
{
    local int SeasonalEventID;

    SeasonalEventID = class'KFGameEngine'.static.GetSeasonalEventIDForZedSkins();

    if (SeasonalEventID != SEI_Spring)
    {
        return 1;
    }

    return SeasonalEventID;
}
*/
function SetPlayerDefaults(Pawn PlayerPawn)
{
    local KFPawn_Human P;
    local DeadZone_PlayerController KFPC_DZ;

    Super.SetPlayerDefaults(PlayerPawn);

    // Проверяем, что это первая волна (WaveNum == 0)
    if (WaveNum == 0)
    {
        P = KFPawn_Human(PlayerPawn);
        if (P != none)
        {
            // Даем игроку максимальную броню
            P.GiveMaxArmor();
        }

        // Получаем контроллер игрока
        KFPC_DZ = DeadZone_PlayerController(PlayerPawn.Controller);
        if (KFPC_DZ != none)
        {
            // Вызываем функцию GunGameLevelGrantWeapon для всего инвентаря
            GunGameLevelGrantWeapon(KFPC_DZ);
        }
    }
}


function GunGameLevelGrantWeapon(DeadZone_PlayerController KFPC_DZ)
{
    local KFWeapon KFW;
    local KFInventoryManager KFIM;
    local KFPerk CurrentPerk;

    // Получаем InventoryManager игрока
    KFIM = KFInventoryManager(KFPC_DZ.Pawn.InvManager);

    // Если InventoryManager существует, восстанавливаем гранаты до максимума
    if (KFIM != none)
    {
        // Получаем текущий перк персонажа
        CurrentPerk = KFPawn(KFPC_DZ.Pawn).GetPerk();
        if (CurrentPerk != none)
        {
            // Устанавливаем количество гранат на максимум через переменную MaxGrenadeCount
            KFIM.GrenadeCount = CurrentPerk.MaxGrenadeCount;
        }
    }

    // Перебираем всё оружие в инвентаре игрока
    foreach KFPC_DZ.Pawn.InvManager.InventoryActors(class'KFWeapon', KFW)
    {
        if (KFW != none)
        {
            // Пополняем боеприпасы для основного и дополнительного оружия
            KFW.AmmoCount[0] = KFW.MagazineCapacity[0]; // Основной магазин
            KFW.AddAmmo(KFW.GetMaxAmmoAmount(0));      // Пополнение общего запаса патронов
            KFW.AmmoCount[1] = KFW.MagazineCapacity[1]; // Дополнительный магазин
            KFW.AddSecondaryAmmo(KFW.GetMaxAmmoAmount(1)); // Пополнение общего запаса вторичных патронов
        }
    }
}


defaultproperties
{
	KFGFxManagerClass = class'DeadZone_GFxMoviePlayer_Manager'
	
	bIsEndlessGame = true
	bIsInHoePlus=true
	
	AllowSeasonalSkinsIndex=0 // 0 - enable
//	SeasonalSkinsIndex=3
	// 1 - classic. 2 - summer. 3 - halloween. 4 - xmas
	
	    // Normal Wave
    LateArrivalStarts(1)={(
        StartingDosh[0]=2500,
        StartingDosh[1]=2500,
        StartingDosh[2]=2500,
        StartingDosh[3]=2500,
        StartingDosh[4]=2500,
        StartingDosh[5]=2500,
        StartingDosh[6]=2500,
        StartingDosh[7]=2500 
    )}
    
    MaxRespawnDosh(0)=2000.f // Normal
    MaxRespawnDosh(1)=2500.f // Hard
    MaxRespawnDosh(2)=3000.f // Suicidal  //1550
    MaxRespawnDosh(3)=3500.f // Hell On Earth //1000.0
    MaxRespawnDosh(4)=3500.f // Hell On Earth Plus //1000.0
	
	GameReplicationInfoClass=class'DeadZone.DeadZoneGameReplicationInfo_Endless'
	PlayerReplicationInfoClass=Class'DeadZone.DeadZone_PlayerReplicationInfo'
	DefaultPawnClass=class'DeadZone.DeadZone_KFPawn_Human'
	CustomizationPawnClass=class'DeadZone.DeadZone_KFPawn_Customization'
	PlayerControllerClass=class'DeadZone.DeadZone_PlayerController'	
	
	

	SpawnManagerClasses(0)=class'KFGameContent.KFAISpawnManager_Endless'

	OutbreakEventClass=class'KFOutbreakEvent_Endless'

//	TraderVoiceGroupClass=class'KFGameContent.KFTraderVoiceGroup_Patriarch' //plays patty VO for trader
//	TraderVoiceGroupClass=class'KFGameContent.KFTraderVoiceGroup_Santa' //plays patty VO for trader winter
	TraderVoiceGroupClass=class'KFGameContent.KFTraderVoiceGroup_Lockheart' //plays patty VO for trader may be spring

	DifficultyInfoClass = class'DeadZone_KFGameDifficulty_Endless'
	DifficultyInfoConsoleClass = class'KFGameDifficulty_Endless_Console'

	SpecialWaveStart=6
	OutbreakWaveStart=6

	SpecialWaveTypes(0)=AT_Clot
	SpecialWaveTypes(1)=AT_SlasherClot
	SpecialWaveTypes(2)=AT_Crawler
	SpecialWaveTypes(3)=AT_Stalker
	SpecialWaveTypes(4)=AT_Siren
	SpecialWaveTypes(5)=AT_Husk
	SpecialWaveTypes(6)=AT_Scrake
	SpecialWaveTypes(7)=AT_AlphaClot
	SpecialWaveTypes(8)=AT_GoreFast
	SpecialWaveTypes(9)=AT_Bloat
	SpecialWaveTypes(10)=AT_FleshPound

	bSplitBossDoshReward=false

 	`if(`__TW_)
	// @note: this could be be done in the config (GameInfoClassAliases is normally config),
	// but then we have to mess with ini patching, etc... so just do it here.
	GameInfoClassAliases.Add((ShortName="BenchMark", GameClassName="KFGameContent.KFGameInfo_BenchMark"))
	GameInfoClassAliases.Add((ShortName="Survival", GameClassName="DeadZone.DeadZone_Survival"))
	GameInfoClassAliases.Add((ShortName="Versus", GameClassName="DeadZone.DeadZone_VersusSurvival"))
    GameInfoClassAliases.Add((ShortName="Weekly", GameClassName="DeadZone.DeadZone_WeeklySurvival"))
	GameInfoClassAliases.Add((ShortName="Tutorial", GameClassName="KFGameContent.KFGameInfo_Tutorial"))
	GameInfoClassAliases.Add((ShortName="Endless", GameClassName="DeadZone.DeadZone_Endless"))
	GameInfoClassAliases.Add((ShortName="Objective", GameClassName="DeadZone.DeadZone_Objective"))
`endif
}
