class VS_ZedRecentZed extends VS_ZedClotBase;

var repnotify bool bWasWoken;
var transient float WakeUpAnimTime;

replication
{
    if (true)
        bWasWoken;
}



simulated function float StartAttackAnim(byte Num) // Return animation duration.
{
    if (FPHandModel != None)
        FPHandModel.PlayHandsAnim('Atk_Combo1_V3', 1.5f);
    return PlayBodyAnim('Atk_Combo1_V3', EAS_UpperBody, 1.5f);
}

simulated event ReplicatedEvent(name VarName)
{
    switch (VarName)
    {
    case 'bWasWoken':
        if (bWasWoken)
            WakeUp();
        break;
    default:
        Super.ReplicatedEvent(VarName);
    }
}



simulated function WakeUp()
{
    local TeamInfo MonsterTeam;

    bWasWoken = true;
    bNoWeaponFiring = False;
    WakeUpAnimTime = BodyStanceNodes[EAS_FullBody].PlayCustomAnim('Getup_Fast_F_V1', 1.f);
    SetTimer(WakeUpAnimTime, false, 'GotUp');
    GoToState('WakingUp');

    // Убедимся, что здоровье установлено
    Health = HealthMax;

    // Убедимся, что команда установлена
    if (Controller != None && Controller.PlayerReplicationInfo != None)
    {
        // Проверяем, существует ли уже команда для монстров
        MonsterTeam = FindMonsterTeam();

        if (MonsterTeam == None)
        {
            // Создаем новую команду для монстров
            MonsterTeam = Spawn(class'TeamInfo');
            MonsterTeam.TeamIndex = 255; // Устанавливаем индекс команды
 //           MonsterTeam.TeamName = "Monsters"; // Название команды
            MonsterTeam.TeamColor = MakeColor(255, 0, 0, 255); // Красный цвет для монстров

            // Добавляем команду в GameReplicationInfo
            if (WorldInfo.GRI != None)
            {
                WorldInfo.GRI.SetTeam(255, MonsterTeam);
            }
        }

        // Устанавливаем команду для контроллера
        Controller.PlayerReplicationInfo.Team = MonsterTeam;
    }
}

