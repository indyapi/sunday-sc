#include	<YSI_Coding\y_hooks>

#define 	MAX_GATES				(5000)

/*
    pEditType,  
	pEditGate,

    mysql_tquery(g_SQL, "SELECT * FROM `gates`", "Gate_Load", "");
*/

enum gateData {
	gateID,
	gateExists,
	gateOpened,
	gateModel,
	Float:gateSpeed,
	Float:gateRadius,
	gateTime,
	Float:gatePos[6],
	gateInterior,
	gateWorld,
	Float:gateMove[6],
	gateLinkID,
	gateFaction,
	gatePass[32],
	gateTimer,
	gateObject
};
new GateData[MAX_GATES][gateData];

C_Gate()
{
    CreateDynamicObject(989,1025.0000000,-1029.4000000,32.9000000,0.0000000,0.0000000,287.0000000); //object(ac_apgate) (1)
	CreateDynamicObject(989,2071.6001000,-1831.3000000,14.4000000,0.0000000,0.0000000,16.7460000); //object(ac_apgate) (2)
	CreateDynamicObject(989,488.2998000,-1734.7002000,12.0000000,0.0000000,0.0000000,98.9920000); //object(ac_apgate) (4)
	CreateDynamicObject(989,720.0000000,-462.5000000,16.8000000,0.0000000,0.0000000,286.7460000); //object(ac_apgate) (3)
	CreateDynamicObject(976,-95.7000000,1111.4000000,18.7000000,0.0000000,0.0000000,180.0000000); //object(phils_compnd_gate) (1)
    CreateDynamicObject(976, 2390.38916, 1043.50305, 9.94149,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(976, -1424.94641, 2591.08813, 54.92140,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(976, -1424.94641, 2591.08813, 57.35400,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(976, -2429.18872, 1028.10205, 49.38518,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(976, -2429.18872, 1028.10205, 52.54500,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(976, 1968.59094, 2158.59546, 9.81610,   0.00000, 0.00000, 90.00000);

	//Close Car Tune
	CreateDynamicObject(989, 1041.37427, -1025.98193, 32.55460,   0.00000, 0.00000, 286.74216);
	CreateDynamicObject(976, 2640.12573, -2039.15527, 12.60236,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(976, 2391.09766, 1043.50830, 9.95760,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(976, -1931.33862, 238.89215, 33.44099,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(976, -2716.12305, 221.97211, 3.50313,   0.00000, 0.00000, 270.00000);
    return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if (newkeys & KEY_NO)
    {
        new idx;
  		if ((idx = Gate_Nearest(playerid)) != -1)
		{
			if (idx != -1)
			{
				if (strlen(GateData[idx][gatePass]))
				{
				    Dialog_Show(playerid, GatePass, DIALOG_STYLE_INPUT, "Enter Password", "Please enter the password for this gate below:", "Submit", "Cancel");
				}
				else
				{
		    		if (GateData[idx][gateFaction] != -1 && playerData[playerid][pFaction] != GetFactionByID(GateData[idx][gateFaction]))
						return SendClientMessage(playerid,  0xFFFFFFAA,"คุณไม่สามารถเปิดประตูนี้ได้");

					Gate_Operate(idx);

					switch (GateData[idx][gateOpened])
					{
					    case 0:
						    //ShowPlayerFooter(playerid, "You have ~r~closed~w~ the gate!");
						    SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s ปิดประตู", GetPlayerNameEx(playerid));

		                case 1:
		        			//ShowPlayerFooter(playerid, "You have ~g~opened~w~ the gate!");
		        			SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s เปิดประตู", GetPlayerNameEx(playerid));

					}
				}
			}
		}
	}
    return 1;
}

// ระบบ Gate
stock IsValidObjectModel(modelid)
{
	if (modelid < 0 || modelid > 20000)
	    return 0;

    switch (modelid)
	{
		case 18632..18645, 18646..18658, 18659..18667, 18668..19299, 19301..19515, 18631, 331, 333..339, 318..321, 325, 326, 341..344, 346..353, 355..370, 372, 19817, 12943, 12978:
			return 1;
	}
    new const g_arrModelData[] =
	{
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -128,
        -515899393, -134217729, -1, -1, 33554431, -1, -1, -1, -14337, -1, -33,
      	127, 0, 0, 0, 0, 0, -8388608, -1, -1, -1, -16385, -1, -1, -1, -1, -1,
       -1, -1, -33, -1, -771751937, -1, -9, -1, -1, -1, -1, -1, -1, -1, -1, -1,
       -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
       -1, -1, -1, -1, -1, -1, -1, -1, 33554431, -25, -1, -1, -1, -1, -1, -1,
       -1073676289, -2147483648, 34079999, 2113536, -4825600, -5, -1, -3145729,
       -1, -16777217, -63, -1, -1, -1, -1, -201326593, -1, -1, -1, -1, -1,
       -257, -1, 1073741823, -133122, -1, -1, -65, -1, -1, -1, -1, -1, -1,
       -2146435073, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1073741823, -64, -1,
       -1, -1, -1, -2635777, 134086663, 0, -64, -1, -1, -1, -1, -1, -1, -1,
       -536870927, -131069, -1, -1, -1, -1, -1, -1, -1, -1, -16384, -1,
       -33554433, -1, -1, -1, -1, -1, -1610612737, 524285, -128, -1,
       2080309247, -1, -1, -1114113, -1, -1, -1, 66977343, -524288, -1, -1, -1,
       -1, -2031617, -1, 114687, -256, -1, -4097, -1, -4097, -1, -1,
       1010827263, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -32768, -1, -1, -1, -1, -1,
       2147483647, -33554434, -1, -1, -49153, -1148191169, 2147483647,
       -100781080, -262145, -57, 134217727, -8388608, -1, -1, -1, -1, -1, -1,
       -1, -1, -1, -1, -1, -1, -1, -1, -1048577, -1, -449, -1017, -1, -1, -1,
       -1, -1, -1, -1, -1, -1, -1, -1, -1835009, -2049, -1, -1, -1, -1, -1, -1,
       -8193, -1, -536870913, -1, -1, -1, -1, -1, -87041, -1, -1, -1, -1, -1,
       -1, -209860, -1023, -8388609, -2096897, -1, -1048577, -1, -1, -1, -1,
       -1, -1, -897, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1610612737,
       -3073, -28673, -1, -1, -1, -1537, -1, -1, -13, -1, -1, -1, -1, -1985,
       -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1056964609, -1, -1, -1,
       -1, -1, -1, -1, -2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
       -236716037, -1, -1, -1, -1, -1, -1, -1, -536870913, 3, 0, 0, 0, 0, 0, 0,
       0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
       0, 0, 0, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
       -1, -1, -1, -1, -1, -2097153, -2109441, -1, 201326591, -4194304, -1, -1,
       -241, -1, -1, -1, -1, -1, -1, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
       0, -32768, -1, -1, -1, -2, -671096835, -1, -8388609, -66323585, -13,
       -1793, -32257, -247809, -1, -1, -513, 16252911, 0, 0, 0, -131072,
       33554383, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
       0, 0, 0, 0, 0, 0, 0, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
       -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 8356095, 0, 0, 0, 0, 0,
       0, -256, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
       -268435449, -1, -1, -2049, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
       92274627, -65536, -2097153, -268435457, 591191935, 1, 0, -16777216, -1,
       -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 127
	};
 	return ((modelid >= 0) && ((modelid / 32) < sizeof(g_arrModelData)) && (g_arrModelData[modelid / 32] & (1 << (modelid % 32))));
}

forward CloseGate(gateid, linkid, Float:fX, Float:fY, Float:fZ, Float:speed, Float:fRotX, Float:fRotY, Float:fRotZ);
public CloseGate(gateid, linkid, Float:fX, Float:fY, Float:fZ, Float:speed, Float:fRotX, Float:fRotY, Float:fRotZ)
{
	new id = -1;

	if (GateData[gateid][gateExists] && GateData[gateid][gateOpened])
 	{
	 	MoveDynamicObject(GateData[gateid][gateObject], fX, fY, fZ, speed, fRotX, fRotY, fRotZ);

	 	if ((id = GetGateByID(linkid)) != -1)
            MoveDynamicObject(GateData[id][gateObject], GateData[id][gatePos][0], GateData[id][gatePos][1], GateData[id][gatePos][2], speed, GateData[id][gatePos][3], GateData[id][gatePos][4], GateData[id][gatePos][5]);

		GateData[id][gateOpened] = 0;
		return 1;
	}
	return 0;
}

stock Gate_Operate(gateid)
{
	if (gateid != -1 && GateData[gateid][gateExists])
	{
	    new id = -1;

		if (!GateData[gateid][gateOpened])
		{
		    GateData[gateid][gateOpened] = true;
		    MoveDynamicObject(GateData[gateid][gateObject], GateData[gateid][gateMove][0], GateData[gateid][gateMove][1], GateData[gateid][gateMove][2], GateData[gateid][gateSpeed], GateData[gateid][gateMove][3], GateData[gateid][gateMove][4], GateData[gateid][gateMove][5]);

            if (GateData[gateid][gateTime] > 0) {
				GateData[gateid][gateTimer] = SetTimerEx("CloseGate", GateData[gateid][gateTime], false, "ddfffffff", gateid, GateData[gateid][gateLinkID], GateData[gateid][gatePos][0], GateData[gateid][gatePos][1], GateData[gateid][gatePos][2], GateData[gateid][gateSpeed], GateData[gateid][gatePos][3], GateData[gateid][gatePos][4], GateData[gateid][gatePos][5]);
			}
			if (GateData[gateid][gateLinkID] != -1 && (id = GetGateByID(GateData[gateid][gateLinkID])) != -1)
			{
			    GateData[id][gateOpened] = true;
			    MoveDynamicObject(GateData[id][gateObject], GateData[id][gateMove][0], GateData[id][gateMove][1], GateData[id][gateMove][2], GateData[id][gateSpeed], GateData[id][gateMove][3], GateData[id][gateMove][4], GateData[id][gateMove][5]);
			}
		}
		else if (GateData[gateid][gateOpened])
		{
		    GateData[gateid][gateOpened] = false;
		    MoveDynamicObject(GateData[gateid][gateObject], GateData[gateid][gatePos][0], GateData[gateid][gatePos][1], GateData[gateid][gatePos][2], GateData[gateid][gateSpeed], GateData[gateid][gatePos][3], GateData[gateid][gatePos][4], GateData[gateid][gatePos][5]);

            if (GateData[gateid][gateTime] > 0) {
				KillTimer(GateData[gateid][gateTimer]);
		    }
			if (GateData[gateid][gateLinkID] != -1 && (id = GetGateByID(GateData[gateid][gateLinkID])) != -1)
			{
			    GateData[id][gateOpened] = false;
			    MoveDynamicObject(GateData[id][gateObject], GateData[id][gatePos][0], GateData[id][gatePos][1], GateData[id][gatePos][2], GateData[id][gateSpeed], GateData[id][gatePos][3], GateData[id][gatePos][4], GateData[id][gatePos][5]);
			}
		}
	}
	return 1;
}

stock Gate_Create(playerid)
{
	new
	    Float:x,
	    Float:y,
	    Float:z,
	    id,
	    Float:angle;


	if (GetPlayerPos(playerid, x, y, z) && GetPlayerFacingAngle(playerid, angle))
	{
		for (new i = 0; i < MAX_GATES; i ++) if (!GateData[i][gateExists])
		{
		    GateData[i][gateExists] = true;
			GateData[i][gateModel] = 980;
			GateData[i][gateSpeed] = 3.0;
			GateData[i][gateRadius] = 5.0;
			GateData[i][gateOpened] = 0;
			GateData[i][gateTime] = 0;

			GateData[i][gatePos][0] = x + (3.0 * floatsin(-angle, degrees));
			GateData[i][gatePos][1] = y + (3.0 * floatcos(-angle, degrees));
			GateData[i][gatePos][2] = z;
			GateData[i][gatePos][3] = 0.0;
			GateData[i][gatePos][4] = 0.0;
			GateData[i][gatePos][5] = angle;

			GateData[i][gateMove][0] = x + (3.0 * floatsin(-angle, degrees));
			GateData[i][gateMove][1] = y + (3.0 * floatcos(-angle, degrees));
			GateData[i][gateMove][2] = z - 10.0;
			GateData[i][gateMove][3] = -1000.0;
			GateData[i][gateMove][4] = -1000.0;
			GateData[i][gateMove][5] = -1000.0;

            GateData[i][gateInterior] = GetPlayerInterior(playerid);
            GateData[i][gateWorld] = GetPlayerVirtualWorld(playerid);

            GateData[i][gateLinkID] = -1;
            GateData[i][gateFaction] = -1;

            GateData[i][gatePass][0] = '\0';
            GateData[i][gateObject] = CreateDynamicObject(GateData[i][gateModel], GateData[i][gatePos][0], GateData[i][gatePos][1], GateData[i][gatePos][2], GateData[i][gatePos][3], GateData[i][gatePos][4], GateData[i][gatePos][5], GateData[i][gateWorld], GateData[i][gateInterior]);
			Gate_Save(id);

			mysql_tquery(g_SQL, "INSERT INTO `gates` (`gateModel`) VALUES(980)", "OnGateCreated", "d", i);
			return i;
		}
	}
	return -1;
}

stock Gate_Delete(gateid)
{
	if (gateid != -1 && GateData[gateid][gateExists])
	{
		new
		    query[64];

		format(query, sizeof(query), "DELETE FROM `gates` WHERE `gateID` = '%d'", GateData[gateid][gateID]);
		mysql_tquery(g_SQL, query);

		if (IsValidDynamicObject(GateData[gateid][gateObject]))
		    DestroyDynamicObject(GateData[gateid][gateObject]);

		for (new i = 0; i != MAX_GATES; i ++) if (GateData[i][gateExists] && GateData[i][gateLinkID] == GateData[gateid][gateID]) {
		    GateData[i][gateLinkID] = -1;
		    Gate_Save(i);
		}
		if (GateData[gateid][gateOpened] && GateData[gateid][gateTime] > 0) {
		    KillTimer(GateData[gateid][gateTimer]);
		}
	    GateData[gateid][gateExists] = false;
	    GateData[gateid][gateID] = 0;
	    GateData[gateid][gateOpened] = 0;
	}
	return 1;
}

stock Gate_Save(gateid)
{
	static
	    query[1024];

	mysql_format(g_SQL, query, sizeof(query), "UPDATE `gates` SET `gateModel` = '%d', `gateSpeed` = '%.4f', `gateRadius` = '%.4f', `gateTime` = '%d', `gateX` = '%.4f', `gateY` = '%.4f', `gateZ` = '%.4f', `gateRX` = '%.4f', `gateRY` = '%.4f', `gateRZ` = '%.4f', `gateInterior` = '%d', `gateWorld` = '%d', `gateMoveX` = '%.4f', `gateMoveY` = '%.4f', `gateMoveZ` = '%.4f', `gateMoveRX` = '%.4f', `gateMoveRY` = '%.4f', `gateMoveRZ` = '%.4f', `gateLinkID` = '%d', `gateFaction` = '%d', `gatePass` = '%s' WHERE `gateID` = '%d'",
	    GateData[gateid][gateModel],
	    GateData[gateid][gateSpeed],
	    GateData[gateid][gateRadius],
	    GateData[gateid][gateTime],
	    GateData[gateid][gatePos][0],
	    GateData[gateid][gatePos][1],
	    GateData[gateid][gatePos][2],
	    GateData[gateid][gatePos][3],
	    GateData[gateid][gatePos][4],
	    GateData[gateid][gatePos][5],
	    GateData[gateid][gateInterior],
	    GateData[gateid][gateWorld],
	    GateData[gateid][gateMove][0],
	    GateData[gateid][gateMove][1],
	    GateData[gateid][gateMove][2],
	    GateData[gateid][gateMove][3],
	    GateData[gateid][gateMove][4],
	    GateData[gateid][gateMove][5],
	    GateData[gateid][gateLinkID],
	    GateData[gateid][gateFaction],
	    SQL_ReturnEscaped(GateData[gateid][gatePass]),
	    GateData[gateid][gateID]
	);
	return mysql_tquery(g_SQL, query);
}

Dialog:GatePass(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    new id = Gate_Nearest(playerid);

	    if (id == -1)
	        return 0;

        if (isnull(inputtext))
        	return Dialog_Show(playerid, GatePass, DIALOG_STYLE_INPUT, "Enter Password", "Please enter the password for this gate below:", "Submit", "Cancel");

		if (strcmp(inputtext, GateData[id][gatePass]) != 0)
  			return Dialog_Show(playerid, GatePass, DIALOG_STYLE_INPUT, "Enter Password", "Error: Incorrect password specified.\n\nPlease enter the password for this gate below:", "Submit", "Cancel");

		Gate_Operate(id);
	}
	return 1;
}

Gate_Nearest(playerid)
{
    for (new i = 0; i != MAX_GATES; i ++) if (GateData[i][gateExists] && IsPlayerInRangeOfPoint(playerid, GateData[i][gateRadius], GateData[i][gatePos][0], GateData[i][gatePos][1], GateData[i][gatePos][2]))
	{
		if (GetPlayerInterior(playerid) == GateData[i][gateInterior] && GetPlayerVirtualWorld(playerid) == GateData[i][gateWorld])
			return i;
	}
	return -1;
}

CMD:creategate(playerid, params[])
{
	static
	    id = -1;

    if (playerData[playerid][pAdmin] < 5)
	    return SendAdminAlert(COLOR_LIGHTRED, "คุณไม่ได้รับอนุญาตให้ใช้คำสั่งนี้.");

	id = Gate_Create(playerid);

	if (id == -1)
	    return SendAdminAlert(COLOR_LIGHTRED, "The server has reached the limit for gates.");

	SendAdminAlert(COLOR_LIGHTRED, "You have successfully created gate ID: %d.", id);
	return 1;
}

CMD:destroygate(playerid, params[])
{
	static
	    id = 0;

    if (playerData[playerid][pAdmin] < 5)
	    return SendAdminAlert(COLOR_LIGHTRED, "คุณไม่ได้รับอนุญาตให้ใช้คำสั่งนี้.");

	if (sscanf(params, "d", id))
	    return SendAdminAlert(COLOR_LIGHTRED, "/destroygate [gate id]");

	if ((id < 0 || id >= MAX_GATES) || !GateData[id][gateExists])
	    return SendAdminAlert(COLOR_LIGHTRED, "You have specified an invalid gate ID.");

	Gate_Delete(id);
	SendAdminAlert(COLOR_LIGHTRED, "You have successfully destroyed gate ID: %d.", id);
	return 1;
}

CMD:editgate(playerid, params[])
{
	static
	    id,
	    type[24],
	    string[128];

	if (playerData[playerid][pAdmin] < 5)
	    return SendClientMessage(playerid, COLOR_GREY, "คุณไม่ได้รับอนุญาตให้ใช้คำสั่งนี้.");

	if (sscanf(params, "ds[24]S()[128]", id, type, string))
 	{
	 	SendClientMessage(playerid, COLOR_GREY, "/editgate [id] [name]");
	    SendClientMessage(playerid, COLOR_YELLOW, "[NAMES]:{FFFFFF} location, speed, radius, time, model, pos, move, pass, linkid, faction");
		return 1;
	}
	if ((id < 0 || id >= MAX_GATES) || !GateData[id][gateExists])
	    return SendClientMessage(playerid, COLOR_GREY, "You have specified an invalid gate ID.");

    if (!strcmp(type, "location", true))
	{
		static
		    Float:x,
		    Float:y,
		    Float:z,
		    Float:angle;

		GetPlayerPos(playerid, x, y, z);
		GetPlayerFacingAngle(playerid, angle);

		x += 3.0 * floatsin(-angle, degrees);
		y += 3.0 * floatcos(-angle, degrees);

		GateData[id][gatePos][0] = x;
		GateData[id][gatePos][1] = y;
		GateData[id][gatePos][2] = z;
		GateData[id][gatePos][3] = 0.0;
		GateData[id][gatePos][4] = 0.0;
		GateData[id][gatePos][5] = angle;

		SetDynamicObjectPos(GateData[id][gateObject], x, y, z);
		SetDynamicObjectRot(GateData[id][gateObject], 0.0, 0.0, angle);

		GateData[id][gateOpened] = false;

		Gate_Save(id);
		SendAdminAlert(COLOR_LIGHTRED, "[ADMIN]: %s has adjusted the position of gate ID: %d.", GetPlayerNameEx(playerid), id);
		return 1;
	}
	else if (!strcmp(type, "speed", true))
	{
	    static
	        Float:speed;

		if (sscanf(string, "f", speed))
		    return SendClientMessage(playerid, COLOR_GREY, "/editgate [id] [speed] [move speed]");

		if (speed < 0.0 || speed > 20.0)
		    return SendClientMessage(playerid, COLOR_GREY, "The specified speed can't be below 0 or above 20.");

        GateData[id][gateSpeed] = speed;

		Gate_Save(id);
		SendAdminAlert(COLOR_LIGHTRED, "[ADMIN]: %s has adjusted the speed of gate ID: %d to %.2f.", GetPlayerNameEx(playerid), id, speed);
		return 1;
	}
	else if (!strcmp(type, "radius", true))
	{
	    static
	        Float:radius;

		if (sscanf(string, "f", radius))
		    return SendClientMessage(playerid, COLOR_GREY, "/editgate [id] [radius] [open radius]");

		if (radius < 0.0 || radius > 20.0)
		    return SendClientMessage(playerid, COLOR_GREY, "The specified radius can't be below 0 or above 20.");

        GateData[id][gateRadius] = radius;

		Gate_Save(id);
		SendAdminAlert(COLOR_LIGHTRED, "[ADMIN]: %s has adjusted the radius of gate ID: %d to %.2f.", GetPlayerNameEx(playerid), id, radius);
		return 1;
	}
	else if (!strcmp(type, "time", true))
	{
	    static
	        time;

		if (sscanf(string, "d", time))
		    return SendClientMessage(playerid, COLOR_GREY, "/editgate [id] [time] [close time] (0 to disable)");

		if (time < 0 || time > 60000)
		    return SendClientMessage(playerid, COLOR_GREY, "The specified time can't be 0 or above 60,000 ms.");

        GateData[id][gateTime] = time;

		Gate_Save(id);
		SendAdminAlert(COLOR_LIGHTRED, "[ADMIN]: %s has adjusted the close time of gate ID: %d to %d.", GetPlayerNameEx(playerid), id, time);
		return 1;
	}
	else if (!strcmp(type, "model", true))
	{
	    static
	        model;

		if (sscanf(string, "d", model))
		    return SendClientMessage(playerid, COLOR_GREY, "/editgate [id] [model] [gate model]");

		if (!IsValidObjectModel(model))
		    return SendClientMessage(playerid, COLOR_GREY, "Invalid object model.");

        GateData[id][gateModel] = model;

		DestroyDynamicObject(GateData[id][gateObject]);
		GateData[id][gateObject] = CreateDynamicObject(GateData[id][gateModel], GateData[id][gatePos][0], GateData[id][gatePos][1], GateData[id][gatePos][2], GateData[id][gatePos][3], GateData[id][gatePos][4], GateData[id][gatePos][5], GateData[id][gateWorld], GateData[id][gateInterior]);

		Gate_Save(id);
		SendAdminAlert(COLOR_LIGHTRED, "[ADMIN]: %s has adjusted the model of gate ID: %d to %d.", GetPlayerNameEx(playerid), id, model);
		return 1;
	}
    else if (!strcmp(type, "pos", true))
	{
	    ResetEditing(playerid);
	   	EditDynamicObject(playerid, GateData[id][gateObject]);

		playerData[playerid][pEditGate] = id;
		playerData[playerid][pEditType] = 1;

		SendAdminAlert(COLOR_LIGHTRED,  "You are now adjusting the position of gate ID: %d.", id);
		return 1;
	}
	else if (!strcmp(type, "move", true))
	{
	    ResetEditing(playerid);
	   	EditDynamicObject(playerid, GateData[id][gateObject]);

		playerData[playerid][pEditGate] = id;
		playerData[playerid][pEditType] = 2;

		SendAdminAlert(COLOR_LIGHTRED,  "You are now adjusting the position of gate ID: %d.", id);
		return 1;
	}
	else if (!strcmp(type, "linkid", true))
	{
	    static
	        linkid = -1;

		if (sscanf(string, "d", linkid))
		    return SendClientMessage(playerid, COLOR_GREY, "/editgate [id] [linkid] [gate link] (-1 for none)");

        if ((linkid < -1 || linkid >= MAX_GATES) || (linkid != -1 && !GateData[linkid][gateExists]))
	    	return SendClientMessage(playerid, COLOR_GREY, "You have specified an invalid gate ID.");

        GateData[id][gateLinkID] = (linkid == -1) ? (-1) : (GateData[linkid][gateID]);
		Gate_Save(id);

		if (id == -1)
			SendAdminAlert(COLOR_LIGHTRED, "[ADMIN]: %s has adjusted the faction of gate ID: %d to no gate.", GetPlayerNameEx(playerid), id);

		else
		    SendAdminAlert(COLOR_LIGHTRED, "[ADMIN]: %s has adjusted the faction of gate ID: %d to ID: %d.", GetPlayerNameEx(playerid), id, linkid);

		return 1;
	}
	else if (!strcmp(type, "faction", true))
	{
	    static
	        factionid = -1;

		if (sscanf(string, "d", factionid))
		    return SendClientMessage(playerid, COLOR_GREY, "/editgate [id] [faction] [gate faction] (-1 for none)");

        if ((factionid < -1 || factionid >= MAX_FACTIONS) || (factionid != -1 && !factionData[factionid][factionExists]))
	    	return SendClientMessage(playerid, COLOR_GREY, "You have specified an invalid faction ID.");

        GateData[id][gateFaction] = (factionid == -1) ? (-1) : (factionData[factionid][factionID]);
		Gate_Save(id);

		if (factionid == -1)
			SendAdminAlert(COLOR_LIGHTRED, "[ADMIN]: %s has adjusted the faction of gate ID: %d to no faction.", GetPlayerNameEx(playerid), id);

		else
		    SendAdminAlert(COLOR_LIGHTRED, "[ADMIN]: %s has adjusted the faction of gate ID: %d to \"%s\".", GetPlayerNameEx(playerid), id, factionData[factionid][factionName]);

		return 1;
	}
	else if (!strcmp(type, "pass", true))
	{
	    static
	        pass[32];

		if (sscanf(string, "s[32]", pass))
		    return SendClientMessage(playerid, COLOR_GREY, "/editgate [id] [pass] [gate password] (Use 'none' to disable)");

		if (!strcmp(params, "none", true))
			GateData[id][gatePass][0] = 0;

		else format(GateData[id][gatePass], 32, pass);

		Gate_Save(id);
		SendAdminAlert(COLOR_LIGHTRED, "[ADMIN]: %s has adjusted the password of gate ID: %d to %s.", GetPlayerNameEx(playerid), id, pass);
		return 1;
	}
	return 1;
}

public OnPlayerEditDynamicObject(playerid, objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
	if (response == EDIT_RESPONSE_FINAL)
	{

		 if (playerData[playerid][pEditGate] != -1 && GateData[playerData[playerid][pEditGate]][gateExists])
	    {
	        switch (playerData[playerid][pEditType])
	        {
	            case 1:
	            {
	                new id = playerData[playerid][pEditGate];

	                GateData[playerData[playerid][pEditGate]][gatePos][0] = x;
	                GateData[playerData[playerid][pEditGate]][gatePos][1] = y;
	                GateData[playerData[playerid][pEditGate]][gatePos][2] = z;
	                GateData[playerData[playerid][pEditGate]][gatePos][3] = rx;
	                GateData[playerData[playerid][pEditGate]][gatePos][4] = ry;
	                GateData[playerData[playerid][pEditGate]][gatePos][5] = rz;

	                DestroyDynamicObject(GateData[id][gateObject]);
					GateData[id][gateObject] = CreateDynamicObject(GateData[id][gateModel], GateData[id][gatePos][0], GateData[id][gatePos][1], GateData[id][gatePos][2], GateData[id][gatePos][3], GateData[id][gatePos][4], GateData[id][gatePos][5], GateData[id][gateWorld], GateData[id][gateInterior]);

					Gate_Save(id);
                    SendAdminAlert(COLOR_LIGHTRED,  "You have edited the position of gate ID: %d.", id);
				}
				case 2:
	            {
	                new id = playerData[playerid][pEditGate];

	                GateData[playerData[playerid][pEditGate]][gateMove][0] = x;
	                GateData[playerData[playerid][pEditGate]][gateMove][1] = y;
	                GateData[playerData[playerid][pEditGate]][gateMove][2] = z;
	                GateData[playerData[playerid][pEditGate]][gateMove][3] = rx;
	                GateData[playerData[playerid][pEditGate]][gateMove][4] = ry;
	                GateData[playerData[playerid][pEditGate]][gateMove][5] = rz;

	                DestroyDynamicObject(GateData[id][gateObject]);
					GateData[id][gateObject] = CreateDynamicObject(GateData[id][gateModel], GateData[id][gatePos][0], GateData[id][gatePos][1], GateData[id][gatePos][2], GateData[id][gatePos][3], GateData[id][gatePos][4], GateData[id][gatePos][5], GateData[id][gateWorld], GateData[id][gateInterior]);

					Gate_Save(id);
                    SendAdminAlert(COLOR_LIGHTRED,  "You have edited the moving position of gate ID: %d.", id);
				}
			}
		}
	}
	if (response == EDIT_RESPONSE_FINAL || response == EDIT_RESPONSE_CANCEL)
	{

	    playerData[playerid][pEditType] = 0;
	    playerData[playerid][pEditGate] = -1;
	}
	return 1;
}

CMD:open(playerid, params[])
{
	new id = Gate_Nearest(playerid);

	if (id != -1)
	{
		if (strlen(GateData[id][gatePass]))
		{
		    Dialog_Show(playerid, GatePass, DIALOG_STYLE_INPUT, "Enter Password", "Please enter the password for this gate below:", "Submit", "Cancel");
		}
		else
		{
		    if (GateData[id][gateFaction] != -1 && playerData[playerid][pFaction] != GetFactionByID(GateData[id][gateFaction]))
				return SendClientMessage(playerid,  0xFFFFFFAA,"คุณไม่สามารถเปิดประตูนี้ได้");

			Gate_Operate(id);

			switch (GateData[id][gateOpened])
			{
			    case 0:
				    //ShowPlayerFooter(playerid, "You have ~r~closed~w~ the gate!");
				    SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s ปิดประตู", GetPlayerNameEx(playerid));

                case 1:
        			//ShowPlayerFooter(playerid, "You have ~g~opened~w~ the gate!");
        			SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s เปิดประตู", GetPlayerNameEx(playerid));
			}
		}
	}
	return 1;

}

stock GetGateByID(sqlid)
{
	for (new i = 0; i != MAX_GATES; i ++) if (GateData[i][gateExists] && GateData[i][gateID] == sqlid)
	    return i;

	return -1;
}

forward Gate_Load();
public Gate_Load()
{
    static
	    rows;

	cache_get_row_count(rows);

	for (new i = 0; i < rows; i ++) if (i < MAX_GATES)
	{
	    GateData[i][gateExists] = true;
	    GateData[i][gateOpened] = false;


	    cache_get_value_name_int(i, "gateID",GateData[i][gateID]);
	    cache_get_value_name_int(i, "gateModel",GateData[i][gateModel]);
	    cache_get_value_name_float(i, "gateSpeed",GateData[i][gateSpeed]);
	    cache_get_value_name_float(i, "gateRadius",GateData[i][gateRadius]);
	    cache_get_value_name_int(i, "gateTime",GateData[i][gateTime]);
	    cache_get_value_name_int(i, "gateInterior",GateData[i][gateInterior]);
	    cache_get_value_name_int(i, "gateWorld",GateData[i][gateWorld]);

	    cache_get_value_name_float(i, "gateX",GateData[i][gatePos][0]);
	    cache_get_value_name_float(i, "gateY",GateData[i][gatePos][1]);
	    cache_get_value_name_float(i, "gateZ",GateData[i][gatePos][2]);
	    cache_get_value_name_float(i, "gateRX",GateData[i][gatePos][3]);
	    cache_get_value_name_float(i, "gateRY",GateData[i][gatePos][4]);
	    cache_get_value_name_float(i, "gateRZ",GateData[i][gatePos][5]);

        cache_get_value_name_float(i, "gateMoveX",GateData[i][gateMove][0]);
	    cache_get_value_name_float(i, "gateMoveY",GateData[i][gateMove][1]);
	    cache_get_value_name_float(i, "gateMoveZ",GateData[i][gateMove][2]);
	    cache_get_value_name_float(i, "gateMoveRX",GateData[i][gateMove][3]);
	    cache_get_value_name_float(i, "gateMoveRY",GateData[i][gateMove][4]);
	    cache_get_value_name_float(i, "gateMoveRZ",GateData[i][gateMove][5]);

        cache_get_value_name_int(i, "gateLinkID",GateData[i][gateLinkID]);
	    cache_get_value_name_int(i, "gateFaction",GateData[i][gateFaction]);

		cache_get_value_name_int(i, "gatePass", GateData[i][gatePass]);
	    //cache_get_field_content(i, "gatePass", GateData[i][gatePass], g_iHandle, 32);
		printf("[SERVER]: %d Gates were loaded from \"%s\" database...", rows, MYSQL_DATABASE);
	    GateData[i][gateObject] = CreateDynamicObject(GateData[i][gateModel], GateData[i][gatePos][0], GateData[i][gatePos][1], GateData[i][gatePos][2], GateData[i][gatePos][3], GateData[i][gatePos][4], GateData[i][gatePos][5], GateData[i][gateWorld], GateData[i][gateInterior]);
	}
	printf("[SERVER]: %d Gates were loaded from \"%s\" database...", rows, MYSQL_DATABASE);
	return 1;
}

forward OnGateCreated(gateid);
public OnGateCreated(gateid)
{
	if (gateid == -1 || !GateData[gateid][gateExists])
	    return 0;

	GateData[gateid][gateID] = cache_insert_id();
	Gate_Save(gateid);

	return 1;
}

ResetEditing(playerid)
{
	playerData[playerid][pEditType] = 0;
 	playerData[playerid][pEditGate] = -1;
	return 1;
}
