#include	<YSI_Coding\y_hooks>
#include 	<YSI_Coding\y_timers>



#define     MAX_SUN_MINE                (1000)
#define     SUN_MINENAME               "ก้อนหิน"
#define     SUN_MINENAME2              "ถ่านหิน"
#define     SUN_MINENAME3              "เศษเหล็ก"

static sun_minetake[MAX_PLAYERS];
static auto_mine[MAX_PLAYERS];

static sun_mineframe[MAX_PLAYERS];
static auto_mineframe[MAX_PLAYERS];

static mineActor;

enum SUN_MINE_INFO
{
    s_mineID,
    s_mineExists,
    Float: s_minePosX,
	Float: s_minePosY,
	Float: s_minePosZ,
	Float: s_minePosA,
    Text3D: s_mine3D,
	s_mineInterior,
	s_mineWorld,
    s_minePickup
};
new s_minenfo[MAX_SUN_MINE][SUN_MINE_INFO];

hook OnGameModeInit()
{
   /* for(new i = 0; i < sizeof(s_minenfo); i++)
	{
        s_minenfo[i][s_minePickup] = CreateDynamicPickup(1604, 23, s_minenfo[i][s_minePosX], s_minenfo[i][s_minePosY], s_minenfo[i][s_minePosZ]);
		s_minenfo[i][s_mine3D] = CreateDynamic3DTextLabel("{B7FF56}( JOB: Minning )\n[ ใช้ 'N' เพื่อเก็บแร่ ]\n[ ใช้ 'H' เพื่อเปิด-ปิดออโต้ฟาร์ม ]", COLOR_GREEN, s_minenfo[i][s_minePosX], s_minenfo[i][s_minePosY], s_minenfo[i][s_minePosZ], 5.0);
	}*/
	
	//CreateDynamicPickup(, 23, 2571.3096,-1085.6847,66.8413);
	CreateDynamic3DTextLabel("(SELL:"#SUN_MINENAME")\n[ ใช้ 'N' เพื่อขาย]", COLOR_GREEN, 2571.3096,-1085.6847,66.8413, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);

	mineActor = CreateActor(6, 2571.3096,-1085.6847,66.8413,102.3149);
	ApplyActorAnimation(mineActor, "COP_AMBIENT", "Coplook_loop", 4.1, 0, 1, 1, 1, 1);



    CreateDynamicPickup(19632, 23, 686.8401, 844.9627, -38.4270);
	CreateDynamic3DTextLabel("(สกัด:"#SUN_MINENAME")\n[ ใช้ 'N' เพื่อสกัด]", COLOR_GREEN, 686.8401, 844.9627, -38.4270, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);

    CreateDynamicPickup(19632, 23, 689.4277, 848.6667, -38.4270);
	CreateDynamic3DTextLabel("(สกัด:"#SUN_MINENAME")\n[ ใช้ 'N' เพื่อสกัด]", COLOR_GREEN, 689.4277, 848.6667, -38.4270, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);

    CreateDynamicPickup(19632, 23, 675.7468, 825.2248, -38.4114);
	CreateDynamic3DTextLabel("(สกัด:"#SUN_MINENAME")\n[ ใช้ 'N' เพื่อสกัด]", COLOR_GREEN, 675.7468, 825.2248, -38.4114, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);

    CreateDynamicPickup(19632, 23, 678.4672, 828.8467, -38.4114);
	CreateDynamic3DTextLabel("(สกัด:"#SUN_MINENAME")\n[ ใช้ 'N' เพื่อสกัด]", COLOR_GREEN, 678.4672, 828.8467, -38.4114, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);

    CreateDynamicPickup(19632, 23, 619.6882, 887.8883, -35.2443);
	CreateDynamic3DTextLabel("(สกัด:"#SUN_MINENAME")\n[ ใช้ 'N' เพื่อสกัด]", COLOR_GREEN, 619.6882, 887.8883, -35.2443, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);

    CreateDynamicPickup(19632, 23, 622.62400, 892.6135, -35.2838);
	CreateDynamic3DTextLabel("(สกัด:"#SUN_MINENAME")\n[ ใช้ 'N' เพื่อสกัด]", COLOR_GREEN, 622.62400, 892.6135, -35.2838, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);

    CreateDynamicPickup(19904, 23, 584.849, 877.6011, -42.4973);
	CreateDynamic3DTextLabel("(สมัครงาน: ขุดเหมือง)\n[ เร็วๆนี้...]", COLOR_GREEN, 584.849, 877.6011, -42.4973, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);
	
    return 1;
}
hook OnPlayerConnect(playerid)
{
    sun_minetake[playerid] = 0;
    auto_mine[playerid] = 0;
    return 1;
}
hook OnPlayerDisconnect(playerid, reason)
{
    if (sun_minetake[playerid] != 0)
    {
		StopProgress(playerid);
    }
    if(auto_mine[playerid] != 0)
    {
        auto_mine[playerid] = 0;
    }
    return 1;
}
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid))
	{
		if (s_mine_Nearest(playerid) != -1)
        {
                if (!Inventory_HasItem(playerid, "ค้อนทุบหิน"))
                    return SendClientMessage(playerid, COLOR_RED, "[ERROR!] {FFFFFF}ไม่มีค้อน");

                if (sun_minetake[playerid] == 1)
                    return SendClientMessage(playerid, COLOR_RED, "[ERROR!] {FFFFFF}กำลังใช้ค้อน....");

				sun_minetake[playerid] = 1; //ใช้งาน
					
				new rand = randomEx(10, 200);
				Start_loadType1(playerid, rand, 0, INVALID_OBJECT_ID);

				//SetPlayerFacingAngle(playerid, s_minenfo[i][s_minePosA]);

				SetPlayerAttachedObject(playerid, 9, 19631, 6, 0.048, 0.029, 0.103, -80.0, 80.0, 0.0);
				SetPlayerArmedWeapon(playerid, 0);
				ApplyAnimation(playerid, "BASEBALL", "Bat_1", 4.1, 1, 0, 0, 1, 0, 1);
				//SetPlayerAttachedObject(playerid, 0, 18632, 6, 0.079376, 0.037070, 0.007706, 181.482910, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000);

				SendClientMessage(playerid, COLOR_YELLOW, "[NEW!] {FFFFFF}เหวี่ยงค้อน...");
				
				//break;
	    	
		}
        if (IsPlayerInRangeOfPoint(playerid, 2.5, 686.8401, 844.9627, -38.4270) || IsPlayerInRangeOfPoint(playerid, 2.5, 689.4277, 848.6667, -38.4270) || IsPlayerInRangeOfPoint(playerid, 2.5, 675.7468, 825.2248, -38.4114)  || IsPlayerInRangeOfPoint(playerid, 2.5, 678.4672, 828.8467, -38.4114)  || IsPlayerInRangeOfPoint(playerid, 2.5, 619.6882, 887.8883, -35.2443)  || IsPlayerInRangeOfPoint(playerid, 2.5, 622.62400, 892.6135, -35.2838)  || IsPlayerInRangeOfPoint(playerid, 2.5, 584.849, 877.6011, -42.4973)) //แก้จุด
        {
            Dialog_Show(playerid, D_MINEFRAME, DIALOG_STYLE_TABLIST_HEADERS, "[สกัดแร่]", "\
				ชื่อ\tจำนวน/ชิ้น\n\
				ก้อนหิน\t{FF00FF}%d\n\
                ",  "สกัด", "ออก", Inventory_Count(playerid, SUN_MINENAME));
            return 1;
        }
        if (IsPlayerInRangeOfPoint(playerid, 2.5,2571.3096,-1085.6847,66.8413))
        {
            Dialog_Show(playerid, DSUN_SELLMINE, DIALOG_STYLE_TABLIST_HEADERS, "[ร้านรับซื้อแร่]", "\
				ชื่อรายการ\tราคา\n\
				ถ่านหิน\t{00FF00}$%d\n\
				หินเกลือ\t{00FF00}$%d\n\
				แร่ดาวม่วง\t{00FF00}$%d\n\
				แร่เฮมาไทต์\t{00FF00}$%d\n\
				หินแดง\t{00FF00}$%d\n\
				หินน้ำเงิน\t{00FF00}$%d\n\
				แร่หินไฟ\t{00FF00}$%d\n\
				เหล็ก\t{00FF00}$%d\n\
				ทอง\t{00FF00}$%d\n\
				เพชร\t{00FF00}$%d\n\
				มรกตเขียว\t{00FF00}$%d\n\
                มรกตแดง\t{00FF00}$%d\n\
                มรกตม่วง\t{00FF00}$%d\n\
                มรกตดำ\t{00FF00}$%d\n\
                มรกตขาว\t{00FF00}$%d\n\
                ยูเรเนียม\t{00FF00}$%d\n\
                ไทเทเนียม\t{00FF00}$%d\n\
                เหรียญยูนิตี้\t{00FF00}$%d",
				"ขาย", "ออก",
				SUN_Jobcash[16],
				SUN_Jobcash[17],
				SUN_Jobcash[18],
				SUN_Jobcash[19],
				SUN_Jobcash[20],
				SUN_Jobcash[21],
				SUN_Jobcash[22],
				SUN_Jobcash[23],
				SUN_Jobcash[24],
				SUN_Jobcash[25],
				SUN_Jobcash[26],
                SUN_Jobcash[27],
                SUN_Jobcash[28],
                SUN_Jobcash[29],
                SUN_Jobcash[30],
                SUN_Jobcash[31],
                SUN_Jobcash[32],
                SUN_Jobcash[33]);
        }
	}
	if (newkeys & KEY_CTRL_BACK && !IsPlayerInAnyVehicle(playerid))
	{
		if (auto_mine[playerid] == 0)
		{
			if (s_mine_Nearest(playerid) != -1)
            {
					auto_mine[playerid] = 1;
					SendClientMessage(playerid, COLOR_YELLOW, "[NEW!] {FFFFFF}เปิดออโต้ฟาร์ม");
				
			}
		}
		else if (auto_mine[playerid] == 1)
		{
			if (s_mine_Nearest(playerid) != -1)
            {
					auto_mine[playerid] = 0;
					SendClientMessage(playerid, COLOR_YELLOW, "[NEW!] {FF0000}ปิดออโต้ฟาร์ม");
				
			}
		}
		if (auto_mineframe[playerid] == 0)
		{
			if (IsPlayerInRangeOfPoint(playerid, 2.5, 686.8401, 844.9627, -38.4270) || IsPlayerInRangeOfPoint(playerid, 2.5, 689.4277, 848.6667, -38.4270) || IsPlayerInRangeOfPoint(playerid, 2.5, 675.7468, 825.2248, -38.4114)  || IsPlayerInRangeOfPoint(playerid, 2.5, 678.4672, 828.8467, -38.4114)  || IsPlayerInRangeOfPoint(playerid, 2.5, 619.6882, 887.8883, -35.2443)  || IsPlayerInRangeOfPoint(playerid, 2.5, 622.62400, 892.6135, -35.2838)  || IsPlayerInRangeOfPoint(playerid, 2.5, 584.849, 877.6011, -42.4973)) //แก้จุด
        	{
				auto_mineframe[playerid] = 1;
				Dialog_Show(playerid, D_MINEFRAME, DIALOG_STYLE_TABLIST_HEADERS, "[สกัดแร่]", "\
					ชื่อ\tจำนวน/ชิ้น\n\
					ก้อนหิน\t{FF00FF}%d\n\
				",  "สกัด", "ออก", Inventory_Count(playerid, SUN_MINENAME));
				SendClientMessage(playerid, COLOR_YELLOW, "[NEW!] {FFFFFF}เปิดออโต้สกัดแร่");
				
			}
		}
		else if (auto_mineframe[playerid] == 1)
		{
			if (IsPlayerInRangeOfPoint(playerid, 2.5, 686.8401, 844.9627, -38.4270) || IsPlayerInRangeOfPoint(playerid, 2.5, 689.4277, 848.6667, -38.4270) || IsPlayerInRangeOfPoint(playerid, 2.5, 675.7468, 825.2248, -38.4114)  || IsPlayerInRangeOfPoint(playerid, 2.5, 678.4672, 828.8467, -38.4114)  || IsPlayerInRangeOfPoint(playerid, 2.5, 619.6882, 887.8883, -35.2443)  || IsPlayerInRangeOfPoint(playerid, 2.5, 622.62400, 892.6135, -35.2838)  || IsPlayerInRangeOfPoint(playerid, 2.5, 584.849, 877.6011, -42.4973)) //แก้จุด
        	{
					auto_mineframe[playerid] = 0;
					SendClientMessage(playerid, COLOR_YELLOW, "[NEW!] {FF0000}ปิดออโต้สกัดแร่");
				
			}
		}
		
	}
	return 1;
}

Dialog:D_MINEFRAME(playerid, response, listitem, inputtext[])
{
	if (response)
	{
        switch(listitem)
	    {
	        case 0:
	        {
                sun_mineframe[playerid] = 1;
                Start_loadType1(playerid, 50, 0, INVALID_OBJECT_ID);
		    }
        }
    }
    return 1;
}

Dialog:DSUN_SELLMINE(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
	            new name[128];
	            name = "ถ่านหิน";
			    new ammo = Inventory_Count(playerid, name);
			    new price = ammo*SUN_Jobcash[16];
			    
			    if (ammo <= 0)
			        return SendClientMessageEx(playerid, COLOR_RED, "[WARNING] {FFFFFF} ไม่มี %s",  name);


				new exprand = randomEx(10, 50);
				GivePlayerExp(playerid, exprand);
		        GivePlayerMoneyEx(playerid, price);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[รับซื้อแร่] {FFFFFF}เงินเขียว +{00FF00}%s {FFFFFF}จากการขาย %s {00FF00}%d {FFFFFF}ตัว", FormatMoney(price), name, ammo);
				Inventory_Remove(playerid, name, ammo);
		    }
		    case 1:
	        {
	            new name[128];
	            name = "หินเกลือ";
			    new ammo = Inventory_Count(playerid, name);
			    new price = ammo*SUN_Jobcash[17];


			    if (ammo <= 0)
			        return SendClientMessageEx(playerid, COLOR_RED, "[WARNING] {FFFFFF} ไม่มี %s",  name);

				new exprand = randomEx(10, 50);
				GivePlayerExp(playerid, exprand);
		        GivePlayerMoneyEx(playerid, price);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[รับซื้อแร่] {FFFFFF}เงินเขียว +{00FF00}%s {FFFFFF}จากการขาย %s {00FF00}%d {FFFFFF}ตัว", FormatMoney(price), name, ammo);
				Inventory_Remove(playerid, name, ammo);
		    }
	        case 2:
	        {
	            new name[128];
	            name = "แร่ดาวม่วง";
			    new ammo = Inventory_Count(playerid, name);
			    new price = ammo*SUN_Jobcash[18];


			    if (ammo <= 0)
			        return SendClientMessageEx(playerid, COLOR_RED, "[WARNING] {FFFFFF} ไม่มี %s",  name);


				new exprand = randomEx(10, 50);
				GivePlayerExp(playerid, exprand);
		        GivePlayerMoneyEx(playerid, price);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[รับซื้อแร่] {FFFFFF}เงินเขียว +{00FF00}%s {FFFFFF}จากการขาย %s {00FF00}%d {FFFFFF}ตัว", FormatMoney(price), name, ammo);
				Inventory_Remove(playerid, name, ammo);
		    }
		    case 3:
	        {
	            new name[128];
	            name = "แร่เฮมาไทต์";
			    new ammo = Inventory_Count(playerid, name);
			    new price = ammo*SUN_Jobcash[19];


			    if (ammo <= 0)
			        return SendClientMessageEx(playerid, COLOR_RED, "[WARNING] {FFFFFF} ไม่มี %s",  name);

				new exprand = randomEx(10, 50);
				GivePlayerExp(playerid, exprand);
		        GivePlayerMoneyEx(playerid, price);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[รับซื้อแร่] {FFFFFF}เงินเขียว +{00FF00}%s {FFFFFF}จากการขาย %s {00FF00}%d {FFFFFF}ตัว", FormatMoney(price), name, ammo);
				Inventory_Remove(playerid, name, ammo);
		    }
		    case 4:
	        {
	            new name[128];
	            name = "หินแดง";
			    new ammo = Inventory_Count(playerid, name);
			    new price = ammo*SUN_Jobcash[20];


			    if (ammo <= 0)
			        return SendClientMessageEx(playerid, COLOR_RED, "[WARNING] {FFFFFF} ไม่มี %s",  name);

				new exprand = randomEx(10, 50);
				GivePlayerExp(playerid, exprand);
		        GivePlayerMoneyEx(playerid, price);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[รับซื้อแร่] {FFFFFF}เงินเขียว +{00FF00}%s {FFFFFF}จากการขาย %s {00FF00}%d {FFFFFF}ตัว", FormatMoney(price), name, ammo);
				Inventory_Remove(playerid, name, ammo);
		    }
		    case 5:
	        {
	            new name[128];
	            name = "หินน้ำเงิน";
			    new ammo = Inventory_Count(playerid, name);
			    new price = ammo*SUN_Jobcash[21];


			    if (ammo <= 0)
			        return SendClientMessageEx(playerid, COLOR_RED, "[WARNING] {FFFFFF} ไม่มี %s",  name);

				new exprand = randomEx(10, 50);
				GivePlayerExp(playerid, exprand);
		        GivePlayerMoneyEx(playerid, price);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[รับซื้อแร่] {FFFFFF}เงินเขียว +{00FF00}%s {FFFFFF}จากการขาย %s {00FF00}%d {FFFFFF}ตัว", FormatMoney(price), name, ammo);
				Inventory_Remove(playerid, name, ammo);
		    }
		    case 6:
	        {
	            new name[128];
	            name = "แร่หินไฟ";
			    new ammo = Inventory_Count(playerid, name);
			    new price = ammo*SUN_Jobcash[22];


			    if (ammo <= 0)
			        return SendClientMessageEx(playerid, COLOR_RED, "[WARNING] {FFFFFF} ไม่มี %s",  name);

				new exprand = randomEx(10, 50);
				GivePlayerExp(playerid, exprand);
		        GivePlayerMoneyEx(playerid, price);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[รับซื้อแร่] {FFFFFF}เงินเขียว +{00FF00}%s {FFFFFF}จากการขาย %s {00FF00}%d {FFFFFF}ตัว", FormatMoney(price), name, ammo);
				Inventory_Remove(playerid, name, ammo);
		    }
		    case 7:
	        {
	            new name[128];
	            name = "เหล็ก";
			    new ammo = Inventory_Count(playerid, name);
			    new price = ammo*SUN_Jobcash[23];


			    if (ammo <= 0)
			        return SendClientMessageEx(playerid, COLOR_RED, "[WARNING] {FFFFFF} ไม่มี %s",  name);

				new exprand = randomEx(10, 50);
				GivePlayerExp(playerid, exprand);
		        GivePlayerMoneyEx(playerid, price);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[รับซื้อแร่] {FFFFFF}เงินเขียว +{00FF00}%s {FFFFFF}จากการขาย %s {00FF00}%d {FFFFFF}ตัว", FormatMoney(price), name, ammo);
				Inventory_Remove(playerid, name, ammo);
		    }
		    case 8:
	        {
	            new name[128];
	            name = "ทอง";
			    new ammo = Inventory_Count(playerid, name);
			    new price = ammo*SUN_Jobcash[24];


			    if (ammo <= 0)
			        return SendClientMessageEx(playerid, COLOR_RED, "[WARNING] {FFFFFF} ไม่มี %s",  name);

				new exprand = randomEx(10, 50);
				GivePlayerExp(playerid, exprand);
		        GivePlayerMoneyEx(playerid, price);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[รับซื้อแร่] {FFFFFF}เงินเขียว +{00FF00}%s {FFFFFF}จากการขาย %s {00FF00}%d {FFFFFF}ตัว", FormatMoney(price), name, ammo);
				Inventory_Remove(playerid, name, ammo);
		    }
		    case 9:
	        {
	            new name[128];
	            name = "เพชร";
			    new ammo = Inventory_Count(playerid, name);
			    new price = ammo*SUN_Jobcash[25];


			    if (ammo <= 0)
			        return SendClientMessageEx(playerid, COLOR_RED, "[WARNING] {FFFFFF} ไม่มี %s",  name);

				new exprand = randomEx(10, 50);
				GivePlayerExp(playerid, exprand);
		        GivePlayerMoneyEx(playerid, price);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[รับซื้อแร่] {FFFFFF}เงินเขียว +{00FF00}%s {FFFFFF}จากการขาย %s {00FF00}%d {FFFFFF}ตัว", FormatMoney(price), name, ammo);
				Inventory_Remove(playerid, name, ammo);
		    }
		    case 10:
	        {
	            new name[128];
	            name = "มรกตเขียว";
			    new ammo = Inventory_Count(playerid, name);
			    new price = ammo*SUN_Jobcash[26];


			    if (ammo <= 0)
			        return SendClientMessageEx(playerid, COLOR_RED, "[WARNING] {FFFFFF} ไม่มี %s",  name);

				new exprand = randomEx(10, 50);
				GivePlayerExp(playerid, exprand);
		        GivePlayerMoneyEx(playerid, price);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[รับซื้อแร่] {FFFFFF}เงินเขียว +{00FF00}%s {FFFFFF}จากการขาย %s {00FF00}%d {FFFFFF}ตัว", FormatMoney(price), name, ammo);
				Inventory_Remove(playerid, name, ammo);
		    }/////
            case 11:
	        {
	            new name[128];
	            name = "มรกตแดง";
			    new ammo = Inventory_Count(playerid, name);
			    new price = ammo*SUN_Jobcash[27];


			    if (ammo <= 0)
			        return SendClientMessageEx(playerid, COLOR_RED, "[WARNING] {FFFFFF} ไม่มี %s",  name);

				new exprand = randomEx(10, 50);
				GivePlayerExp(playerid, exprand);
		        GivePlayerMoneyEx(playerid, price);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[รับซื้อแร่] {FFFFFF}เงินเขียว +{00FF00}%s {FFFFFF}จากการขาย %s {00FF00}%d {FFFFFF}ตัว", FormatMoney(price), name, ammo);
				Inventory_Remove(playerid, name, ammo);
		    }
            case 12:
	        {
	            new name[128];
	            name = "มรกตม่วง";
			    new ammo = Inventory_Count(playerid, name);
			    new price = ammo*SUN_Jobcash[28];


			    if (ammo <= 0)
			        return SendClientMessageEx(playerid, COLOR_RED, "[WARNING] {FFFFFF} ไม่มี %s",  name);

				new exprand = randomEx(10, 50);
				GivePlayerExp(playerid, exprand);
		        GivePlayerMoneyEx(playerid, price);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[รับซื้อแร่] {FFFFFF}เงินเขียว +{00FF00}%s {FFFFFF}จากการขาย %s {00FF00}%d {FFFFFF}ตัว", FormatMoney(price), name, ammo);
				Inventory_Remove(playerid, name, ammo);
		    }
            case 13:
	        {
	            new name[128];
	            name = "มรกตดำ";
			    new ammo = Inventory_Count(playerid, name);
			    new price = ammo*SUN_Jobcash[29];


			    if (ammo <= 0)
			        return SendClientMessageEx(playerid, COLOR_RED, "[WARNING] {FFFFFF} ไม่มี %s",  name);

				new exprand = randomEx(10, 50);
				GivePlayerExp(playerid, exprand);
		        GivePlayerMoneyEx(playerid, price);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[รับซื้อแร่] {FFFFFF}เงินเขียว +{00FF00}%s {FFFFFF}จากการขาย %s {00FF00}%d {FFFFFF}ตัว", FormatMoney(price), name, ammo);
				Inventory_Remove(playerid, name, ammo);
		    }
            case 14:
	        {
	            new name[128];
	            name = "มรกตขาว";
			    new ammo = Inventory_Count(playerid, name);
			    new price = ammo*SUN_Jobcash[30];


			    if (ammo <= 0)
			        return SendClientMessageEx(playerid, COLOR_RED, "[WARNING] {FFFFFF} ไม่มี %s",  name);

				new exprand = randomEx(10, 50);
				GivePlayerExp(playerid, exprand);
		        GivePlayerMoneyEx(playerid, price);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[รับซื้อแร่] {FFFFFF}เงินเขียว +{00FF00}%s {FFFFFF}จากการขาย %s {00FF00}%d {FFFFFF}ตัว", FormatMoney(price), name, ammo);
				Inventory_Remove(playerid, name, ammo);
		    }
            case 15:
	        {
	            new name[128];
	            name = "ยูเรเนียม";
			    new ammo = Inventory_Count(playerid, name);
			    new price = ammo*SUN_Jobcash[31];


			    if (ammo <= 0)
			        return SendClientMessageEx(playerid, COLOR_RED, "[WARNING] {FFFFFF} ไม่มี %s",  name);

				new exprand = randomEx(10, 50);
				GivePlayerExp(playerid, exprand);
		        GivePlayerMoneyEx(playerid, price);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[รับซื้อแร่] {FFFFFF}เงินเขียว +{00FF00}%s {FFFFFF}จากการขาย %s {00FF00}%d {FFFFFF}ตัว", FormatMoney(price), name, ammo);
				Inventory_Remove(playerid, name, ammo);
		    }
            case 16:
	        {
	            new name[128];
	            name = "ไทเทเนียม";
			    new ammo = Inventory_Count(playerid, name);
			    new price = ammo*SUN_Jobcash[32];


			    if (ammo <= 0)
			        return SendClientMessageEx(playerid, COLOR_RED, "[WARNING] {FFFFFF} ไม่มี %s",  name);

				new exprand = randomEx(10, 50);
				GivePlayerExp(playerid, exprand);
		        GivePlayerMoneyEx(playerid, price);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[รับซื้อแร่] {FFFFFF}เงินเขียว +{00FF00}%s {FFFFFF}จากการขาย %s {00FF00}%d {FFFFFF}ตัว", FormatMoney(price), name, ammo);
				Inventory_Remove(playerid, name, ammo);
		    }
            case 17:
	        {
	            new name[128];
	            name = "เหรียญยูนิตี้";
			    new ammo = Inventory_Count(playerid, name);
			    new price = ammo*SUN_Jobcash[33];


			    if (ammo <= 0)
			        return SendClientMessageEx(playerid, COLOR_RED, "[WARNING] {FFFFFF} ไม่มี %s",  name);

				new exprand = randomEx(10, 50);
				GivePlayerExp(playerid, exprand);
		        GivePlayerMoneyEx(playerid, price);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[รับซื้อแร่] {FFFFFF}เงินเขียว +{00FF00}%s {FFFFFF}จากการขาย %s {00FF00}%d {FFFFFF}ตัว", FormatMoney(price), name, ammo);
				Inventory_Remove(playerid, name, ammo);
		    }

		}
	}
	return 1;
}

sun_minning_finish(playerid)
{
	ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.0, 0, 0, 0, 0, 1);
	sun_minetake[playerid] = 0;
	RemovePlayerAttachedObject(playerid, 0);
    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	ClearAnimations(playerid);
    RemovePlayerAttachedObject(playerid, 9);
	//auto_mine[playerid] = 1;
    new orer = randomEx(1,3);
    new orer2 = randomEx(1,3);
    switch(random(5))
    {
        case 0..2:
        {
            Inventory_Add(playerid, SUN_MINENAME2, orer);
            SendClientMessageEx(playerid, COLOR_GREEN, "[+] {FFFFFF}%s +%d...", SUN_MINENAME2, orer);
        }
        case 3..5:
        {
            Inventory_Add(playerid, SUN_MINENAME, orer);
            Inventory_Add(playerid, SUN_MINENAME2, orer2);
            SendClientMessageEx(playerid, COLOR_GREEN, "[+] {FFFFFF}%s +%d...", SUN_MINENAME, orer);
            SendClientMessageEx(playerid, COLOR_GREEN, "[+] {FFFFFF}%s +%d...", SUN_MINENAME2, orer2);
        }
    }
	return 1;
}

