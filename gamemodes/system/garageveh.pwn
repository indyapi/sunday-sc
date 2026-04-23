#include	<YSI_Coding\y_hooks>

#define 	MAX_GARAGEVAH				(500)

enum GARAGEVEH_DATA {
	garagevehID,
	garagevehExists,
	Float:garagevehPosX,
	Float:garagevehPosY,
	Float:garagevehPosZ,
	garagevehInterior,
	garagevehWorld,
	garagevehType,
	Text3D:garagevehText3D,
	garagevehPickup
};
new garagevehData[MAX_GARAGEVAH][GARAGEVEH_DATA];

//mysql_tquery(g_SQL, "SELECT * FROM `garagevehs`", "garageveh_Load", "");

forward garageveh_Load();
public garageveh_Load()
{
	static
	    rows;

	cache_get_row_count(rows);

	for (new i = 0; i < rows; i ++) if (i < MAX_GARAGEVAH)
	{
	    garagevehData[i][garagevehExists] = true;

	    cache_get_value_name_int(i, "garagevehID", garagevehData[i][garagevehID]);
	    cache_get_value_name_float(i, "garagevehX", garagevehData[i][garagevehPosX]);
	    cache_get_value_name_float(i, "garagevehY", garagevehData[i][garagevehPosY]);
	    cache_get_value_name_float(i, "garagevehZ", garagevehData[i][garagevehPosZ]);
	    cache_get_value_name_int(i, "garagevehInterior", garagevehData[i][garagevehInterior]);
	    cache_get_value_name_int(i, "garagevehWorld", garagevehData[i][garagevehWorld]);
		cache_get_value_name_int(i, "garagevehType", garagevehData[i][garagevehType]);

	    garageveh_Refresh(i);
	}
	printf("[SERVER]: %d garagevehs were loaded from \"%s\" database...", rows, MYSQL_DATABASE);
	return 1;
}

forward OngaragevehCreated(garagevehid);
public OngaragevehCreated(garagevehid)
{
	if (garagevehid == -1 || !garagevehData[garagevehid][garagevehExists])
	    return 0;

	garagevehData[garagevehid][garagevehID] = cache_insert_id();
	garageveh_Save(garagevehid);

	return 1;
}

garageveh_Nearest(playerid)
{
    for (new i = 0; i != MAX_GARAGEVAH; i ++) if (garagevehData[i][garagevehExists] && IsPlayerInRangeOfPoint(playerid, 4.0, garagevehData[i][garagevehPosX], garagevehData[i][garagevehPosY], garagevehData[i][garagevehPosZ]))
	{
		if (GetPlayerInterior(playerid) == garagevehData[i][garagevehInterior] && GetPlayerVirtualWorld(playerid) == garagevehData[i][garagevehWorld])
			return i;
	}
	return -1;
}

garageveh_Delete(garagevehid)
{
	if (garagevehid != -1 && garagevehData[garagevehid][garagevehExists])
	{
	    static
	        string[64];

        if (IsValidDynamicPickup(garagevehData[garagevehid][garagevehPickup]))
		    DestroyDynamicPickup(garagevehData[garagevehid][garagevehPickup]);

		if (IsValidDynamic3DTextLabel(garagevehData[garagevehid][garagevehText3D]))
		    DestroyDynamic3DTextLabel(garagevehData[garagevehid][garagevehText3D]);

		mysql_format(g_SQL, string, sizeof(string), "DELETE FROM `garagevehs` WHERE `garagevehID` = '%d'", garagevehData[garagevehid][garagevehID]);
		mysql_tquery(g_SQL, string);

		garagevehData[garagevehid][garagevehExists] = false;
		garagevehData[garagevehid][garagevehID] = 0;
	}
	return 1;
}

garageveh_Create(Float:x, Float:y, Float:z, interior, world, type)
{
	for (new i = 0; i < MAX_GARAGEVAH; i ++) if (!garagevehData[i][garagevehExists])
	{
	    garagevehData[i][garagevehExists] = true;
	    garagevehData[i][garagevehPosX] = x;
	    garagevehData[i][garagevehPosY] = y;
	    garagevehData[i][garagevehPosZ] = z;
	    garagevehData[i][garagevehInterior] = interior;
	    garagevehData[i][garagevehWorld] = world;
		garagevehData[i][garagevehType] = type;

	    mysql_tquery(g_SQL, "INSERT INTO `garagevehs` (`garagevehInterior`) VALUES(0)", "OngaragevehCreated", "d", i);
		garageveh_Refresh(i);
		return i;
	}
	return -1;
}

