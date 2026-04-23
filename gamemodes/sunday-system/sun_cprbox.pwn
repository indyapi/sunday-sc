#include	<YSI_Coding\y_hooks>

new CPRuser[MAX_PLAYERS];

hook OnPlayerConnect(playerid)
{
	CPRuser[playerid] = 0;
	return 1;
}
	
hook OnPlayerUseItem(playerid, const name[])
{
	if (!strcmp(name, "กล่องชุบ", true))
	{
		new
	    	userid;

		if (GetPlayerState(userid) != PLAYER_STATE_ONFOOT)
	    	return 1;

		//if (userid == INVALID_PLAYER_ID)
	    //	return 1;

		if (!Player_Nearest(playerid))
			return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ผู้เล่นไอดีนี้ไม่ได้อยู่ใกล้คุณ");

		CPRuser[playerid] = 1;
		StartProgress(playerid, 100, 0, INVALID_OBJECT_ID);
	}
	return 1;
}

Player_Nearest(playerid)
{
	new 
		userid;

	new
	    Float:fDistance = FLOAT_INFINITY,
	    Float:fX,
	    Float:fY,
	    Float:fZ,
	    iIndex = -1
	;
	for(new i=0;i!=MAX_PLAYERS;i++) {

	    GetPlayerPos(i, fX, fY, fZ);

		new
        	Float:temp = GetPlayerDistanceFromPoint(userid, fX, fY, fZ);

		if (temp < fDistance && temp < 5.0)
		{
		    fDistance = temp;
		    iIndex = i;
		}
	}
	return iIndex;
}

hook OnProgressFinish(playerid, objectid)
{
	if(CPRuser[playerid] == 1)
		CPRsuport(playerid);

	return 1;
}

hook OnProgressUpdate(playerid, progress, objectid)
{
	if(CPRuser[playerid] == 1)
	{
		ApplyAnimation(playerid, "MEDIC","CPR", 4.1, 1, 0, 0, 1, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}
	return Y_HOOKS_CONTINUE_RETURN_0;
}
	
CPRsuport(playerid)
{
	new 
		userid;

	new 
		user = Player_Nearest(playerid);

	CPRuser[playerid] = 0;

	SetPlayerHealth(user, 20);
	SetPlayerWeather(user, globalWeather);
    playerData[user][pInjured] = 0;
    playerData[user][pInjuredTime] = 0;
    ClearAnimations(user);
    ShowPlayerStats(user, true);

	SendClientMessage(playerid, COLOR_WHITE, "[NEW!]: เริ่มใช้กล่องชุบ");
	Inventory_Remove(playerid, "กล่องชุบ", 1);
	return 1;
}