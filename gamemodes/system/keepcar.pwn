#include	<YSI_Coding\y_hooks>

#define 	MAX_KEEPCAR 			(70)
enum KEEPCAR_DATA {
	keepcarID,
	keepcarExists,
	Float:keepcarPosX,
	Float:keepcarPosY,
	Float:keepcarPosZ,
	Text3D:keepcarText3D,
	keepcarPickup
};
new keepcarData[MAX_KEEPCAR][KEEPCAR_DATA];

forward keepcar_Load();
public keepcar_Load()
{
	static
	    rows;

	cache_get_row_count(rows);

	for (new i = 0; i < rows; i ++) if (i < MAX_KEEPCAR)
	{
	    keepcarData[i][keepcarExists] = true;

	    cache_get_value_name_int(i, "keepcarID", keepcarData[i][keepcarID]);
	    cache_get_value_name_float(i, "keepcarX", keepcarData[i][keepcarPosX]);
	    cache_get_value_name_float(i, "keepcarY", keepcarData[i][keepcarPosY]);
	    cache_get_value_name_float(i, "keepcarZ", keepcarData[i][keepcarPosZ]);

	    keepcar_Refresh(i);
	}
	printf("[SERVER]: %i keepcar were loaded from \"%s\" database...", rows, MYSQL_DATABASE);
	return 1;
}

forward OnkeepcarCreated(keepcarid);
public OnkeepcarCreated(keepcarid)
{
	if (keepcarid == -1 || !keepcarData[keepcarid][keepcarExists])
	    return 0;

	keepcarData[keepcarid][keepcarID] = cache_insert_id();
	keepcar_Save(keepcarid);

	return 1;
}

keepcar_Nearest(playerid)
{
    for (new i = 0; i != MAX_KEEPCAR; i ++) if (keepcarData[i][keepcarExists] && IsPlayerInRangeOfPoint(playerid, 4.0, keepcarData[i][keepcarPosX], keepcarData[i][keepcarPosY], keepcarData[i][keepcarPosZ]))
	{
		return i;
	}
	return -1;
}

keepcar_Delete(pumpid)
{
	if (pumpid != -1 && keepcarData[pumpid][keepcarExists])
	{
	    static
	        string[64];

        if (IsValidDynamicPickup(keepcarData[pumpid][keepcarPickup]))
		    DestroyDynamicPickup(keepcarData[pumpid][keepcarPickup]);

		if (IsValidDynamic3DTextLabel(keepcarData[pumpid][keepcarText3D]))
		    DestroyDynamic3DTextLabel(keepcarData[pumpid][keepcarText3D]);

		mysql_format(g_SQL, string, sizeof(string), "DELETE FROM `keepcar` WHERE `keepcarID` = '%d'", keepcarData[pumpid][keepcarID]);
		mysql_tquery(g_SQL, string);

		keepcarData[pumpid][keepcarExists] = false;
		keepcarData[pumpid][keepcarID] = 0;
	}
	return 1;
}

keepcar_Create(Float:x, Float:y, Float:z)
{
	for (new i = 0; i < MAX_KEEPCAR; i ++) if (!keepcarData[i][keepcarExists])
	{
	    keepcarData[i][keepcarExists] = true;
	    keepcarData[i][keepcarPosX] = x;
	    keepcarData[i][keepcarPosY] = y;
	    keepcarData[i][keepcarPosZ] = z;

	    mysql_tquery(g_SQL, "INSERT INTO `keepcar` (`keepcarID`) VALUES(0)", "OnkeepcarCreated", "d", i);
		keepcar_Refresh(i);
		return i;
	}
	return -1;
}

keepcar_Save(pumpid)
{
	static
	    query[220];

	mysql_format(g_SQL, query, sizeof(query), "UPDATE `keepcar` SET `keepcarX` = '%.4f', `keepcarY` = '%.4f', `keepcarZ` = '%.4f' WHERE `keepcarID` = '%d'",
	    keepcarData[pumpid][keepcarPosX],
	    keepcarData[pumpid][keepcarPosY],
	    keepcarData[pumpid][keepcarPosZ],
	    keepcarData[pumpid][keepcarID]
	);
	return mysql_tquery(g_SQL, query);
}

keepcar_Refresh(pumpid)
{
	if (pumpid != -1 && keepcarData[pumpid][keepcarExists])
	{
		if (IsValidDynamicPickup(keepcarData[pumpid][keepcarPickup]))
		    DestroyDynamicPickup(keepcarData[pumpid][keepcarPickup]);

		if (IsValidDynamic3DTextLabel(keepcarData[pumpid][keepcarText3D]))
		    DestroyDynamic3DTextLabel(keepcarData[pumpid][keepcarText3D]);

		keepcarData[pumpid][keepcarPickup] = CreateDynamicPickup(19605, 23, keepcarData[pumpid][keepcarPosX], keepcarData[pumpid][keepcarPosY], keepcarData[pumpid][keepcarPosZ]-1);
  		keepcarData[pumpid][keepcarText3D] = CreateDynamic3DTextLabel("{F11E54}[Garage]\n{FFFFFF}[ ใช้ 'Y' สำหรับเก็บรถ]", COLOR_GREEN, keepcarData[pumpid][keepcarPosX], keepcarData[pumpid][keepcarPosY], keepcarData[pumpid][keepcarPosZ], 5.0, INVALID_VEHICLE_ID, INVALID_PLAYER_ID, 0);
	}
	return 1;
}

// --> การาจเก็บรถ
CMD:createkeepcar(playerid, params[])
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

	id = keepcar_Create(x, y, z);

	if (id == -1)
	    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ความจุของการาจเรียกรถในฐานข้อมูลเต็มแล้ว ไม่สามารถสร้างได้อีก (ติดต่อผู้พัฒนา)");

	SendClientMessageEx(playerid, COLOR_SERVER, "คุณได้สร้างการาจเรีกยรถขึ้นมาใหม่ ไอดี: %d", id);
	return 1;
}

CMD:deletekeepcar(playerid, params[])
{
	static
	    id = 0;

    if (playerData[playerid][pAdmin] < 5)
	    return 1;

	if (sscanf(params, "d", id))
	    return SendClientMessage(playerid, COLOR_WHITE, "การใช้งาน : /deletekeepcar [ไอดี]");

	if ((id < 0 || id >= MAX_KEEPCAR) || !keepcarData[id][keepcarExists])
	    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ไม่มีไอดีการาจเรียกรถนี้อยู่ในฐานข้อมูล");

	keepcar_Delete(id);
	SendClientMessageEx(playerid, COLOR_SERVER, "คุณได้ลบปั้มการาจเรียกรถไอดี %d ออกสำเร็จ", id);
	return 1;
}


