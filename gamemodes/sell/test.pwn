#include	<YSI_Coding\y_hooks>

#include    <stamina>

/*new PlayerText:Stamina_TextDraws[MAX_PLAYERS][6];
new PlayerBar:Stamina_Bar[MAX_PLAYERS][1];*/

hook OnPlayerConnect(playerid)
{
	/*Stamina_TextDraws[playerid][0] = CreatePlayerTextDraw(playerid, 146.000000, 378.000000, "ld_beat:chit");
	PlayerTextDrawFont(playerid, Stamina_TextDraws[playerid][0], 4);
	PlayerTextDrawLetterSize(playerid, Stamina_TextDraws[playerid][0], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Stamina_TextDraws[playerid][0], 29.000000, 24.000000);
	PlayerTextDrawSetOutline(playerid, Stamina_TextDraws[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, Stamina_TextDraws[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, Stamina_TextDraws[playerid][0], 1);
	PlayerTextDrawColor(playerid, Stamina_TextDraws[playerid][0], 1296911871);
	PlayerTextDrawBackgroundColor(playerid, Stamina_TextDraws[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, Stamina_TextDraws[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, Stamina_TextDraws[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, Stamina_TextDraws[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, Stamina_TextDraws[playerid][0], 0);

	Stamina_TextDraws[playerid][1] = CreatePlayerTextDraw(playerid, 228.000000, 378.000000, "ld_beat:chit");
	PlayerTextDrawFont(playerid, Stamina_TextDraws[playerid][1], 4);
	PlayerTextDrawLetterSize(playerid, Stamina_TextDraws[playerid][1], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Stamina_TextDraws[playerid][1], 29.000000, 24.000000);
	PlayerTextDrawSetOutline(playerid, Stamina_TextDraws[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, Stamina_TextDraws[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, Stamina_TextDraws[playerid][1], 1);
	PlayerTextDrawColor(playerid, Stamina_TextDraws[playerid][1], 1296911871);
	PlayerTextDrawBackgroundColor(playerid, Stamina_TextDraws[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, Stamina_TextDraws[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, Stamina_TextDraws[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, Stamina_TextDraws[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, Stamina_TextDraws[playerid][1], 0);

	Stamina_TextDraws[playerid][2] = CreatePlayerTextDraw(playerid, 202.000000, 384.000000, "_");
	PlayerTextDrawFont(playerid, Stamina_TextDraws[playerid][2], 1);
	PlayerTextDrawLetterSize(playerid, Stamina_TextDraws[playerid][2], 0.600000, 1.350003);
	PlayerTextDrawTextSize(playerid, Stamina_TextDraws[playerid][2], 298.500000, 74.500000);
	PlayerTextDrawSetOutline(playerid, Stamina_TextDraws[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, Stamina_TextDraws[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, Stamina_TextDraws[playerid][2], 2);
	PlayerTextDrawColor(playerid, Stamina_TextDraws[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, Stamina_TextDraws[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, Stamina_TextDraws[playerid][2], 1296911871);
	PlayerTextDrawUseBox(playerid, Stamina_TextDraws[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, Stamina_TextDraws[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, Stamina_TextDraws[playerid][2], 0);

	Stamina_TextDraws[playerid][3] = CreatePlayerTextDraw(playerid, 158.000000, 384.000000, "HUD:radar_hostpital");
	PlayerTextDrawFont(playerid, Stamina_TextDraws[playerid][3], 4);
	PlayerTextDrawLetterSize(playerid, Stamina_TextDraws[playerid][3], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Stamina_TextDraws[playerid][3], 17.000000, 12.000000);
	PlayerTextDrawSetOutline(playerid, Stamina_TextDraws[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, Stamina_TextDraws[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, Stamina_TextDraws[playerid][3], 1);
	PlayerTextDrawColor(playerid, Stamina_TextDraws[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, Stamina_TextDraws[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, Stamina_TextDraws[playerid][3], 50);
	PlayerTextDrawUseBox(playerid, Stamina_TextDraws[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, Stamina_TextDraws[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, Stamina_TextDraws[playerid][3], 0);

	Stamina_TextDraws[playerid][4] = CreatePlayerTextDraw(playerid, 177.000000, 371.000000, "S");
	PlayerTextDrawFont(playerid, Stamina_TextDraws[playerid][4], 1);
	PlayerTextDrawLetterSize(playerid, Stamina_TextDraws[playerid][4], 0.370833, 1.400000);
	PlayerTextDrawTextSize(playerid, Stamina_TextDraws[playerid][4], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Stamina_TextDraws[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, Stamina_TextDraws[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, Stamina_TextDraws[playerid][4], 1);
	PlayerTextDrawColor(playerid, Stamina_TextDraws[playerid][4], -1962934017);
	PlayerTextDrawBackgroundColor(playerid, Stamina_TextDraws[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, Stamina_TextDraws[playerid][4], 50);
	PlayerTextDrawUseBox(playerid, Stamina_TextDraws[playerid][4], 0);
	PlayerTextDrawSetProportional(playerid, Stamina_TextDraws[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, Stamina_TextDraws[playerid][4], 0);

	Stamina_TextDraws[playerid][5] = CreatePlayerTextDraw(playerid, 185.000000, 373.000000, "tamina");
	PlayerTextDrawFont(playerid, Stamina_TextDraws[playerid][5], 2);
	PlayerTextDrawLetterSize(playerid, Stamina_TextDraws[playerid][5], 0.216666, 1.100000);
	PlayerTextDrawTextSize(playerid, Stamina_TextDraws[playerid][5], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Stamina_TextDraws[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, Stamina_TextDraws[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, Stamina_TextDraws[playerid][5], 1);
	PlayerTextDrawColor(playerid, Stamina_TextDraws[playerid][5], -1);
	PlayerTextDrawBackgroundColor(playerid, Stamina_TextDraws[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, Stamina_TextDraws[playerid][5], 50);
	PlayerTextDrawUseBox(playerid, Stamina_TextDraws[playerid][5], 0);
	PlayerTextDrawSetProportional(playerid, Stamina_TextDraws[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, Stamina_TextDraws[playerid][5], 0);

	Stamina_Bar[playerid][0] = CreatePlayerProgressBar(playerid, 180.000000, 386.000000, 69.000000, 9.000000, COLOR_YELLOW, 100.000000, 0);
	*/

	SetPlayerMaxStamina(playerid, 100);
	SetPlayerStamina(playerid, 100);

	return 1;
}

