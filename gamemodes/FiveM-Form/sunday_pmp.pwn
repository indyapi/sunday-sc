#include	<YSI_Coding\y_hooks>

new PlayerText:fuel_progress[MAX_PLAYERS][2];

hook OnPlayerConnect(playerid)
{
	fuel_progress[playerid][0] = CreatePlayerTextDraw(playerid, 334.000000, 372.000000, "100.0");
	PlayerTextDrawFont(playerid, fuel_progress[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, fuel_progress[playerid][0], 0.316665, 1.349998);
	PlayerTextDrawTextSize(playerid, fuel_progress[playerid][0], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, fuel_progress[playerid][0], 0);
	PlayerTextDrawSetShadow(playerid, fuel_progress[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, fuel_progress[playerid][0], 2);
	PlayerTextDrawColor(playerid, fuel_progress[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, fuel_progress[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, fuel_progress[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, fuel_progress[playerid][0], 0);
	PlayerTextDrawSetProportional(playerid, fuel_progress[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, fuel_progress[playerid][0], 0);

	fuel_progress[playerid][1] = CreatePlayerTextDraw(playerid, 300.000000, 372.000000, "Fuel :");
	PlayerTextDrawFont(playerid, fuel_progress[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid, fuel_progress[playerid][1], 0.316665, 1.349998);
	PlayerTextDrawTextSize(playerid, fuel_progress[playerid][1], 400.000000, 33.000000);
	PlayerTextDrawSetOutline(playerid, fuel_progress[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, fuel_progress[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, fuel_progress[playerid][1], 2);
	PlayerTextDrawColor(playerid, fuel_progress[playerid][1], 16777215);
	PlayerTextDrawBackgroundColor(playerid, fuel_progress[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, fuel_progress[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, fuel_progress[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid, fuel_progress[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, fuel_progress[playerid][1], 0);
	return 1;
}

forward sunstartpumprefuel(playerid);
public sunstartpumprefuel(playerid)
{
	if(PumpFuelcar[playerid] == 1)
	{
		new vehicleid = GetNearbyVehicle(playerid);
		new Float:maxfuel = 100.0;
	
		if (vehicleFuel[vehicleid] >= maxfuel)
		{
			PumpFuelcar[playerid] = 0;
		}

		vehicleFuel[vehicleid] += 0.15;
		GivePlayerMoneyEx(playerid, - 5);

		new str[162];

		format(str, sizeof(str), "%.2f", vehicleFuel[vehicleid]);
		PlayerTextDrawSetString(playerid, fuel_progress[playerid][0], str);
		PlayerTextDrawShow(playerid, fuel_progress[playerid][0]);
		PlayerTextDrawShow(playerid, fuel_progress[playerid][1]);
	}
	else
	{
		PlayerTextDrawHide(playerid, fuel_progress[playerid][0]);
		PlayerTextDrawHide(playerid, fuel_progress[playerid][1]);
	}
}
    