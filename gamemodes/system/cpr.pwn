#include	<YSI_Coding\y_hooks>

new CprTake[MAX_PLAYERS];

hook OnPlayerConnect(playerid)
{
	CprTake[playerid] = 0;
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	if (CprTake[playerid] != 0)
	{
		StopProgress(playerid);

	}
	return 1;
}

StartCpr(playerid,userid){
    if(IsPlayerInAnyVehicle(playerid))
		return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณต้องลงจากรถก่อน");

	CprTake[playerid] = 1;
	TogglePlayerControllable( playerid, false );
	SendClientMessageEx(playerid, COLOR_WHITE, "คุณกำลังชุบผู้เล่น{00FF00}%s",GetPlayerNameEx(userid));
	ApplyAnimation(playerid, "MEDIC","CPR", 4.1, 0, 0, 0, 0, 0, 1);
	StartProgress(playerid, 70, 0, INVALID_OBJECT_ID);
	playerData[playerid][pMedicOfferID] = userid;
	return 1;
}

hook OnProgressFinish(playerid, objectid)
{
    new userid = playerData[playerid][pMedicOfferID];
	if(CprTake[playerid] == 1){
	    CprTake[playerid] = 0;
	    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		ClearAnimations(playerid);
        TogglePlayerControllable( playerid, true );
        
		SetPlayerHealth(userid, 100);
		SetPlayerWeather(userid, globalWeather);
	    playerData[userid][pInjured] = 0;
	    playerData[userid][pInjuredTime] = 0;
	    ClearAnimations(userid);
	    SetPlayerSpecialAction(userid, SPECIAL_ACTION_NONE);
	   
	    ShowPlayerStats(userid, true);
	    SendClientMessageEx(playerid, COLOR_WHITE, "คุณได้รักษาอาการบาดเจ็บให้ {33CCFF}%s", GetPlayerNameEx(userid));
	    SendClientMessageEx(userid, COLOR_LIGHTBLUE, "%s {FFFFFF}ได้รักษาอาการบาดเจ็บให้คุณ", GetPlayerNameEx(playerid));
	    SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s ได้รักษาอาการบาดเจ็บให้ %s", GetPlayerNameEx(playerid), GetPlayerNameEx(userid));
		playerData[userid][pMedicOfferID] = INVALID_PLAYER_ID;
		playerData[userid][pMedicOfferPrice] = 0;
		playerData[playerid][pMedicOfferID] = INVALID_PLAYER_ID;
		playerData[playerid][pMedicOfferPrice] = 0;
	}
	return Y_HOOKS_CONTINUE_RETURN_0;
}

hook OnProgressUpdate(playerid, progress, objectid)
{
	if(CprTake[playerid] == 1)
	{
	    if(IsPlayerInAnyVehicle(playerid))
	        return StopProgress(playerid);

		ApplyAnimation(playerid, "MEDIC","CPR", 4.1, 0, 0, 0, 0, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}
	return Y_HOOKS_CONTINUE_RETURN_0;
}

