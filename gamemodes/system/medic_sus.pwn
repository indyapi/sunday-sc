#include	<YSI_Coding\y_hooks>

#define 	MAX_MEDICAL 			(200)
enum MEDICAL_DATA {
	medicalID,
	medicalExists,
	Float:medicalPosX,
	Float:medicalPosY,
	Float:medicalPosZ,
	medicalInterior,
	medicalWorld,
	medicalType,
	Text3D:medicalText3D,
	medicalPickup
};
new medicalData[MAX_MEDICALS][MEDICAL_DATA];

forward medical_Load();
public medical_Load()
{
	static
	    rows;

	cache_get_row_count(rows);

	for (new i = 0; i < rows; i ++) if (i < MAX_MEDICALS)
	{
	    medicalData[i][medicalExists] = true;

	    cache_get_value_name_int(i, "medicalID", medicalData[i][medicalID]);
	    cache_get_value_name_float(i, "medicalX", medicalData[i][medicalPosX]);
	    cache_get_value_name_float(i, "medicalY", medicalData[i][medicalPosY]);
	    cache_get_value_name_float(i, "medicalZ", medicalData[i][medicalPosZ]);
	    cache_get_value_name_int(i, "medicalInterior", medicalData[i][medicalInterior]);
	    cache_get_value_name_int(i, "medicalWorld", medicalData[i][medicalWorld]);
		cache_get_value_name_int(i, "medicalType", medicalData[i][medicalType]);

	    medical_Refresh(i);
	}
	printf("[SERVER]: %d medicals were loaded from \"%s\" database...", rows, MYSQL_DATABASE);
	return 1;
}

forward OnmedicalCreated(medicalid);
public OnmedicalCreated(medicalid)
{
	if (medicalid == -1 || !medicalData[medicalid][medicalExists])
	    return 0;

	medicalData[medicalid][medicalID] = cache_insert_id();
	medical_Save(medicalid);

	return 1;
}

medical_Nearest(playerid)
{
    for (new i = 0; i != MAX_MEDICALS; i ++) if (medicalData[i][medicalExists] && IsPlayerInRangeOfPoint(playerid, 4.0, medicalData[i][medicalPosX], medicalData[i][medicalPosY], medicalData[i][medicalPosZ]))
	{
		if (GetPlayerInterior(playerid) == medicalData[i][medicalInterior] && GetPlayerVirtualWorld(playerid) == medicalData[i][medicalWorld])
			return i;
	}
	return -1;
}

medical_Delete(medicalid)
{
	if (medicalid != -1 && medicalData[medicalid][medicalExists])
	{
	    static
	        string[64];

        if (IsValidDynamicPickup(medicalData[medicalid][medicalPickup]))
		    DestroyDynamicPickup(medicalData[medicalid][medicalPickup]);

		if (IsValidDynamic3DTextLabel(medicalData[medicalid][medicalText3D]))
		    DestroyDynamic3DTextLabel(medicalData[medicalid][medicalText3D]);

		mysql_format(g_SQL, string, sizeof(string), "DELETE FROM `medicals` WHERE `medicalID` = '%d'", medicalData[medicalid][medicalID]);
		mysql_tquery(g_SQL, string);

		medicalData[medicalid][medicalExists] = false;
		medicalData[medicalid][medicalID] = 0;
	}
	return 1;
}

medical_Create(Float:x, Float:y, Float:z, interior, world, type)
{
	for (new i = 0; i < MAX_MEDICALS; i ++) if (!medicalData[i][medicalExists])
	{
	    medicalData[i][medicalExists] = true;
	    medicalData[i][medicalPosX] = x;
	    medicalData[i][medicalPosY] = y;
	    medicalData[i][medicalPosZ] = z;
	    medicalData[i][medicalInterior] = interior;
	    medicalData[i][medicalWorld] = world;
		medicalData[i][medicalType] = type;

	    mysql_tquery(g_SQL, "INSERT INTO `medicals` (`medicalInterior`) VALUES(0)", "OnmedicalCreated", "d", i);
		medical_Refresh(i);
		return i;
	}
	return -1;
}

