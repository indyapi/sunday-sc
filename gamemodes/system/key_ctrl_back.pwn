#include	<YSI_Coding\y_hooks>

new PlayerText:fuel_progress[MAX_PLAYERS][2];
new Timer:AutoPumpRefuel[MAX_PLAYERS];

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

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if (newkeys & KEY_CTRL_BACK)
    {
		if (GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
		{
			if (Pump_Nearest(playerid) != -1)
			{
				//new vehicleid = Vehicle_Nearest(playerid);
				if (PumpFuelcar[playerid] == 0)
				{
					if(!Vehicle_Nearest(playerid))
						return SendClientMessage(playerid, COLOR_RED, "[ ERROR! ] {FFFFFF}ไม่มีรถคนไหนอยู่ใกล้ๆคุณ");

					if (PumpFuelcar[playerid] == 1)
						return SendClientMessage(playerid, COLOR_RED, "[ ERROR! ] {FFFFFF}ปั้มน้ำมันกำลังถูกใช้งาน");

					PumpFuelcar[playerid] = 1;
					FuelPlus(playerid);
					//SetTimer("sunstartpumprefuel", 100, true);
					ApplyAnimation(playerid, "INT_HOUSE","wash_up", 4.1, 0, 0, 0, 1, 0, 1);
				}
				return 1;
			}

			if (garageveh_Nearest(playerid) != -1)
	  		{
				new vid = garageveh_Nearest(playerid);

				if (garagevehData[vid][garagevehType] == 1)
				{
					new query[128];
					mysql_format(g_SQL, query, sizeof(query), "SELECT * FROM `vehicles` WHERE `carOwnerID` = %d", playerData[playerid][pID]);
					mysql_tquery(g_SQL, query, "OnQueryFinished", "dd", playerid, THREAD_LIST_VEHICLES);
					return 1;
				}
		   	}
			if (IsPlayerInRangeOfPoint(playerid, 2.0,-2476.3860,2287.4343,4.9844)) //บัสเบไซด์
    		{
				if (playerData[playerid][pPrisoned] > 0)
					return SendClientMessageEx(playerid, COLOR_RED, "[ ERROR! ] {FFFFFF} ติดคุกอยู่...");

				if (playerData[playerid][pInjured] > 0)
					return SendClientMessageEx(playerid, COLOR_RED, "[ ERROR! ] {FFFFFF} บาดเจ็บอยู่...");

				Dialog_Show(playerid, D_SelectBusBS, DIALOG_STYLE_LIST, "{FA492D}สถานที่", 
				"{FA492D}SEL: {FFFFFF}เมือง LS\n\
				{FA492D}SEL: {FFFFFF}เมือง LV\n\
				{FA492D}SEL: {FFFFFF}เมือง SF", "เลือกพิกัด", "ปิด");
			
			}
			if (IsPlayerInRangeOfPoint(playerid, 2.0,1720.4814,1423.5206,10.6406)) //บัส lv
    		{
				if (playerData[playerid][pPrisoned] > 0)
					return SendClientMessageEx(playerid, COLOR_RED, "[ ERROR! ] {FFFFFF} ติดคุกอยู่...");

				if (playerData[playerid][pInjured] > 0)
					return SendClientMessageEx(playerid, COLOR_RED, "[ ERROR! ] {FFFFFF} บาดเจ็บอยู่...");

				Dialog_Show(playerid, D_SelectBusLV, DIALOG_STYLE_LIST, "{FA492D}สถานที่", 
				"{FA492D}SEL: {FFFFFF}เมือง LS\n\
				{FA492D}SEL: {FFFFFF}เมือง SF\n\
				{FA492D}SEL: {FFFFFF}เกาะ bay side", "เลือกพิกัด", "ปิด");
		
			}
			if (IsPlayerInRangeOfPoint(playerid, 2.0,-1985.3083,190.7851,27.6875)) //บัส sf
    		{
				if (playerData[playerid][pPrisoned] > 0)
					return SendClientMessageEx(playerid, COLOR_RED, "[ ERROR! ] {FFFFFF} ติดคุกอยู่...");

				if (playerData[playerid][pInjured] > 0)
					return SendClientMessageEx(playerid, COLOR_RED, "[ ERROR! ] {FFFFFF} บาดเจ็บอยู่...");

				Dialog_Show(playerid, D_SelectBusSF, DIALOG_STYLE_LIST, "{FA492D}สถานที่", 
				"{FA492D}SEL: {FFFFFF}เมือง LS\n\
				{FA492D}SEL: {FFFFFF}เมือง LV\n\
				{FA492D}SEL: {FFFFFF}เกาะ bay side", "เลือกพิกัด", "ปิด");
			}
			if (IsPlayerInRangeOfPoint(playerid, 2.0,1273.6876,-1309.5917,13.4931)) // บัส ls
    		{
				if (playerData[playerid][pPrisoned] > 0)
					return SendClientMessageEx(playerid, COLOR_RED, "[ ERROR! ] {FFFFFF} ติดคุกอยู่...");

				if (playerData[playerid][pInjured] > 0)
					return SendClientMessageEx(playerid, COLOR_RED, "[ ERROR! ] {FFFFFF} บาดเจ็บอยู่...");
					
				Dialog_Show(playerid, D_SelectBusLS, DIALOG_STYLE_LIST, "{FA492D}สถานที่", 
				"{FA492D}SEL: {FFFFFF}เกาะ bay side\n\
				{FA492D}SEL: {FFFFFF}เมือง LV\n\
				{FA492D}SEL: {FFFFFF}เมือง SF", "เลือกพิกัด", "ปิด");
			}
		}
	}
	return 1;
}

