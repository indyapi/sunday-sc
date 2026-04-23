/* 
/////////// เขียนขึ้นโดย ..... SUNDAY.dev
////// วันที่ 8/9/65
// ราคา 100บาท


ข้อตกลงการซื้อขายกับแอดซัน

 - ขอความร่วมมือ "ห้ามนำไปแจก" นะครับ
 - นำไปขายต่อได้ ราคาไม่จำกัด
 - ห้ามลบเครดิตผู้เขียนนะครับ
 - ห้ามเอาไปแจกแม้แต่เศษเสี้ยวเลยน้าา ไม่งั้นแอดจะแจกบ้างถ้ามีคนเอาไปแจก
   แจกระบบนี้แหละ ไม่ไปแจกระบบใหม่อะไร

 */

#include    <a_samp>
#include	<YSI_Coding\y_hooks>

#define 	MAX_SAFETY 			(20)

enum SAFETY_DATA {
	safetyID,
	safetyExists,
	Float:safetyPosX,
	Float:safetyPosY,
	Float:safetyPosZ,
	Text3D:safetyText3D,
	safetyPickup,
    safetyRMoney,
    safetyMoney,
    safetyKnuckles,
    safetyPoon,
    safetyHematite
};
new safetyData[MAX_SAFETY][SAFETY_DATA];

forward safety_Load();
public safety_Load()
{
	static
	    rows;

	cache_get_row_count(rows);

	for (new i = 0; i < rows; i ++) if (i < MAX_SAFETY)
	{
		new playerid;
		playerid = playerData[playerid][pID];
	    safetyData[i][safetyExists] = true;

	    cache_get_value_name_int(i, "safetyID", safetyData[i][safetyID]);
		cache_get_value_name_int(i, "ID", playerData[playerid][pID]);
	    cache_get_value_name_float(i, "safetyX", safetyData[i][safetyPosX]);
	    cache_get_value_name_float(i, "safetyY", safetyData[i][safetyPosY]);
	    cache_get_value_name_float(i, "safetyZ", safetyData[i][safetyPosZ]);
        cache_get_value_name_int(i, "safetyRMoney", safetyData[i][safetyRMoney]);
        cache_get_value_name_int(i, "safetyMoney", safetyData[i][safetyMoney]);
        cache_get_value_name_int(i, "safetyKnuckles", safetyData[i][safetyKnuckles]);
        cache_get_value_name_int(i, "safetyPoon", safetyData[i][safetyPoon]);
        cache_get_value_name_int(i, "safetyHematite", safetyData[i][safetyHematite]);

        /*
		playerData[playerid][pID],
		GetPlayerNameEx(playerid),
        safetyData[safetyid][safetyRMoney],
        safetyData[safetyid][safetyMoney],
        safetyData[safetyid][safetyKnuckles],
        safetyData[safetyid][safetyPoon],
        safetyData[safetyid][safetyHematite],
        */

	    safety_Refresh(i);
	}
	printf("[SERVER]: %i sunsafety were loaded from \"%s\" database...", rows, MYSQL_DATABASE);
	return 1;
}

forward OnsafetyCreated(safetyid);
public OnsafetyCreated(safetyid)
{
	if (safetyid == -1 || !safetyData[safetyid][safetyExists])
	    return 0;

	safetyData[safetyid][safetyID] = cache_insert_id();
	safety_Save(safetyid);

	return 1;
}

safety_Nearest(playerid)
{
    for (new i = 0; i != MAX_SAFETY; i ++) if (safetyData[i][safetyExists] && IsPlayerInRangeOfPoint(playerid, 4.0, safetyData[i][safetyPosX], safetyData[i][safetyPosY], safetyData[i][safetyPosZ]))
	{
		return i;
	}
	return -1;
}

safety_Delete(safetyid)
{
	if (safetyid != -1 && safetyData[safetyid][safetyExists])
	{
	    static
	        string[64];

        if (IsValidDynamicPickup(safetyData[safetyid][safetyPickup]))
		    DestroyDynamicPickup(safetyData[safetyid][safetyPickup]);

		if (IsValidDynamic3DTextLabel(safetyData[safetyid][safetyText3D]))
		    DestroyDynamic3DTextLabel(safetyData[safetyid][safetyText3D]);

		mysql_format(g_SQL, string, sizeof(string), "DELETE FROM `sunsafety` WHERE `safetyID` = '%d'", safetyData[safetyid][safetyID]);
		mysql_tquery(g_SQL, string);

		safetyData[safetyid][safetyExists] = false;
		safetyData[safetyid][safetyID] = 0;
	}
	return 1;
}

