class DeadZone_KFGameDifficulty_Endless extends KFGameDifficulty_Endless;

defaultproperties
{
	//NORMAL START----------------------------------------------------------------------------------------------------------------------------------------------------------------
	DifficultyScalings(0)={(
		// Normal
		Difficulties[0]={(
			TraderTime = 75, //75
			SpawnRateModifier = 0.8,
			MovementSpeedMod = 0.90000,
			WaveCountMod = 0.750000, //0.85
			DoshKillMod = 1.10000, //1.2
			StartingDosh = 300,
			AmmoPickupsMod = 0.400000,
			ItemPickupsMod = 0.450000,
			SelfInflictedDamageMod = 0.100000,
			TraderTimerMapOverride[0]=(MapName="KF-DieSector",TraderTime=45)
		)},
		// Hard
		Difficulties[1]={(
			TraderTime = 75, //75
			RespawnDosh = 300,
			SpawnRateModifier = 0.8,
			MovementSpeedMod = 0.95,
			WaveCountMod = 0.80000, //0.85
			DoshKillMod = 1.0, //1.0 //0.8
			AmmoPickupsMod = 0.300000,
			ItemPickupsMod = 0.350000,
			SelfInflictedDamageMod = 0.100000,
			TraderTimerMapOverride[0]=(MapName="KF-DieSector",TraderTime=45)
		)},
		// Suicidal
		Difficulties[2]={(
			TraderTime = 75, //75
			WaveCountMod = 0.9000, //0.95
			SpawnRateModifier = 0.7,   //1.0
			MovementSpeedMod = 0.95,  //1.0
			DoshKillMod = 1.00000,  //0.9 //0.7
			AmmoPickupsMod = 0.40000, //0.25
			ItemPickupsMod = 0.250000,
			MediumAttackChance = 1.000000,
			HardAttackChance = 0.500000,
			SelfInflictedDamageMod = 0.100000,
			TraderTimerMapOverride[0]=(MapName="KF-DieSector",TraderTime=45)
		)},
		// Hell On Earth
		Difficulties[3]={(
			TraderTime = 75, //75
			MovementSpeedMod = 0.95, //1.05
			SpawnRateModifier = 0.68, //1.0
			WaveCountMod = 0.950000, //1.0
			DoshKillMod = 1.00000, //0.8 0.6
			StartingDosh = 250, //200
			AmmoPickupsMod = 0.250000,
			ItemPickupsMod = 0.100000,
			MediumAttackChance = 1.000000,
			HardAttackChance = 1.000000,
			SelfInflictedDamageMod = 0.10000,
			TraderTimerMapOverride[0]=(MapName="KF-DieSector",TraderTime=45)
		)},
		// Hell On Earth Plus
		Difficulties[4]={(
			TraderTime = 75, //75
			MovementSpeedMod = 0.95, //1.05
			SpawnRateModifier = 0.68, //1.0
			WaveCountMod = 1.000000, //1.7
			DoshKillMod = 1.00000,  //0.7 0.5
			StartingDosh = 250, //200
			AmmoPickupsMod = 0.250000,
			ItemPickupsMod = 0.100000,
			MediumAttackChance = 1.000000,
			HardAttackChance = 1.000000,
			SelfInflictedDamageMod = 0.10000,
			TraderTimerMapOverride[0]=(MapName="KF-DieSector",TraderTime=45)
		)},

		DifficultyIncrement={(
			TraderTime = 0,
			GlobalHealthMod = 0.0,
			MovementSpeedMod = 0.0,
			WaveCountMod = 0.1, //0.1
			SpawnRateModifier = -0.3,
			DoshKillMod = -0.01,
			StartingDosh = 0,
			RespawnDosh = 0,
			AmmoPickupsMod = 0.2,    //this will need to go to other diff
			ItemPickupsMod = 0.2,    // this will need to go to other diff
			WeakAttackChance = 0.0,
			MediumAttackChance = 0.0,
			HardAttackChance = 0.0,
			SelfInflictedDamageMod = 0.0,
			TraderTimerMapOverride[0]=(MapName="KF-DieSector",TraderTime=45)
		)},

		// Normal
		ZedAdjustmentsByDifficulty[0] = {(
			ZedsToAdjust = {(
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedPatriarch',HealthScale = 0.65,DamageDealtScale = 0.75,DoshGiven = 250),  //750
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedHans',HealthScale = 0.45,DamageDealtScale = 0.75,DoshGiven = 250),  //750
				
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedMatriarch',HealthScale = 0.55,DamageDealtScale = 0.75,DoshGiven = 250),

				(ClassToAdjust = class'KFGameContent.KFPawn_ZedBloatKing',HealthScale = 0.62,DamageDealtScale = 0.75,DoshGiven = 250), //750
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedBloatKingSubspawn',HealthScale = 0.5,DamageDealtScale = 0.85,DoshGiven = 5),

				(ClassToAdjust = class'KFGameContent.KFPawn_ZedFleshpoundKing',HealthScale = 0.42,DamageDealtScale = 0.75,DoshGiven = 250),  //750
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedFleshpoundMini',HealthScale = 0.42,DamageDealtScale = 0.75,DoshGiven = 11)
			)}
		)},
		// Hard
		ZedAdjustmentsByDifficulty[1] = {(
			ZedsToAdjust = {(
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedPatriarch',HealthScale = 0.9,DamageDealtScale = 0.85,DoshGiven = 500),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedHans',HealthScale = 0.85,DamageDealtScale = 0.85,DoshGiven = 500),
				
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedMatriarch',HealthScale = 0.75,DamageDealtScale = 0.85,DoshGiven = 500),

				(ClassToAdjust = class'KFGameContent.KFPawn_ZedBloatKing',HealthScale = 0.85,DamageDealtScale = 0.85,DoshGiven = 500),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedBloatKingSubspawn',HealthScale = 0.85,DamageDealtScale = 0.85,DoshGiven = 5),

				(ClassToAdjust = class'KFGameContent.KFPawn_ZedFleshpoundKing',HealthScale = 0.84,DamageDealtScale = 0.85,DoshGiven = 500),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedFleshpoundMini',HealthScale = 0.84,DamageDealtScale = 0.85,DoshGiven = 11)
			)}
		)},
		// Suicidal
		ZedAdjustmentsByDifficulty[2] = {(
			ZedsToAdjust = {(
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedPatriarch',HealthScale = 0.95,DamageDealtScale = 0.95,DoshGiven = 800),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedHans',HealthScale = 0.95,DamageDealtScale = 0.95,DoshGiven = 800),

				(ClassToAdjust = class'KFGameContent.KFPawn_ZedMatriarch',HealthScale = 0.95,DamageDealtScale = 0.95,DoshGiven = 800),

				(ClassToAdjust = class'KFGameContent.KFPawn_ZedBloatKing',HealthScale = 0.95,DamageDealtScale = 0.95,DoshGiven = 800),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedBloatKingSubspawn',HealthScale = 1.0,DamageDealtScale = 0.85,DoshGiven = 5),

				(ClassToAdjust = class'KFGameContent.KFPawn_ZedFleshpoundKing',HealthScale = 0.95,DamageDealtScale = 0.95,DoshGiven = 800),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedFleshpoundMini',HealthScale = 1.0,DamageDealtScale = 0.85,DoshGiven = 11)
			)}
		)},
		// Hell On Earth
		ZedAdjustmentsByDifficulty[3] = {(
			ZedsToAdjust = {(
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedPatriarch',HealthScale = 1.0,DamageDealtScale = 1.0,DoshGiven = 1000),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedHans',HealthScale = 1.0,DamageDealtScale = 1.0,DoshGiven = 1000),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedMatriarch',HealthScale = 1.0,DamageDealtScale = 1.0,DoshGiven = 1000),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedBloatKing',HealthScale = 1.0,DamageDealtScale = 1.0,DoshGiven = 1000),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedFleshpoundKing',HealthScale = 1.0,DamageDealtScale = 1.0,DoshGiven = 1000)
			)}
		)},
		// Hell On Earth Plus Base
		ZedAdjustmentsByDifficulty[4] = {(
			ZedsToAdjust = {(
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedPatriarch',HealthScale = 1.0,DamageDealtScale = 1.0,DoshGiven = 1000),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedHans',HealthScale = 1.0,DamageDealtScale = 1.0,DoshGiven = 1000),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedMatriarch',HealthScale = 1.0,DamageDealtScale = 1.0,DoshGiven = 1000),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedBloatKing',HealthScale = 1.0,DamageDealtScale = 1.0,DoshGiven = 1000),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedFleshpoundKing',HealthScale = 1.0,DamageDealtScale = 1.0,DoshGiven = 1000)
			)}
		)},

		ZedAdjustmentIncrement = {(
			HealthScale=0.0,
			DamageDealtScale=.01,
			DamageTakenScale=0.0
		)},

		// Normal
		ZedDiffOverride[0]={(
			ZedsOverride={(
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Cyst',HealthMod=0.75f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Alpha',HealthMod=0.75f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_AlphaKing',HealthMod=0.75f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Slasher',HealthMod=0.75f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedSiren',HealthMod=1.f,DamageMod=0.25f,SoloDamageMod=0.3),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedStalker',HealthMod=1.f,DamageMod=1.f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedCrawler',HealthMod=0.75f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedCrawlerKing',HealthMod=0.75f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedGorefast',HealthMod=0.75f,DamageMod=0.4f,SoloDamageMod=0.4),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedGorefastDualBlade',HealthMod=0.75f,DamageMod=0.4f,SoloDamageMod=0.4),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloat',HealthMod=0.75f,DamageMod=0.4f,SoloDamageMod=0.3),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedHusk',HealthMod=0.75f,DamageMod=0.35f,SoloDamageMod=0.35),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedScrake',HealthMod=0.85f,DamageMod=0.425f,SoloDamageMod=0.425),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpound',HealthMod=0.75f,DamageMod=0.31f,SoloDamageMod=0.31),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpoundMini',HealthMod=0.5f,DamageMod=0.31f,SoloDamageMod=0.31),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedHans',HealthMod=0.71f,DamageMod=0.54f,SoloDamageMod=0.4),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedPatriarch',HealthMod=0.75f,DamageMod=0.67f,SoloDamageMod=0.35),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedMatriarch',HealthMod=0.7f,DamageMod=0.6f,SoloDamageMod=0.37),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpoundKing',HealthMod=0.63f,DamageMod=0.51f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloatKing',HealthMod=0.65f,DamageMod=0.7f,SoloDamageMod=0.35),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloatKingSubspawn',HealthMod=0.35f,DamageMod=0.2f)
			)}
		)},
		// Hard
		ZedDiffOverride[1]={(
			ZedsOverride={(
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Cyst',HealthMod=0.75f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Alpha',HealthMod=0.75f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_AlphaKing',HealthMod=0.75f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Slasher',HealthMod=0.75f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedSiren',HealthMod=1.f,DamageMod=0.25f,SoloDamageMod=0.3),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedStalker',HealthMod=1.f,DamageMod=1.f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedCrawler',HealthMod=0.75f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedCrawlerKing',HealthMod=0.75f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedGorefast',HealthMod=0.75f,DamageMod=0.4f,SoloDamageMod=0.4),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedGorefastDualBlade',HealthMod=0.75f,DamageMod=0.4f,SoloDamageMod=0.4),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloat',HealthMod=0.75f,DamageMod=0.4f,SoloDamageMod=0.3),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedHusk',HealthMod=0.75f,DamageMod=0.35f,SoloDamageMod=0.35),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedScrake',HealthMod=0.85f,DamageMod=0.425f,SoloDamageMod=0.425),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpound',HealthMod=0.75f,DamageMod=0.31f,SoloDamageMod=0.31),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpoundMini',HealthMod=0.5f,DamageMod=0.31f,SoloDamageMod=0.31),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedHans',HealthMod=0.71f,DamageMod=0.54f,SoloDamageMod=0.4),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedPatriarch',HealthMod=0.75f,DamageMod=0.67f,SoloDamageMod=0.35),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedMatriarch',HealthMod=0.7f,DamageMod=0.6f,SoloDamageMod=0.37),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpoundKing',HealthMod=0.63f,DamageMod=0.51f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloatKing',HealthMod=0.65f,DamageMod=0.7f,SoloDamageMod=0.35),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloatKingSubspawn',HealthMod=0.35f,DamageMod=0.2f)
			)}
		)},
		// Suicidal
		ZedDiffOverride[2]={(
			ZedsOverride={(
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Cyst',HealthMod=0.75f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Alpha',HealthMod=0.75f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_AlphaKing',HealthMod=0.75f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Slasher',HealthMod=0.75f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedSiren',HealthMod=1.f,DamageMod=0.25f,SoloDamageMod=0.3),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedStalker',HealthMod=1.f,DamageMod=1.f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedCrawler',HealthMod=0.75f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedCrawlerKing',HealthMod=0.75f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedGorefast',HealthMod=0.75f,DamageMod=0.4f,SoloDamageMod=0.4),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedGorefastDualBlade',HealthMod=0.75f,DamageMod=0.4f,SoloDamageMod=0.4),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloat',HealthMod=0.75f,DamageMod=0.4f,SoloDamageMod=0.3),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedHusk',HealthMod=0.75f,DamageMod=0.35f,SoloDamageMod=0.35),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedScrake',HealthMod=0.85f,DamageMod=0.425f,SoloDamageMod=0.425),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpound',HealthMod=0.75f,DamageMod=0.31f,SoloDamageMod=0.31),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpoundMini',HealthMod=0.5f,DamageMod=0.31f,SoloDamageMod=0.31),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedHans',HealthMod=0.71f,DamageMod=0.54f,SoloDamageMod=0.4),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedPatriarch',HealthMod=0.75f,DamageMod=0.67f,SoloDamageMod=0.35),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedMatriarch',HealthMod=0.7f,DamageMod=0.6f,SoloDamageMod=0.37),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpoundKing',HealthMod=0.63f,DamageMod=0.51f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloatKing',HealthMod=0.65f,DamageMod=0.7f,SoloDamageMod=0.35),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloatKingSubspawn',HealthMod=0.35f,DamageMod=0.2f)
			)}
		)},
		// Hell on Earth
		ZedDiffOverride[3]={(
			ZedsOverride={(
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Cyst',HealthMod=0.75f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Alpha',HealthMod=0.75f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_AlphaKing',HealthMod=0.75f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Slasher',HealthMod=0.75f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedSiren',HealthMod=1.f,DamageMod=0.25f,SoloDamageMod=0.3),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedStalker',HealthMod=1.f,DamageMod=1.f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedCrawler',HealthMod=0.75f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedCrawlerKing',HealthMod=0.75f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedGorefast',HealthMod=0.75f,DamageMod=0.4f,SoloDamageMod=0.4),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedGorefastDualBlade',HealthMod=0.75f,DamageMod=0.4f,SoloDamageMod=0.4),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloat',HealthMod=0.75f,DamageMod=0.4f,SoloDamageMod=0.3),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedHusk',HealthMod=0.75f,DamageMod=0.35f,SoloDamageMod=0.35),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedScrake',HealthMod=0.85f,DamageMod=0.425f,SoloDamageMod=0.425),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpound',HealthMod=0.75f,DamageMod=0.31f,SoloDamageMod=0.31),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpoundMini',HealthMod=0.5f,DamageMod=0.31f,SoloDamageMod=0.31),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedHans',HealthMod=0.71f,DamageMod=0.54f,SoloDamageMod=0.4),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedPatriarch',HealthMod=0.75f,DamageMod=0.67f,SoloDamageMod=0.35),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedMatriarch',HealthMod=0.7f,DamageMod=0.6f,SoloDamageMod=0.37),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpoundKing',HealthMod=0.63f,DamageMod=0.51f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloatKing',HealthMod=0.65f,DamageMod=0.7f,SoloDamageMod=0.35),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloatKingSubspawn',HealthMod=0.35f,DamageMod=0.2f)
			)}
		)},
		// Hell on Earth Plus
		ZedDiffOverride[4]={(
			ZedsOverride={(
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Cyst',HealthMod=0.75f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Alpha',HealthMod=0.75f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_AlphaKing',HealthMod=0.75f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Slasher',HealthMod=0.75f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedSiren',HealthMod=1.f,DamageMod=0.25f,SoloDamageMod=0.3),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedStalker',HealthMod=1.f,DamageMod=1.f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedCrawler',HealthMod=0.75f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedCrawlerKing',HealthMod=0.75f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedGorefast',HealthMod=0.75f,DamageMod=0.4f,SoloDamageMod=0.4),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedGorefastDualBlade',HealthMod=0.75f,DamageMod=0.4f,SoloDamageMod=0.4),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloat',HealthMod=0.75f,DamageMod=0.4f,SoloDamageMod=0.3),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedHusk',HealthMod=0.75f,DamageMod=0.35f,SoloDamageMod=0.35),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedScrake',HealthMod=0.85f,DamageMod=0.425f,SoloDamageMod=0.425),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpound',HealthMod=0.75f,DamageMod=0.31f,SoloDamageMod=0.31),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpoundMini',HealthMod=0.5f,DamageMod=0.31f,SoloDamageMod=0.31),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedHans',HealthMod=0.71f,DamageMod=0.54f,SoloDamageMod=0.4),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedPatriarch',HealthMod=0.75f,DamageMod=0.67f,SoloDamageMod=0.35),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedMatriarch',HealthMod=0.7f,DamageMod=0.6f,SoloDamageMod=0.37),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpoundKing',HealthMod=0.63f,DamageMod=0.51f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloatKing',HealthMod=0.65f,DamageMod=0.7f,SoloDamageMod=0.35),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloatKingSubspawn',HealthMod=0.35f,DamageMod=0.2f)
			)}
		)},

