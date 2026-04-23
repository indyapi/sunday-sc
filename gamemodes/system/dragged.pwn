#include	<YSI_Coding\y_hooks>

new IsFPS[MAX_PLAYERS];
new CameraFirstPerson[MAX_PLAYERS];

hook OnPlayerDisconnect(playerid)
{
	if(IsFPS[playerid] == 1)
	{
    	DestroyObject(CameraFirstPerson[playerid]);
	}
}

hook OnPlayerDeath(playerid, killerid, reason)
{
    if(GetPVarInt(playerid, "DisableFPS") == 0) {
		SetPVarInt(playerid, "DisableFPS", 1);
     	DestroyObject(CameraFirstPerson[playerid]);
		SetCameraBehindPlayer(playerid);
      	IsFPS[playerid] = 0;
 	}
}

ptask FPSTimer[500](playerid)
{
	if(IsFPS[playerid] == 1) {
		SetPVarInt(playerid, "DisableFPS", 0);
		SyncCamera(playerid);
	}
}

// --> ระบบอุ้ม
CMD:dragged(playerid, params[])
{
	new
	    userid;

    if (sscanf(params, "u", userid))
	    return SendClientMessage(playerid, COLOR_GREY, "การใช้งาน : {FFFFFF}/อุ้ม [ไอดี/ชื่อ]");

	if (userid == INVALID_PLAYER_ID)
	    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ผู้เล่นไอดีนี้ไม่ได้อยู่ในเกม");

	if (playerData[userid][pJailTime] > 0)
	    return SendClientMessage(playerid, COLOR_RED, "* คุณไม่สามารถลากผู้เล่นที่ติดคุกอยู่ได้");

	if (GetPlayerState(userid) != PLAYER_STATE_ONFOOT)
	    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ผู้เล่นไอดีนี้ต้องไม่อยู่ในยานพาหนะ");

    if (playerData[userid][pDraggedBy] == playerid)
	{
     	SetPVarInt(userid, "DisableFPS", 1);

     	DestroyObject(CameraFirstPerson[userid]);

		SetCameraBehindPlayer(userid);
      	IsFPS[userid] = 0;

		playerData[userid][pDragged] = 0;
		playerData[userid][pDraggedBy] = INVALID_PLAYER_ID;

		SetPlayerVirtualWorld(userid, GetPlayerVirtualWorld(playerid));

		ApplyAnimation(playerid, "CARRY", "putdwn", 4.0, 0, 0, 0, 0, 0);
		RemovePlayerAttachedObject(playerid, 6);
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);

		KillTimer(playerData[userid][pDragTimer]);
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s ได้ปล่อยตัว %s วางที่พื้น", GetPlayerNameEx(playerid), GetPlayerNameEx(userid));
		return 1;
	}

	if (!IsPlayerNearPlayer(playerid, userid, 5.0))
	    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ผู้เล่นไอดีนี้ไม่ได้อยู่ใกล้คุณ");

	if (playerData[userid][pInjured])
	{
		if (playerData[userid][pDragged])
		{
			if (playerData[userid][pDraggedBy] != playerid)
			    return SendClientMessage(playerid, COLOR_LIGHTRED, "* คุณไม่สามารถแย่งตัวผู้เล่นที่กำลังถูกอุ้มอยู่ได้");

	     	SetPVarInt(userid, "DisableFPS", 1);

	     	DestroyObject(CameraFirstPerson[userid]);

			SetCameraBehindPlayer(userid);
	      	IsFPS[userid] = 0;

		    playerData[userid][pDragged] = 0;
		    playerData[userid][pDraggedBy] = INVALID_PLAYER_ID;

			SetPlayerVirtualWorld(userid, GetPlayerVirtualWorld(playerid));

			ApplyAnimation(playerid, "CARRY", "putdwn", 4.0, 0, 0, 0, 0, 0);
			RemovePlayerAttachedObject(playerid, 6);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);

		    KillTimer(playerData[userid][pDragTimer]);
		    SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s ได้ปล่อยตัว %s วางที่พื้น", GetPlayerNameEx(playerid), GetPlayerNameEx(userid));
		}
		else
		{
		    playerData[userid][pDragged] = 1;
		    playerData[userid][pDraggedBy] = playerid;

			// --> ถือคนอุ้ม
			SetPlayerAttachedObject(playerid, 6, 3092, 6, 0.048999, 0.021000, -0.269999, -27.799999, -5.000000, 15.299999, 1.000000, 1.000000, 1.000000);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);

			ApplyAnimation(playerid, "CARRY", "liftup", 4.1, 0, 0, 0, 0, 0, 1);

			// --> ทำตัวผู้เล่นที่ถูกอุ้มให้หาย
			SetPlayerVirtualWorld(userid, userid + 1);

			// --> FPS Mode
	        SetCameraBehindPlayer(userid);
	        CameraFirstPerson[userid] = CreateObject(19300, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
	    	SetPVarInt(userid, "DisableFPS", 0);
		  	SyncCamera(userid);
	      	IsFPS[userid] = 1;

		    playerData[userid][pDragTimer] = SetTimerEx("DragUpdate", 200, true, "dd", playerid, userid);
		    SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s ได้อุ้มตัว %s ที่กำลังบาดเจ็บไปกับเขา", GetPlayerNameEx(playerid), GetPlayerNameEx(userid));
		}
		return 1;
	}
	else
	{
		return SendClientMessage(playerid, COLOR_LIGHTRED, "* สำหรับผู้บาดเจ็บเท่านั้น");
	}
	return 1;
}
alias:dragged("อุ้ม")

