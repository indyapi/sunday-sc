#include	<YSI_Coding\y_hooks>

#define 	MAX_CARPICK 			(50)
#define 	MAX_CARKEEP			(50)

enum CARPICK_DATA {
	carpickID,
	carpickExists,
	Float:carpickPosX,
	Float:carpickPosY,
	Float:carpickPosZ,
	Text3D:carpickText3D,
	carpickPickup
};
new carpickData[MAX_CARPICK][CARPICK_DATA];

enum CARKEEP_DATA {
	carkeepID,
	carkeepExists,
	Float:carkeepPosX,
	Float:carkeepPosY,
	Float:carkeepPosZ,
	Text3D:carkeepText3D,
	carkeepPickup
};
new carkeepData[CARKEEP_DATA][MAX_CARKEEP];

forward Carpick_Load();
public Carpick_Load()
{
	static
	    rows;

	cache_get_row_count(rows);

	for (new i = 0; i < rows; i ++) if (i < MAX_CARPICK)
	{
	    carpickData[i][carpickExists] = true;

	    cache_get_value_name_int(i, "carpickID", carpickData[i][carpickID]);
	    cache_get_value_name_float(i, "carpickX", carpickData[i][carpickPosX]);
	    cache_get_value_name_float(i, "carpickY", carpickData[i][carpickPosY]);
	    cache_get_value_name_float(i, "carpickZ", carpickData[i][carpickPosZ]);

	    Carpick_Refresh(i);
	}
	printf("[SERVER]: %i carpick were loaded from \"%s\" database...", rows, MYSQL_DATABASE);
	return 1;
}

forward Carkeep_Load();
public Carkeep_Load()
{
	static
	    rows;

	cache_get_row_count(rows);

	for (new i = 0; i < rows; i ++) if (i < MAX_CARKEEP)
	{
	    carkeepData[i][carkeepExists] = true;

	    cache_get_value_name_int(i, "carkeepID", carkeepData[i][carkeepID]);
	    cache_get_value_name_float(i, "carkeepX", carkeepData[i][carkeepPosX]);
	    cache_get_value_name_float(i, "carkeepY", carkeepData[i][carkeepPosY]);
	    cache_get_value_name_float(i, "carkeepZ", carkeepData[i][carkeepPosZ]);

	    Carkeep_Refresh(i);
	}
	printf("[SERVER]: %i carkeep were loaded from \"%s\" database...", rows, MYSQL_DATABASE);
	return 1;
}

forward CarpickCreate(carpickid);
public CarpickCreate(carpickid)
{
	if (carpickid == -1 || !carpickData[carpickid][carpickExists])
	    return 0;

	carpickData[carpickid][carpickID] = cache_insert_id();
	Carpick_Save(carpickid);

	return 1;
}

forward CarkeepCreate(carkeepid);
public CarkeepCreate(carkeepid)
{
	if (carkeepid == -1 || !carkeepData[carkeepid][carkeepExists])
	    return 0;

	carkeepData[carkeepid][carkeepID] = cache_insert_id();
	Carkeep_Save(carkeepid);

	return 1;
}

Carpick_Nearest(playerid)
{
    for (new i = 0; i != MAX_CARPICK; i ++) if (carpickData[i][carpickExists] && IsPlayerInRangeOfPoint(playerid, 4.0, carpickData[i][carpickPosX], carpickData[i][carpickPosY], carpickData[i][carpickPosZ]))
	{
		return i;
	}
	return -1;
}

Carkeep_Nearest(playerid)
{
    for (new i = 0; i != MAX_CARKEEP; i ++) if (carkeepData[i][carkeepExists] && IsPlayerInRangeOfPoint(playerid, 4.0, carkeepData[i][carkeepPosX], carkeepData[i][carkeepPosY], carkeepData[i][carkeepPosZ]))
	{
		return i;
	}
	return -1;
}

Carpick_Delete(pumpid)
{
	if (pumpid != -1 && carpickData[pumpid][carpickExists])
	{
	    static
	        string[64];

        if (IsValidDynamicPickup(carpickData[pumpid][carpickPickup]))
		    DestroyDynamicPickup(carpickData[pumpid][carpickPickup]);

		if (IsValidDynamic3DTextLabel(carpickData[pumpid][carpickText3D]))
		    DestroyDynamic3DTextLabel(carpickData[pumpid][carpickText3D]);

		mysql_format(g_SQL, string, sizeof(string), "DELETE FROM `carpick` WHERE `carpickID` = '%d'", carpickData[pumpid][carpickID]);
		mysql_tquery(g_SQL, string);

		carpickData[pumpid][carpickExists] = false;
		carpickData[pumpid][carpickID] = 0;
	}
	return 1;
}