OutbreakPctChances[0]=0.5, // Normal
OutbreakPctChances[1]=0.7, // Hard
OutbreakPctChances[2]=0.8, // Suicidal
OutbreakPctChances[3]=0.9, // Hell on Earth
OutbreakPctChances[4]=1.0, // Hell on Earth Plus

		// Normal
		SpecialWavePctChance[0]=0.1, //
		// Hard
		SpecialWavePctChance[1]=0.25,  //0.1
		// Suicidal
		SpecialWavePctChance[2]=0.35,   //0.2
		// Hell on Earth
		SpecialWavePctChance[3]=0.45,  //0.025
		// Hell on Earth Plus
		SpecialWavePctChance[4]=0.5,   //0.3

		// Normal
		DifficultySpecialWaveTypes[0]={(
			SpecialWaveInfos[0]=(ZedType=AT_Clot, PctChance=0.25, WaveScale=2.f, SpawnRateMultiplier=10.0f, bSpawnEnraged=true),
			SpecialWaveInfos[1]=(ZedType=AT_SlasherClot, PctChance=0.25, WaveScale=2.f, SpawnRateMultiplier=10.0f, bSpawnEnraged=true),
			SpecialWaveInfos[2]=(ZedType=AT_Crawler, PctChance=0.25, WaveScale=2.f, SpawnRateMultiplier=10.0f, bSpawnEnraged=true),
			SpecialWaveInfos[3]=(ZedType=AT_Stalker, PctChance=0.0, WaveScale=1.f, SpawnRateMultiplier=3.f),
			SpecialWaveInfos[4]=(ZedType=AT_Siren, PctChance=0.0, WaveScale=0.5f, SpawnRateMultiplier=2.f),
			SpecialWaveInfos[5]=(ZedType=AT_Husk, PctChance=0.0, WaveScale=0.75f, SpawnRateMultiplier=1.0f),
			SpecialWaveInfos[6]=(ZedType=AT_Scrake, PctChance=0.0, WaveScale=0.2f, SpawnRateMultiplier=0.25f),
			SpecialWaveInfos[7]=(ZedType=AT_AlphaClot, PctChance=0.25, WaveScale=2.f, SpawnRateMultiplier=10.0f, bSpawnEnraged=true),
			SpecialWaveInfos[8]=(ZedType=AT_GoreFast, PctChance=0.0, WaveScale=0.75f, SpawnRateMultiplier=1.5f),
			SpecialWaveInfos[9]=(ZedType=AT_Bloat, PctChance=0.0, WaveScale=0.5f, SpawnRateMultiplier=1.5f),
			SpecialWaveInfos[10]=(ZedType=AT_FleshPound, PctChance=0.0, WaveScale=0.2f, SpawnRateMultiplier=0.25f)
		)},
		// Hard
		DifficultySpecialWaveTypes[1]={(
			SpecialWaveInfos[7]=(ZedType=AT_AlphaClot, PctChance=0.2, WaveScale=2.f, SpawnRateMultiplier=10.0f, bSpawnEnraged=true),
			SpecialWaveInfos[9]=(ZedType=AT_Bloat, PctChance=0.2, WaveScale=0.5f, SpawnRateMultiplier=1.5f),
			SpecialWaveInfos[1]=(ZedType=AT_SlasherClot, PctChance=0.2, WaveScale=2.f, SpawnRateMultiplier=10.0f, bSpawnEnraged=true),
			SpecialWaveInfos[2]=(ZedType=AT_Crawler, PctChance=0.2, WaveScale=2.f, SpawnRateMultiplier=10.0f, bSpawnEnraged=true),
			SpecialWaveInfos[3]=(ZedType=AT_Stalker, PctChance=0.2, WaveScale=1.f, SpawnRateMultiplier=3.f)
		)},
		// Suicidal
		DifficultySpecialWaveTypes[2]={(
			SpecialWaveInfos[8]=(ZedType=AT_GoreFast, PctChance=0.17, WaveScale=0.75f, SpawnRateMultiplier=1.5f),
			SpecialWaveInfos[9]=(ZedType=AT_Bloat, PctChance=0.17, WaveScale=0.5f, SpawnRateMultiplier=1.5f),
			SpecialWaveInfos[1]=(ZedType=AT_SlasherClot, PctChance=0.17, WaveScale=2.f, SpawnRateMultiplier=10.0f, bSpawnEnraged=true),
			SpecialWaveInfos[4]=(ZedType=AT_Siren, PctChance=0.17, WaveScale=0.5f, SpawnRateMultiplier=2.f),
			SpecialWaveInfos[5]=(ZedType=AT_Husk, PctChance=0.17, WaveScale=0.75f, SpawnRateMultiplier=1.0f),
			SpecialWaveInfos[6]=(ZedType=AT_Scrake, PctChance=0.17, WaveScale=0.2f, SpawnRateMultiplier=0.25f)
		)},
		// Hell on Earth
		DifficultySpecialWaveTypes[3]={(
			SpecialWaveInfos[8]=(ZedType=AT_GoreFast, PctChance=0.25, WaveScale=0.75f, SpawnRateMultiplier=1.5f, bSpawnEnraged=true),
			SpecialWaveInfos[9]=(ZedType=AT_Bloat, PctChance=0.25, WaveScale=0.5f, SpawnRateMultiplier=1.5f),
			SpecialWaveInfos[5]=(ZedType=AT_Husk, PctChance=0.25, WaveScale=0.75f, SpawnRateMultiplier=1.0f),
			SpecialWaveInfos[6]=(ZedType=AT_Scrake, PctChance=0.25, WaveScale=0.2f, SpawnRateMultiplier=0.25f)
		)},
		// Hell on Earth Plus
		DifficultySpecialWaveTypes[4]={(
			SpecialWaveInfos[10]=(ZedType=AT_FleshPound, PctChance=0.0, WaveScale=0.2f, SpawnRateMultiplier=0.15f),
			SpecialWaveInfos[6]=(ZedType=AT_Scrake, PctChance=1.0, WaveScale=0.2f, SpawnRateMultiplier=0.25f)
		)}
	)}

	// HARD START ----------------------------------------------------------------------------------------------------------------------------------------------------------------
	DifficultyScalings(1)={(
		// Hard
		Difficulties[0]={(
			TraderTime = 60,
			RespawnDosh = 300,
			SpawnRateModifier = 0.8,
			MovementSpeedMod = 0.95,
			WaveCountMod = 0.750000, //0.85
			DoshKillMod = 1.1, //1.0 //0.8
			AmmoPickupsMod = 0.300000,
			ItemPickupsMod = 0.350000,
			SelfInflictedDamageMod = 0.200000,
			TraderTimerMapOverride[0]=(MapName="KF-DieSector",TraderTime=45)
		)},
		// Suicidal
		Difficulties[1]={(
			TraderTime = 60,
			WaveCountMod = 0.8000, //0.95
			SpawnRateModifier = 0.7,   //1.0
			MovementSpeedMod = 0.95,  //1.0
			DoshKillMod = 1.00000,  //0.9 //0.7
			AmmoPickupsMod = 0.40000, //0.25
			ItemPickupsMod = 0.250000,
			MediumAttackChance = 1.000000,
			HardAttackChance = 0.500000,
			SelfInflictedDamageMod = 0.200000,
			TraderTimerMapOverride[0]=(MapName="KF-DieSector",TraderTime=45)
		)},
		// Hell On Earth
		Difficulties[2]={(
			TraderTime = 60,
			MovementSpeedMod = 0.95, //1.05
			SpawnRateModifier = 0.68, //1.0
			WaveCountMod = 0.850000, //1.0
			DoshKillMod = 1.00000, //0.8 0.6
			StartingDosh = 250, //200
			AmmoPickupsMod = 0.250000,
			ItemPickupsMod = 0.100000,
			MediumAttackChance = 1.000000,
			HardAttackChance = 1.000000,
			SelfInflictedDamageMod = 0.20000,
			TraderTimerMapOverride[0]=(MapName="KF-DieSector",TraderTime=45)
		)},
		// Hell On Earth +
		Difficulties[3]={(
			TraderTime = 60,
			MovementSpeedMod = 0.95, //1.05
			SpawnRateModifier = 0.65, //1.0
			WaveCountMod = 0.900000, //1.7
			DoshKillMod = 1.000000,  //0.7 0.5
			StartingDosh = 250, //200
			AmmoPickupsMod = 0.250000,
			ItemPickupsMod = 0.100000,
			MediumAttackChance = 1.000000,
			HardAttackChance = 1.000000,
			SelfInflictedDamageMod = 0.20000,
			TraderTimerMapOverride[0]=(MapName="KF-DieSector",TraderTime=45)
		)},
		// Hell On Earth ++
		Difficulties[4]={(
			TraderTime = 60,
			MovementSpeedMod = 0.95, //1.05
			SpawnRateModifier = 0.6, //1.0
			WaveCountMod = 0.950000, //1.7
			DoshKillMod = 1.000000,  //0.7 0.5
			StartingDosh = 250, //200
			AmmoPickupsMod = 0.250000,
			ItemPickupsMod = 0.100000,
			MediumAttackChance = 1.000000,
			HardAttackChance = 1.000000,
			SelfInflictedDamageMod = 0.20000,
			TraderTimerMapOverride[0]=(MapName="KF-DieSector",TraderTime=45)
		)},

		DifficultyIncrement={(
			TraderTime = 0,
			GlobalHealthMod = 0.0,
			MovementSpeedMod = 0.0,
			WaveCountMod = 0.1, //0.1
			SpawnRateModifier = -0.3,
			DoshKillMod = -0.01,
			StartingDosh = 0,
			RespawnDosh = 0,
			AmmoPickupsMod = 0.2,    //this will need to go to other diff
			ItemPickupsMod = 0.2,    // this will need to go to other diff
			WeakAttackChance = 0.0,
			MediumAttackChance = 0.0,
			HardAttackChance = 0.0,
			SelfInflictedDamageMod = 0.0,
			TraderTimerMapOverride[0]=(MapName="KF-DieSector",TraderTime=45)

		)},

		// Normal
		ZedAdjustmentsByDifficulty[0] = {(
			ZedsToAdjust = {(
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedPatriarch',HealthScale = 0.65,DamageDealtScale = 0.75,DoshGiven = 250),  //750
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedHans',HealthScale = 0.45,DamageDealtScale = 0.75,DoshGiven = 250),  //750

				(ClassToAdjust = class'KFGameContent.KFPawn_ZedMatriarch',HealthScale = 0.55,DamageDealtScale = 0.75,DoshGiven = 250),

				(ClassToAdjust = class'KFGameContent.KFPawn_ZedBloatKing',HealthScale = 0.62,DamageDealtScale = 0.75,DoshGiven = 250), //750
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedBloatKingSubspawn',HealthScale = 0.5,DamageDealtScale = 0.85,DoshGiven = 5),

				(ClassToAdjust = class'KFGameContent.KFPawn_ZedFleshpoundKing',HealthScale = 0.42,DamageDealtScale = 0.75,DoshGiven = 250),  //750
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedFleshpoundMini',HealthScale = 0.42,DamageDealtScale = 0.75,DoshGiven = 11)
			)}
		)},
		// Hard
		ZedAdjustmentsByDifficulty[1] = {(
			ZedsToAdjust = {(
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedPatriarch',HealthScale = 0.9,DamageDealtScale = 0.85,DoshGiven = 500),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedHans',HealthScale = 0.85,DamageDealtScale = 0.85,DoshGiven = 500),

				(ClassToAdjust = class'KFGameContent.KFPawn_ZedMatriarch',HealthScale = 0.75,DamageDealtScale = 0.85,DoshGiven = 500),

				(ClassToAdjust = class'KFGameContent.KFPawn_ZedBloatKing',HealthScale = 0.85,DamageDealtScale = 0.85,DoshGiven = 500),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedBloatKingSubspawn',HealthScale = 0.85,DamageDealtScale = 0.85,DoshGiven = 5),

				(ClassToAdjust = class'KFGameContent.KFPawn_ZedFleshpoundKing',HealthScale = 0.84,DamageDealtScale = 0.85,DoshGiven = 500),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedFleshpoundMini',HealthScale = 0.84,DamageDealtScale = 0.85,DoshGiven = 11)
			)}
		)},
		// Suicidal
		ZedAdjustmentsByDifficulty[2] = {(
			ZedsToAdjust = {(
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedPatriarch',HealthScale = 0.95,DamageDealtScale = 0.95,DoshGiven = 800),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedHans',HealthScale = 0.95,DamageDealtScale = 0.95,DoshGiven = 800),

				(ClassToAdjust = class'KFGameContent.KFPawn_ZedMatriarch',HealthScale = 0.95,DamageDealtScale = 0.95,DoshGiven = 800),

				(ClassToAdjust = class'KFGameContent.KFPawn_ZedBloatKing',HealthScale = 0.95,DamageDealtScale = 0.95,DoshGiven = 800),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedBloatKingSubspawn',HealthScale = 1.0,DamageDealtScale = 0.85,DoshGiven = 5),

				(ClassToAdjust = class'KFGameContent.KFPawn_ZedFleshpoundKing',HealthScale = 0.95,DamageDealtScale = 0.95,DoshGiven = 800),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedFleshpoundMini',HealthScale = 1.0,DamageDealtScale = 0.85,DoshGiven = 11)
			)}
		)},
		// Hell On Earth
		ZedAdjustmentsByDifficulty[3] = {(
			ZedsToAdjust = {(
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedPatriarch',HealthScale = 1.0,DamageDealtScale = 1.0,DoshGiven = 1000),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedHans',HealthScale = 1.0,DamageDealtScale = 1.0,DoshGiven = 1000),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedMatriarch',HealthScale = 1.0,DamageDealtScale = 1.0,DoshGiven = 1000),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedBloatKing',HealthScale = 1.0,DamageDealtScale = 1.0,DoshGiven = 1000),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedFleshpoundKing',HealthScale = 1.0,DamageDealtScale = 1.0,DoshGiven = 1000)
			)}
		)},
		// Hell On Earth Plus Base
		ZedAdjustmentsByDifficulty[4] = {(
			ZedsToAdjust = {(
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedPatriarch',HealthScale = 1.0,DamageDealtScale = 1.0,DoshGiven = 1000),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedHans',HealthScale = 1.0,DamageDealtScale = 1.0,DoshGiven = 1000),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedMatriarch',HealthScale = 1.0,DamageDealtScale = 1.0,DoshGiven = 1000),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedBloatKing',HealthScale = 1.0,DamageDealtScale = 1.0,DoshGiven = 1000),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedFleshpoundKing',HealthScale = 1.0,DamageDealtScale = 1.0,DoshGiven = 1000)
			)}
		)},

		ZedAdjustmentIncrement = {(
			HealthScale=0.0,
			DamageDealtScale=.01,
			DamageTakenScale=0.0
		)},

		// Normal
		ZedDiffOverride[0]={(
			ZedsOverride={(
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Cyst',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Alpha',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_AlphaKing',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Slasher',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedSiren',HealthMod=1.f,DamageMod=0.85f,SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedStalker',HealthMod=1.f,DamageMod=0.75f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedCrawler',HealthMod=1.f,DamageMod=0.75f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedCrawlerKing',HealthMod=1.f,DamageMod=0.75f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedGorefast',HealthMod=1.f,DamageMod=0.75f,SoloDamageMod=0.8),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedGorefastDualBlade',HealthMod=1.f,DamageMod=0.75f,SoloDamageMod=0.8),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloat',HealthMod=1.f,DamageMod=0.75f,SoloDamageMod=0.75),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedHusk',HealthMod=1.f,DamageMod=0.75f,SoloDamageMod=0.75),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedScrake',HealthMod=1.f,DamageMod=0.7f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpound',HealthMod=1.f,DamageMod=0.65f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpoundMini',HealthMod=0.75f,DamageMod=0.65f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedHans',HealthMod=0.82f,DamageMod=0.73f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedPatriarch',HealthMod=1.f,DamageMod=0.81f,SoloDamageMod=0.42),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedMatriarch',HealthMod=0.9f,DamageMod=0.75f,SoloDamageMod=0.45),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpoundKing',HealthMod=0.83f,DamageMod=0.75f,SoloDamageMod=0.5,SoloDamageMod=0.42),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloatKing',HealthMod=0.8f,DamageMod=0.85f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloatKingSubspawn',HealthMod=0.95f,DamageMod=0.75f)
			)}
		)},
		// Hard
		ZedDiffOverride[1]={(
			ZedsOverride={(
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Cyst',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Alpha',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_AlphaKing',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Slasher',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedSiren',HealthMod=1.f,DamageMod=0.85f,SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedStalker',HealthMod=1.f,DamageMod=0.75f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedCrawler',HealthMod=1.f,DamageMod=0.75f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedCrawlerKing',HealthMod=1.f,DamageMod=0.75f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedGorefast',HealthMod=1.f,DamageMod=0.75f,SoloDamageMod=0.8),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedGorefastDualBlade',HealthMod=1.f,DamageMod=0.75f,SoloDamageMod=0.8),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloat',HealthMod=1.f,DamageMod=0.75f,SoloDamageMod=0.75),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedHusk',HealthMod=1.f,DamageMod=0.75f,SoloDamageMod=0.75),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedScrake',HealthMod=1.f,DamageMod=0.7f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpound',HealthMod=1.f,DamageMod=0.65f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpoundMini',HealthMod=0.75f,DamageMod=0.65f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedHans',HealthMod=0.82f,DamageMod=0.73f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedPatriarch',HealthMod=1.f,DamageMod=0.81f,SoloDamageMod=0.42),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedMatriarch',HealthMod=0.9f,DamageMod=0.75f,SoloDamageMod=0.45),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpoundKing',HealthMod=0.83f,DamageMod=0.75f,SoloDamageMod=0.5,SoloDamageMod=0.42),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloatKing',HealthMod=0.8f,DamageMod=0.85f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloatKingSubspawn',HealthMod=0.95f,DamageMod=0.75f)
			)}
		)},
		// Suicidal
		ZedDiffOverride[2]={(
			ZedsOverride={(
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Cyst',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Alpha',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_AlphaKing',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Slasher',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedSiren',HealthMod=1.f,DamageMod=0.85f,SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedStalker',HealthMod=1.f,DamageMod=0.75f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedCrawler',HealthMod=1.f,DamageMod=0.75f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedCrawlerKing',HealthMod=1.f,DamageMod=0.75f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedGorefast',HealthMod=1.f,DamageMod=0.75f,SoloDamageMod=0.8),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedGorefastDualBlade',HealthMod=1.f,DamageMod=0.75f,SoloDamageMod=0.8),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloat',HealthMod=1.f,DamageMod=0.75f,SoloDamageMod=0.75),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedHusk',HealthMod=1.f,DamageMod=0.75f,SoloDamageMod=0.75),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedScrake',HealthMod=1.f,DamageMod=0.7f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpound',HealthMod=1.f,DamageMod=0.65f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpoundMini',HealthMod=0.75f,DamageMod=0.65f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedHans',HealthMod=0.82f,DamageMod=0.73f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedPatriarch',HealthMod=1.f,DamageMod=0.81f,SoloDamageMod=0.42),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedMatriarch',HealthMod=0.9f,DamageMod=0.75f,SoloDamageMod=0.45),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpoundKing',HealthMod=0.83f,DamageMod=0.75f,SoloDamageMod=0.5,SoloDamageMod=0.42),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloatKing',HealthMod=0.8f,DamageMod=0.85f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloatKingSubspawn',HealthMod=0.95f,DamageMod=0.75f)
			)}
		)},
		// Hell on Earth
		ZedDiffOverride[3]={(
			ZedsOverride={(
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Cyst',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Alpha',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_AlphaKing',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Slasher',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedSiren',HealthMod=1.f,DamageMod=0.85f,SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedStalker',HealthMod=1.f,DamageMod=0.75f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedCrawler',HealthMod=1.f,DamageMod=0.75f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedCrawlerKing',HealthMod=1.f,DamageMod=0.75f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedGorefast',HealthMod=1.f,DamageMod=0.75f,SoloDamageMod=0.8),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedGorefastDualBlade',HealthMod=1.f,DamageMod=0.75f,SoloDamageMod=0.8),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloat',HealthMod=1.f,DamageMod=0.75f,SoloDamageMod=0.75),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedHusk',HealthMod=1.f,DamageMod=0.75f,SoloDamageMod=0.75),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedScrake',HealthMod=1.f,DamageMod=0.7f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpound',HealthMod=1.f,DamageMod=0.65f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpoundMini',HealthMod=0.75f,DamageMod=0.65f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedHans',HealthMod=0.82f,DamageMod=0.73f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedPatriarch',HealthMod=1.f,DamageMod=0.81f,SoloDamageMod=0.42),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedMatriarch',HealthMod=0.9f,DamageMod=0.75f,SoloDamageMod=0.45),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpoundKing',HealthMod=0.83f,DamageMod=0.75f,SoloDamageMod=0.5,SoloDamageMod=0.42),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloatKing',HealthMod=0.8f,DamageMod=0.85f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloatKingSubspawn',HealthMod=0.95f,DamageMod=0.75f)
			)}
		)},
		// Hell on Earth Plus
		ZedDiffOverride[4]={(
			ZedsOverride={(
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Cyst',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Alpha',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_AlphaKing',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Slasher',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedSiren',HealthMod=1.f,DamageMod=0.85f,SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedStalker',HealthMod=1.f,DamageMod=0.75f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedCrawler',HealthMod=1.f,DamageMod=0.75f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedCrawlerKing',HealthMod=1.f,DamageMod=0.75f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedGorefast',HealthMod=1.f,DamageMod=0.75f,SoloDamageMod=0.8),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedGorefastDualBlade',HealthMod=1.f,DamageMod=0.75f,SoloDamageMod=0.8),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloat',HealthMod=1.f,DamageMod=0.75f,SoloDamageMod=0.75),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedHusk',HealthMod=1.f,DamageMod=0.75f,SoloDamageMod=0.75),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedScrake',HealthMod=1.f,DamageMod=0.7f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpound',HealthMod=1.f,DamageMod=0.65f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpoundMini',HealthMod=0.75f,DamageMod=0.65f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedHans',HealthMod=0.82f,DamageMod=0.73f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedPatriarch',HealthMod=1.f,DamageMod=0.81f,SoloDamageMod=0.42),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedMatriarch',HealthMod=0.9f,DamageMod=0.75f,SoloDamageMod=0.45),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpoundKing',HealthMod=0.83f,DamageMod=0.75f,SoloDamageMod=0.5,SoloDamageMod=0.42),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloatKing',HealthMod=0.8f,DamageMod=0.85f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloatKingSubspawn',HealthMod=0.95f,DamageMod=0.75f)
			)}
		)},

