#include <YSI_Coding\y_hooks>

hook OnPlayerDeath(playerid, killerid, reason)
{
	if (playerData[playerid][pInjured] == 0)
	{
	    playerData[playerid][pInjured] = 1;
	   // SetPlayerPos(playerid, playerData[playerid][pPos_X], playerData[playerid][pPos_Y], playerData[playerid][pPos_Z]);
	//	SetPlayerFacingAngle(playerid, playerData[playerid][pPos_A]);
		GetPlayerPos(playerid, playerData[playerid][pPos_X], playerData[playerid][pPos_Y], playerData[playerid][pPos_Z]);
	  	GetPlayerFacingAngle(playerid, playerData[playerid][pPos_A]);	
	}
	if (playerData[playerid][pInjured] == 1)
	{
	    if (GetFactionOnline(FACTION_MEDIC) > 0)
     	{
			playerData[playerid][pInjuredTime] = 1800;
		}
		else
		{
			playerData[playerid][pInjuredTime] = 300;
		}
		playerData[playerid][pInterior] = GetPlayerInterior(playerid);
		playerData[playerid][pWorld] = GetPlayerVirtualWorld(playerid);

      //  SetPlayerPos(playerid, playerData[playerid][pPos_X], playerData[playerid][pPos_Y], playerData[playerid][pPos_Z]);
		//SetPlayerFacingAngle(playerid, playerData[playerid][pPos_A]);

		GetPlayerPos(playerid, playerData[playerid][pPos_X], playerData[playerid][pPos_Y], playerData[playerid][pPos_Z]);
	  	GetPlayerFacingAngle(playerid, playerData[playerid][pPos_A]);
	}
	else
	{
	    playerData[playerid][pInjured] = 0;
 		playerData[playerid][pInjuredTime] = 0;
	    playerData[playerid][pHospital] = 1;
	}
//	SendClientMessageEx(playerid, COLOR_WHITE, "DEBUG: OnPlayerDeath (playerid: %d, killerid: %d)", playerid, killerid);
	return 1;
}
