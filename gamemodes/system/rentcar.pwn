#include	<YSI_Coding\y_hooks>

#define 	MAX_RENTCAR 			(100)
enum RENTCAR_DATA {
	rentcarID,
	rentcarExists,
	Float:rentcarPosX,
	Float:rentcarPosY,
	Float:rentcarPosZ,
	Text3D:rentcarText3D,
	rentcarPickup
};
new rentcarData[MAX_RENTCAR][RENTCAR_DATA];

forward rentcar_Load();
public rentcar_Load()
{
	static
	    rows;

	cache_get_row_count(rows);

	for (new i = 0; i < rows; i ++) if (i < MAX_RENTCAR)
	{
	    rentcarData[i][rentcarExists] = true;

	    cache_get_value_name_int(i, "rentcarID", rentcarData[i][rentcarID]);
	    cache_get_value_name_float(i, "rentcarX", rentcarData[i][rentcarPosX]);
	    cache_get_value_name_float(i, "rentcarY", rentcarData[i][rentcarPosY]);
	    cache_get_value_name_float(i, "rentcarZ", rentcarData[i][rentcarPosZ]);

	    rentcar_Refresh(i);
	}
	printf("[SERVER]: %i rentcar were loaded from \"%s\" database...", rows, MYSQL_DATABASE);
	return 1;
}

forward OnrentcarCreated(rentcarid);
public OnrentcarCreated(rentcarid)
{
	if (rentcarid == -1 || !rentcarData[rentcarid][rentcarExists])
	    return 0;

	rentcarData[rentcarid][rentcarID] = cache_insert_id();
	rentcar_Save(rentcarid);

	return 1;
}

rentcar_Nearest(playerid)
{
    for (new i = 0; i != MAX_RENTCAR; i ++) if (rentcarData[i][rentcarExists] && IsPlayerInRangeOfPoint(playerid, 4.0, rentcarData[i][rentcarPosX], rentcarData[i][rentcarPosY], rentcarData[i][rentcarPosZ]))
	{
		return i;
	}
	return -1;
}

rentcar_Delete(pumpid)
{
	if (pumpid != -1 && rentcarData[pumpid][rentcarExists])
	{
	    static
	        string[64];

        if (IsValidDynamicPickup(rentcarData[pumpid][rentcarPickup]))
		    DestroyDynamicPickup(rentcarData[pumpid][rentcarPickup]);

		if (IsValidDynamic3DTextLabel(rentcarData[pumpid][rentcarText3D]))
		    DestroyDynamic3DTextLabel(rentcarData[pumpid][rentcarText3D]);

		mysql_format(g_SQL, string, sizeof(string), "DELETE FROM `rentcar` WHERE `rentcarID` = '%d'", rentcarData[pumpid][rentcarID]);
		mysql_tquery(g_SQL, string);

		rentcarData[pumpid][rentcarExists] = false;
		rentcarData[pumpid][rentcarID] = 0;
	}
	return 1;
}

rentcar_Create(Float:x, Float:y, Float:z)
{
	for (new i = 0; i < MAX_RENTCAR; i ++) if (!rentcarData[i][rentcarExists])
	{
	    rentcarData[i][rentcarExists] = true;
	    rentcarData[i][rentcarPosX] = x;
	    rentcarData[i][rentcarPosY] = y;
	    rentcarData[i][rentcarPosZ] = z;

	    mysql_tquery(g_SQL, "INSERT INTO `rentcar` (`rentcarID`) VALUES(0)", "OnrentcarCreated", "d", i);
		rentcar_Refresh(i);
		return i;
	}
	return -1;
}

rentcar_Save(pumpid)
{
	static
	    query[220];

	mysql_format(g_SQL, query, sizeof(query), "UPDATE `rentcar` SET `rentcarX` = '%.4f', `rentcarY` = '%.4f', `rentcarZ` = '%.4f' WHERE `rentcarID` = '%d'",
	    rentcarData[pumpid][rentcarPosX],
	    rentcarData[pumpid][rentcarPosY],
	    rentcarData[pumpid][rentcarPosZ],
	    rentcarData[pumpid][rentcarID]
	);
	return mysql_tquery(g_SQL, query);
}

rentcar_Refresh(pumpid)
{
	if (pumpid != -1 && rentcarData[pumpid][rentcarExists])
	{
		if (IsValidDynamicPickup(rentcarData[pumpid][rentcarPickup]))
		    DestroyDynamicPickup(rentcarData[pumpid][rentcarPickup]);

		if (IsValidDynamic3DTextLabel(rentcarData[pumpid][rentcarText3D]))
		    DestroyDynamic3DTextLabel(rentcarData[pumpid][rentcarText3D]);

		rentcarData[pumpid][rentcarPickup] = CreateDynamicPickup(19132, 23, rentcarData[pumpid][rentcarPosX], rentcarData[pumpid][rentcarPosY], rentcarData[pumpid][rentcarPosZ]);
  		rentcarData[pumpid][rentcarText3D] = CreateDynamic3DTextLabel("{F11E54}[Rent Bike]\n{FFFFFF}[ ใช้ 'N' สำหรับเช่าจักรยาน ]", COLOR_GREEN, rentcarData[pumpid][rentcarPosX], rentcarData[pumpid][rentcarPosY], rentcarData[pumpid][rentcarPosZ], 5.0, INVALID_VEHICLE_ID, INVALID_PLAYER_ID, 0);
	}
	return 1;
}

CMD:createrentcar(playerid, params[])
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

	id = rentcar_Create(x, y, z);

	if (id == -1)
	    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ความจุของการาจเช่ารถในฐานข้อมูลเต็มแล้ว ไม่สามารถสร้างได้อีก (ติดต่อผู้พัฒนา)");

	SendClientMessageEx(playerid, COLOR_SERVER, "คุณได้สร้างการาจเช่ารถขึ้นมาใหม่ ไอดี: %d", id);
	return 1;
}

CMD:deleterentcar(playerid, params[])
{
	static
	    id = 0;

    if (playerData[playerid][pAdmin] < 5)
	    return 1;

	if (sscanf(params, "d", id))
	    return SendClientMessage(playerid, COLOR_WHITE, "การใช้งาน : /deleterentcar [ไอดี]");

	if ((id < 0 || id >= MAX_RENTCAR) || !rentcarData[id][rentcarExists])
	    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ไม่มีไอดีการาจเช่ารถนี้อยู่ในฐานข้อมูล");

	rentcar_Delete(id);
	SendClientMessageEx(playerid, COLOR_SERVER, "คุณได้ลบการาจเช่ารถไอดี %d ออกสำเร็จ", id);
	return 1;
}


