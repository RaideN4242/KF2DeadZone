class KFExtendedHUD extends KFGFxHudWrapper;

var array<Ext_T_MonsterPRI> MyCurrentPet;

var DeadZone_PlayerReplicationInfo EPRI; // Замена ExtPlayerReplicationInfo на DeadZone_PlayerReplicationInfo
var transient float BestPetXL, BestPetYL;

var localized string NewItemText;

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	KFPlayerOwner = KFPlayerController(Owner);
}

simulated function Destroyed()
{
	Super.Destroyed();
	NotifyLevelChange();
}

simulated final function NotifyLevelChange(optional bool bMapswitch)
{
	// Clear any delegates or references if needed
}

event PostRender()
{
	if (KFGRI == None)
		KFGRI = KFGameReplicationInfo(WorldInfo.GRI);

	if (MyCurrentPet.Length > 0)
		DrawPetInfo();

	if (EPRI == None)
		EPRI = DeadZone_PlayerReplicationInfo(KFPlayerOwner.PlayerReplicationInfo); // Замена ExtPlayerReplicationInfo на DeadZone_PlayerReplicationInfo
}

final function DrawPetInfo()
{
	local float X, Y, XL, YL, YS;
	local string S;
	local int i;

	X = Canvas.ClipX * 0.165;
	Y = Canvas.ClipY * 0.925;
	Canvas.Font = class'Engine'.static.GetMediumFont(); // Используем стандартный шрифт
	Canvas.TextSize("ABC", XL, YS);
	S = "Current Pet(s)"; // TODO: Localization.
	Canvas.TextSize(S, XL, YL);
	Y -= (YS * MyCurrentPet.Length);

	Canvas.SetDrawColor(120, 0, 0, 145);
	DrawRectBox(X, Y, BestPetXL * 1.04, YL);

	Canvas.DrawColor = MakeColor(255, 255, 255, 255);
	Canvas.SetPos(X, Y);
	Canvas.DrawText(S);

	Canvas.SetDrawColor(8, 8, 8, 145);
	DrawRectBox(X, Y + YS, BestPetXL * 1.04, YL * MyCurrentPet.Length);

	Canvas.DrawColor = MakeColor(32, 250, 32, 255);
	for (i = 0; i < MyCurrentPet.Length; ++i)
	{
		if (MyCurrentPet[i] == None)
		{
			MyCurrentPet.Remove(i--, 1);
			continue;
		}
		Y += YS;
		S = MyCurrentPet[i].MonsterName $ " (" $ MyCurrentPet[i].HealthStatus $ "/" $ MyCurrentPet[i].HealthMax $ "HP)";
		Canvas.TextSize(S, XL, YL);
		Canvas.SetPos(X, Y);
		Canvas.DrawText(S);

		if (XL > BestPetXL)
			BestPetXL = XL;
		if (YL > BestPetYL)
			BestPetYL = YL;
	}
}

static final function string GetNameOf(class<Pawn> Other)
{
	local string S;
	local class<KFPawn_Monster> KFM;

	if (Class<VSZombie>(Other) != None)
		return Class<VSZombie>(Other).Default.ZombieName;

	KFM = class<KFPawn_Monster>(Other);
	if (KFM != None && KFM.default.LocalizationKey != '')
		return Localize("Zeds", string(KFM.default.LocalizationKey), "KFGame");

	if (Other.Default.MenuName != "")
		return Other.Default.MenuName;
	S = string(Other.Name);
	if (Left(S, 10) ~= "KFPawn_Zed")
		S = Mid(S, 10);
	else if (Left(S, 7) ~= "KFPawn_")
		S = Mid(S, 7);
	S = Repl(S, "_", " ");
	return S;
}

simulated function DrawRectBox(float X, float Y, float Width, float Height)
{
	// Простая замена для отрисовки прямоугольника
	Canvas.SetPos(X, Y);
	Canvas.DrawBox(Width, Height);
}

defaultproperties
{
///	HUDClass=class'ExtMoviePlayer_HUD'
}