garageveh_Save(garagevehid)
{
	static
	    query[280];

	mysql_format(g_SQL, query, sizeof(query), "UPDATE `garagevehs` SET `garagevehX` = '%.4f', `garagevehY` = '%.4f', `garagevehZ` = '%.4f', `garagevehInterior` = '%d', `garagevehWorld` = '%d' , `garagevehType` = '%d' WHERE `garagevehID` = '%d'",
	    garagevehData[garagevehid][garagevehPosX],
	    garagevehData[garagevehid][garagevehPosY],
	    garagevehData[garagevehid][garagevehPosZ],
	    garagevehData[garagevehid][garagevehInterior],
	    garagevehData[garagevehid][garagevehWorld],
		garagevehData[garagevehid][garagevehType],
	    garagevehData[garagevehid][garagevehID]
	);
	return mysql_tquery(g_SQL, query);
}

garageveh_Refresh(garagevehid)
{
	if (garagevehid != -1 && garagevehData[garagevehid][garagevehExists])
	{
		if (IsValidDynamicPickup(garagevehData[garagevehid][garagevehPickup]))
		    DestroyDynamicPickup(garagevehData[garagevehid][garagevehPickup]);

		if (IsValidDynamic3DTextLabel(garagevehData[garagevehid][garagevehText3D]))
		    DestroyDynamic3DTextLabel(garagevehData[garagevehid][garagevehText3D]);

		if (garagevehData[garagevehid][garagevehType] == 1)
		{
			garagevehData[garagevehid][garagevehPickup] = CreateDynamicPickup(19607, 23, garagevehData[garagevehid][garagevehPosX], garagevehData[garagevehid][garagevehPosY], garagevehData[garagevehid][garagevehPosZ]-0.8, garagevehData[garagevehid][garagevehWorld], garagevehData[garagevehid][garagevehInterior]);
  			garagevehData[garagevehid][garagevehText3D] = CreateDynamic3DTextLabel("{0FFF00}(| เบิกรถ |)\n{FFFFFF} [ ใช้ > 'H' < use ]", COLOR_GREEN, garagevehData[garagevehid][garagevehPosX], garagevehData[garagevehid][garagevehPosY], garagevehData[garagevehid][garagevehPosZ]-1, 5.0, INVALID_VEHICLE_ID, INVALID_PLAYER_ID, 0, garagevehData[garagevehid][garagevehWorld], garagevehData[garagevehid][garagevehInterior]);
		}
		if (garagevehData[garagevehid][garagevehType] == 2)
		{
			garagevehData[garagevehid][garagevehPickup] = CreateDynamicPickup(19605, 23, garagevehData[garagevehid][garagevehPosX], garagevehData[garagevehid][garagevehPosY], garagevehData[garagevehid][garagevehPosZ]-0.8, garagevehData[garagevehid][garagevehWorld], garagevehData[garagevehid][garagevehInterior]);
  			garagevehData[garagevehid][garagevehText3D] = CreateDynamic3DTextLabel("{FF0000}(| เก็บรถ |)\n{FFFFFF} [ ใช้ > 'Y' < use ]", COLOR_GREEN, garagevehData[garagevehid][garagevehPosX], garagevehData[garagevehid][garagevehPosY], garagevehData[garagevehid][garagevehPosZ]-1, 5.0, INVALID_VEHICLE_ID, INVALID_PLAYER_ID, 0, garagevehData[garagevehid][garagevehWorld], garagevehData[garagevehid][garagevehInterior]);
		}
        if (garagevehData[garagevehid][garagevehType] == 3)
		{
			garagevehData[garagevehid][garagevehPickup] = CreateDynamicPickup(1239, 23, garagevehData[garagevehid][garagevehPosX], garagevehData[garagevehid][garagevehPosY], garagevehData[garagevehid][garagevehPosZ], garagevehData[garagevehid][garagevehWorld], garagevehData[garagevehid][garagevehInterior]);
  			garagevehData[garagevehid][garagevehText3D] = CreateDynamic3DTextLabel("{8282ff}(| พาวรถ |)\n{FFFFFF} [ ใช้ > 'N' < use ]", COLOR_GREEN, garagevehData[garagevehid][garagevehPosX], garagevehData[garagevehid][garagevehPosY], garagevehData[garagevehid][garagevehPosZ], 5.0, INVALID_VEHICLE_ID, INVALID_PLAYER_ID, 0, garagevehData[garagevehid][garagevehWorld], garagevehData[garagevehid][garagevehInterior]);
		}
	}
	return 1;
}

