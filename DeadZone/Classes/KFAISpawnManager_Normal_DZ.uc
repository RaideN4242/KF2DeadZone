class KFAISpawnManager_Normal_DZ extends KFAISpawnManager_Normal;

DefaultProperties
{
    EarlyWaveIndex=4
	
		//Suicidial
	PerDifficultyMaxMonsters[2]={(
			MaxMonsters[0]=24,
			MaxMonsters[1]=36,
			MaxMonsters[2]=64,
			MaxMonsters[3]=76,
			MaxMonsters[4]=92,
			MaxMonsters[5]=104
		)}
				
	//Hell on Earth
	PerDifficultyMaxMonsters[3]={(
			MaxMonsters[0]=12, //16
			MaxMonsters[1]=18,
			MaxMonsters[2]=32,  //22
			MaxMonsters[3]=38,  //26
			MaxMonsters[4]=46,  //30
			MaxMonsters[5]=56
		)}

    // ---------------------------------------------
    // Wave settings
    // Normal
    DifficultyWaveSettings(0)={(Waves[0]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Norm.ZED_Wave1_Med_Norm',
                                Waves[1]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Norm.ZED_Wave2_Med_Norm',
                                Waves[2]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Norm.ZED_Wave3_Med_Norm',
                                Waves[3]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Norm.ZED_Wave4_Med_Norm',
                                Waves[4]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Norm.ZED_Wave5_Med_Norm',
                                Waves[5]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Norm.ZED_Wave6_Med_Norm',
                                Waves[6]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Norm.ZED_Wave7_Med_Norm',
                                Waves[7]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Norm.ZED_Boss_Med_Norm')}

    // Hard
    DifficultyWaveSettings(1)={(Waves[0]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Hard.ZED_Wave1_Med_Hard',
                                Waves[1]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Hard.ZED_Wave2_Med_Hard',
                                Waves[2]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Hard.ZED_Wave3_Med_Hard',
                                Waves[3]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Hard.ZED_Wave4_Med_Hard',
                                Waves[4]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Hard.ZED_Wave5_Med_Hard',
                                Waves[5]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Hard.ZED_Wave6_Med_Hard',
                                Waves[6]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Hard.ZED_Wave7_Med_Hard',
                                Waves[7]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Hard.ZED_Boss_Med_Hard')}

    // Suicidal
    DifficultyWaveSettings(2)={(Waves[0]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Suicidal.ZED_Wave1_Med_SUI',
                                Waves[1]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Suicidal.ZED_Wave2_Med_SUI',
                                Waves[2]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Suicidal.ZED_Wave3_Med_SUI',
                                Waves[3]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Suicidal.ZED_Wave4_Med_SUI',
                                Waves[4]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Suicidal.ZED_Wave5_Med_SUI',
                                Waves[5]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Suicidal.ZED_Wave6_Med_SUI',
                                Waves[6]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Suicidal.ZED_Wave7_Med_SUI',
                                Waves[7]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.Suicidal.ZED_Boss_Med_SUI')}

    // Hell On Earth
    DifficultyWaveSettings(3)={(Waves[0]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.HOE.ZED_Wave1_Med_HOE',
                                Waves[1]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.HOE.ZED_Wave2_Med_HOE',
                                Waves[2]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.HOE.ZED_Wave3_Med_HOE',
                                Waves[3]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.HOE.ZED_Wave4_Med_HOE',
                                Waves[4]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.HOE.ZED_Wave5_Med_HOE',
                                Waves[5]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.HOE.ZED_Wave6_Med_HOE',
                                Waves[6]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.HOE.ZED_Wave7_Med_HOE',
                                Waves[7]=KFAIWaveInfo'GP_Spawning_ARCH.Normal.HOE.ZED_Boss_Med_HOE')}

    // ---------------------------------------------
    // Solo Spawn Rates
    // Normal
    SoloWaveSpawnRateModifier(0)={(RateModifier[0]=1.55,     // Wave 1  //1.65 for all
                                   RateModifier[1]=1.60,     // Wave 2
                                   RateModifier[2]=1.65,     // Wave 3
                                   RateModifier[3]=1.70,     // Wave 4
                                   RateModifier[4]=1.75,     // Wave 5
                                   RateModifier[5]=1.8,     // Wave 6
                                   RateModifier[6]=1.85)}    // Wave 7

    // Hard
    SoloWaveSpawnRateModifier(1)={(RateModifier[0]=1.55,     // Wave 1   //1.8 for all
                                   RateModifier[1]=1.60,     // Wave 2
                                   RateModifier[2]=1.65,     // Wave 3
                                   RateModifier[3]=1.70,     // Wave 4
                                   RateModifier[4]=1.75,     // Wave 5
                                   RateModifier[5]=1.80,     // Wave 6
                                   RateModifier[6]=1.80)}    // Wave 7

    // Suicidal
    SoloWaveSpawnRateModifier(2)={(RateModifier[0]=1.55,     // Wave 1     //1.8 for all
                                   RateModifier[1]=1.60,     // Wave 2
                                   RateModifier[2]=1.65,     // Wave 3
                                   RateModifier[3]=1.70,     // Wave 4
                                   RateModifier[4]=1.75,     // Wave 5
                                   RateModifier[5]=1.80,     // Wave 6
                                   RateModifier[6]=1.80)}    // Wave 7

    // Hell On Earth
    SoloWaveSpawnRateModifier(3)={(RateModifier[0]=1.55,     // Wave 1     //1.8 for all
                                   RateModifier[1]=1.60,     // Wave 2
                                   RateModifier[2]=1.65,     // Wave 3
                                   RateModifier[3]=1.70,     // Wave 4
                                   RateModifier[4]=1.75,     // Wave 5
                                   RateModifier[5]=1.80,     // Wave 6
                                   RateModifier[6]=1.80)}    // Wave 7
}
