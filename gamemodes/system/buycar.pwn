#include	<YSI_Coding\y_hooks>

#define 	MAX_BUYCAR 			(7777)
enum BUYCAR_DATA {
	buycarID,
	buycarExists,
	Float:buycarPosX,
	Float:buycarPosY,
	Float:buycarPosZ,
	Text3D:buycarText3D,
	buycarPickup
};
new buycarData[MAX_BUYCAR][BUYCAR_DATA];

forward buycar_Load();
public buycar_Load()
{
	static
	    rows;

	cache_get_row_count(rows);

	for (new i = 0; i < rows; i ++) if (i < MAX_BUYCAR)
	{
	    buycarData[i][buycarExists] = true;

	    cache_get_value_name_int(i, "buycarID", buycarData[i][buycarID]);
	    cache_get_value_name_float(i, "buycarX", buycarData[i][buycarPosX]);
	    cache_get_value_name_float(i, "buycarY", buycarData[i][buycarPosY]);
	    cache_get_value_name_float(i, "buycarZ", buycarData[i][buycarPosZ]);

	    buycar_Refresh(i);
	}
	printf("[SERVER]: %i buycar were loaded from \"%s\" database...", rows, MYSQL_DATABASE);
	return 1;
}

forward OnbuycarCreated(buycarid);
public OnbuycarCreated(buycarid)
{
	if (buycarid == -1 || !buycarData[buycarid][buycarExists])
	    return 0;

	buycarData[buycarid][buycarID] = cache_insert_id();
	buycar_Save(buycarid);

	return 1;
}

buycar_Nearest(playerid)
{
    for (new i = 0; i != MAX_BUYCAR; i ++) if (buycarData[i][buycarExists] && IsPlayerInRangeOfPoint(playerid, 4.0, buycarData[i][buycarPosX], buycarData[i][buycarPosY], buycarData[i][buycarPosZ]))
	{
		return i;
	}
	return -1;
}

buycar_Delete(pumpid)
{
	if (pumpid != -1 && buycarData[pumpid][buycarExists])
	{
	    static
	        string[64];

        if (IsValidDynamicPickup(buycarData[pumpid][buycarPickup]))
		    DestroyDynamicPickup(buycarData[pumpid][buycarPickup]);

		if (IsValidDynamic3DTextLabel(buycarData[pumpid][buycarText3D]))
		    DestroyDynamic3DTextLabel(buycarData[pumpid][buycarText3D]);

		mysql_format(g_SQL, string, sizeof(string), "DELETE FROM `buycar` WHERE `buycarID` = '%d'", buycarData[pumpid][buycarID]);
		mysql_tquery(g_SQL, string);

		buycarData[pumpid][buycarExists] = false;
		buycarData[pumpid][buycarID] = 0;
	}
	return 1;
}

buycar_Create(Float:x, Float:y, Float:z)
{
	for (new i = 0; i < MAX_BUYCAR; i ++) if (!buycarData[i][buycarExists])
	{
	    buycarData[i][buycarExists] = true;
	    buycarData[i][buycarPosX] = x;
	    buycarData[i][buycarPosY] = y;
	    buycarData[i][buycarPosZ] = z;

	    mysql_tquery(g_SQL, "INSERT INTO `buycar` (`buycarID`) VALUES(0)", "OnbuycarCreated", "d", i);
		buycar_Refresh(i);
		return i;
	}
	return -1;
}

buycar_Save(pumpid)
{
	static
	    query[220];

	mysql_format(g_SQL, query, sizeof(query), "UPDATE `buycar` SET `buycarX` = '%.4f', `buycarY` = '%.4f', `buycarZ` = '%.4f' WHERE `buycarID` = '%d'",
	    buycarData[pumpid][buycarPosX],
	    buycarData[pumpid][buycarPosY],
	    buycarData[pumpid][buycarPosZ],
	    buycarData[pumpid][buycarID]
	);
	return mysql_tquery(g_SQL, query);
}

buycar_Refresh(pumpid)
{
	if (pumpid != -1 && buycarData[pumpid][buycarExists])
	{
		if (IsValidDynamicPickup(buycarData[pumpid][buycarPickup]))
		    DestroyDynamicPickup(buycarData[pumpid][buycarPickup]);

		if (IsValidDynamic3DTextLabel(buycarData[pumpid][buycarText3D]))
		    DestroyDynamic3DTextLabel(buycarData[pumpid][buycarText3D]);

		buycarData[pumpid][buycarPickup] = CreateDynamicPickup(19255, 23, buycarData[pumpid][buycarPosX], buycarData[pumpid][buycarPosY], buycarData[pumpid][buycarPosZ]-1);
  		buycarData[pumpid][buycarText3D] = CreateDynamic3DTextLabel("{F11E54}[CAR SHOP]\n{FFFFFF}[ ใช้ 'N' เพื่อเลือกซื้อรถ]", COLOR_GREEN, buycarData[pumpid][buycarPosX], buycarData[pumpid][buycarPosY], buycarData[pumpid][buycarPosZ], 5.0, INVALID_VEHICLE_ID, INVALID_PLAYER_ID, 0);
	}
	return 1;
}

// --> การาจเก็บรถ
CMD:createbuycar(playerid, params[])
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

	id = buycar_Create(x, y, z);

	if (id == -1)
	    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ความจุของการาจเรียกรถในฐานข้อมูลเต็มแล้ว ไม่สามารถสร้างได้อีก (ติดต่อผู้พัฒนา)");

	SendClientMessageEx(playerid, COLOR_SERVER, "คุณได้สร้างการาจเรีกยรถขึ้นมาใหม่ ไอดี: %d", id);
	return 1;
}

CMD:deletebuycar(playerid, params[])
{
	static
	    id = 0;

    if (playerData[playerid][pAdmin] < 5)
	    return 1;

	if (sscanf(params, "d", id))
	    return SendClientMessage(playerid, COLOR_WHITE, "การใช้งาน : /deletebuycar [ไอดี]");

	if ((id < 0 || id >= MAX_BUYCAR) || !buycarData[id][buycarExists])
	    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ไม่มีไอดีการาจเรียกรถนี้อยู่ในฐานข้อมูล");

	buycar_Delete(id);
	SendClientMessageEx(playerid, COLOR_SERVER, "คุณได้ลบปั้มการาจเรียกรถไอดี %d ออกสำเร็จ", id);
	return 1;
}