safety_Create(Float:x, Float:y, Float:z)
{
	for (new i = 0; i < MAX_SAFETY; i ++) if (!safetyData[i][safetyExists])
	{
	    safetyData[i][safetyExists] = true;
	    safetyData[i][safetyPosX] = x;
	    safetyData[i][safetyPosY] = y;
	    safetyData[i][safetyPosZ] = z;

	    mysql_tquery(g_SQL, "INSERT INTO `sunsafety` (`safetyID`) VALUES(0)", "OnsafetyCreated", "d", i);
		safety_Refresh(i);
		return i;
	}
	return -1;
}

safety_Save(safetyid)
{
	static
	    query[220];


	mysql_format(g_SQL, query, sizeof(query), "UPDATE `safetyX` = '%.4f', `safetyY` = '%.4f', `safetyZ` = '%.4f', `safetyRMoney` = %d, `safetyMoney` = %d, `safetyKnuckles` = %d, `safetyPoon` = %d, `safetyHematite` = %d WHERE `safetyID` = '%d'",
		safetyData[safetyid][safetyPosX],
	    safetyData[safetyid][safetyPosY],
	    safetyData[safetyid][safetyPosZ],
        safetyData[safetyid][safetyRMoney],
        safetyData[safetyid][safetyMoney],
        safetyData[safetyid][safetyKnuckles],
        safetyData[safetyid][safetyPoon],
        safetyData[safetyid][safetyHematite],
	    safetyData[safetyid][safetyID]
	);
	return mysql_tquery(g_SQL, query);
}

safety_Refresh(safetyid)
{
	if (safetyid != -1 && safetyData[safetyid][safetyExists])
	{
		if (IsValidDynamicPickup(safetyData[safetyid][safetyPickup]))
		    DestroyDynamicPickup(safetyData[safetyid][safetyPickup]);

		if (IsValidDynamic3DTextLabel(safetyData[safetyid][safetyText3D]))
		    DestroyDynamic3DTextLabel(safetyData[safetyid][safetyText3D]);

		safetyData[safetyid][safetyPickup] = CreateDynamicPickup(19605, 23, safetyData[safetyid][safetyPosX], safetyData[safetyid][safetyPosY], safetyData[safetyid][safetyPosZ]-1);
  		safetyData[safetyid][safetyText3D] = CreateDynamic3DTextLabel("{F11E54}[SAFETY]\n{FFFFFF}[ ใช้ 'N' สำหรับเปิดตู้]", COLOR_GREEN, safetyData[safetyid][safetyPosX], safetyData[safetyid][safetyPosY], safetyData[safetyid][safetyPosZ], 5.0, INVALID_VEHICLE_ID, INVALID_PLAYER_ID, 0);
	}
	return 1;
}

// --> ตู้เซฟเก็บของ
alias:createsafety("วางตู้")
CMD:createsafety(playerid, params[])
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

	id = safety_Create(x, y, z);

	if (id == -1)
	    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ความจุของตู้เซฟในฐานข้อมูลเต็มแล้ว ไม่สามารถสร้างได้อีก (ติดต่อผู้พัฒนา)");

	SendClientMessageEx(playerid, COLOR_SERVER, "คุณได้สร้างตู้เซฟขึ้นมาใหม่ ไอดี: %d", id);
	return 1;
}