OutbreakPctChances[0]=0.5, // Normal
OutbreakPctChances[1]=0.7, // Hard
OutbreakPctChances[2]=0.8, // Suicidal
OutbreakPctChances[3]=0.9, // Hell on Earth
OutbreakPctChances[4]=1.0, // Hell on Earth Plus

		// Normal
		SpecialWavePctChance[0]=0.1, //
		// Hard
		SpecialWavePctChance[1]=0.25,  //0.1
		// Suicidal
		SpecialWavePctChance[2]=0.35,   //0.2
		// Hell on Earth
		SpecialWavePctChance[3]=0.45,  //0.025
		// Hell on Earth Plus
		SpecialWavePctChance[4]=0.5,   //0.3

		// Normal
		DifficultySpecialWaveTypes[0]={(
			SpecialWaveInfos[0]=(ZedType=AT_Clot, PctChance=0.25, WaveScale=2.f, SpawnRateMultiplier=10.0f, bSpawnEnraged=true),
			SpecialWaveInfos[1]=(ZedType=AT_SlasherClot, PctChance=0.25, WaveScale=2.f, SpawnRateMultiplier=10.0f, bSpawnEnraged=true),
			SpecialWaveInfos[2]=(ZedType=AT_Crawler, PctChance=0.25, WaveScale=2.f, SpawnRateMultiplier=10.0f, bSpawnEnraged=true),
			SpecialWaveInfos[3]=(ZedType=AT_Stalker, PctChance=0.0, WaveScale=1.f, SpawnRateMultiplier=3.f),
			SpecialWaveInfos[4]=(ZedType=AT_Siren, PctChance=0.0, WaveScale=0.5f, SpawnRateMultiplier=2.f),
			SpecialWaveInfos[5]=(ZedType=AT_Husk, PctChance=0.0, WaveScale=0.75f, SpawnRateMultiplier=1.0f),
			SpecialWaveInfos[6]=(ZedType=AT_Scrake, PctChance=0.0, WaveScale=0.2f, SpawnRateMultiplier=0.25f),
			SpecialWaveInfos[7]=(ZedType=AT_AlphaClot, PctChance=0.25, WaveScale=2.f, SpawnRateMultiplier=10.0f, bSpawnEnraged=true),
			SpecialWaveInfos[8]=(ZedType=AT_GoreFast, PctChance=0.0, WaveScale=0.75f, SpawnRateMultiplier=1.5f),
			SpecialWaveInfos[9]=(ZedType=AT_Bloat, PctChance=0.0, WaveScale=0.5f, SpawnRateMultiplier=1.5f),
			SpecialWaveInfos[10]=(ZedType=AT_FleshPound, PctChance=0.0, WaveScale=0.2f, SpawnRateMultiplier=0.25f)
		)},
		// Hard
		DifficultySpecialWaveTypes[1]={(
			SpecialWaveInfos[7]=(ZedType=AT_AlphaClot, PctChance=0.2, WaveScale=2.f, SpawnRateMultiplier=10.0f, bSpawnEnraged=true),
			SpecialWaveInfos[9]=(ZedType=AT_Bloat, PctChance=0.2, WaveScale=0.5f, SpawnRateMultiplier=1.5f),
			SpecialWaveInfos[1]=(ZedType=AT_SlasherClot, PctChance=0.2, WaveScale=2.f, SpawnRateMultiplier=10.0f, bSpawnEnraged=true),
			SpecialWaveInfos[2]=(ZedType=AT_Crawler, PctChance=0.2, WaveScale=2.f, SpawnRateMultiplier=10.0f, bSpawnEnraged=true),
			SpecialWaveInfos[3]=(ZedType=AT_Stalker, PctChance=0.2, WaveScale=1.f, SpawnRateMultiplier=3.f)
		)},
		// Suicidal
		DifficultySpecialWaveTypes[2]={(
			SpecialWaveInfos[8]=(ZedType=AT_GoreFast, PctChance=0.17, WaveScale=0.75f, SpawnRateMultiplier=1.5f),
			SpecialWaveInfos[9]=(ZedType=AT_Bloat, PctChance=0.17, WaveScale=0.5f, SpawnRateMultiplier=1.5f),
			SpecialWaveInfos[1]=(ZedType=AT_SlasherClot, PctChance=0.17, WaveScale=2.f, SpawnRateMultiplier=10.0f, bSpawnEnraged=true),
			SpecialWaveInfos[4]=(ZedType=AT_Siren, PctChance=0.17, WaveScale=0.5f, SpawnRateMultiplier=2.f),
			SpecialWaveInfos[5]=(ZedType=AT_Husk, PctChance=0.17, WaveScale=0.75f, SpawnRateMultiplier=1.0f),
			SpecialWaveInfos[6]=(ZedType=AT_Scrake, PctChance=0.17, WaveScale=0.2f, SpawnRateMultiplier=0.25f)
		)},
		// Hell on Earth
		DifficultySpecialWaveTypes[3]={(
			SpecialWaveInfos[8]=(ZedType=AT_GoreFast, PctChance=0.25, WaveScale=0.75f, SpawnRateMultiplier=1.5f, bSpawnEnraged=true),
			SpecialWaveInfos[9]=(ZedType=AT_Bloat, PctChance=0.25, WaveScale=0.5f, SpawnRateMultiplier=1.5f),
			SpecialWaveInfos[5]=(ZedType=AT_Husk, PctChance=0.25, WaveScale=0.75f, SpawnRateMultiplier=1.0f),
			SpecialWaveInfos[6]=(ZedType=AT_Scrake, PctChance=0.25, WaveScale=0.2f, SpawnRateMultiplier=0.25f)
		)},
		// Hell on Earth Plus
		DifficultySpecialWaveTypes[4]={(
			SpecialWaveInfos[10]=(ZedType=AT_FleshPound, PctChance=0.0, WaveScale=0.2f, SpawnRateMultiplier=0.15f),
			SpecialWaveInfos[6]=(ZedType=AT_Scrake, PctChance=1.0, WaveScale=0.2f, SpawnRateMultiplier=0.25f)
		)}
	)}

	// SUICIDAL START ----------------------------------------------------------------------------------------------------------------------------------------------------------
	DifficultyScalings(2)={(
			// Sucidal
		Difficulties[0]={(
			TraderTime = 60,
			WaveCountMod = 0.750000, //0.95  //0.9
			SpawnRateModifier = 0.7,   //1.0
			MovementSpeedMod = 0.95,  //1.0
			DoshKillMod = 1.1,  //0.9 //0.7  0.8
			AmmoPickupsMod = 0.40000, //0.25
			ItemPickupsMod = 0.250000,
			MediumAttackChance = 1.000000,
			HardAttackChance = 0.500000,
			SelfInflictedDamageMod = 0.200000,
			TraderTimerMapOverride[0]=(MapName="KF-DieSector",TraderTime=45)
		)},
		// Hell On Earth
		Difficulties[1]={(
			TraderTime = 60,
			MovementSpeedMod = 0.95, //1.05
			SpawnRateModifier = 0.68, //1.0
			WaveCountMod = 0.80000, //1.0 //0.95
			DoshKillMod = 1.0, //0.8 0.6 //0.7
			StartingDosh = 250, //200
			AmmoPickupsMod = 0.250000,
			ItemPickupsMod = 0.100000,
			MediumAttackChance = 1.000000,
			HardAttackChance = 1.000000,
			SelfInflictedDamageMod = 0.20000,
			TraderTimerMapOverride[0]=(MapName="KF-DieSector",TraderTime=45)
		)},
		// Hell On Earth +
		Difficulties[2]={(
			TraderTime = 60,
			MovementSpeedMod = 0.95, //1.05
			SpawnRateModifier = 0.65, //1.0
			WaveCountMod = 0.9000, //1.7 //1.0
			DoshKillMod = 1.000000,  //0.7 0.5  0.6
			StartingDosh = 250, //200
			AmmoPickupsMod = 0.250000,
			ItemPickupsMod = 0.100000,
			MediumAttackChance = 1.000000,
			HardAttackChance = 1.000000,
			SelfInflictedDamageMod = 0.20000,
			TraderTimerMapOverride[0]=(MapName="KF-DieSector",TraderTime=45)
		)},
		// Hell On Earth ++
		Difficulties[3]={(
			TraderTime = 60,
			MovementSpeedMod = 0.95, //1.05
			SpawnRateModifier = 0.6, //1.0
			WaveCountMod = 0.950000, //1.7 //1.05
			DoshKillMod = 1.000000,  //0.7 0.5  0.5
			StartingDosh = 250, //200
			AmmoPickupsMod = 0.250000,
			ItemPickupsMod = 0.100000,
			MediumAttackChance = 1.000000,
			HardAttackChance = 1.000000,
			SelfInflictedDamageMod = 0.20000,
			TraderTimerMapOverride[0]=(MapName="KF-DieSector",TraderTime=45)
		)},
		// Hell On Earth +++
		Difficulties[4]={(
			TraderTime = 60,
			MovementSpeedMod = 0.95, //1.05
			SpawnRateModifier = 0.55, //1.0
			WaveCountMod = 1.000000, //1.7  //1.1
			DoshKillMod = 1.000000,  //0.7 0.5  0.5
			StartingDosh = 250, //200
			AmmoPickupsMod = 0.250000,
			ItemPickupsMod = 0.100000,
			MediumAttackChance = 1.000000,
			HardAttackChance = 1.000000,
			SelfInflictedDamageMod = 0.20000,
			TraderTimerMapOverride[0]=(MapName="KF-DieSector",TraderTime=45)
		)},

		DifficultyIncrement={(
			TraderTime = 0,
			GlobalHealthMod = 0.0,
			MovementSpeedMod = 0.0,
			WaveCountMod = 0.1, //0.1
			SpawnRateModifier = -0.3,
			DoshKillMod = -0.01,
			StartingDosh = 0,
			RespawnDosh = 0,
			AmmoPickupsMod = 0.2,    //this will need to go to other diff
			ItemPickupsMod = 0.2,    // this will need to go to other diff
			WeakAttackChance = 0.0,
			MediumAttackChance = 0.0,
			HardAttackChance = 0.0,
			SelfInflictedDamageMod = 0.0,
			TraderTimerMapOverride[0]=(MapName="KF-DieSector",TraderTime=45)

		)},

				// Normal
		ZedAdjustmentsByDifficulty[0] = {(
			ZedsToAdjust = {(
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedPatriarch',HealthScale = 0.65,DamageDealtScale = 0.75,DoshGiven = 250),  //750
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedHans',HealthScale = 0.45,DamageDealtScale = 0.75,DoshGiven = 250),  //750

				(ClassToAdjust = class'KFGameContent.KFPawn_ZedMatriarch',HealthScale = 0.55,DamageDealtScale = 0.75,DoshGiven = 250),

				(ClassToAdjust = class'KFGameContent.KFPawn_ZedBloatKing',HealthScale = 0.62,DamageDealtScale = 0.75,DoshGiven = 250), //750
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedBloatKingSubspawn',HealthScale = 0.5,DamageDealtScale = 0.85,DoshGiven = 5),

				(ClassToAdjust = class'KFGameContent.KFPawn_ZedFleshpoundKing',HealthScale = 0.42,DamageDealtScale = 0.75,DoshGiven = 250),  //750
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedFleshpoundMini',HealthScale = 0.42,DamageDealtScale = 0.75,DoshGiven = 11)
			)}
		)},
		// Hard
		ZedAdjustmentsByDifficulty[1] = {(
			ZedsToAdjust = {(
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedPatriarch',HealthScale = 0.9,DamageDealtScale = 0.85,DoshGiven = 500),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedHans',HealthScale = 0.85,DamageDealtScale = 0.85,DoshGiven = 500),

				(ClassToAdjust = class'KFGameContent.KFPawn_ZedMatriarch',HealthScale = 0.75,DamageDealtScale = 0.85,DoshGiven = 500),

				(ClassToAdjust = class'KFGameContent.KFPawn_ZedBloatKing',HealthScale = 0.85,DamageDealtScale = 0.85,DoshGiven = 500),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedBloatKingSubspawn',HealthScale = 0.85,DamageDealtScale = 0.85,DoshGiven = 5),

				(ClassToAdjust = class'KFGameContent.KFPawn_ZedFleshpoundKing',HealthScale = 0.84,DamageDealtScale = 0.85,DoshGiven = 500),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedFleshpoundMini',HealthScale = 0.84,DamageDealtScale = 0.85,DoshGiven = 11)
			)}
		)},
		// Suicidal
		ZedAdjustmentsByDifficulty[2] = {(
			ZedsToAdjust = {(
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedPatriarch',HealthScale = 0.95,DamageDealtScale = 0.95,DoshGiven = 800),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedHans',HealthScale = 0.95,DamageDealtScale = 0.95,DoshGiven = 800),

				(ClassToAdjust = class'KFGameContent.KFPawn_ZedMatriarch',HealthScale = 0.95,DamageDealtScale = 0.95,DoshGiven = 800),

				(ClassToAdjust = class'KFGameContent.KFPawn_ZedBloatKing',HealthScale = 0.95,DamageDealtScale = 0.95,DoshGiven = 800),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedBloatKingSubspawn',HealthScale = 1.0,DamageDealtScale = 0.85,DoshGiven = 5),

				(ClassToAdjust = class'KFGameContent.KFPawn_ZedFleshpoundKing',HealthScale = 0.95,DamageDealtScale = 0.95,DoshGiven = 800),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedFleshpoundMini',HealthScale = 1.0,DamageDealtScale = 0.85,DoshGiven = 11)
			)}
		)},
		// Hell On Earth
		ZedAdjustmentsByDifficulty[3] = {(
			ZedsToAdjust = {(
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedPatriarch',HealthScale = 1.0,DamageDealtScale = 1.0,DoshGiven = 1000),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedHans',HealthScale = 1.0,DamageDealtScale = 1.0,DoshGiven = 1000),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedMatriarch',HealthScale = 1.0,DamageDealtScale = 1.0,DoshGiven = 1000),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedBloatKing',HealthScale = 1.0,DamageDealtScale = 1.0,DoshGiven = 1000),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedFleshpoundKing',HealthScale = 1.0,DamageDealtScale = 1.0,DoshGiven = 1000)
			)}
		)},
		// Hell On Earth Plus Base
		ZedAdjustmentsByDifficulty[4] = {(
			ZedsToAdjust = {(
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedPatriarch',HealthScale = 1.0,DamageDealtScale = 1.0,DoshGiven = 1000),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedHans',HealthScale = 1.0,DamageDealtScale = 1.0,DoshGiven = 1000),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedMatriarch',HealthScale = 1.0,DamageDealtScale = 1.0,DoshGiven = 1000),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedBloatKing',HealthScale = 1.0,DamageDealtScale = 1.0,DoshGiven = 1000),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedFleshpoundKing',HealthScale = 1.0,DamageDealtScale = 1.0,DoshGiven = 1000)
			)}
		)},

		ZedAdjustmentIncrement = {(
			HealthScale=0.0,
			DamageDealtScale=0.01,
			DamageTakenScale=0.0
		)},

		// Normal
		ZedDiffOverride[0]={(
			ZedsOverride={(
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Cyst',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Alpha',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_AlphaKing',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Slasher',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedSiren',HealthMod=1.f,DamageMod=1.f,SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedStalker',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedCrawler',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedCrawlerKing',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedGorefast',HealthMod=1.f,DamageMod=1.f,SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedGorefastDualBlade',HealthMod=1.f,DamageMod=1.f,SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloat',HealthMod=1.2f,DamageMod=1.f,SoloDamageMod=0.75),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedHusk',HealthMod=1.f,DamageMod=1.f,SoloDamageMod=0.75),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedScrake',HealthMod=1.1f,DamageMod=1.f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpound',HealthMod=1.1f,DamageMod=1.125f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpoundMini',HealthMod=1.1f,DamageMod=1.f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedHans',HealthMod=0.85f,DamageMod=1.15f,SoloDamageMod=0.4),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedPatriarch',HealthMod=1.13f,DamageMod=1.47f,SoloDamageMod=0.41),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedMatriarch',HealthMod=1.0f,DamageMod=1.15f,SoloDamageMod=0.4),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpoundKing',HealthMod=1.f,DamageMod=1.f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloatKing',HealthMod=0.9f,DamageMod=1.15f,SoloDamageMod=0.41),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloatKingSubspawn',HealthMod=1.f,DamageMod=1.f)
			)}
		)},
		// Hard
		ZedDiffOverride[1]={(
			ZedsOverride={(
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Cyst',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Alpha',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_AlphaKing',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Slasher',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedSiren',HealthMod=1.f,DamageMod=1.f,SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedStalker',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedCrawler',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedCrawlerKing',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedGorefast',HealthMod=1.f,DamageMod=1.f,SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedGorefastDualBlade',HealthMod=1.f,DamageMod=1.f,SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloat',HealthMod=1.2f,DamageMod=1.f,SoloDamageMod=0.75),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedHusk',HealthMod=1.f,DamageMod=1.f,SoloDamageMod=0.75),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedScrake',HealthMod=1.1f,DamageMod=1.f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpound',HealthMod=1.1f,DamageMod=1.125f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpoundMini',HealthMod=1.1f,DamageMod=1.f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedHans',HealthMod=0.85f,DamageMod=1.15f,SoloDamageMod=0.4),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedPatriarch',HealthMod=1.13f,DamageMod=1.47f,SoloDamageMod=0.41),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedMatriarch',HealthMod=1.0f,DamageMod=1.15f,SoloDamageMod=0.4),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpoundKing',HealthMod=1.f,DamageMod=1.f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloatKing',HealthMod=0.9f,DamageMod=1.15f,SoloDamageMod=0.41),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloatKingSubspawn',HealthMod=1.f,DamageMod=1.f)
			)}
		)},
		// Suicidal
		ZedDiffOverride[2]={(
			ZedsOverride={(
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Cyst',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Alpha',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_AlphaKing',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Slasher',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedSiren',HealthMod=1.f,DamageMod=1.f,SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedStalker',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedCrawler',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedCrawlerKing',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedGorefast',HealthMod=1.f,DamageMod=1.f,SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedGorefastDualBlade',HealthMod=1.f,DamageMod=1.f,SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloat',HealthMod=1.2f,DamageMod=1.f,SoloDamageMod=0.75),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedHusk',HealthMod=1.f,DamageMod=1.f,SoloDamageMod=0.75),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedScrake',HealthMod=1.1f,DamageMod=1.f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpound',HealthMod=1.1f,DamageMod=1.125f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpoundMini',HealthMod=1.1f,DamageMod=1.f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedHans',HealthMod=0.85f,DamageMod=1.15f,SoloDamageMod=0.4),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedPatriarch',HealthMod=1.13f,DamageMod=1.47f,SoloDamageMod=0.41),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedMatriarch',HealthMod=1.0f,DamageMod=1.15f,SoloDamageMod=0.4),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpoundKing',HealthMod=1.f,DamageMod=1.f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloatKing',HealthMod=0.9f,DamageMod=1.15f,SoloDamageMod=0.41),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloatKingSubspawn',HealthMod=1.f,DamageMod=1.f)
			)}
		)},
		// Hell on Earth
		ZedDiffOverride[3]={(
			ZedsOverride={(
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Cyst',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Alpha',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_AlphaKing',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Slasher',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedSiren',HealthMod=1.f,DamageMod=1.f,SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedStalker',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedCrawler',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedCrawlerKing',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedGorefast',HealthMod=1.f,DamageMod=1.f,SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedGorefastDualBlade',HealthMod=1.f,DamageMod=1.f,SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloat',HealthMod=1.2f,DamageMod=1.f,SoloDamageMod=0.75),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedHusk',HealthMod=1.f,DamageMod=1.f,SoloDamageMod=0.75),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedScrake',HealthMod=1.1f,DamageMod=1.f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpound',HealthMod=1.1f,DamageMod=1.125f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpoundMini',HealthMod=1.1f,DamageMod=1.f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedHans',HealthMod=0.85f,DamageMod=1.15f,SoloDamageMod=0.4),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedPatriarch',HealthMod=1.13f,DamageMod=1.47f,SoloDamageMod=0.41),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedMatriarch',HealthMod=1.0f,DamageMod=1.15f,SoloDamageMod=0.4),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpoundKing',HealthMod=1.f,DamageMod=1.f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloatKing',HealthMod=0.9f,DamageMod=1.15f,SoloDamageMod=0.41),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloatKingSubspawn',HealthMod=1.f,DamageMod=1.f)
			)}
		)},
		// Hell on Earth Plus
		ZedDiffOverride[4]={(
			ZedsOverride={(
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Cyst',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Alpha',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_AlphaKing',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Slasher',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedSiren',HealthMod=1.f,DamageMod=1.f,SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedStalker',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedCrawler',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedCrawlerKing',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedGorefast',HealthMod=1.f,DamageMod=1.f,SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedGorefastDualBlade',HealthMod=1.f,DamageMod=1.f,SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloat',HealthMod=1.2f,DamageMod=1.f,SoloDamageMod=0.75),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedHusk',HealthMod=1.f,DamageMod=1.f,SoloDamageMod=0.75),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedScrake',HealthMod=1.1f,DamageMod=1.f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpound',HealthMod=1.1f,DamageMod=1.125f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpoundMini',HealthMod=1.1f,DamageMod=1.f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedHans',HealthMod=0.85f,DamageMod=1.15f,SoloDamageMod=0.4),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedPatriarch',HealthMod=1.13f,DamageMod=1.47f,SoloDamageMod=0.41),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedMatriarch',HealthMod=1.0f,DamageMod=1.15f,SoloDamageMod=0.4),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpoundKing',HealthMod=1.f,DamageMod=1.f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloatKing',HealthMod=0.9f,DamageMod=1.15f,SoloDamageMod=0.41),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloatKingSubspawn',HealthMod=1.f,DamageMod=1.f)
			)}
		)},