sun_minning_frame(playerid)
{
	ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.0, 0, 0, 0, 0, 1);
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	ClearAnimations(playerid);
    sun_mineframe[playerid] = 0;
    new name[128];
	name = "ก้อนหิน";
	new ammo = Inventory_Count(playerid, name);

    if (ammo <= 0)
		return SendClientMessageEx(playerid, COLOR_RED, "[WARNING] {FFFFFF} ไม่มี %s",  name);

    new randore = randomEx(1, 1000);
    new orefi[64];
    switch(randore)
    {
        /*case 1..50: orefi = "แร่เฮมาไทต์";
        case 51..80: orefi = "แร่หินเกลือ";
        case 81..139: orefi = "แร่ถ่านหิน";
        case 140..160: orefi = "แร่ยูเรเนียม";*/

        case 1..100: orefi = "ถ่านหิน";
        case 101..200: orefi = "เหรียญยูนิตี้";
		case 201..290: orefi = "หินเกลือ";
		case 291..358: orefi = "แร่ดาวม่วง";
		case 359..455: orefi = "แร่เฮมาไทต์";
		case 456..520: orefi = "หินแดง";
		case 521..580: orefi = "หินน้ำเงิน";
		case 581..620: orefi = "แร่หินไฟ";
		case 621..660: orefi = "เหล็ก";
		case 661..710: orefi = "ทอง";
		case 711..750: orefi = "เพชร";
		case 751..799: orefi = "มรกตเขียว";
        case 800..859: orefi = "มรกตแดง";
        case 860..905: orefi = "มรกตม่วง";
        case 906..940: orefi = "มรกตดำ";
        case 941..982: orefi = "มรกตขาว";
        case 983..992: orefi = "ยูเรเนียม";
        case 993..1000: orefi = "ไทเทเนียม";
        
    }
    new count = Inventory_Count(playerid, orefi)+1;

    if(count > playerData[playerid][pItemAmount])
    {
        ClearAnimations(playerid);
        SendClientMessageEx(playerid, COLOR_RED, "[WARNING!] {FFFFFF}ช่องเก็บ {00FF00}%s {FFFFFF}เต็มจ้า", orefi);
        return 1;
    }

    new id = Inventory_Add(playerid, orefi, 1);

    if (id == -1)
    {
        SendClientMessageEx(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ความจุของกระเป๋าไม่เพียงพอ (%d/%d)", Inventory_Items(playerid), playerData[playerid][pMaxItem]);
        return 1;
    }
			    
    SendClientMessageEx(playerid, COLOR_RED, "[สกัดแร่] {FFFFFF}%s -{00FF00}1 {FFFFFF}[เหลือก้อนหิน: {00FF00}%d]", name, ammo);
	SendClientMessageEx(playerid, COLOR_GREEN, "[สกัดแร่] {FFFFFF}%s +{00FF00}1 {FFFFFF}", orefi);
	Inventory_Remove(playerid, name, 1);
	

	return 1;
}