simulated function bool Died(Controller Killer, class<DamageType> damageType, vector HitLocation)
{
    if (WorldInfo.NetMode == NM_Client)
    {
        return Super.Died(Killer, damageType, HitLocation);
    }

    // Check if the zombie's health is 0
    if (Health <= 0)
    {
        // Log the death of the zombie
        `log("Zombie died. Starting transformation to human.");

        // Transition to the ReturnToHuman state
        GoToState('ReturnToHuman');
        return true;
    }

    // Log warning: Zombie's health is not 0
    `log("Warning: Zombie's health is not 0. Transformation aborted.");
    return Super.Died(Killer, damageType, HitLocation);
}

state ReturnToHuman
{
 //   ignores TakeDamage, FaceRotation, SetMovementPhysics;

    simulated event BeginState(name PreviousStateName)
    {
        local DeadZone_KFPawn_Human NewHumanPawn;

        // Log the start of the transformation
        `log("Starting zombie to human transformation.");

        // Destroy the current zombie
        Destroy();

        // Spawn a new human player (DeadZone_KFPawn_Human)
        NewHumanPawn = Spawn(class'DeadZone_KFPawn_Human',,, Location, Rotation,, true);
        if (NewHumanPawn != None)
        {
            // Transfer control to the new human player
            if (Controller != None)
            {
                Controller.Possess(NewHumanPawn, false);
                WorldInfo.Game.ChangeTeam(Controller, 0, true); // Set the player's team to 0
                WorldInfo.Game.SetPlayerDefaults(NewHumanPawn);

                // Set the player's health to 0 (dead)
                NewHumanPawn.Health = 0;

                // Set the flag that the player should be respawned after the wave ends
                NewHumanPawn.bPendingRespawn = true;

                // Log success
                `log("Zombie to human transformation successful.");
            }
            else
            {
                // Log error: Controller is None
                `log("Error: Zombie's controller is None.");
            }
        }
        else
        {
            // Log error: Failed to spawn new human player
            `log("Error: Failed to spawn new human player (DeadZone_KFPawn_Human).");
        }
    }

    simulated function EndState(name NextStateName)
    {
        // Cleanup if needed
        `log("Exiting ReturnToHuman state.");
    }
}

// Функция для поиска команды монстров
simulated function TeamInfo FindMonsterTeam()
{
    local TeamInfo Team;

    if (WorldInfo.GRI != None)
    {
        foreach WorldInfo.GRI.Teams(Team)
        {
            if (Team.TeamIndex == 255)
            {
                return Team;
            }
        }
    }

    return None;
}



simulated function GotUp()
{
    if (Health <= 0)
        return;

    ClearTimer('GotUp');
    bWasWoken = false;
    bNoWeaponFiring = false;
    GoToState('Auto');
}

state WakingUp
{
//    ignores TakeDamage, FaceRotation;

    function UnPossessed()
    {
        Super.UnPossessed();

        ClearTimer('GotUp');
        KilledBy(None);
        LifeSpan = 2.f;
    }
}

simulated function NotifyTeamChanged()
{
    // Applies Character Info for < ROLE_Authority
    if (PlayerReplicationInfo != None)
        SetCharacterArch(GetCharacterInfo());
}

simulated function SetCharacterAnimationInfo()
{
    local KFCharacterInfo_Monster M;

    Super.SetCharacterAnimationInfo();

    // Keep monster animations.
    M = KFCharacterInfo_Monster'ZED_ARCH.ZED_Clot_UnDev_Archetype';
    Mesh.AnimSets = M.AnimSets;
    if (Mesh.AnimTreeTemplate != M.AnimTreeTemplate)
        Mesh.SetAnimTreeTemplate(M.AnimTreeTemplate);
    if (M.AnimArchetype != None)
        PawnAnimInfo = M.AnimArchetype;
}

simulated function KFCharacterInfoBase GetCharacterInfo()
{
    return Super.GetCharacterInfo();
}

simulated function SetCharacterArch(KFCharacterInfoBase Info, optional bool bForce)
{
    local KFPlayerReplicationInfo KFPRI;

    KFPRI = KFPlayerReplicationInfo(PlayerReplicationInfo);
    if (Info != CharacterArch || bForce)
    {
        // Set Family Info
        CharacterArch = Info;
        CharacterArch.SetCharacterFromArch(self, KFPRI);
        CharacterArch.SetCharacterMeshFromArch(self, KFPRI); // Используем экземпляр объекта
        CharacterArch.SetFirstPersonArmsFromArch(self, KFPRI); // Используем экземпляр объекта

        SetCharacterAnimationInfo();

        // Sounds
        SoundGroupArch = Info.SoundGroupArch;

        if (WorldInfo.NetMode != NM_DedicatedServer)
        {
            // refresh weapon attachment (attachment bone may have changed)
            if (WeaponAttachmentTemplate != None)
            {
                WeaponAttachmentChanged(true);
            }
        }
        if (CharacterArch != none)
        {
            if (CharacterArch.VoiceGroupArchName != "")
                VoiceGroupArch = class<KFPawnVoiceGroup>(DynamicLoadObject(CharacterArch.VoiceGroupArchName, class'Class', true));
        }
    }
}

// Dont gore and gib because human chars don't support it.
simulated function HandlePartialGoreAndGibs(class<KFDamageType> DmgType, vector HitLocation, vector HitDirection, name HitBoneName, bool ObliterateGibs);
simulated function PlayHeadAsplode();
simulated function bool PlayDismemberment(int InHitZoneIndex, class<KFDamageType> InDmgType, optional vector HitDirection)
{
    return false;
}

event OnRigidBodyLinearConstraintViolated(name StretchedBoneName);
simulated function ApplyHeadChunkGore(class<KFDamageType> DmgType, vector HitLocation, vector HitDirection);

defaultproperties
{
    Health=600
    HealthMax=600
    FPHandOffset=(X=-35, Z=-60)
    HitsPerAttack=1
    HPScaler=0.4

    MonsterArchPath="ZED_ARCH.ZED_Clot_UnDev_Archetype"
    CharacterMonsterArch=KFCharacterInfo_Monster'ZED_ARCH.ZED_Clot_UnDev_Archetype'
    GroundSpeed=700
    MeleeDamage=50

    // Stats
    XPValues(0)=11
    XPValues(1)=11
    XPValues(2)=11
    XPValues(3)=11
	
	bVersusZed=true
		Begin Object Name=SpecialMoveHandler_0
		SpecialMoveClasses(SM_PlayerZedMove_V)=class'KFSM_PlayerAlpha_Rally'
	End Object
	MoveListGamepadScheme(ZGM_Special_R3)=SM_PlayerZedMove_V
	SpecialMoveCooldowns(0)=(SMHandle=SM_PlayerZedMove_V,		CooldownTime=1.5f,  SpecialMoveIcon=Texture2D'ZED_Clot_UI.ZED-VS_Icons_AlphaClot-Enrage', NameLocalizationKey="Rally")

}