OutbreakPctChances[0]=0.5, // Normal
OutbreakPctChances[1]=0.7, // Hard
OutbreakPctChances[2]=0.8, // Suicidal
OutbreakPctChances[3]=0.9, // Hell on Earth
OutbreakPctChances[4]=1.0, // Hell on Earth Plus

		// Normal
		SpecialWavePctChance[0]=0.1, //
		// Hard
		SpecialWavePctChance[1]=0.25,  //0.1
		// Suicidal
		SpecialWavePctChance[2]=0.35,   //0.2
		// Hell on Earth
		SpecialWavePctChance[3]=0.45,  //0.025
		// Hell on Earth Plus
		SpecialWavePctChance[4]=0.5,   //0.3

		// Normal
		DifficultySpecialWaveTypes[0]={(
			SpecialWaveInfos[0]=(ZedType=AT_Clot, PctChance=0.25, WaveScale=2.f, SpawnRateMultiplier=10.0f, bSpawnEnraged=true),
			SpecialWaveInfos[1]=(ZedType=AT_SlasherClot, PctChance=0.25, WaveScale=2.f, SpawnRateMultiplier=10.0f, bSpawnEnraged=true),
			SpecialWaveInfos[2]=(ZedType=AT_Crawler, PctChance=0.25, WaveScale=2.f, SpawnRateMultiplier=10.0f, bSpawnEnraged=true),
			SpecialWaveInfos[3]=(ZedType=AT_Stalker, PctChance=0.0, WaveScale=1.f, SpawnRateMultiplier=3.f),
			SpecialWaveInfos[4]=(ZedType=AT_Siren, PctChance=0.0, WaveScale=0.5f, SpawnRateMultiplier=2.f),
			SpecialWaveInfos[5]=(ZedType=AT_Husk, PctChance=0.0, WaveScale=0.75f, SpawnRateMultiplier=1.0f),
			SpecialWaveInfos[6]=(ZedType=AT_Scrake, PctChance=0.0, WaveScale=0.2f, SpawnRateMultiplier=0.25f),
			SpecialWaveInfos[7]=(ZedType=AT_AlphaClot, PctChance=0.25, WaveScale=2.f, SpawnRateMultiplier=10.0f, bSpawnEnraged=true),
			SpecialWaveInfos[8]=(ZedType=AT_GoreFast, PctChance=0.0, WaveScale=0.75f, SpawnRateMultiplier=1.5f),
			SpecialWaveInfos[9]=(ZedType=AT_Bloat, PctChance=0.0, WaveScale=0.5f, SpawnRateMultiplier=1.5f),
			SpecialWaveInfos[10]=(ZedType=AT_FleshPound, PctChance=0.0, WaveScale=0.2f, SpawnRateMultiplier=0.25f)
		)},
		// Hard
		DifficultySpecialWaveTypes[1]={(
			SpecialWaveInfos[7]=(ZedType=AT_AlphaClot, PctChance=0.2, WaveScale=2.f, SpawnRateMultiplier=10.0f, bSpawnEnraged=true),
			SpecialWaveInfos[9]=(ZedType=AT_Bloat, PctChance=0.2, WaveScale=0.5f, SpawnRateMultiplier=1.5f),
			SpecialWaveInfos[1]=(ZedType=AT_SlasherClot, PctChance=0.2, WaveScale=2.f, SpawnRateMultiplier=10.0f, bSpawnEnraged=true),
			SpecialWaveInfos[2]=(ZedType=AT_Crawler, PctChance=0.2, WaveScale=2.f, SpawnRateMultiplier=10.0f, bSpawnEnraged=true),
			SpecialWaveInfos[3]=(ZedType=AT_Stalker, PctChance=0.2, WaveScale=1.f, SpawnRateMultiplier=3.f)
		)},
		// Suicidal
		DifficultySpecialWaveTypes[2]={(
			SpecialWaveInfos[8]=(ZedType=AT_GoreFast, PctChance=0.17, WaveScale=0.75f, SpawnRateMultiplier=1.5f),
			SpecialWaveInfos[9]=(ZedType=AT_Bloat, PctChance=0.17, WaveScale=0.5f, SpawnRateMultiplier=1.5f),
			SpecialWaveInfos[1]=(ZedType=AT_SlasherClot, PctChance=0.17, WaveScale=2.f, SpawnRateMultiplier=10.0f, bSpawnEnraged=true),
			SpecialWaveInfos[4]=(ZedType=AT_Siren, PctChance=0.17, WaveScale=0.5f, SpawnRateMultiplier=2.f),
			SpecialWaveInfos[5]=(ZedType=AT_Husk, PctChance=0.17, WaveScale=0.75f, SpawnRateMultiplier=1.0f),
			SpecialWaveInfos[6]=(ZedType=AT_Scrake, PctChance=0.17, WaveScale=0.2f, SpawnRateMultiplier=0.25f)
		)},
		// Hell on Earth
		DifficultySpecialWaveTypes[3]={(
			SpecialWaveInfos[8]=(ZedType=AT_GoreFast, PctChance=0.25, WaveScale=0.75f, SpawnRateMultiplier=1.5f, bSpawnEnraged=true),
			SpecialWaveInfos[9]=(ZedType=AT_Bloat, PctChance=0.25, WaveScale=0.5f, SpawnRateMultiplier=1.5f),
			SpecialWaveInfos[5]=(ZedType=AT_Husk, PctChance=0.25, WaveScale=0.75f, SpawnRateMultiplier=1.0f),
			SpecialWaveInfos[6]=(ZedType=AT_Scrake, PctChance=0.25, WaveScale=0.2f, SpawnRateMultiplier=0.25f)
		)},
		// Hell on Earth Plus
		DifficultySpecialWaveTypes[4]={(
			SpecialWaveInfos[10]=(ZedType=AT_FleshPound, PctChance=0.0, WaveScale=0.2f, SpawnRateMultiplier=0.15f),
			SpecialWaveInfos[6]=(ZedType=AT_Scrake, PctChance=1.0, WaveScale=0.2f, SpawnRateMultiplier=0.25f)
		)}
	)}

	// HELL ON EARTH START -----------------------------------------------------------------------------------------------------------------------------------------------------
	DifficultyScalings(3)={(
		// Hell On Earth
		Difficulties[0]={(
			TraderTime = 60,
			MovementSpeedMod = 0.95, //1.05
			SpawnRateModifier = 0.5, //1.0 //0.65
			WaveCountMod = 0.850000, //1.0
			DoshKillMod = 1.1, //0.8 0.6
			StartingDosh = 250, //200
			AmmoPickupsMod = 0.250000,
			ItemPickupsMod = 0.100000,
			MediumAttackChance = 1.000000,
			HardAttackChance = 1.000000,
			SelfInflictedDamageMod = 0.50000,
			TraderTimerMapOverride[0]=(MapName="KF-DieSector",TraderTime=45)
		)},
		// Hell On Earth +
		Difficulties[1]={(
			TraderTime = 60,
			MovementSpeedMod = 0.95, //1.05
			SpawnRateModifier = 0.5, //1.0
			WaveCountMod = 0.9, //1.7
			DoshKillMod = 1.000000,  //0.7 0.5
			StartingDosh = 250, //200
			AmmoPickupsMod = 0.250000,
			ItemPickupsMod = 0.100000,
			MediumAttackChance = 1.000000,
			HardAttackChance = 1.000000,
			SelfInflictedDamageMod = 0.50000,
			TraderTimerMapOverride[0]=(MapName="KF-DieSector",TraderTime=45)
		)},
		// Hell On Earth ++
		Difficulties[2]={(
			TraderTime = 60,
			MovementSpeedMod = 0.95, //1.05
			SpawnRateModifier = 0.65, //1.0
			WaveCountMod = 0.95, //1.7
			DoshKillMod = 1.0,  //0.7 0.5
			StartingDosh = 250, //200
			AmmoPickupsMod = 0.250000,
			ItemPickupsMod = 0.100000,
			MediumAttackChance = 1.000000,
			HardAttackChance = 1.000000,
			SelfInflictedDamageMod = 0.50000,
			TraderTimerMapOverride[0]=(MapName="KF-DieSector",TraderTime=45)
		)},
		// Hell On Earth +++
		Difficulties[3]={(
			TraderTime = 60,
			MovementSpeedMod = 0.95, //1.05
			SpawnRateModifier = 0.6, //1.0
			WaveCountMod = 1.0, //1.7
			DoshKillMod = 1.00000,  //0.7 0.5
			StartingDosh = 250, //200
			AmmoPickupsMod = 0.250000,
			ItemPickupsMod = 0.100000,
			MediumAttackChance = 1.000000,
			HardAttackChance = 1.000000,
			SelfInflictedDamageMod = 0.50000,
			TraderTimerMapOverride[0]=(MapName="KF-DieSector",TraderTime=45)
		)},
		// Hell On Earth ++++
		Difficulties[4]={(
			TraderTime = 60,
			MovementSpeedMod = 0.95, //1.05
			SpawnRateModifier = 0.55, //1.0
			WaveCountMod = 1.05000, //1.7
			DoshKillMod = 1.00000,  //0.7 0.5
			StartingDosh = 250, //200
			AmmoPickupsMod = 0.250000,
			ItemPickupsMod = 0.100000,
			MediumAttackChance = 1.000000,
			HardAttackChance = 1.000000,
			SelfInflictedDamageMod = 0.50000,
			TraderTimerMapOverride[0]=(MapName="KF-DieSector",TraderTime=45)
		)},

		DifficultyIncrement={(
			TraderTime = 0,
			GlobalHealthMod = 0.0,
			MovementSpeedMod = 0.0,
			WaveCountMod = 0.1, //0.1
			SpawnRateModifier = -0.3,
			DoshKillMod = -0.01,
			StartingDosh = 0,
			RespawnDosh = 0,
			AmmoPickupsMod = 0.2,    //this will need to go to other diff
			ItemPickupsMod = 0.2,    // this will need to go to other diff
			WeakAttackChance = 0.0,
			MediumAttackChance = 0.0,
			HardAttackChance = 0.0,
			SelfInflictedDamageMod = 0.0,
			TraderTimerMapOverride[0]=(MapName="KF-DieSector",TraderTime=45)

		)},


				// Normal
		ZedAdjustmentsByDifficulty[0] = {(
			ZedsToAdjust = {(
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedPatriarch',HealthScale = 0.65,DamageDealtScale = 1.0,DoshGiven = 250),  //750
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedHans',HealthScale = 0.45,DamageDealtScale = 1.0,DoshGiven = 250),  //750

				(ClassToAdjust = class'KFGameContent.KFPawn_ZedMatriarch',HealthScale = 0.55,DamageDealtScale = 1.0,DoshGiven = 250),

				(ClassToAdjust = class'KFGameContent.KFPawn_ZedBloatKing',HealthScale = 0.62,DamageDealtScale = 1.0,DoshGiven = 250), //750
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedBloatKingSubspawn',HealthScale = 1.0,DamageDealtScale = 1.0,DoshGiven = 5),

				(ClassToAdjust = class'KFGameContent.KFPawn_ZedFleshpoundKing',HealthScale = 0.42,DamageDealtScale = 1.0,DoshGiven = 250),  //750
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedFleshpoundMini',HealthScale = 0.55,DamageDealtScale = 1.0,DoshGiven = 11)
			)}
		)},
		// Hard
		ZedAdjustmentsByDifficulty[1] = {(
			ZedsToAdjust = {(
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedPatriarch',HealthScale = 0.9,DamageDealtScale = 1.0,DoshGiven = 500),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedHans',HealthScale = 0.85,DamageDealtScale = 1.0,DoshGiven = 500),

				(ClassToAdjust = class'KFGameContent.KFPawn_ZedMatriarch',HealthScale = 0.75,DamageDealtScale = 1.0,DoshGiven = 500),

				(ClassToAdjust = class'KFGameContent.KFPawn_ZedBloatKing',HealthScale = 0.85,DamageDealtScale = 1.0,DoshGiven = 500),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedBloatKingSubspawn',HealthScale = 1.0,DamageDealtScale = 1.0,DoshGiven = 5),

				(ClassToAdjust = class'KFGameContent.KFPawn_ZedFleshpoundKing',HealthScale = 0.84,DamageDealtScale = 1.0,DoshGiven = 500),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedFleshpoundMini',HealthScale = 0.84,DamageDealtScale = 1.0,DoshGiven = 11)
			)}
		)},
		// Suicidal
		ZedAdjustmentsByDifficulty[2] = {(
			ZedsToAdjust = {(
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedPatriarch',HealthScale = 0.95,DamageDealtScale = 1.0,DoshGiven = 800),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedHans',HealthScale = 0.95,DamageDealtScale = 1.0,DoshGiven = 800),

				(ClassToAdjust = class'KFGameContent.KFPawn_ZedMatriarch',HealthScale = 0.95,DamageDealtScale = 1.0,DoshGiven = 800),

				(ClassToAdjust = class'KFGameContent.KFPawn_ZedBloatKing',HealthScale = 0.95,DamageDealtScale = 1.0,DoshGiven = 800),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedBloatKingSubspawn',HealthScale = 1.0,DamageDealtScale = 1.0,DoshGiven = 5),

				(ClassToAdjust = class'KFGameContent.KFPawn_ZedFleshpoundKing',HealthScale = 0.95,DamageDealtScale = 1.0,DoshGiven = 800),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedFleshpoundMini',HealthScale = 1.0,DamageDealtScale = 1.0,DoshGiven = 11)
			)}
		)},
		// Hell On Earth
		ZedAdjustmentsByDifficulty[3] = {(
			ZedsToAdjust = {(
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedPatriarch',HealthScale = 1.0,DamageDealtScale = 1.0,DoshGiven = 1000),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedHans',HealthScale = 1.0,DamageDealtScale = 1.0,DoshGiven = 1000),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedMatriarch',HealthScale = 1.0,DamageDealtScale = 1.0,DoshGiven = 1000),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedBloatKing',HealthScale = 1.0,DamageDealtScale = 1.0,DoshGiven = 1000),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedFleshpoundKing',HealthScale = 1.0,DamageDealtScale = 1.0,DoshGiven = 1000)
			)}
		)},
		// Hell On Earth Plus Base
		ZedAdjustmentsByDifficulty[4] = {(
			ZedsToAdjust = {(
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedPatriarch',HealthScale = 1.0,DamageDealtScale = 1.0,DoshGiven = 1000),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedHans',HealthScale = 1.0,DamageDealtScale = 1.0,DoshGiven = 1000),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedMatriarch',HealthScale = 1.0,DamageDealtScale = 1.0,DoshGiven = 1000),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedBloatKing',HealthScale = 1.0,DamageDealtScale = 1.0,DoshGiven = 1000),
				(ClassToAdjust = class'KFGameContent.KFPawn_ZedFleshpoundKing',HealthScale = 1.0,DamageDealtScale = 1.0,DoshGiven = 1000)
			)}
		)},

		ZedAdjustmentIncrement = {(
			HealthScale=0.0,
			DamageDealtScale=.01,
			DamageTakenScale=0.0
		)},

		// Normal
		ZedDiffOverride[0]={(
			ZedsOverride={(
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Cyst',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Alpha',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_AlphaKing',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Slasher',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedSiren',HealthMod=1.f,DamageMod=1.f,SoloDamageMod=0.75),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedStalker',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedCrawler',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedCrawlerKing',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedGorefast',HealthMod=1.f,DamageMod=1.f,SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedGorefastDualBlade',HealthMod=1.f,DamageMod=1.f,SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloat',HealthMod=1.3f,DamageMod=1.5f,SoloDamageMod=0.75),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedHusk',HealthMod=1.3f,DamageMod=1.5f,SoloDamageMod=0.75),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedScrake',HealthMod=1.1f,DamageMod=1.25f,SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpound',HealthMod=1.2f,DamageMod=1.25f,SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpoundMini',HealthMod=1.15f,DamageMod=1.05f, SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedHans',HealthMod=0.91f,DamageMod=1.18f,SoloDamageMod=0.51),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedPatriarch',HealthMod=1.39f,DamageMod=1.45f,SoloDamageMod=0.52),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedMatriarch',HealthMod=1.2f,DamageMod=1.45f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpoundKing',HealthMod=1.2f,DamageMod=1.2f,SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloatKing',HealthMod=1.05f,DamageMod=1.2f,SoloDamageMod=0.52),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloatKingSubspawn',HealthMod=1.f,DamageMod=1.f)
			)}
		)},
		// Hard
		ZedDiffOverride[1]={(
			ZedsOverride={(
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Cyst',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Alpha',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_AlphaKing',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Slasher',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedSiren',HealthMod=1.f,DamageMod=1.f,SoloDamageMod=0.75),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedStalker',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedCrawler',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedCrawlerKing',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedGorefast',HealthMod=1.f,DamageMod=1.f,SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedGorefastDualBlade',HealthMod=1.f,DamageMod=1.f,SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloat',HealthMod=1.3f,DamageMod=1.5f,SoloDamageMod=0.75),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedHusk',HealthMod=1.3f,DamageMod=1.5f,SoloDamageMod=0.75),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedScrake',HealthMod=1.1f,DamageMod=1.25f,SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpound',HealthMod=1.2f,DamageMod=1.25f,SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpoundMini',HealthMod=1.15f,DamageMod=1.05f, SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedHans',HealthMod=0.91f,DamageMod=1.18f,SoloDamageMod=0.51),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedPatriarch',HealthMod=1.39f,DamageMod=1.45f,SoloDamageMod=0.52),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedMatriarch',HealthMod=1.2f,DamageMod=1.45f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpoundKing',HealthMod=1.2f,DamageMod=1.2f,SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloatKing',HealthMod=1.05f,DamageMod=1.2f,SoloDamageMod=0.52),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloatKingSubspawn',HealthMod=1.f,DamageMod=1.f)
			)}
		)},
		// Suicidal
		ZedDiffOverride[2]={(
			ZedsOverride={(
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Cyst',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Alpha',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_AlphaKing',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Slasher',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedSiren',HealthMod=1.f,DamageMod=1.f,SoloDamageMod=0.75),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedStalker',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedCrawler',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedCrawlerKing',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedGorefast',HealthMod=1.f,DamageMod=1.f,SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedGorefastDualBlade',HealthMod=1.f,DamageMod=1.f,SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloat',HealthMod=1.3f,DamageMod=1.5f,SoloDamageMod=0.75),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedHusk',HealthMod=1.3f,DamageMod=1.5f,SoloDamageMod=0.75),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedScrake',HealthMod=1.1f,DamageMod=1.25f,SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpound',HealthMod=1.2f,DamageMod=1.25f,SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpoundMini',HealthMod=1.15f,DamageMod=1.05f, SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedHans',HealthMod=0.91f,DamageMod=1.18f,SoloDamageMod=0.51),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedPatriarch',HealthMod=1.39f,DamageMod=1.45f,SoloDamageMod=0.52),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedMatriarch',HealthMod=1.2f,DamageMod=1.45f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpoundKing',HealthMod=1.2f,DamageMod=1.2f,SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloatKing',HealthMod=1.05f,DamageMod=1.2f,SoloDamageMod=0.52),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloatKingSubspawn',HealthMod=1.f,DamageMod=1.f)
			)}
		)},
		// Hell on Earth
		ZedDiffOverride[3]={(
			ZedsOverride={(
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Cyst',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Alpha',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_AlphaKing',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Slasher',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedSiren',HealthMod=1.f,DamageMod=1.f,SoloDamageMod=0.75),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedStalker',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedCrawler',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedCrawlerKing',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedGorefast',HealthMod=1.f,DamageMod=1.f,SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedGorefastDualBlade',HealthMod=1.f,DamageMod=1.f,SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloat',HealthMod=1.3f,DamageMod=1.5f,SoloDamageMod=0.75),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedHusk',HealthMod=1.3f,DamageMod=1.5f,SoloDamageMod=0.75),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedScrake',HealthMod=1.1f,DamageMod=1.25f,SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpound',HealthMod=1.2f,DamageMod=1.25f,SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpoundMini',HealthMod=1.15f,DamageMod=1.05f, SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedHans',HealthMod=0.91f,DamageMod=1.18f,SoloDamageMod=0.51),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedPatriarch',HealthMod=1.39f,DamageMod=1.45f,SoloDamageMod=0.52),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedMatriarch',HealthMod=1.2f,DamageMod=1.45f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpoundKing',HealthMod=1.2f,DamageMod=1.2f,SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloatKing',HealthMod=1.05f,DamageMod=1.2f,SoloDamageMod=0.52),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloatKingSubspawn',HealthMod=1.f,DamageMod=1.f)
			)}
		)},
		// Hell on Earth Plus
		ZedDiffOverride[4]={(
			ZedsOverride={(
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Cyst',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Alpha',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_AlphaKing',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedClot_Slasher',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedSiren',HealthMod=1.f,DamageMod=1.f,SoloDamageMod=0.75),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedStalker',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedCrawler',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedCrawlerKing',HealthMod=1.f,DamageMod=1.f),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedGorefast',HealthMod=1.f,DamageMod=1.f,SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedGorefastDualBlade',HealthMod=1.f,DamageMod=1.f,SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloat',HealthMod=1.3f,DamageMod=1.5f,SoloDamageMod=0.75),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedHusk',HealthMod=1.3f,DamageMod=1.5f,SoloDamageMod=0.75),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedScrake',HealthMod=1.1f,DamageMod=1.25f,SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpound',HealthMod=1.2f,DamageMod=1.25f,SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpoundMini',HealthMod=1.15f,DamageMod=1.05f, SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedHans',HealthMod=0.91f,DamageMod=1.18f,SoloDamageMod=0.51),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedPatriarch',HealthMod=1.39f,DamageMod=1.45f,SoloDamageMod=0.52),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedMatriarch',HealthMod=1.2f,DamageMod=1.45f,SoloDamageMod=0.5),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedFleshpoundKing',HealthMod=1.2f,DamageMod=1.2f,SoloDamageMod=0.65),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloatKing',HealthMod=1.05f,DamageMod=1.2f,SoloDamageMod=0.52),
				(ClassToAdjust=class'KFGameContent.KFPawn_ZedBloatKingSubspawn',HealthMod=1.f,DamageMod=1.f)
			)}
		)},