alias:deletesafety("ลบตู้")
CMD:deletesafety(playerid, params[])
{
	static
	    id = 0;

    if (playerData[playerid][pAdmin] < 5)
	    return 1;

	if (sscanf(params, "d", id))
	    return SendClientMessage(playerid, COLOR_WHITE, "การใช้งาน : /deletesafety [ไอดี]");

	if ((id < 0 || id >= MAX_SAFETY) || !safetyData[id][safetyExists])
	    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ไม่มีไอดีตู้เซฟนี้อยู่ในฐานข้อมูล");

	safety_Delete(id);
	SendClientMessageEx(playerid, COLOR_SERVER, "คุณได้ลบตู้เซฟไอดี %d ออกสำเร็จ", id);
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
  if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid))
  {
    if (safety_Nearest(playerid) != -1)
    {
        if (!Inventory_HasItem(playerid, "กุญแจตู้เซฟ"))
		    return SendClientMessage(playerid, COLOR_LIGHTRED, "[EROOR!] ไม่มีกุญแจตู้");

        new safetyid = safety_Nearest(playerid);
        new string100[1024];
        new string2[1024];

        format(string100, sizeof(string100), "{FFFFFF}[รายการ]\n");
        strcat(string2,string100);

        format(string100, sizeof(string100), "{FF0000}เงินแดง\t( $%d )\n", safetyData[safetyid][safetyRMoney]);
        strcat(string2,string100);

        format(string100, sizeof(string100), "{FF0000}เงินเขียว\t( $%d )\n", safetyData[safetyid][safetyMoney]);
        strcat(string2,string100);

        format(string100, sizeof(string100), "{FF0000}สนับมือ\t( $%d )\n", safetyData[safetyid][safetyKnuckles]);
        strcat(string2,string100);

        format(string100, sizeof(string100), "{FF0000}ปูน\t( $%d )\n", safetyData[safetyid][safetyPoon]);
        strcat(string2,string100);

        format(string100, sizeof(string100), "{FF0000}แร่เฮมาไทต์\t( $%d )\n", safetyData[safetyid][safetyHematite]);
        strcat(string2,string100);

        Dialog_Show(playerid, D_KEEPSAFETY, DIALOG_STYLE_TABLIST_HEADERS,"{00FFFB}[ ตู้เซฟ ]", string2, "Select", "Close");
    }
  }
  return 1;
}

Dialog:D_KEEPSAFETY(playerid, response, listitem, inputtext[])
{
    if (response)
	  {
	      switch(listitem)
	      {
	          case 0:
	          {
				    Dialog_Show(playerid, D_kstRmoeny, DIALOG_STYLE_LIST, "{80FF00}[ เงินแดง ]",
                "[+] ใส่เข้าไป\n\
                 [-] นำออกมา",
                "Select","Close");
	          }
	          case 1:
	          {
				    Dialog_Show(playerid, D_kstMoney, DIALOG_STYLE_LIST, "{FF0000}[ เงินเขียว ]",
                "[+] ใส่เข้าไป\n\
                 [-] นำออกมา",
                "Select","Close");
	          }
            case 2:
	          {
				    Dialog_Show(playerid, D_kstKnuckles, DIALOG_STYLE_LIST, "{FF0000}[ สนับมือ ]",
                "[+] ใส่เข้าไป\n\
                 [-] นำออกมา",
                "Select","Close");
	          }
            case 3:
	          {
				    Dialog_Show(playerid, D_kstPoon, DIALOG_STYLE_LIST, "{FF0000}[ ปูน ]",
                "[+] ใส่เข้าไป\n\
                 [-] นำออกมา",
                "Select","Close");
	          }
            case 4:
	          {
				    Dialog_Show(playerid, D_kstHematite, DIALOG_STYLE_LIST, "{FF0000}[ เฮมาไทต์ ]",
                "[+] ใส่เข้าไป\n\
                 [-] นำออกมา",
                "Select","Close");
	          }
        }
    }
    return 1;
}

Dialog:D_kstRmoeny(playerid, response, listitem, inputtext[])//เงิน
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
                new safetyid = safety_Nearest(playerid);
                new NameItem[64];
                NameItem = "เงินแดง";
                if (safetyData[safetyid][safetyRMoney] >= 1000000)
                    return SendClientMessage(playerid, COLOR_LIGHTRED, "[ERROR!]{FFFFFF} เงินในตู้เต็ม....($1,000,000)");

                Dialog_Show(playerid, D_kstRmoeny1, DIALOG_STYLE_INPUT, "{80FF00}[ เงินแดง ]", "จำนวนที่ต้องการใส่เข้าไป คือ","ใส่เข้าไป","ยกเลิก");
            }
			case 1:
			{
				Dialog_Show(playerid, D_TKmoeny2, DIALOG_STYLE_INPUT, "{80FF00}[ เงินเขียว ]", "จำนวนที่ต้องการนำออกมา คือ","นำออกมา","ยกเลิก");
			}
		}
	}
	return 1;
}

