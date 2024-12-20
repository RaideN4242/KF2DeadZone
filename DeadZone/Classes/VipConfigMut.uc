class VipConfigMut extends KFMutator config(WeaponConfig);

struct VipStruct
{
    var config string PlayerID;
    var config string PerkClass;
    var config string PlayerName;
    var config string SpecialWeapon;
};

var config array<VipStruct> VipList;
var bool bWaveIsActive;

function PostBeginPlay()
{
    if (KFGameInfo(WorldInfo.Game) == None) Destroy();
    Super.PostBeginPlay();
    SaveConfig();
}

function NotifyLogin(Controller NewPlayer)
{
    Super.NotifyLogin(NewPlayer);
    `log("NotifyLogin called for player" @ NewPlayer.PlayerReplicationInfo.PlayerName);
    if (bWaveIsActive)
    {
        SetTimer(2.0, false, 'DelayedGiveWeapon', NewPlayer);
    }
}

function ModifyPlayer(Pawn P)
{
    Super.ModifyPlayer(P);
    `log("ModifyPlayer called for player" @ P.PlayerReplicationInfo.PlayerName);
    if (bWaveIsActive)
    {
        SetTimer(2.0, false, 'DelayedGiveWeapon', Controller(P.Owner));
    }
}

function DelayedGiveWeapon(Controller PlayerController)
{
    if (PlayerController != None && PlayerController.Pawn != None)
    {
        TryGiveSpecialWeapon(PlayerController.Pawn);
    }
}

function TryGiveSpecialWeapon(Pawn P)
{
    local KFPlayerReplicationInfo KFPRI;
    local string Hash, PerkClass;
    local PlayerController PC;
    local int i;
    local class<KFWeapon> WeaponClass;
    local KFWeapon NewWeapon;

    if (P == None)
    {
        `log("TryGiveSpecialWeapon: Pawn is None");
        return;
    }

    KFPRI = KFPlayerReplicationInfo(P.PlayerReplicationInfo);
    PC = PlayerController(P.Controller);

    if (PC == None)
    {
        `log("TryGiveSpecialWeapon: PlayerController is None");
        return;
    }

    Hash = class'OnlineSubsystem'.static.UniqueNetIdToString(PC.PlayerReplicationInfo.UniqueId);

    if (KFPRI != None)
    {
        PerkClass = string(KFPRI.CurrentPerkClass);
    }
    else
    {
        `log("TryGiveSpecialWeapon: KFPlayerReplicationInfo is None");
        return;
    }

    for (i = 0; i < VipList.Length; i++)
    {
        if (VipList[i].PlayerID ~= Hash && VipList[i].PerkClass ~= PerkClass)
        {
            WeaponClass = class<KFWeapon>(DynamicLoadObject(VipList[i].SpecialWeapon, class'Class'));
            if (WeaponClass != None)
            {
                NewWeapon = KFWeapon(P.InvManager.CreateInventory(WeaponClass));
                if (NewWeapon != None)
                {
                    `log("TryGiveSpecialWeapon: Successfully created weapon" @ NewWeapon.ItemName);
                    PC.ClientMessage("You have been given a " $ NewWeapon.ItemName);
                }
                else
                {
                    `log("TryGiveSpecialWeapon: Failed to create weapon");
                }
            }
            else
            {
                `log("TryGiveSpecialWeapon: WeaponClass is None");
            }
        }
    }
}

function StartWave()
{
    `log("StartWave called");
    bWaveIsActive = true;
}

defaultproperties
{
    // VipList(0)=(PlayerID="76561198026211213",PlayerName="RaideN",PerkClass="KFGame.KFPerk_Support",SpecialWeapon="DeadZone.KFWeapDef_AA12_DZ")
    // bAddToServerPackages=True
    // GroupName="KF-VipConfig"
    // FriendlyName="VipConfigMut"
    // Description="Vip Settings"
    // bAlwaysRelevant=True
}