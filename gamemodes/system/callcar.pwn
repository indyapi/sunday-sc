#include	<YSI_Coding\y_hooks>

#define 	MAX_SUN_MINE 			(100)
enum SUN_MINE_INFO {
	s_mineID,
	s_mineExists,
	Float:s_minePosX,
	Float:s_minePosY,
	Float:s_minePosZ,
	Float:s_minePosA,
	Text3D:s_mine3D,
	s_mineIPickup
};
new s_mineInfo[MAX_SUN_MINE][SUN_MINE_INFO];

forward Mine_Load();
public Mine_Load()
{
	static
	    rows;

	cache_get_row_count(rows);

	for (new i = 0; i < rows; i ++) if (i < MAX_SUN_MINE)
	{
	    s_mineInfo[i][s_mineExists] = true;

	    cache_get_value_name_int(i, "s_mineID", s_mineInfo[i][s_mineID]);
	    cache_get_value_name_float(i, "s_minePosX", s_mineInfo[i][s_minePosX]);
	    cache_get_value_name_float(i, "s_minePosY", s_mineInfo[i][s_minePosY]);
	    cache_get_value_name_float(i, "s_minePosZ", s_mineInfo[i][s_minePosZ]);
		cache_get_value_name_float(i, "s_minePosA", s_mineInfo[i][s_minePosA]);

	    s_mineI_Refresh(i);
	}
	printf("[SERVER]: %i s_mineI were loaded from \"%s\" database...", rows, MYSQL_DATABASE);
	return 1;
}

forward OnMineCreated(s_mineID);
public OnMineCreated(s_mineID)
{
	if (s_mineID == -1 || !s_mineInfo[s_mineID][s_mineExists])
	    return 0;

	s_mineInfo[s_mineID][s_mineID] = cache_insert_id();
	s_mineI_Save(s_mineID);

	return 1;
}

s_mineI_Nearest(playerid)
{
    for (new i = 0; i != MAX_SUN_MINE; i ++) if (s_mineInfo[i][s_mineExists] && IsPlayerInRangeOfPoint(playerid, 4.0, s_mineInfo[i][s_minePosX], s_mineInfo[i][s_minePosY], s_mineInfo[i][s_minePosZ]))
	{
		return i;
	}
	return -1;
}

s_mineI_Delete(pumpid)
{
	if (pumpid != -1 && s_mineInfo[pumpid][s_mineExists])
	{
	    static
	        string[64];

        if (IsValidDynamicPickup(s_mineInfo[pumpid][s_mineIPickup]))
		    DestroyDynamicPickup(s_mineInfo[pumpid][s_mineIPickup]);

		if (IsValidDynamic3DTextLabel(s_mineInfo[pumpid][s_mine3D]))
		    DestroyDynamic3DTextLabel(s_mineInfo[pumpid][s_mine3D]);

		mysql_format(g_SQL, string, sizeof(string), "DELETE FROM `s_mineI` WHERE `s_mineID` = '%d'", s_mineInfo[pumpid][s_mineID]);
		mysql_tquery(g_SQL, string);

		s_mineInfo[pumpid][s_mineExists] = false;
		s_mineInfo[pumpid][s_mineID] = 0;
	}
	return 1;
}

s_mineI_Create(Float:x, Float:y, Float:z)
{
	for (new i = 0; i < MAX_SUN_MINE; i ++) if (!s_mineInfo[i][s_mineExists])
	{
	    s_mineInfo[i][s_mineExists] = true;
	    s_mineInfo[i][s_minePosX] = x;
	    s_mineInfo[i][s_minePosY] = y;
	    s_mineInfo[i][s_minePosZ] = z;

	    mysql_tquery(g_SQL, "INSERT INTO `s_mineI` (`s_mineID`) VALUES(0)", "OnMineCreated", "d", i);
		s_mineI_Refresh(i);
		return i;
	}
	return -1;
}

s_mineI_Save(pumpid)
{
	static
	    query[220];

	mysql_format(g_SQL, query, sizeof(query), "UPDATE `s_mineI` SET `s_minePosX` = '%.4f', `s_minePosY` = '%.4f', `s_minePosZ` = '%.4f' WHERE `s_mineID` = '%d'",
	    s_mineInfo[pumpid][s_minePosX],
	    s_mineInfo[pumpid][s_minePosY],
	    s_mineInfo[pumpid][s_minePosZ],
	    s_mineInfo[pumpid][s_mineID]
	);
	return mysql_tquery(g_SQL, query);
}

s_mineI_Refresh(pumpid)
{
	if (pumpid != -1 && s_mineInfo[pumpid][s_mineExists])
	{
		if (IsValidDynamicPickup(s_mineInfo[pumpid][s_mineIPickup]))
		    DestroyDynamicPickup(s_mineInfo[pumpid][s_mineIPickup]);

		if (IsValidDynamic3DTextLabel(s_mineInfo[pumpid][s_mine3D]))
		    DestroyDynamic3DTextLabel(s_mineInfo[pumpid][s_mine3D]);

		s_mineInfo[pumpid][s_mineIPickup] = CreateDynamicPickup(19607, 23, s_mineInfo[pumpid][s_minePosX], s_mineInfo[pumpid][s_minePosY], s_mineInfo[pumpid][s_minePosZ]-1);
  		s_mineInfo[pumpid][s_mine3D] = CreateDynamic3DTextLabel("{1FFF00}[JOBS : เหมืองแร่]\n{FFFFFF}[ ใช้ 'N' สำหรับขุดหาแร่ ]\n[ ใช้ 'H' เพื่อ เปิด/ปิด ออโต้ฟาร์ม]", COLOR_GREEN, s_mineInfo[pumpid][s_minePosX], s_mineInfo[pumpid][s_minePosY], s_mineInfo[pumpid][s_minePosZ], 5.0, INVALID_VEHICLE_ID, INVALID_PLAYER_ID, 0);
	}
	return 1;
}

// --> การาจเรียกรถ
CMD:createmine(playerid, params[])
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

	id = s_mineI_Create(x, y, z);

	if (id == -1)
	    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ความจุของการาจเรียกรถในฐานข้อมูลเต็มแล้ว ไม่สามารถสร้างได้อีก (ติดต่อผู้พัฒนา)");

	SendClientMessageEx(playerid, COLOR_SERVER, "คุณได้สร้างจุดงานแร่ขึ้นมาใหม่ ไอดี: %d", id);
	return 1;
}

CMD:deletemine(playerid, params[])
{
	static
	    id = 0;

    if (playerData[playerid][pAdmin] < 5)
	    return 1;

	if (sscanf(params, "d", id))
	    return SendClientMessage(playerid, COLOR_WHITE, "การใช้งาน : /deletemine [ไอดี]");

	if ((id < 0 || id >= MAX_SUN_MINE) || !s_mineInfo[id][s_mineExists])
	    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ไม่มีไอดีจุดงานแร่นี้อยู่ในฐานข้อมูล");

	s_mineI_Delete(id);
	SendClientMessageEx(playerid, COLOR_SERVER, "คุณได้ลบจุดงานแร่ไอดี %d ออกสำเร็จ", id);
	return 1;
}