Dialog:D_kstRmoeny1(playerid, response, listitem, inputtext[])
{
	new amount = strval(inputtext);
	new safetyid = safety_Nearest(playerid);
	new query[300];

    if (response)
    {
        if (amount <= 0)
            return SendClientMessage(playerid, COLOR_LIGHTRED, "[ERROR!]{FFFFFF} 0 ตัวเดียวไม่มีค่า....");

        if (amount < 1 || amount > playerData[playerid][pRedMoney])
            return SendClientMessage(playerid, COLOR_LIGHTRED, "[ERROR!]{FFFFFF} เงินไม่พอ....");

        if (amount > 1000000)
            return SendClientMessage(playerid, COLOR_LIGHTRED, "[ERROR!]{FFFFFF} พื้นที่จัดเก็บคือ....($1,000,000)");

        new NameItem[64];
        NameItem = "เงินแดง";
        new NamePlayer[128];
        NamePlayer = GetPlayerNameEx(playerid);
        safetyData[safetyid][safetyRMoney] += amount;
        playerData[playerid][pRedMoney] -= amount;

        new gString[256];
		format(gString, sizeof(gString), "INSERT INTO safetylog (givePlayerID, givePlayerName, giveItem, giveAmount, safetyID) VALUES('%d', '%s', '[+] เงินแดง', '%d', '%d')", playerData[playerid][pID], GetPlayerNameEx(playerid), amount, safetyData[safetyid][safetyID]);
		mysql_tquery(g_SQL, gString);

        mysql_format(g_SQL, query, sizeof(query), "UPDATE sunsafety SET safetyRMoney = %d WHERE safetyID = %d", safetyData[safetyid][safetyRMoney], safetyData[safetyid][safetyID]);
        mysql_tquery(g_SQL, query);
    
        SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "[TRUNK] : {FFFFFF}ฝาก %s จำนวน %d บาท", NameItem, amount);
        printf("[SAFETY] : deposit 'Red Money' %d (By : %s)", amount, NamePlayer);
    }
	return 1;
}

Dialog:D_kstRmoeny2(playerid, response, listitem, inputtext[])
{
	new amount = strval(inputtext);
	new safetyid = safety_Nearest(playerid);
	new query[300];

    if (response)
    {
        if (amount <= 0)
            return SendClientMessage(playerid, COLOR_LIGHTRED, "[ERROR!]{FFFFFF} 0 ตัวเดียวไม่มีค่า....");

        if (safetyData[safetyid][safetyRMoney] < amount)
            return SendClientMessage(playerid, COLOR_LIGHTRED, "[ERROR!]{FFFFFF} เงินในตู้ไม่พอ....");

        new NameItem[64];
        NameItem = "เงินแดง";
        new NamePlayer[128];
        NamePlayer = GetPlayerNameEx(playerid);
        safetyData[safetyid][safetyRMoney] -= amount;
        playerData[playerid][pRedMoney] += amount;

        new gString[256];
		format(gString, sizeof(gString), "INSERT INTO safetylog (givePlayerID, givePlayerName, giveItem, giveAmount, safetyID) VALUES('%d', '%s', '[-] เงินแดง', '%d', '%d')", playerData[playerid][pID], GetPlayerNameEx(playerid), amount, safetyData[safetyid][safetyID]);
		mysql_tquery(g_SQL, gString);

        mysql_format(g_SQL, query, sizeof(query), "UPDATE sunsafety SET safetyRMoney = %d WHERE safetyID = %d", safetyData[safetyid][safetyRMoney], safetyData[safetyid][safetyID]);
        mysql_tquery(g_SQL, query);

        SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "[TRUNK] : {FFFFFF}ถอน %s จำนวน %d บาท", NameItem, amount);
        printf("[SAFETY] : withdraw 'Red Money' %d (By : %s)", amount, NamePlayer);
    }
	return 1;
}

Dialog:D_kstMoney(playerid, response, listitem, inputtext[])//เงิน
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
                new safetyid = safety_Nearest(playerid);
                new NameItem[64];
                NameItem = "เงินเขียว";
                if (safetyData[safetyid][safetyMoney] >= 1000000)
                    return SendClientMessage(playerid, COLOR_LIGHTRED, "[ERROR!]{FFFFFF} เงินในตู้เต็ม....($1,000,000)");

                Dialog_Show(playerid, D_kstMoney1, DIALOG_STYLE_INPUT, "{80FF00}[ เงินแดง ]", "จำนวนที่ต้องการใส่เข้าไป คือ","ใส่เข้าไป","ยกเลิก");
            }
			case 1:
			{
				Dialog_Show(playerid, D_kstMoney2, DIALOG_STYLE_INPUT, "{80FF00}[ เงินเขียว ]", "จำนวนที่ต้องการนำออกมา คือ","นำออกมา","ยกเลิก");
			}
		}
	}
	return 1;
}