ptask mineautofarm[1000*5](playerid)
{
	if (auto_mine[playerid] == 1)
	{
        if (!Inventory_HasItem(playerid, "ค้อนทุบหิน"))
            return 1;
                
        if (sun_minetake[playerid] == 1)
            return 1;

		if (s_mine_Nearest(playerid) != -1)
        {

			if (!Inventory_HasItem(playerid, "ค้อนทุบหิน"))
                return SendClientMessage(playerid, COLOR_RED, "[ERROR!] {FFFFFF}ไม่มีค้อน");

            if (sun_minetake[playerid] == 1)
                return SendClientMessage(playerid, COLOR_RED, "[ERROR!] {FFFFFF}กำลังใช้ค้อน....");

			sun_minetake[playerid] = 1; //ใช้งาน
					
			new rand = randomEx(10, 200);
			Start_loadType1(playerid, rand, 0, INVALID_OBJECT_ID);

				//SetPlayerFacingAngle(playerid, s_minenfo[i][s_minePosA]);

			SetPlayerAttachedObject(playerid, 9, 19631, 6, 0.048, 0.029, 0.103, -80.0, 80.0, 0.0);
			SetPlayerArmedWeapon(playerid, 0);
			ApplyAnimation(playerid, "BASEBALL", "Bat_1", 4.1, 1, 0, 0, 1, 0, 1);
			SetPlayerAttachedObject(playerid, 0, 18632, 6, 0.079376, 0.037070, 0.007706, 181.482910, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000);

			SendClientMessage(playerid, COLOR_YELLOW, "[NEW!] {FFFFFF}เหวี่ยงค้อน...");
				//break;	
		}
		else
		{
			auto_mine[playerid] = 0;
		}	
	}
    if(auto_mineframe[playerid] == 1)
    {
		if (IsPlayerInRangeOfPoint(playerid, 2.5, 686.8401, 844.9627, -38.4270) || IsPlayerInRangeOfPoint(playerid, 2.5, 689.4277, 848.6667, -38.4270) || IsPlayerInRangeOfPoint(playerid, 2.5, 675.7468, 825.2248, -38.4114)  || IsPlayerInRangeOfPoint(playerid, 2.5, 678.4672, 828.8467, -38.4114)  || IsPlayerInRangeOfPoint(playerid, 2.5, 619.6882, 887.8883, -35.2443)  || IsPlayerInRangeOfPoint(playerid, 2.5, 622.62400, 892.6135, -35.2838)  || IsPlayerInRangeOfPoint(playerid, 2.5, 584.849, 877.6011, -42.4973)) //แก้จุด
        {
			sun_mineframe[playerid] = 0;
			new name[128];
			name = "ก้อนหิน";
			new ammo = Inventory_Count(playerid, name);

			if (ammo <= 0)
				return SendClientMessageEx(playerid, COLOR_RED, "[WARNING] {FFFFFF} ไม่มี %s",  name);

			new randore = randomEx(1, 1000);
			new orefi[64];
			switch(randore)
			{
			/*case 1..50: orefi = "แร่เฮมาไทต์";
			case 51..80: orefi = "แร่หินเกลือ";
			case 81..139: orefi = "แร่ถ่านหิน";
			case 140..160: orefi = "แร่ยูเรเนียม";*/

				case 1..100: orefi = "ถ่านหิน";
				case 101..200: orefi = "เหรียญยูนิตี้";
				case 201..290: orefi = "หินเกลือ";
				case 291..358: orefi = "แร่ดาวม่วง";
				case 359..455: orefi = "แร่เฮมาไทต์";
				case 456..520: orefi = "หินแดง";
				case 521..580: orefi = "หินน้ำเงิน";
				case 581..620: orefi = "แร่หินไฟ";
				case 621..660: orefi = "เหล็ก";
				case 661..710: orefi = "ทอง";
				case 711..750: orefi = "เพชร";
				case 751..799: orefi = "มรกตเขียว";
				case 800..859: orefi = "มรกตแดง";
				case 860..905: orefi = "มรกตม่วง";
				case 906..940: orefi = "มรกตดำ";
				case 941..982: orefi = "มรกตขาว";
				case 983..992: orefi = "ยูเรเนียม";
				case 993..1000: orefi = "ไทเทเนียม";
			}
			new count = Inventory_Count(playerid, orefi)+1;

			if(count > playerData[playerid][pItemAmount])
			{
				ClearAnimations(playerid);
				SendClientMessageEx(playerid, COLOR_RED, "[WARNING!] {FFFFFF}ช่องเก็บ {00FF00}%s {FFFFFF}เต็มจ้า", orefi);
				return 1;
			}

			new id = Inventory_Add(playerid, orefi, 1);

			if (id == -1)
			{
				SendClientMessageEx(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ความจุของกระเป๋าไม่เพียงพอ (%d/%d)", Inventory_Items(playerid), playerData[playerid][pMaxItem]);
				return 1;
			}
						
			SendClientMessageEx(playerid, COLOR_RED, "[สกัดแร่] {FFFFFF}%s -{00FF00}1 {FFFFFF}[เหลือก้อนหิน: {00FF00}%d]", name, ammo);
			SendClientMessageEx(playerid, COLOR_GREEN, "[สกัดแร่] {FFFFFF}%s +{00FF00}1 {FFFFFF}", orefi);
			Inventory_Remove(playerid, name, 1);
		}
		else
		{
			auto_mineframe[playerid] = 0;
		}
    }

	return 1;
}

hook OnloadType1_Finish(playerid, objectid)
{
	if(sun_minetake[playerid] == 1)
		sun_minning_finish(playerid);

    if(sun_mineframe[playerid] == 1)
        sun_minning_frame(playerid);

	return Y_HOOKS_CONTINUE_RETURN_0;
}

hook OnloadType1_Update(playerid, progress, objectid)
{
	if(sun_minetake[playerid] == 1)
	{
		ApplyAnimation(playerid, "BASEBALL", "Bat_1", 4.1, 1, 0, 0, 1, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}
    if(sun_mineframe[playerid] == 1)
    {
		ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 1, 0, 0, 1, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}

	return Y_HOOKS_CONTINUE_RETURN_0;
}

forward Mine_Load();
public Mine_Load()
{
	static
	    rows;

	cache_get_row_count(rows);

	for (new i = 0; i < rows; i ++) if (i < MAX_SUN_MINE)
	{
        s_minenfo[i][s_mineExists] = true;

	    cache_get_value_name_int(i, "s_mineID", s_minenfo[i][s_mineID]);
	    cache_get_value_name_float(i, "s_minePosX", s_minenfo[i][s_minePosX]);
	    cache_get_value_name_float(i, "s_minePosY", s_minenfo[i][s_minePosY]);
	    cache_get_value_name_float(i, "s_minePosZ", s_minenfo[i][s_minePosZ]);
		cache_get_value_name_float(i, "s_minePosA", s_minenfo[i][s_minePosA]);
		cache_get_value_name_int(i, "s_mineInterior", s_minenfo[i][s_mineInterior]);
		cache_get_value_name_int(i, "s_mineWorld", s_minenfo[i][s_mineWorld]);

	    s_mine_Refresh(i);
	}
	printf("[SERVER]: %i s_mine were loaded from \"%s\" database...", rows, MYSQL_DATABASE);
	return 1;
}

forward OnMineCreated(mineid);
public OnMineCreated(mineid)
{
	if (mineid == -1 || !s_minenfo[mineid][s_mineExists])
	    return 0;

	s_minenfo[mineid][s_mineID] = cache_insert_id();
	s_mine_Save(mineid);

	return 1;
}

s_mine_Nearest(playerid)
{
    for (new i = 0; i != MAX_SUN_MINE; i ++) if (s_minenfo[i][s_mineExists] && IsPlayerInRangeOfPoint(playerid, 4.0, s_minenfo[i][s_minePosX], s_minenfo[i][s_minePosY], s_minenfo[i][s_minePosZ]))
	{
		if (GetPlayerInterior(playerid) == s_minenfo[i][s_mineInterior] && GetPlayerVirtualWorld(playerid) == s_minenfo[i][s_mineWorld])
			return i;
	}
	return -1;
}

s_mine_Delete(pumpid)
{
	if (pumpid != -1 && s_minenfo[pumpid][s_mineExists])
	{
	    static
	        string[64];

        if (IsValidDynamicPickup(s_minenfo[pumpid][s_minePickup]))
		    DestroyDynamicPickup(s_minenfo[pumpid][s_minePickup]);

		if (IsValidDynamic3DTextLabel(s_minenfo[pumpid][s_mine3D]))
		    DestroyDynamic3DTextLabel(s_minenfo[pumpid][s_mine3D]);

		mysql_format(g_SQL, string, sizeof(string), "DELETE FROM `s_mine` WHERE `s_mineID` = '%d'", s_minenfo[pumpid][s_mineID]);
		mysql_tquery(g_SQL, string);

		s_minenfo[pumpid][s_mineExists] = false;
		s_minenfo[pumpid][s_mineID] = 0;
	}
	return 1;
}

s_mine_Create(Float:x, Float:y, Float:z, interior, world)
{
	for (new i = 0; i < MAX_SUN_MINE; i ++) if (!s_minenfo[i][s_mineExists])
	{
	    s_minenfo[i][s_mineExists] = true;
	    s_minenfo[i][s_minePosX] = x;
	    s_minenfo[i][s_minePosY] = y;
	    s_minenfo[i][s_minePosZ] = z;
		s_minenfo[i][s_mineInterior] = interior;
	    s_minenfo[i][s_mineWorld] = world;

	    mysql_tquery(g_SQL, "INSERT INTO `s_mine` (`s_mineInterior`) VALUES(0)", "OnMineCreated", "d", i);
		s_mine_Refresh(i);
		return i;
	}
	return -1;
}

s_mine_Save(pumpid)
{
	static
	    query[220];

	mysql_format(g_SQL, query, sizeof(query), "UPDATE `s_mine` SET `s_minePosX` = '%.4f', `s_minePosY` = '%.4f', `s_minePosZ` = '%.4f', `s_mineInterior` = '%d', `s_mineWorld` = '%d' WHERE `s_mineID` = '%d'",
	    s_minenfo[pumpid][s_minePosX],
	    s_minenfo[pumpid][s_minePosY],
	    s_minenfo[pumpid][s_minePosZ],
		s_minenfo[pumpid][s_mineInterior],
	    s_minenfo[pumpid][s_mineWorld],
	    s_minenfo[pumpid][s_mineID]
	);
	return mysql_tquery(g_SQL, query);
}

s_mine_Refresh(pumpid)
{
	if (pumpid != -1 && s_minenfo[pumpid][s_mineExists])
	{
		if (IsValidDynamicPickup(s_minenfo[pumpid][s_minePickup]))
		    DestroyDynamicPickup(s_minenfo[pumpid][s_minePickup]);

		if (IsValidDynamic3DTextLabel(s_minenfo[pumpid][s_mine3D]))
		    DestroyDynamic3DTextLabel(s_minenfo[pumpid][s_mine3D]);

		s_minenfo[pumpid][s_minePickup] = CreateDynamicObject(2936, s_minenfo[pumpid][s_minePosX], s_minenfo[pumpid][s_minePosY], s_minenfo[pumpid][s_minePosZ]-1, 0.0, 0.0, 0.0);
  		s_minenfo[pumpid][s_mine3D] = CreateDynamic3DTextLabel("{1FFF00}[JOBS : เหมืองแร่]\n{FFFFFF}[ ใช้ 'N' สำหรับขุดหาแร่ ]\n[ ใช้ 'H' เพื่อ เปิด/ปิด ออโต้ฟาร์ม]", COLOR_GREEN, s_minenfo[pumpid][s_minePosX], s_minenfo[pumpid][s_minePosY], s_minenfo[pumpid][s_minePosZ], 5.0, INVALID_VEHICLE_ID, INVALID_PLAYER_ID, 0, s_minenfo[pumpid][s_mineWorld], s_minenfo[pumpid][s_mineInterior]);
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

	id = s_mine_Create(x, y, z,  GetPlayerInterior(playerid), GetPlayerVirtualWorld(playerid));

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

	if ((id < 0 || id >= MAX_SUN_MINE) || !s_minenfo[id][s_mineExists])
	    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ไม่มีไอดีจุดงานแร่นี้อยู่ในฐานข้อมูล");

	s_mine_Delete(id);
	SendClientMessageEx(playerid, COLOR_SERVER, "คุณได้ลบจุดงานแร่ไอดี %d ออกสำเร็จ", id);
	return 1;
}