FuelPlus(playerid)
{
	if (PumpFuelcar[playerid] == 0)
	{
		new vehicleid = GetNearbyVehicle(playerid);
		new Float:maxfuel = 100.0;

		if (vehicleFuel[vehicleid] >= maxfuel)
		{
			PumpFuelcar[playerid] = 0;
			vehicleFuel[vehicleid] = 100.0;
			stop AutoPumpRefuel[playerid];
			PlayerTextDrawHide(playerid, fuel_progress[playerid][0]);
			PlayerTextDrawHide(playerid, fuel_progress[playerid][1]);
			TogglePlayerControllable(playerid, true);
		}

		stop AutoPumpRefuel[playerid];
		PlayerTextDrawHide(playerid, fuel_progress[playerid][0]);
		PlayerTextDrawHide(playerid, fuel_progress[playerid][1]);
		TogglePlayerControllable(playerid, true);
	}
	if (PumpFuelcar[playerid] == 1)
	{
		new str[500];
		new vehicleid = GetNearbyVehicle(playerid);
		stop AutoPumpRefuel[playerid];
		AutoPumpRefuel[playerid] = repeat StartReFuel(playerid);

		format(str, sizeof(str), "%.2f", vehicleFuel[vehicleid]);
		PlayerTextDrawSetString(playerid, fuel_progress[playerid][0], str);
		PlayerTextDrawShow(playerid, fuel_progress[playerid][0]);
		PlayerTextDrawShow(playerid, fuel_progress[playerid][1]);
	}
	return 1;
}

timer StartReFuel[100](playerid)
{
	if (PumpFuelcar[playerid] == 1)
	{
		new vehicleid = GetNearbyVehicle(playerid);
		new Float:maxfuel = 100.0;

		if (GetPlayerMoneyEx(playerid) < 4)
	    {
			PumpFuelcar[playerid] = 0;
			TogglePlayerControllable(playerid, true);
			PlayerTextDrawHide(playerid, fuel_progress[playerid][0]);
			PlayerTextDrawHide(playerid, fuel_progress[playerid][1]);
			SendClientMessageEx(playerid, COLOR_RED, "[ WARNING! ] {FFFFFF} ตังไม่พอ");
		}
			
		if (vehicleFuel[vehicleid] >= maxfuel)
		{
			PumpFuelcar[playerid] = 0;
			vehicleFuel[vehicleid] = 100.0;
			TogglePlayerControllable(playerid, true);
			PlayerTextDrawHide(playerid, fuel_progress[playerid][0]);
			PlayerTextDrawHide(playerid, fuel_progress[playerid][1]);
		}

		vehicleFuel[vehicleid] += 0.12;
		GivePlayerMoneyEx(playerid, - 4);

		new str[162];

		format(str, sizeof(str), "%.2f", vehicleFuel[vehicleid]);
		PlayerTextDrawSetString(playerid, fuel_progress[playerid][0], str);
		PlayerTextDrawShow(playerid, fuel_progress[playerid][0]);
		PlayerTextDrawShow(playerid, fuel_progress[playerid][1]);
	}
	else
	{
		TogglePlayerControllable(playerid, true);
		stop AutoPumpRefuel[playerid];
		PlayerTextDrawHide(playerid, fuel_progress[playerid][0]);
		PlayerTextDrawHide(playerid, fuel_progress[playerid][1]);
	}
	return 1;
}

/*
forward sunstartpumprefuel(playerid);
public sunstartpumprefuel(playerid)
{
	if(playerData[playerid][IsLoggedIn] == false)
	    return SendClientMessage(playerid, COLOR_RED, "[SUNDAY] {FFFFFF}กรุณาล็อกอินก่อน!");

	if(PumpFuelcar[playerid] == 1)
	{
		FuelPlus(playerid);
	}
	else return 1;
	return 1;
}*/