Dialog:D_kstMoney1(playerid, response, listitem, inputtext[])
{
	new amount = strval(inputtext);
	new safetyid = safety_Nearest(playerid);
	new query[300];

    if (response)
    {
        if (amount <= 0)
            return SendClientMessage(playerid, COLOR_LIGHTRED, "[ERROR!]{FFFFFF} 0 ตัวเดียวไม่มีค่า....");

        if (amount < 1 || amount > playerData[playerid][pRedMoney])
            return SendClientMessage(playerid, COLOR_LIGHTRED, "[ERROR!]{FFFFFF} เงินไม่พอ....");

        if (amount > 1000000)
            return SendClientMessage(playerid, COLOR_LIGHTRED, "[ERROR!]{FFFFFF} พื้นที่จัดเก็บคือ....($1,000,000)");

        new NameItem[64];
        NameItem = "เงินเขียว";
        new NamePlayer[128];
        NamePlayer = GetPlayerNameEx(playerid);
        safetyData[safetyid][safetyMoney] += amount;
        GivePlayerMoney(playerid, -amount);

        new gString[256];
		format(gString, sizeof(gString), "INSERT INTO safetylog (givePlayerID, givePlayerName, giveItem, giveAmount, safetyID) VALUES('%d', '%s', '[+] เงินเขียว', '%d', '%d')", playerData[playerid][pID], GetPlayerNameEx(playerid), amount, safetyData[safetyid][safetyID]);
		mysql_tquery(g_SQL, gString);

        mysql_format(g_SQL, query, sizeof(query), "UPDATE sunsafety SET safetyMoney = %d WHERE safetyID = %d", safetyData[safetyid][safetyMoney], safetyData[safetyid][safetyID]);
        mysql_tquery(g_SQL, query);
    
        SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "[TRUNK] : {FFFFFF}ฝาก %s จำนวน %d บาท", NameItem, amount);
        printf("[SAFETY] : deposit 'Money' %d (By : %s)", amount, NamePlayer);
    }
	return 1;
}

Dialog:D_kstMoney2(playerid, response, listitem, inputtext[])
{
	new amount = strval(inputtext);
	new safetyid = safety_Nearest(playerid);
	new query[300];

    if (response)
    {
        if (amount <= 0)
            return SendClientMessage(playerid, COLOR_LIGHTRED, "[ERROR!]{FFFFFF} 0 ตัวเดียวไม่มีค่า....");

        if (safetyData[safetyid][safetyMoney] < amount)
            return SendClientMessage(playerid, COLOR_LIGHTRED, "[ERROR!]{FFFFFF} เงินในตู้ไม่พอ....");

        new NameItem[64];
        NameItem = "เงินแดง";
        new NamePlayer[128];
        NamePlayer = GetPlayerNameEx(playerid);
        safetyData[safetyid][safetyMoney] -= amount;
        GivePlayerMoney(playerid, amount);

        new gString[256];
		format(gString, sizeof(gString), "INSERT INTO safetylog (givePlayerID, givePlayerName, giveItem, giveAmount, safetyID) VALUES('%d', '%s', '[-] เงินเขียว', '%d', '%d')", playerData[playerid][pID], GetPlayerNameEx(playerid), amount, safetyData[safetyid][safetyID]);
		mysql_tquery(g_SQL, gString);

        mysql_format(g_SQL, query, sizeof(query), "UPDATE sunsafety SET safetyMoney = %d WHERE safetyID = %d", safetyData[safetyid][safetyMoney], safetyData[safetyid][safetyID]);
        mysql_tquery(g_SQL, query);

        SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "[TRUNK] : {FFFFFF}ถอน %s จำนวน %d บาท", NameItem, amount);
        printf("[SAFETY] : withdraw 'Money' %d (By : %s)", amount, NamePlayer);
    }
	return 1;
}

Dialog:D_kstKnuckles(playerid, response, listitem, inputtext[])//เงิน
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
                new safetyid = safety_Nearest(playerid);
                new NameItem[64];
                NameItem = "สนับมือ";
                if (safetyData[safetyid][safetyKnuckles] >= 200)
                    return SendClientMessage(playerid, COLOR_LIGHTRED, "[ERROR!]{FFFFFF} สนับในตู้เต็ม....(200)");

                Dialog_Show(playerid, D_kstKnuckles1, DIALOG_STYLE_INPUT, "{80FF00}[ สนับมือ ]", "จำนวนที่ต้องการใส่เข้าไป คือ","ใส่เข้าไป","ยกเลิก");
            }
			case 1:
			{
				Dialog_Show(playerid, D_kstKnuckles2, DIALOG_STYLE_INPUT, "{80FF00}[ สนับมือ ]", "จำนวนที่ต้องการนำออกมา คือ","นำออกมา","ยกเลิก");
			}
		}
	}
	return 1;
}