OutbreakPctChances[0]=0.5, // Normal
OutbreakPctChances[1]=0.7, // Hard
OutbreakPctChances[2]=0.8, // Suicidal
OutbreakPctChances[3]=0.9, // Hell on Earth
OutbreakPctChances[4]=1.0, // Hell on Earth Plus

		// Normal
		SpecialWavePctChance[0]=0.1, //
		// Hard
		SpecialWavePctChance[1]=0.25,  //0.1
		// Suicidal
		SpecialWavePctChance[2]=0.35,   //0.2
		// Hell on Earth
		SpecialWavePctChance[3]=0.45,  //0.025
		// Hell on Earth Plus
		SpecialWavePctChance[4]=0.5,   //0.3

		// Normal
		DifficultySpecialWaveTypes[0]={(
			SpecialWaveInfos[0]=(ZedType=AT_Clot, PctChance=0.25, WaveScale=2.f, SpawnRateMultiplier=10.0f, bSpawnEnraged=true),
			SpecialWaveInfos[1]=(ZedType=AT_SlasherClot, PctChance=0.25, WaveScale=2.f, SpawnRateMultiplier=10.0f, bSpawnEnraged=true),
			SpecialWaveInfos[2]=(ZedType=AT_Crawler, PctChance=0.25, WaveScale=2.f, SpawnRateMultiplier=10.0f, bSpawnEnraged=true),
			SpecialWaveInfos[3]=(ZedType=AT_Stalker, PctChance=0.0, WaveScale=1.f, SpawnRateMultiplier=3.f),
			SpecialWaveInfos[4]=(ZedType=AT_Siren, PctChance=0.0, WaveScale=0.5f, SpawnRateMultiplier=2.f),
			SpecialWaveInfos[5]=(ZedType=AT_Husk, PctChance=0.0, WaveScale=0.75f, SpawnRateMultiplier=1.0f),
			SpecialWaveInfos[6]=(ZedType=AT_Scrake, PctChance=0.0, WaveScale=0.2f, SpawnRateMultiplier=0.25f),
			SpecialWaveInfos[7]=(ZedType=AT_AlphaClot, PctChance=0.25, WaveScale=2.f, SpawnRateMultiplier=10.0f, bSpawnEnraged=true),
			SpecialWaveInfos[8]=(ZedType=AT_GoreFast, PctChance=0.0, WaveScale=0.75f, SpawnRateMultiplier=1.5f),
			SpecialWaveInfos[9]=(ZedType=AT_Bloat, PctChance=0.0, WaveScale=0.5f, SpawnRateMultiplier=1.5f),
			SpecialWaveInfos[10]=(ZedType=AT_FleshPound, PctChance=0.0, WaveScale=0.2f, SpawnRateMultiplier=0.25f)
		)},
		// Hard
		DifficultySpecialWaveTypes[1]={(
			SpecialWaveInfos[7]=(ZedType=AT_AlphaClot, PctChance=0.2, WaveScale=2.f, SpawnRateMultiplier=10.0f, bSpawnEnraged=true),
			SpecialWaveInfos[9]=(ZedType=AT_Bloat, PctChance=0.2, WaveScale=0.5f, SpawnRateMultiplier=1.5f),
			SpecialWaveInfos[1]=(ZedType=AT_SlasherClot, PctChance=0.2, WaveScale=2.f, SpawnRateMultiplier=10.0f, bSpawnEnraged=true),
			SpecialWaveInfos[2]=(ZedType=AT_Crawler, PctChance=0.2, WaveScale=2.f, SpawnRateMultiplier=10.0f, bSpawnEnraged=true),
			SpecialWaveInfos[3]=(ZedType=AT_Stalker, PctChance=0.2, WaveScale=1.f, SpawnRateMultiplier=3.f)
		)},
		// Suicidal
		DifficultySpecialWaveTypes[2]={(
			SpecialWaveInfos[8]=(ZedType=AT_GoreFast, PctChance=0.17, WaveScale=0.75f, SpawnRateMultiplier=1.5f),
			SpecialWaveInfos[9]=(ZedType=AT_Bloat, PctChance=0.17, WaveScale=0.5f, SpawnRateMultiplier=1.5f),
			SpecialWaveInfos[1]=(ZedType=AT_SlasherClot, PctChance=0.17, WaveScale=2.f, SpawnRateMultiplier=10.0f, bSpawnEnraged=true),
			SpecialWaveInfos[4]=(ZedType=AT_Siren, PctChance=0.17, WaveScale=0.5f, SpawnRateMultiplier=2.f),
			SpecialWaveInfos[5]=(ZedType=AT_Husk, PctChance=0.17, WaveScale=0.75f, SpawnRateMultiplier=1.0f),
			SpecialWaveInfos[6]=(ZedType=AT_Scrake, PctChance=0.17, WaveScale=0.2f, SpawnRateMultiplier=0.25f)
		)},
		// Hell on Earth
		DifficultySpecialWaveTypes[3]={(
			SpecialWaveInfos[8]=(ZedType=AT_GoreFast, PctChance=0.25, WaveScale=0.75f, SpawnRateMultiplier=1.5f, bSpawnEnraged=true),
			SpecialWaveInfos[9]=(ZedType=AT_Bloat, PctChance=0.25, WaveScale=0.5f, SpawnRateMultiplier=1.5f),
			SpecialWaveInfos[5]=(ZedType=AT_Husk, PctChance=0.25, WaveScale=0.75f, SpawnRateMultiplier=1.0f),
			SpecialWaveInfos[6]=(ZedType=AT_Scrake, PctChance=0.25, WaveScale=0.2f, SpawnRateMultiplier=0.25f)
		)},
		// Hell on Earth Plus
		DifficultySpecialWaveTypes[4]={(
			SpecialWaveInfos[10]=(ZedType=AT_FleshPound, PctChance=0.0, WaveScale=0.2f, SpawnRateMultiplier=0.15f),
			SpecialWaveInfos[6]=(ZedType=AT_Scrake, PctChance=1.0, WaveScale=0.2f, SpawnRateMultiplier=0.25f)
		)}
	)}
}
