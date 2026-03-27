# Dead Zone — сервер Killing Floor 2

![KF2](https://img.shields.io/badge/Game-Killing%20Floor%202-red)
![Server](https://img.shields.io/badge/Status-Online-brightgreen)
![Version](https://img.shields.io/badge/Build-Custom-orange)

Исходный код и конфигурации для моего сервера Killing Floor 2 с кастомными модификациями.

## 🎮 Подключение к серверу

**IP-адрес сервера:** 87.224.213.71:7777


## 📦 Сборка и запуск

### Проект основан на: [https://github.com/GenZmeY/KF2-MSK-GS](https://github.com/GenZmeY/KF2-MSK-GS)

### Строка запуска сервера:
?Game=DeadZone.DeadZone_Survival?Mutator=CTI.Mut,YAS.YASMut,DeadZone-SRV.DeadZone_Mut,TRB.Mut,CVC.Mut,StartWave.Mut,UnofficialKFPatch_Lite.UKFPMutator?adminpassword=XXX?AdminName=raiden4242?MaxPlayers=16?Difficulty=2?


## ✨ Основные модификации

### 1. Улучшенный режим Endless
- Добавлен полный боезапас и гранаты в начале игры
- Случайные события с зедами для класса `DeadZone_Endless.uc`
- Включена сложность **HoE+** (Hell on Earth+)
- Принудительный запуск события **OutBreak**

### 2. Добавлено отображение оружия на спине персонажа.

![Система рюкзака](https://github.com/user-attachments/assets/5c58ff0a-5c54-49e4-914b-190c7b77b3f6)

### 3. Персонализация
- Добавлены **ноги от первого лица** для большей иммерсивности

![Ноги от первого лица](https://github.com/user-attachments/assets/ea18ffd5-d7f0-4b5c-a9e9-16c230739ce1)

### 4. Изменения торговца
- **Все двери торговца открыты** с самого начала волны

![Открытые двери торговца](https://github.com/user-attachments/assets/f0b1d8d6-5ce0-4bda-89bf-8d299b6f8ee6)

### 5. Система смерти
- **Выпадение всего оружия** после смерти игрока

![Выпадение оружия после смерти](https://github.com/user-attachments/assets/46263353-46b8-4cf2-b490-c99874558da1)

### 6. Кастомное оружие
- Добавлена кастомная версия **AA12 DZ** (`DeadZone.KFWeap_Shotgun_AA12_DZ`)
- Использование взломанного скина DLC

![Кастомный AA12 DZ](https://github.com/user-attachments/assets/62bc87c0-de34-48f4-9adb-a216b5c4eb2c)

## ⚠️ Экспериментальные функции

### Система голосования за карты
- Файл `Src_test_new_Map_Vote.7z` содержит **xVotingHandler** (систему голосования за карты) из ServerExtMut
- **Известная проблема:** голосовалка зависает после смены карты

![Система голосования](https://github.com/user-attachments/assets/6ea21914-f907-4626-9115-f88cc1a650ab)