Carkeep_Delete(pumpid)
{
	if (pumpid != -1 && carkeepData[pumpid][carkeepExists])
	{
	    static
	        string[64];

        if (IsValidDynamicPickup(carkeepData[pumpid][carkeepPickup]))
		    DestroyDynamicPickup(carkeepData[pumpid][carkeepPickup]);

		if (IsValidDynamic3DTextLabel(carkeepData[pumpid][carkeepText3D]))
		    DestroyDynamic3DTextLabel(carkeepData[pumpid][carkeepText3D]);

		mysql_format(g_SQL, string, sizeof(string), "DELETE FROM `carkeep` WHERE `carkeepID` = '%d'", carkeepData[pumpid][carkeepID]);
		mysql_tquery(g_SQL, string);

		carkeepData[pumpid][carkeepExists] = false;
		carkeepData[pumpid][carkeepID] = 0;
	}
	return 1;
}

Carpick_Create(Float:x, Float:y, Float:z)
{
	for (new i = 0; i < MAX_CARPICK; i ++) if (!carpickData[i][carpickExists])
	{
	    carpickData[i][carpickExists] = true;
	    carpickData[i][carpickPosX] = x;
	    carpickData[i][carpickPosY] = y;
	    carpickData[i][carpickPosZ] = z;

	    mysql_tquery(g_SQL, "INSERT INTO `carpick` (`carpickID`) VALUES(0)", "CarpickCreate", "d", i);
		Carkeep_Refresh(i);
		return i;
	}
	return -1;
}

Carkeep_Create(Float:x, Float:y, Float:z)
{
	for (new i = 0; i < MAX_CARKEEP; i ++) if (!carkeepData[i][carkeepExists])
	{
	    carkeepData[i][carkeepExists] = true;
	    carkeepData[i][carkeepPosX] = x;
	    carkeepData[i][carkeepPosY] = y;
	    carkeepData[i][carkeepPosZ] = z;

	    mysql_tquery(g_SQL, "INSERT INTO `carkeep` (`carkeepID`) VALUES(0)", "CarkeepCreate", "d", i);
		Carkeep_Refresh(i);
		return i;
	}
	return -1;
}

Carpick_Save(pumpid)
{
	static
	    query[220];

	mysql_format(g_SQL, query, sizeof(query), "UPDATE `carpick` SET `carpickX` = '%.4f', `carpickY` = '%.4f', `carpickZ` = '%.4f' WHERE `carpickID` = '%d'",
	    carpickData[pumpid][carpickPosX],
	    carpickData[pumpid][carpickPosY],
	    carpickData[pumpid][carpickPosZ],
	    carpickData[pumpid][carpickID]
	);
	return mysql_tquery(g_SQL, query);
}

Carkeep_Save(pumpid)
{
	static
	    query[220];

	mysql_format(g_SQL, query, sizeof(query), "UPDATE `carkeep` SET `carkeepX` = '%.4f', `carkeepY` = '%.4f', `carkeepZ` = '%.4f' WHERE `carkeepID` = '%d'",
	    carkeepData[pumpid][carkeepPosX],
	    carkeepData[pumpid][carkeepPosY],
	    carkeepData[pumpid][carkeepPosZ],
	    carkeepData[pumpid][carkeepID]
	);
	return mysql_tquery(g_SQL, query);
}

Carpick_Refresh(pumpid)
{
	if (pumpid != -1 && carpickData[pumpid][carpickExists])
	{
		if (IsValidDynamicPickup(carpickData[pumpid][carpickPickup]))
		    DestroyDynamicPickup(carpickData[pumpid][carpickPickup]);

		if (IsValidDynamic3DTextLabel(carpickData[pumpid][carpickText3D]))
		    DestroyDynamic3DTextLabel(carpickData[pumpid][carpickText3D]);

		carpickData[pumpid][carpickPickup] = CreateDynamicPickup(19134, 23, carpickData[pumpid][carpickPosX], carpickData[pumpid][carpickPosY], carpickData[pumpid][carpickPosZ]-1);
  		carpickData[pumpid][carpickText3D] = CreateDynamic3DTextLabel("{F11E54}(: CARPICK :)\n{FFFFFF}[ ใช้ 'H' เพื่อเบิกรถ]", COLOR_GREEN, carpickData[pumpid][carpickPosX], carpickData[pumpid][carpickPosY], carpickData[pumpid][carpickPosZ], 5.0, INVALID_VEHICLE_ID, INVALID_PLAYER_ID, 0);
	}
	return 1;
}