medical_Save(medicalid)
{
	static
	    query[280];

	mysql_format(g_SQL, query, sizeof(query), "UPDATE `medicals` SET `medicalX` = '%.4f', `medicalY` = '%.4f', `medicalZ` = '%.4f', `medicalInterior` = '%d', `medicalWorld` = '%d' , `medicalType` = '%d' WHERE `medicalID` = '%d'",
	    medicalData[medicalid][medicalPosX],
	    medicalData[medicalid][medicalPosY],
	    medicalData[medicalid][medicalPosZ],
	    medicalData[medicalid][medicalInterior],
	    medicalData[medicalid][medicalWorld],
		medicalData[medicalid][medicalType],
	    medicalData[medicalid][medicalID]
	);
	return mysql_tquery(g_SQL, query);
}

medical_Refresh(medicalid)
{
	if (medicalid != -1 && medicalData[medicalid][medicalExists])
	{
		if (IsValidDynamicPickup(medicalData[medicalid][medicalPickup]))
		    DestroyDynamicPickup(medicalData[medicalid][medicalPickup]);

		if (IsValidDynamic3DTextLabel(medicalData[medicalid][medicalText3D]))
		    DestroyDynamic3DTextLabel(medicalData[medicalid][medicalText3D]);

        if(medicalData[id][medicalType] == 1)
        {
            medicalData[medicalid][medicalPickup] = CreateDynamicPickup(19134, 23, medicalData[medicalid][medicalPosX], medicalData[medicalid][medicalPosY], medicalData[medicalid][medicalPosZ], medicalData[medicalid][medicalWorld], medicalData[medicalid][medicalInterior]);
  		    medicalData[medicalid][medicalText3D] = CreateDynamic3DTextLabel("(: เตียงรักษา :)\n[ ใช้ 'N' เพื่อนอน ]", COLOR_GREEN, medicalData[medicalid][medicalPosX], medicalData[medicalid][medicalPosY], medicalData[medicalid][medicalPosZ], 5.0, INVALID_VEHICLE_ID, INVALID_PLAYER_ID, 0, medicalData[medicalid][medicalWorld], medicalData[medicalid][medicalInterior]);
        }
        else if(medicalData[id][medicalType] == 2)
        {
            medicalData[medicalid][medicalPickup] = CreateDynamicPickup(19133, 23, medicalData[medicalid][medicalPosX], medicalData[medicalid][medicalPosY], medicalData[medicalid][medicalPosZ], medicalData[medicalid][medicalWorld], medicalData[medicalid][medicalInterior]);
  		    medicalData[medicalid][medicalText3D] = CreateDynamic3DTextLabel("(: เตียงนอน :)\n[ ใช้ 'N' เพื่อนอน ]", COLOR_GREEN, medicalData[medicalid][medicalPosX], medicalData[medicalid][medicalPosY], medicalData[medicalid][medicalPosZ], 5.0, INVALID_VEHICLE_ID, INVALID_PLAYER_ID, 0, medicalData[medicalid][medicalWorld], medicalData[medicalid][medicalInterior]);
        }
	}
	return 1;
}

alias:createmedical("วางเตียง")
CMD:createmedical(playerid, params[])
{
	static
		type;

    if (playerData[playerid][pAdmin] < 6)
	    return 1;

	if (sscanf(params, "d", type))
		return SendClientMessage(playerid, COLOR_WHITE, "[medical]: /วางเตียง [Type] 1 = เตียงรักษา 2 = เตียงนอน");

	static
	    id = -1,
		Float:x,
		Float:y,
		Float:z;

	GetPlayerPos(playerid, x, y, z);

    if (type < 1 || type > 2)
	    return SendClientMessage(playerid, COLOR_RED, "[medical] {FFFFFF} [Type] 1 = เตียงรักษา 2 = เตียงนอน");

	id = medical_Create(x, y, z, GetPlayerInterior(playerid), GetPlayerVirtualWorld(playerid), type);

	if (id == -1)
	    return SendClientMessage(playerid, COLOR_RED, "[medical] {FFFFFF}วางไม่ได้ เพราะฐานข้อมูลเตียงเต็ม");

	SendClientMessageEx(playerid, COLOR_SERVER, "[medical] สร้างเตียง ไอดี: %d", id);
	return 1;
}