forward DragUpdate(playerid, targetid);
public DragUpdate(playerid, targetid)
{
	if (playerData[targetid][pDragged] && playerData[targetid][pDraggedBy] == playerid)
	{
	    static
	        Float:fX,
	        Float:fY,
	        Float:fZ,
			Float:fAngle;

		GetPlayerPos(playerid, fX, fY, fZ);
		GetPlayerFacingAngle(playerid, fAngle);

		fX -= 3.0 * floatsin(-fAngle, degrees);
		fY -= 3.0 * floatcos(-fAngle, degrees);

		SetPlayerPos(targetid, fX, fY, fZ);
		SetPlayerInterior(targetid, GetPlayerInterior(playerid));
	}
	return 1;
}

StopDragging(playerid)
{
	if (playerData[playerid][pDragged])
	{
	    playerData[playerid][pDragged] = 0;
		playerData[playerid][pDraggedBy] = INVALID_PLAYER_ID;
		KillTimer(playerData[playerid][pDragTimer]);
	}
	return 1;
}

forward SyncCamera(playerid);
public SyncCamera(playerid)
{
	if(GetPVarInt(playerid, "DisableFPS") == 0)
	{
		if(!IsPlayerInAnyVehicle(playerid))
		{
			AttachObjectToPlayer(CameraFirstPerson[playerid], playerid, 0.0, 0.20, 0.75, 0.0, 0.0, 0.0);
			AttachCameraToObject(playerid, CameraFirstPerson[playerid]);
		}
		else
		{

			if(IsABike(GetPlayerVehicleID(playerid)))
			{
    		if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 461) //PCJ Suc
		    {
                if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
                {
			    	AttachObjectToVehicle(CameraFirstPerson[playerid], GetPlayerVehicleID(playerid), 0.089999, 0.050000, 1.004999, 0.0, 0.0, 0.0);
					AttachCameraToObject(playerid, CameraFirstPerson[playerid]);
				}
				else
				{
			    	AttachObjectToVehicle(CameraFirstPerson[playerid], GetPlayerVehicleID(playerid), -0.484999, -0.309999, 1.164999, 0.0, 0.0, 0.0);
					AttachCameraToObject(playerid, CameraFirstPerson[playerid]);
				}
			}
     		else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 462) //Faggio Suc
		    {
                if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
                {
			    	AttachObjectToVehicle(CameraFirstPerson[playerid], GetPlayerVehicleID(playerid), 0.089999, -0.100000, 1.004999, 0.0, 0.0, 0.0);
					AttachCameraToObject(playerid, CameraFirstPerson[playerid]);
				}
				else
				{
			    	AttachObjectToVehicle(CameraFirstPerson[playerid], GetPlayerVehicleID(playerid), -0.004999, -0.609999, 1.164999, 0.0, 0.0, 0.0);
					AttachCameraToObject(playerid, CameraFirstPerson[playerid]);
				}
			}
     		else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 586) //Wayfarer
		    {
                if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
                {
			    	AttachObjectToVehicle(CameraFirstPerson[playerid], GetPlayerVehicleID(playerid), 0.089999, -0.18, 1.190, 0.0, 0.0, 0.0);
					AttachCameraToObject(playerid, CameraFirstPerson[playerid]);
				}
				else
				{
			    	AttachObjectToVehicle(CameraFirstPerson[playerid], GetPlayerVehicleID(playerid), -0.084999, -0.809999, 1.264999, 0.0, 0.0, 0.0);
					AttachCameraToObject(playerid, CameraFirstPerson[playerid]);
				}
			}
     		else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 521) // FCR-900
		    {
                if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
                {
			    	AttachObjectToVehicle(CameraFirstPerson[playerid], GetPlayerVehicleID(playerid), 0.089999, 0.050000, 1.004999, 0.0, 0.0, 0.0);
					AttachCameraToObject(playerid, CameraFirstPerson[playerid]);
				}
				else
				{
			    	AttachObjectToVehicle(CameraFirstPerson[playerid], GetPlayerVehicleID(playerid), -0.484999, -0.309999, 1.164999, 0.0, 0.0, 0.0);
					AttachCameraToObject(playerid, CameraFirstPerson[playerid]);
				}
			}
     		else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 522) // NRG-500
		    {
                if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
                {
			    	AttachObjectToVehicle(CameraFirstPerson[playerid], GetPlayerVehicleID(playerid), 0.049999, 0.050000, 1.004999, 0.0, 0.0, 0.0);
					AttachCameraToObject(playerid, CameraFirstPerson[playerid]);
				}
				else
				{
			    	AttachObjectToVehicle(CameraFirstPerson[playerid], GetPlayerVehicleID(playerid), -0.284999, -0.459999, 1.164999, 0.0, 0.0, 0.0);
					AttachCameraToObject(playerid, CameraFirstPerson[playerid]);
				}
			}
     		else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 468) // Sanchez
		    {
                if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
                {
			    	AttachObjectToVehicle(CameraFirstPerson[playerid], GetPlayerVehicleID(playerid), 0.00, -0.100000, 0.954999, 0.0, 0.0, 0.0);
					AttachCameraToObject(playerid, CameraFirstPerson[playerid]);
				}
				else
				{
			    	AttachObjectToVehicle(CameraFirstPerson[playerid], GetPlayerVehicleID(playerid), -0.324999, -0.485, 1.154999, 0.0, 0.0, 0.0);
					AttachCameraToObject(playerid, CameraFirstPerson[playerid]);
				}
			}
   		    else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 581) //BF
		    {
                if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
                {
			    	AttachObjectToVehicle(CameraFirstPerson[playerid], GetPlayerVehicleID(playerid), 0.089999, 0.050000, 1.004999, 0.0, 0.0, 0.0);
					AttachCameraToObject(playerid, CameraFirstPerson[playerid]);
				}
				else
				{
			    	AttachObjectToVehicle(CameraFirstPerson[playerid], GetPlayerVehicleID(playerid), -0.484999, -0.309999, 1.164999, 0.0, 0.0, 0.0);
					AttachCameraToObject(playerid, CameraFirstPerson[playerid]);
				}
			}
   		    else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 463) //Freeway
		    {
                if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
                {
			    	AttachObjectToVehicle(CameraFirstPerson[playerid], GetPlayerVehicleID(playerid), 0.044999, -0.269999, 1.039999, 0.0, 0.0, 0.0);
					AttachCameraToObject(playerid, CameraFirstPerson[playerid]);
				}
				else
				{
			    	AttachObjectToVehicle(CameraFirstPerson[playerid], GetPlayerVehicleID(playerid), -0.059999, -0.859999, 1.289999, 0.0, 0.0, 0.0);
					AttachCameraToObject(playerid, CameraFirstPerson[playerid]);
				}
			}
		    else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 411)
		    {
		    	AttachObjectToVehicle(CameraFirstPerson[playerid], GetPlayerVehicleID(playerid), -0.40, -0.15, 0.45, 0.0, 0.0, 0.0);
				AttachCameraToObject(playerid, CameraFirstPerson[playerid]);
			}
			}
			else
			{
			    new vehicleid = GetPlayerVehicleID(playerid);
			    new vehiclemodelid = GetVehicleModel(vehicleid);

			    new iSeat = GetPlayerVehicleSeat(playerid);
			    new Float:X, Float:Y, Float:Z;
			    GetVehicleModelInfo(vehiclemodelid, VEHICLE_MODEL_INFO_FRONTSEAT, X, Y, Z);

				if(iSeat == 0)
			    {
			    	AttachObjectToVehicle(CameraFirstPerson[playerid], vehicleid, X+(-0.85), Y+(-0.18), Z+(0.585), 0.0, 0.0, 0.0);
					AttachCameraToObject(playerid, CameraFirstPerson[playerid]);
			    }
				else if(iSeat == 1)
			    {
			    	AttachObjectToVehicle(CameraFirstPerson[playerid], vehicleid, X+(0.05), Y+(-0.18), Z+(0.585), 0.0, 0.0, 0.0);
					AttachCameraToObject(playerid, CameraFirstPerson[playerid]);
			    }
				else if(iSeat == 2)
			    {
			    	AttachObjectToVehicle(CameraFirstPerson[playerid], vehicleid, X+(-0.85), Y+(-0.86), Z+(0.585), 0.0, 0.0, 0.0);
					AttachCameraToObject(playerid, CameraFirstPerson[playerid]);
			    }
				else if(iSeat == 3)
			    {
			    	AttachObjectToVehicle(CameraFirstPerson[playerid], vehicleid, X+(0.05), Y+(-0.86), Z+(0.585), 0.0, 0.0, 0.0);
					AttachCameraToObject(playerid, CameraFirstPerson[playerid]);
			    }
			}
		}
	}
	return 1;
}
