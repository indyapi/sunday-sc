#include	<YSI_Coding\y_hooks>

new PlayerText:Death_TD[MAX_PLAYERS];
new PlayerText:Prison_TD[MAX_PLAYERS];

TD_Warning(playerid)
{
    Death_TD[playerid] = CreatePlayerTextDraw(playerid, 320.000000, 4.000000, "Please Wait : 12 MIN 59 SEC");
	PlayerTextDrawFont(playerid, Death_TD[playerid], 1);
	PlayerTextDrawLetterSize(playerid, Death_TD[playerid], 0.258332, 2.099998);
	PlayerTextDrawTextSize(playerid, Death_TD[playerid], 298.500000, 219.500000);
	PlayerTextDrawSetOutline(playerid, Death_TD[playerid], 0);
	PlayerTextDrawSetShadow(playerid, Death_TD[playerid], 0);
	PlayerTextDrawAlignment(playerid, Death_TD[playerid], 2);
	PlayerTextDrawColor(playerid, Death_TD[playerid], -16776961);
	PlayerTextDrawBackgroundColor(playerid, Death_TD[playerid], 255);
	PlayerTextDrawBoxColor(playerid, Death_TD[playerid], 135);
	PlayerTextDrawUseBox(playerid, Death_TD[playerid], 1);
	PlayerTextDrawSetProportional(playerid, Death_TD[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, Death_TD[playerid], 0);


	Prison_TD[playerid] = CreatePlayerTextDraw(playerid, 320.000000, 4.000000, "Please Wait : 12 MIN 59 SEC");
	PlayerTextDrawFont(playerid, Prison_TD[playerid], 1);
	PlayerTextDrawLetterSize(playerid, Prison_TD[playerid], 0.258332, 2.099998);
	PlayerTextDrawTextSize(playerid, Prison_TD[playerid], 298.500000, 219.500000);
	PlayerTextDrawSetOutline(playerid, Prison_TD[playerid], 0);
	PlayerTextDrawSetShadow(playerid, Prison_TD[playerid], 0);
	PlayerTextDrawAlignment(playerid, Prison_TD[playerid], 2);
	PlayerTextDrawColor(playerid, Prison_TD[playerid], -16776961);
	PlayerTextDrawBackgroundColor(playerid, Prison_TD[playerid], 255);
	PlayerTextDrawBoxColor(playerid, Prison_TD[playerid], 135);
	PlayerTextDrawUseBox(playerid, Prison_TD[playerid], 1);
	PlayerTextDrawSetProportional(playerid, Prison_TD[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, Prison_TD[playerid], 0);
	
	return 1;
}

/*
		PlayerTextDrawShow(playerid, Warning_SUN[playerid][0]);
		PlayerTextDrawShow(playerid, Warning_SUN[playerid][1]);
		PlayerTextDrawShow(playerid, Warning_SUN[playerid][2]);
		PlayerTextDrawShow(playerid, Warning_SUN[playerid][3]);
		
		PlayerTextDrawHide(playerid, Warning_SUN[playerid][0]);
		PlayerTextDrawHide(playerid, Warning_SUN[playerid][1]);
		PlayerTextDrawHide(playerid, Warning_SUN[playerid][2]);
		PlayerTextDrawHide(playerid, Warning_SUN[playerid][3]);
*/