Dialog:D_kstKnuckles1(playerid, response, listitem, inputtext[])
{
	new amount = strval(inputtext);
	new safetyid = safety_Nearest(playerid);
	new query[300];

    if (response)
    {
		new NameItem[64];
        NameItem = "สนับมือ";

        if (amount <= 0)
            return SendClientMessage(playerid, COLOR_LIGHTRED, "[ERROR!]{FFFFFF} 0 ตัวเดียวไม่มีค่า....");

        if (amount < 1 || amount > Inventory_Count(playerid, NameItem))
            return SendClientMessage(playerid, COLOR_LIGHTRED, "[ERROR!]{FFFFFF} สนับมือไม่พอ....");

        if (amount > 200)
            return SendClientMessage(playerid, COLOR_LIGHTRED, "[ERROR!]{FFFFFF} พื้นที่จัดเก็บคือ....(200)");

        new NamePlayer[128];
        NamePlayer = GetPlayerNameEx(playerid);
        safetyData[safetyid][safetyKnuckles] += amount;
        Inventory_Remove(playerid, NameItem, amount);

        new gString[256];
		format(gString, sizeof(gString), "INSERT INTO safetylog (givePlayerID, givePlayerName, giveItem, giveAmount, safetyID) VALUES('%d', '%s', '[+] %s', '%d', '%d')", playerData[playerid][pID], GetPlayerNameEx(playerid), NameItem, amount, safetyData[safetyid][safetyID]);
		mysql_tquery(g_SQL, gString);

        mysql_format(g_SQL, query, sizeof(query), "UPDATE sunsafety SET safetyKnuckles = %d WHERE safetyID = %d", safetyData[safetyid][safetyKnuckles], safetyData[safetyid][safetyID]);
        mysql_tquery(g_SQL, query);
    
        SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "[TRUNK] : {FFFFFF}ฝาก %s จำนวน %d", NameItem, amount);
        printf("[SAFETY] : deposit 'Knuckles' %d (By : %s)", amount, NamePlayer);
    }
	return 1;
}

Dialog:D_kstKnuckles2(playerid, response, listitem, inputtext[])
{
	new amount = strval(inputtext);
	new safetyid = safety_Nearest(playerid);
	new query[300];

    if (response)
    {
		new NameItem[64];
        NameItem = "สนับมือ";

        if (amount <= 0)
            return SendClientMessage(playerid, COLOR_LIGHTRED, "[ERROR!]{FFFFFF} 0 ตัวเดียวไม่มีค่า....");

        if (safetyData[safetyid][safetyKnuckles] < amount)
            return SendClientMessage(playerid, COLOR_LIGHTRED, "[ERROR!]{FFFFFF} สนับมือในตู้ไม่พอ....");

        new NamePlayer[128];
        NamePlayer = GetPlayerNameEx(playerid);
        safetyData[safetyid][safetyKnuckles] -= amount;
        Inventory_Add(playerid, NameItem, amount);

        new gString[256];
		format(gString, sizeof(gString), "INSERT INTO safetylog (givePlayerID, givePlayerName, giveItem, giveAmount, safetyID) VALUES('%d', '%s', '[-] %s', '%d', '%d')", playerData[playerid][pID], GetPlayerNameEx(playerid), NameItem, amount, safetyData[safetyid][safetyID]);
		mysql_tquery(g_SQL, gString);

        mysql_format(g_SQL, query, sizeof(query), "UPDATE sunsafety SET safetyKnuckles = %d WHERE safetyID = %d", safetyData[safetyid][safetyKnuckles], safetyData[safetyid][safetyID]);
        mysql_tquery(g_SQL, query);

        SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "[TRUNK] : {FFFFFF}ถอน %s จำนวน %d", NameItem, amount);
        printf("[SAFETY] : withdraw 'Knuckles' %d (By : %s)", amount, NamePlayer);
    }
	return 1;
}

Dialog:D_kstPoon(playerid, response, listitem, inputtext[])//เงิน
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
                new safetyid = safety_Nearest(playerid);
                new NameItem[64];
                NameItem = "ปูน";
                if (safetyData[safetyid][safetyPoon] >= 200)
                    return SendClientMessage(playerid, COLOR_LIGHTRED, "[ERROR!]{FFFFFF} สนับในตู้เต็ม....(200)");

                Dialog_Show(playerid, D_kstPoon1, DIALOG_STYLE_INPUT, "{80FF00}[ ปูน ]", "จำนวนที่ต้องการใส่เข้าไป คือ","ใส่เข้าไป","ยกเลิก");
            }
			case 1:
			{
				Dialog_Show(playerid, D_kstPoon2, DIALOG_STYLE_INPUT, "{80FF00}[ ปูน ]", "จำนวนที่ต้องการนำออกมา คือ","นำออกมา","ยกเลิก");
			}
		}
	}
	return 1;
}