/*ShowPlayer_Stamina(playerid)
{
	PlayerTextDrawShow(playerid, Stamina_TextDraws[playerid][0]);
	PlayerTextDrawShow(playerid, Stamina_TextDraws[playerid][1]);
	PlayerTextDrawShow(playerid, Stamina_TextDraws[playerid][2]);
	PlayerTextDrawShow(playerid, Stamina_TextDraws[playerid][3]);
	PlayerTextDrawShow(playerid, Stamina_TextDraws[playerid][4]);
	PlayerTextDrawShow(playerid, Stamina_TextDraws[playerid][5]);

	ShowPlayerProgressBar(playerid, Stamina_Bar[playerid][0]);
}

HidePlayer_Stamina(playerid)
{
	PlayerTextDrawHide(playerid, Stamina_TextDraws[playerid][0]);
	PlayerTextDrawHide(playerid, Stamina_TextDraws[playerid][1]);
	PlayerTextDrawHide(playerid, Stamina_TextDraws[playerid][2]);
	PlayerTextDrawHide(playerid, Stamina_TextDraws[playerid][3]);
	PlayerTextDrawHide(playerid, Stamina_TextDraws[playerid][4]);
	PlayerTextDrawHide(playerid, Stamina_TextDraws[playerid][5]);

	HidePlayerProgressBar(playerid, Stamina_Bar[playerid][0]);
}*/

ptask StaminaTimer[250](playerid)
{
    if (!playerData[playerid][IsLoggedIn])
		return 0;

    //SetPlayerProgressBarValue(playerid, Stamina_Bar[playerid][0], GetPlayerStamina(playerid));
    
	// ??????? (Stamina)
	if (IsPlayerRunning(playerid))
	{
		GivePlayerStamina(playerid, -1);
	}
    else if (GetPlayerStamina(playerid) < GetPlayerMaxStamina(playerid))
	{
		GivePlayerStamina(playerid, 1);
	}
    return 1;
}

public OnPlayerStaminaOver(playerid) // 
{
	SetPlayerExhausted(playerid, true); //
	return 1;
}

/*


 */