alias:deletemedical("ลบเตียง")
CMD:deletemedical(playerid, params[])
{
	static
	    id = 0;

    if (playerData[playerid][pAdmin] < 6)
	    return 1;

	if (sscanf(params, "d", id))
	    return SendClientMessage(playerid, COLOR_WHITE, "[medical]: /ลบเตียง [ID]");

	if ((id < 0 || id >= MAX_MEDICALS) || !medicalData[id][medicalExists])
	    return SendClientMessage(playerid, COLOR_RED, "[medical] {FFFFFF}ไม่มีเตียงไอดีนี้");

	medical_Delete(id);
	SendClientMessageEx(playerid, COLOR_SERVER, "[medical] ลบเตียง ไอดี %d ออกแล้ว", id);
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (newkeys & KEY_YES)
	{
    	if (GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
		{
			if (medical_Nearest(playerid) != -1)
			{
				new pakid = medical_Nearest(playerid);

				if (medicalData[pakid][medicalType] == 1)
				{
					new pakid = medical_Nearest(playerid);
					
					if (playerData[playerid][pRunBar] == 1)
						return SendClientMessage(playerid, COLOR_RED, "[ ERROR! ] {FFFFFF}เตียงกำลังถูกใช้งาน");

					playerData[playerid][pRunBar] = 1;
					SetTimer("bed_heal", 50000, false);
					//TogglePlayerControllable( playerid, false );
					StartProgress(playerid, 500, 0, INVALID_OBJECT_ID);
					SetPlayerPos(playerid, medicalData[medicalid][medicalPosX], medicalData[medicalid][medicalPosY] ,medicalData[medicalid][medicalPosZ]+0.5);
					ApplyAnimation(playerid, "CRACK",  "crckidle2", 4.1, 0, 0, 0, 1, 0, 1);
				}
				return 1;
			}

			if (medical_Nearest(playerid) != -1)
			{
				new pakid = medical_Nearest(playerid);

				if (medicalData[pakid][medicalType] == 1)
				{
					new pakid = medical_Nearest(playerid);
					
					if (playerData[playerid][pRunBar] == 1)
						return SendClientMessage(playerid, COLOR_RED, "[ ERROR! ] {FFFFFF}เตียงกำลังถูกใช้งาน");

					playerData[playerid][pRunBar] = 1;
					SetTimer("bed_sleep", 50000, false);
					//TogglePlayerControllable( playerid, false );
					StartProgress(playerid, 500, 0, INVALID_OBJECT_ID);
					SetPlayerPos(playerid, medicalData[medicalid][medicalPosX], medicalData[medicalid][medicalPosY] ,medicalData[medicalid][medicalPosZ]+0.5);
					ApplyAnimation(playerid, "CRACK",  "crckidle2", 4.1, 0, 0, 0, 1, 0, 1);
				}
			}
		}
	}
}

forward bed_heal(playerid);
public bed_heal(playerid)
{
	ClearAnimations(playerid);
    TogglePlayerControllable(playerid, true );
	playerData[playerid][pRunBar] = 0;
	
	playerData[playerid][pHealth] = 100;
	GivePlayerMoneyEx(playerid, -500);
	SCM(playerid, COLOR_GREEN, "[BED]: คุณหายดีแล้ว | ค่าใช้จ่าย -$500");
	return 1;
}

forward bed_sleep(playerid);
public bed_sleep(playerid)
{
	ClearAnimations(playerid);
    TogglePlayerControllable(playerid, true );
	playerData[playerid][pRunBar] = 0;
	
	//playerData[playerid][pStress] = 100;
	GivePlayerMoneyEx(playerid, -500);
	SCM(playerid, COLOR_GREEN, "[BED]: คุณพักผ่อนเพียงพอแล้ว | ค่าใช้จ่าย -$500");
	return 1;
}