Dialog:D_kstPoon1(playerid, response, listitem, inputtext[])
{
	new amount = strval(inputtext);
	new safetyid = safety_Nearest(playerid);
	new query[300];

    if (response)
    {
		new NameItem[64];
        NameItem = "ปูน";

        if (amount <= 0)
            return SendClientMessage(playerid, COLOR_LIGHTRED, "[ERROR!]{FFFFFF} 0 ตัวเดียวไม่มีค่า....");

        if (amount < 1 || amount > Inventory_Count(playerid, NameItem))
            return SendClientMessage(playerid, COLOR_LIGHTRED, "[ERROR!]{FFFFFF} ปูนไม่พอ....");

        if (amount > 200)
            return SendClientMessage(playerid, COLOR_LIGHTRED, "[ERROR!]{FFFFFF} พื้นที่จัดเก็บคือ....(200)");

        new NamePlayer[128];
        NamePlayer = GetPlayerNameEx(playerid);
        safetyData[safetyid][safetyPoon] += amount;
        Inventory_Remove(playerid, NameItem, amount);

        new gString[256];
		format(gString, sizeof(gString), "INSERT INTO safetylog (givePlayerID, givePlayerName, giveItem, giveAmount, safetyID) VALUES('%d', '%s', '[+] %s', '%d', '%d')", playerData[playerid][pID], GetPlayerNameEx(playerid), NameItem, amount, safetyData[safetyid][safetyID]);
		mysql_tquery(g_SQL, gString);

        mysql_format(g_SQL, query, sizeof(query), "UPDATE sunsafety SET safetyPoon = %d WHERE safetyID = %d", safetyData[safetyid][safetyPoon], safetyData[safetyid][safetyID]);
        mysql_tquery(g_SQL, query);
    
        SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "[TRUNK] : {FFFFFF}ฝาก %s จำนวน %d", NameItem, amount);
        printf("[SAFETY] : deposit 'poon' %d (By : %s)", amount, NamePlayer);
    }
	return 1;
}

Dialog:D_kstPoon2(playerid, response, listitem, inputtext[])
{
	new amount = strval(inputtext);
	new safetyid = safety_Nearest(playerid);
	new query[300];

    if (response)
    {
		new NameItem[64];
        NameItem = "ปูน";

        if (amount <= 0)
            return SendClientMessage(playerid, COLOR_LIGHTRED, "[ERROR!]{FFFFFF} 0 ตัวเดียวไม่มีค่า....");

        if (safetyData[safetyid][safetyPoon] < amount)
            return SendClientMessage(playerid, COLOR_LIGHTRED, "[ERROR!]{FFFFFF} ปูนในตู้ไม่พอ....");

        new NamePlayer[128];
        NamePlayer = GetPlayerNameEx(playerid);
        safetyData[safetyid][safetyPoon] -= amount;
        Inventory_Add(playerid, NameItem, amount);

        new gString[256];
		format(gString, sizeof(gString), "INSERT INTO safetylog (givePlayerID, givePlayerName, giveItem, giveAmount, safetyID) VALUES('%d', '%s', '[-] %s', '%d', '%d')", playerData[playerid][pID], GetPlayerNameEx(playerid), NameItem, amount, safetyData[safetyid][safetyID]);
		mysql_tquery(g_SQL, gString);

        mysql_format(g_SQL, query, sizeof(query), "UPDATE sunsafety SET safetyPoon = %d WHERE safetyID = %d", safetyData[safetyid][safetyPoon], safetyData[safetyid][safetyID]);
        mysql_tquery(g_SQL, query);

        SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "[TRUNK] : {FFFFFF}ถอน %s จำนวน %d", NameItem, amount);
        printf("[SAFETY] : withdraw 'poon' %d (By : %s)", amount, NamePlayer);
    }
	return 1;
}