Carkeep_Refresh(pumpid)
{
	if (pumpid != -1 && carkeepData[pumpid][carkeepExists])
	{
		if (IsValidDynamicPickup(carkeepData[pumpid][carkeepPickup]))
		    DestroyDynamicPickup(carkeepData[pumpid][carkeepPickup]);

		if (IsValidDynamic3DTextLabel(carkeepData[pumpid][carkeepText3D]))
		    DestroyDynamic3DTextLabel(carkeepData[pumpid][carkeepText3D]);

		carkeepData[pumpid][carkeepPickup] = CreateDynamicPickup(19134, 23, carkeepData[pumpid][carkeepPosX], carkeepData[pumpid][carkeepPosY], carkeepData[pumpid][carkeepPosZ]-1);
  		carkeepData[pumpid][carkeepText3D] = CreateDynamic3DTextLabel("{F11E54}(: CARPICK :)\n{FFFFFF}[ ใช้ 'H' เพื่อเบิกรถ]", COLOR_GREEN, carkeepData[pumpid][carkeepPosX], carkeepData[pumpid][carkeepPosY], carkeepData[pumpid][carkeepPosZ], 5.0, INVALID_VEHICLE_ID, INVALID_PLAYER_ID, 0);
	}
	return 1;
}

alias:MakeCarpick("วางเบิกรถ")
CMD:MakeCarpick(playerid, params[])
{
	static
	    id = -1,
		Float:x,
		Float:y,
		Float:z;

	GetPlayerPos(playerid, x, y, z);

    if (playerData[playerid][pAdmin] < 5)
	    return 1;

	if (GetPlayerInterior(playerid) != 0)
	    return 1;

	id = Carpick_Create(x, y, z);

	if (id == -1)
	    return SendClientMessage(playerid, COLOR_RED, "[CARPICK] จุดเรียกรถเต็มฐานข้อมูลแล้ว");

	SendClientMessageEx(playerid, COLOR_SERVER, "[CARPICK] สร้างจุดเบิกรถ ไอดี: %d", id);
	return 1;
}

alias:MakeCarkeep("วางเก็บรถ")
CMD:MakeCarkeep(playerid, params[])
{
	static
	    id = -1,
		Float:x,
		Float:y,
		Float:z;

	GetPlayerPos(playerid, x, y, z);

    if (playerData[playerid][pAdmin] < 5)
	    return 1;

	if (GetPlayerInterior(playerid) != 0)
	    return 1;

	id = Carkeep_Create(x, y, z);

	if (id == -1)
	    return SendClientMessage(playerid, COLOR_RED, "[CARPICK] จุดเก็บรถเต็มฐานข้อมูลแล้ว");

	SendClientMessageEx(playerid, COLOR_SERVER, "[CARPICK] สร้างจุดเก็บรถ ไอดี: %d", id);
	return 1;
}

alias:DelCarpick("ลบเบิกรถ")
CMD:DelCarpick(playerid, params[])
{
	static
	    id = 0;

    if (playerData[playerid][pAdmin] < 5)
	    return 1;

	if (sscanf(params, "d", id))
	    return SendClientMessage(playerid, COLOR_WHITE, "[CARPICK] : /ลบเบิกรถ [ไอดี]");

	if ((id < 0 || id >= MAX_CARPICK) || !carpickData[id][carpickExists])
	    return SendClientMessage(playerid, COLOR_RED, "[CARPICK] ไม่มีจุดเบิกรถไอดีนี้");

	Carpick_Delete(id);
	SendClientMessageEx(playerid, COLOR_SERVER, "[CARPICK] ลบจุดเบิกรถ ไอดี %d", id);
	return 1;
}

alias:DelCarpkeep("ลบเก็บรถ")
CMD:DelCarkeep(playerid, params[])
{
	static
	    id = 0;

    if (playerData[playerid][pAdmin] < 5)
	    return 1;

	if (sscanf(params, "d", id))
	    return SendClientMessage(playerid, COLOR_WHITE, "[CARPICK] : /ลบเก็บรถ [ไอดี]");

	if ((id < 0 || id >= MAX_CARPICK) || !carpickData[id][carpickExists])
	    return SendClientMessage(playerid, COLOR_RED, "[CARPICK] ไม่มีจุดเก็บรถไอดีนี้");

	Carkeep_Delete(id);
	SendClientMessageEx(playerid, COLOR_SERVER, "[CARPICK] ลบจุดเก็บรถ ไอดี %d", id);
	return 1;
}


