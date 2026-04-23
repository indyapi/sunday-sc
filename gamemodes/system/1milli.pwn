#include	<YSI_Coding\y_hooks>
#include 	<YSI_Coding\y_timers>

ptask PlayerTimerSecond[1000](playerid)
{
	if (!playerData[playerid][IsLoggedIn]) return 0;

	SetPlayerScore(playerid, playerData[playerid][pLevel]);

    if (playerData[playerid][pInjured] == 1)
	{
	    if (playerData[playerid][pInjuredTime] > 0)
	    {
	     //   GetPlayerPos(playerid, playerData[playerid][pPos_X], playerData[playerid][pPos_Y], playerData[playerid][pPos_Z]);
		//	GetPlayerFacingAngle(playerid, playerData[playerid][pPos_A]);
	
		    static
		        hours,
		        minutes,
		        seconds,
				str[500];

			playerData[playerid][pInjuredTime]--;

		    GetElapsedTime(playerData[playerid][pInjuredTime], hours, minutes, seconds);

			format(str, sizeof(str), "~r~RESPAWN ~w~AVAILABLE IN ~r~%02d MIN %02d SEC", minutes, seconds);
			GameTextForPlayer(playerid, str, 1000, 4);

			ApplyAnimation(playerid, "WUZI", "CS_Dead_Guy", 4.1, 0, 0, 0, 1, 0, 1);

		}
		if (!playerData[playerid][pInjuredTime])
		{
		    playerData[playerid][pHealth] = 20.0;
		    playerData[playerid][pInjured] = 0;
		    playerData[playerid][pInjuredTime] = 0;
		    playerData[playerid][pHospital] = 1;
		    SpawnPlayer(playerid);

		}
	}
	
	if (playerData[playerid][pJailTime] > 0)
	{
	    static
	        hours,
	        minutes,
	        seconds,
			str[128];

	    playerData[playerid][pJailTime]--;

		GetElapsedTime(playerData[playerid][pJailTime], hours, minutes, seconds);

		format(str, sizeof(str), "~r~~h~Prison Time:~w~~h~ %02d:%02d:%02d", hours, minutes, seconds);
		GameTextForPlayer(playerid, str, 1000, 4);

	    if (!playerData[playerid][pJailTime])
	    {
	        //new id = playerData[playerid][pPrisonOut];
	        SetPlayerPos(playerid, 1815.5325,-1534.9517,13.2749);
	        SetPlayerFacingAngle(playerid, 264.9881);
	        SetPlayerInterior(playerid, 0);
	        SetPlayerVirtualWorld(playerid, 0);

	        ShowPlayerStats(playerid, true);

			SendClientMessage(playerid, COLOR_WHITE, "คุณถูกปล่อยตัวจากห้องขังแล้ว");
		}
	}

    if(targeton[playerid] > 0)
	{
	    new Float:X, Float:Y, Float:Z;
		GetPlayerPos(targetonname[playerid], X, Y, Z);
	    SetPlayerCheckpoint(playerid, X,Y,Z, 5);
	    
	}
	if (playerData[playerid][pStunned] > 0)
	{
        playerData[playerid][pStunned]--;
       	ApplyAnimation(playerid, "CRACK", "crckdeth4", 4.0, 0, 0, 0, 1, 0, 1);
        if (!playerData[playerid][pStunned])
        {
 			ClearAnimations(playerid);
           	TogglePlayerControllable(playerid, true);
		}
		
	}
	if (GetPlayerWantedLevelEx(playerid) > 0)
	{
	    new str[256];
	    playerData[playerid][pWantedTime]++;

		/*format(str, sizeof(str), "%d/200", playerData[playerid][pWantedTime]);
		PlayerTextDrawSetString(playerid, WantedTextDraws[playerid][7], str);*/

		format(str, sizeof(str), "~w~Wanted Time~n~~b~%d/200", playerData[playerid][pWantedTime]);
		GameTextForPlayer(playerid, str, 1000, 4);

		if(playerData[playerid][pWantedTime] >= 200)
		{
			playerData[playerid][pWantedTime] = 0;

			SetPlayerWantedLevel(playerid, GetPlayerWantedLevelEx(playerid)-1);
			playerData[playerid][pWanted] -= 1;

			SendClientMessageEx(playerid, COLOR_GREEN, "[คดีความ] {FFFFFF}ดาวของคุณถูกลบออกไป 1 หลังจากคุณรอดนานครบ 200 วินาที! ดาวทั้งหมด {00FF00}%d", GetPlayerWantedLevelEx(playerid));
		}
		
	}

	new vehicleid = GetPlayerVehicleID(playerid);
	new Float:vehiclehealth;
	GetVehicleHealth(vehicleid, vehiclehealth);
	if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
    {
		switch (GetEngineStatus(vehicleid))
		{
			case true:
			{
  				if (vehiclehealth < 350)
				{
					new vehiclehp = 350;
					SetVehicleHealth(vehicleid, vehiclehp);
					SetVehicleHealth(vehicleid, 350);
			        SetEngineStatus(vehicleid, false);
				}
			}
		}
	}
	if (playerData[playerid][pDrivingTest] && IsPlayerInVehicle(playerid, playerData[playerid][pTestCar]))
	{
	    if (!IsPlayerInRangeOfPoint(playerid, 100.0, g_arrDrivingCheckpoints[playerData[playerid][pTestStage]][0], g_arrDrivingCheckpoints[playerData[playerid][pTestStage]][1], g_arrDrivingCheckpoints[playerData[playerid][pTestStage]][2]))
		{
	        CancelDrivingTest(playerid);
			SendClientMessage(playerid, COLOR_LIGHTRED, "[คำเตือน]{FFFFFF} คุณขับออกนอกเขตมากเกินไป การสอบจึงถูกยกเลิก");
		}
		//else if (GetVehicleSpeedz(vehicleid) >= 90.0)
		else if (GetVehicleSpeed(vehicleid) >= 100.0)
		{
			if (++playerData[playerid][pTestWarns] < 3)
			{
				SendClientMessageEx(playerid, COLOR_LIGHTRED, "[คำเตือน]{FFFFFF} คุณขับเร็วมากเกินไป เตือนครั้งที่ (%d/3)", playerData[playerid][pTestWarns]);
				SendClientMessage(playerid, COLOR_LIGHTRED, "[คำเตือน]{FFFFFF} ความเร็วต้องไม่เกิน 100 KM/H");
    		}
       		else
			{
				CancelDrivingTest(playerid);
    			SendClientMessage(playerid, COLOR_LIGHTRED, "[คำเตือน]{FFFFFF} คุณขับเร็วมากเกินไป  ครบ 3 ครั้ง การสอบจึงถูกยกเลิก");
		    }
		}
	}

	if (CowDelay[playerid] > 0) CowDelay[playerid] --;
	if (CowDelay[playerid] < 0) CowDelay[playerid] = 0;

	if (OilCD[playerid] > 0) OilCD[playerid] --;
	if (OilCD[playerid] < 0) OilCD[playerid] = 0;

	if (playerData[playerid][pOOCSpam] > 0) playerData[playerid][pOOCSpam]--;
	if (playerData[playerid][pHungry] > 100) playerData[playerid][pHungry] = 100;
	if (playerData[playerid][pThirsty] > 100) playerData[playerid][pThirsty] = 100;
	if (playerData[playerid][pHungry] < 0) playerData[playerid][pHungry] = 0;
	if (playerData[playerid][pThirsty] < 0) playerData[playerid][pThirsty] = 0;
	if (InjuredCD[playerid] > 0) InjuredCD[playerid] --;
	if (InjuredCD[playerid] < 0) InjuredCD[playerid] = 0;
	if (playerData[playerid][pPVPFreeze] > 0)
	{
		playerData[playerid][pPVPFreeze]--;
		if (playerData[playerid][pPVPFreeze] <= 0)
		{
		    TogglePlayerControllable(playerid, true);
			playerData[playerid][pPVPFreeze] = 0;
		}
	}
	if (playerData[playerid][pPVPFreeze] < 0)
	{
	    TogglePlayerControllable(playerid, true);
		playerData[playerid][pPVPFreeze] = 0;
	}
	// ค่าอาหาร
	new stringx[128];

	new Float:hp, Float:armour;
	GetPlayerHealth(playerid, hp);
	GetPlayerArmour(playerid, armour);

	SetPlayerProgressBarValue(playerid, sun_hpBAR[playerid], hp);
	SetPlayerProgressBarValue(playerid, sun_arBAR[playerid], armour);
	SetPlayerProgressBarValue(playerid, sun_thBAR[playerid], playerData[playerid][pThirsty]);
	SetPlayerProgressBarValue(playerid, sun_hgBAR[playerid], playerData[playerid][pHungry]);

	format(stringx, sizeof(stringx), "%d", GovOnline());
	PlayerTextDrawSetString(playerid, Menu_SUN[playerid][28], stringx);

	format(stringx, sizeof(stringx), "%d", MedicOnline());
	PlayerTextDrawSetString(playerid, Menu_SUN[playerid][29], stringx);

	format(stringx, sizeof(stringx), "%d", CopOnline());
	PlayerTextDrawSetString(playerid, Menu_SUN[playerid][30], stringx);

	format(stringx, sizeof(stringx), "%d", MechanicOnline());
	PlayerTextDrawSetString(playerid, Menu_SUN[playerid][31], stringx);

	format(stringx, sizeof(stringx), "%d", PlayerOnline());
	PlayerTextDrawSetString(playerid, Menu_SUN[playerid][32], stringx);

	new strzing[128];

	format(strzing, sizeof(strzing), "%s", FormatNumber(playerData[playerid][pCoin]));
	PlayerTextDrawSetString(playerid, sun_point[playerid], strzing);

	format(strzing, sizeof(strzing), "%s", FormatNumber(playerData[playerid][pBitcoin]));
	PlayerTextDrawSetString(playerid, sun_bitcoin[playerid], strzing);

	if (playerData[playerid][pArmorOn])
	{
	    if (armour == 0)
	    {
		    RemovePlayerAttachedObject(playerid, 9);
	    }
	}
    return 1;
}