Dialog:D_kstHematite(playerid, response, listitem, inputtext[])//เงิน
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
                new safetyid = safety_Nearest(playerid);
                new NameItem[64];
                NameItem = "แร่เฮมาไทต์";
                if (safetyData[safetyid][safetyPoon] >= 200)
                    return SendClientMessage(playerid, COLOR_LIGHTRED, "[ERROR!]{FFFFFF} สนับในตู้เต็ม....(200)");

                Dialog_Show(playerid, D_kstHematite1, DIALOG_STYLE_INPUT, "{80FF00}[ แร่เฮมาไทต์ ]", "จำนวนที่ต้องการใส่เข้าไป คือ","ใส่เข้าไป","ยกเลิก");
            }
			case 1:
			{
				Dialog_Show(playerid, D_kstHematite2, DIALOG_STYLE_INPUT, "{80FF00}[ แร่เฮมาไทต์ ]", "จำนวนที่ต้องการนำออกมา คือ","นำออกมา","ยกเลิก");
			}
		}
	}
	return 1;
}

Dialog:D_kstHematite1(playerid, response, listitem, inputtext[])
{
	new amount = strval(inputtext);
	new safetyid = safety_Nearest(playerid);
	new query[300];

    if (response)
    {
		new NameItem[64];
        NameItem = "แร่เฮมาไทต์";

        if (amount <= 0)
            return SendClientMessage(playerid, COLOR_LIGHTRED, "[ERROR!]{FFFFFF} 0 ตัวเดียวไม่มีค่า....");

        if (amount < 1 || amount > Inventory_Count(playerid, NameItem))
            return SendClientMessage(playerid, COLOR_LIGHTRED, "[ERROR!]{FFFFFF} แร่เฮมาไทต์ไม่พอ....");

        if (amount > 200)
            return SendClientMessage(playerid, COLOR_LIGHTRED, "[ERROR!]{FFFFFF} พื้นที่จัดเก็บคือ....(200)");

        new NamePlayer[128];
        NamePlayer = GetPlayerNameEx(playerid);
        safetyData[safetyid][safetyHematite] += amount;
        Inventory_Remove(playerid, NameItem, amount);

        new gString[256];
		format(gString, sizeof(gString), "INSERT INTO safetylog (givePlayerID, givePlayerName, giveItem, giveAmount, safetyID) VALUES('%d', '%s', '[+] %s', '%d', '%d')", playerData[playerid][pID], GetPlayerNameEx(playerid), NameItem, amount, safetyData[safetyid][safetyID]);
		mysql_tquery(g_SQL, gString);

        mysql_format(g_SQL, query, sizeof(query), "UPDATE sunsafety SET safetyHematite = %d WHERE safetyID = %d", safetyData[safetyid][safetyHematite], safetyData[safetyid][safetyID]);
        mysql_tquery(g_SQL, query);
    
        SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "[TRUNK] : {FFFFFF}ฝาก %s จำนวน %d", NameItem, amount);
        printf("[SAFETY] : deposit 'Hematite' %d (By : %s)", amount, NamePlayer);
    }
	return 1;
}

Dialog:D_kstHematite2(playerid, response, listitem, inputtext[])
{
	new amount = strval(inputtext);
	new safetyid = safety_Nearest(playerid);
	new query[300];

    if (response)
    {
		new NameItem[64];
        NameItem = "แร่เฮมาไทต์";

        if (amount <= 0)
            return SendClientMessage(playerid, COLOR_LIGHTRED, "[ERROR!]{FFFFFF} 0 ตัวเดียวไม่มีค่า....");

        if (safetyData[safetyid][safetyHematite] < amount)
            return SendClientMessage(playerid, COLOR_LIGHTRED, "[ERROR!]{FFFFFF} แร่เฮมาไทต์ในตู้ไม่พอ....");

        new NamePlayer[128];
        NamePlayer = GetPlayerNameEx(playerid);
        safetyData[safetyid][safetyHematite] -= amount;
        Inventory_Add(playerid, NameItem, amount);

        new gString[256];
		format(gString, sizeof(gString), "INSERT INTO safetylog (givePlayerID, givePlayerName, giveItem, giveAmount, safetyID) VALUES('%d', '%s', '[-] %s', '%d', '%d')", playerData[playerid][pID], GetPlayerNameEx(playerid), NameItem, amount, safetyData[safetyid][safetyID]);
		mysql_tquery(g_SQL, gString);

        mysql_format(g_SQL, query, sizeof(query), "UPDATE sunsafety SET safetyHematite = %d WHERE safetyID = %d", safetyData[safetyid][safetyHematite], safetyData[safetyid][safetyID]);
        mysql_tquery(g_SQL, query);

        SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "[TRUNK] : {FFFFFF}ถอน %s จำนวน %d", NameItem, amount);
        printf("[SAFETY] : withdraw 'Hematite' %d (By : %s)", amount, NamePlayer);
    }
	return 1;
}