alias:creategarageveh("วางการาจ")
CMD:creategarageveh(playerid, params[])
{
	static
		type;

    if (playerData[playerid][pAdmin] < 6)
	    return 1;

	if (sscanf(params, "d", type))
	{
		SendClientMessage(playerid, COLOR_WHITE, "/วางการาจ [รูปแบบ]");
		SendClientMessage(playerid, COLOR_WHITE, "\t[TYLE] 1 = เบิกรถ 2 = เก็บรถ 3 = พาวรถ");	
		return 1;
	}


	static
	    id = -1,
		Float:x,
		Float:y,
		Float:z;

	GetPlayerPos(playerid, x, y, z);

    if (type < 1 || type > 3)
	    return SendClientMessage(playerid, COLOR_RED, "[SUN-WARNING] {FFFFFF}[TYLE] 1 = เบิกรถ 2 = เก็บรถ 3 = พาวรถ");

	id = garageveh_Create(x, y, z, GetPlayerInterior(playerid), GetPlayerVirtualWorld(playerid), type);

	if (id == -1)
	    return SendClientMessage(playerid, COLOR_RED, "[SUN-WARNING] {FFFFFF}ความจุของการาจในฐานข้อมูลเต็มแล้ว ไม่สามารถสร้างได้อีก (ติดต่อผู้พัฒนา)");

	SendClientMessageEx(playerid, COLOR_SERVER, "สร้างการาจ ไอดี: %d", id);
	return 1;
}

alias:deletegarageveh("ลบการาจ")
CMD:deletegarageveh(playerid, params[])
{
	static
	    id = 0;

    if (playerData[playerid][pAdmin] < 6)
	    return 1;

	if (sscanf(params, "d", id))
	    return SendClientMessage(playerid, COLOR_WHITE, "/ลบการาจ [ไอดี]");

	if ((id < 0 || id >= MAX_GARAGEVAH) || !garagevehData[id][garagevehExists])
	    return SendClientMessage(playerid, COLOR_RED, "[SUN-WARNING] {FFFFFF}ไม่มีไอดีการาจนี้อยู่ในฐานข้อมูล");

	garageveh_Delete(id);
	SendClientMessageEx(playerid, COLOR_SERVER, "ลบการาจ ไอดี %d", id);
	return 1;
}

/*
    if (GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
		{
	        if (garageveh_Nearest(playerid) != -1)
	        {
                new shopid = garageveh_Nearest(playerid);

				if (garagevehData[shopid][garagevehType] == 1)
				{
                    new query[128];
                    mysql_format(g_SQL, query, sizeof(query), "SELECT * FROM `vehicles` WHERE `carOwnerID` = %d", playerData[playerid][pID]);
                    mysql_tquery(g_SQL, query, "OnQueryFinished", "dd", playerid, THREAD_LIST_VEHICLES);
                    return 1;
                }
	        }
	        
		}
    }


        if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	    {
	        if (garageveh_Nearest(playerid) != -1)
	        {
                new shopid = garageveh_Nearest(playerid);

				if (garagevehData[shopid][garagevehType] == 2)
				{
                    new vehicleid = GetPlayerVehicleID(playerid);
                    if(carData[vehicleid][carID] > 0 && IsVehicleOwner(playerid, vehicleid))
                    {
                        SendClientMessageEx(playerid, COLOR_WHITE, "คุณได้เก็บรถรุ่น {FF6347}%s{FFFFFF} เข้าการาจเรียบร้อย", ReturnVehicleName(vehicleid));
                        KillTimer(playerData[playerid][pSpeedoTimer]);
                        DespawnVehicle(vehicleid);
                        return 1;
                    }
                    else return SendClientMessage(playerid, COLOR_RED, "[ERRORS!!!]:คุณไม่ใช่เจ้าของรถคันนี้");
                }
            }
        }

    


*/