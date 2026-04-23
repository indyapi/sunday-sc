#include	<YSI_Coding\y_hooks>
#include 	<YSI_Coding\y_timers>

#define     MAX_SUN_FISH                (32)
#define     SUN_FISHNAME               "ปลา"

static sun_fishTake[MAX_PLAYERS];
static auto_farm[MAX_PLAYERS];
static FishActor;

enum sun_FISH_DATA
{
    sun_fishID,
    Float: sun_fishPosX,
	Float: sun_fishPosY,
	Float: sun_fishPosZ,
	Float: sun_fishPosA,
    Text3D: sun_fish3D,
    sun_fishPickup
};
new const sun_fishData[MAX_SUN_FISH][sun_FISH_DATA] =
{
	{ 0, 709.0341,-1647.9181,3.4375,271.6832, Text3D: INVALID_3DTEXT_ID, -1 },
	{ 1, 709.0342,-1658.3550,3.4375,266.0431, Text3D: INVALID_3DTEXT_ID, -1 },
	{ 2, 709.0342,-1667.6868,3.4375,278.5767, Text3D: INVALID_3DTEXT_ID, -1 },
	{ 3, 709.0344,-1678.7810,3.4430,263.5366, Text3D: INVALID_3DTEXT_ID, -1 },
	{ 4, 716.8347,-1596.1555,14.3626,179.8756, Text3D: INVALID_3DTEXT_ID, -1 },
	{ 5, 724.1230,-1596.2180,14.4274,177.3690, Text3D: INVALID_3DTEXT_ID, -1 },
	{ 6, 734.9575,-1596.2163,14.4010,181.1291, Text3D: INVALID_3DTEXT_ID, -1 },
	{ 7, 734.2208,-1664.7317,10.6709,6.2875, Text3D: INVALID_3DTEXT_ID, -1 },
	{ 8, 722.6445,-1664.7354,10.6907,357.8274, Text3D: INVALID_3DTEXT_ID, -1 },
	{ 9, 714.1008,-1664.7281,10.7458,353.4407, Text3D: INVALID_3DTEXT_ID, -1 },
	{ 10, 723.6694,-1682.9224,10.7311,181.7324, Text3D: INVALID_3DTEXT_ID, -1 },
	{ 11, 732.1443,-1682.9159,10.7518,183.2991, Text3D: INVALID_3DTEXT_ID, -1 },
	{ 12, 738.7352,-1682.9210,10.7677,181.4191, Text3D: INVALID_3DTEXT_ID, -1 },

	{ 13, 738.7352,715.0774,-1577.1860,14.3639, Text3D: INVALID_3DTEXT_ID, -1 },
	{ 14, 738.7352,723.6995,-1577.1001,14.4330, Text3D: INVALID_3DTEXT_ID, -1 },
	{ 15, 738.7352,732.1484,-1577.1003,14.4103, Text3D: INVALID_3DTEXT_ID, -1 },
	{ 16, 738.7352,742.7192,-1609.5450,12.9907, Text3D: INVALID_3DTEXT_ID, -1 },
	{ 17, 738.7352,742.4036,-1622.2407,10.4882, Text3D: INVALID_3DTEXT_ID, -1 },
	{ 18, 738.7352,742.3483,-1636.2024,7.0749, Text3D: INVALID_3DTEXT_ID, -1 },
	{ 19, 738.7352,742.0991,-1650.3359,5.1057, Text3D: INVALID_3DTEXT_ID, -1 },
	{ 20, 738.7352,743.3404,-1661.4841,4.3473, Text3D: INVALID_3DTEXT_ID, -1 },
	{ 21, 738.7352,743.8389,-1672.6635,4.1427, Text3D: INVALID_3DTEXT_ID, -1 },
	{ 22, 738.7352,744.1310,-1681.1122,4.1035, Text3D: INVALID_3DTEXT_ID, -1 },
	{ 23, 738.7352,744.6626,-1691.7218,4.5103, Text3D: INVALID_3DTEXT_ID, -1 },
	{ 24, 738.7352,745.0968,-1705.2042,5.7293, Text3D: INVALID_3DTEXT_ID, -1 },
	{ 25, 738.7352,745.3982,-1715.2776,7.1258, Text3D: INVALID_3DTEXT_ID, -1 },
	{ 26, 738.7352,745.0673,-1724.2998,8.7371, Text3D: INVALID_3DTEXT_ID, -1 },
	{ 27, 738.7352,745.7837,-1738.7217,11.4150, Text3D: INVALID_3DTEXT_ID, -1 },
	{ 28, 738.7352,745.8763,-1749.0198,12.7855, Text3D: INVALID_3DTEXT_ID, -1 },
	{ 29, 738.7352,732.6926,-1749.7002,14.5239, Text3D: INVALID_3DTEXT_ID, -1 },
	{ 30, 738.7352,723.3376,-1746.5699,14.6019, Text3D: INVALID_3DTEXT_ID, -1 },
	{ 31, 738.7352,711.8989,-1742.8984,14.3802, Text3D: INVALID_3DTEXT_ID, -1 }
};

hook OnGameModeInit()
{
    for(new i = 0; i < sizeof(sun_fishData); i++)
	{
        sun_fishData[i][sun_fishPickup] = CreateDynamicPickup(1604, 23, sun_fishData[i][sun_fishPosX], sun_fishData[i][sun_fishPosY], sun_fishData[i][sun_fishPosZ]);
		sun_fishData[i][sun_fish3D] = CreateDynamic3DTextLabel("{B7FF56}( JOB: Fishing )\n[ ใช้ 'N' เพื่อตกปลา ]\n[ ใช้ 'H' เพื่อเปิด-ปิดออโต้ฟาร์ม ]", COLOR_GREEN, sun_fishData[i][sun_fishPosX], sun_fishData[i][sun_fishPosY], sun_fishData[i][sun_fishPosZ], 5.0);
	}
	
	CreateDynamicPickup(1239, 23, 1929.3645,-1769.0892,13.5469);
	CreateDynamic3DTextLabel("(SELL:"#SUN_FISHNAME")\n[ ใช้ 'N' เพื่อขาย]", COLOR_GREEN, 1929.3645,-1769.0892,13.5469, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);

	FishActor = CreateActor(6, 1929.3645,-1769.0892,13.5469,273.5705);
	ApplyActorAnimation(FishActor, "COP_AMBIENT", "Coplook_loop", 4.1, 0, 1, 1, 1, 1);
	
    return 1;
}
hook OnPlayerConnect(playerid)
{
    sun_fishTake[playerid] = 0;
	auto_farm[playerid] = 0;

    return 1;
}
hook OnPlayerDisconnect(playerid, reason)
{
    if (sun_fishTake[playerid] != 0)
    {
		StopProgress(playerid);
		auto_farm[playerid] = 0;
    }
    return 1;
}
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid))
	{
		for(new i = 0; i < sizeof(sun_fishData); i++)
		{
		    if (IsPlayerInRangeOfPoint(playerid, 2.5, sun_fishData[i][sun_fishPosX], sun_fishData[i][sun_fishPosY], sun_fishData[i][sun_fishPosZ]))
		    {
                if (!Inventory_HasItem(playerid, "เหยื่อ"))
                    return SendClientMessage(playerid, COLOR_RED, "[ERROR!] {FFFFFF}ไม่มีเหยื่อ");
                    
                if (!Inventory_HasItem(playerid, "เบ็ดฝรั่ง"))
                    return SendClientMessage(playerid, COLOR_RED, "[ERROR!] {FFFFFF}ไม่มีเบ็ด");

                if (sun_fishTake[playerid] == 1)
                    return SendClientMessage(playerid, COLOR_RED, "[ERROR!] {FFFFFF}กำลังใช้เบ็ด....");
				
				if (auto_farm[playerid] == 1)
				{
					auto_farm[playerid] = 1;
				}
				
				sun_fishTake[playerid] = 1;
				
				new rand = randomEx(100, 200);
				Start_loadType1(playerid, rand, 0, INVALID_OBJECT_ID);
										
				Inventory_Remove(playerid, "เหยื่อ", 1);

				SetPlayerFacingAngle(playerid, sun_fishData[i][sun_fishPosA]);

				ApplyAnimation(playerid, "SWORD", "sword_block", 50.0, 0, 1, 0, 1, 1);
				SetPlayerAttachedObject(playerid, 0, 18632, 6, 0.079376, 0.037070, 0.007706, 181.482910, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000);

				SendClientMessage(playerid, COLOR_YELLOW, "[NEW!] {FFFFFF}เหวี่ยงเบ็ด...");
	    	}
		}
        if (IsPlayerInRangeOfPoint(playerid, 2.5, 1929.3645,-1769.0892,13.5469))
        {
            Dialog_Show(playerid, DSUN_SELLFISH, DIALOG_STYLE_TABLIST_HEADERS, "[ร้านรับซื้อปลา]", "\
				ชื่อรายการ\tราคา\n\
				ปลาเก๋า\t{00FF00}$%d\n\
				ปลาช่อน\t{00FF00}$%d\n\
				ปลาดอลลี่\t{00FF00}$%d\n\
				ปลานิล\t{00FF00}$%d\n\
				ปลากระพง\t{00FF00}$%d\n\
				ปลาทับทิม\t{00FF00}$%d\n\
				ปลาดุก\t{00FF00}$%d\n\
				ปลาทูน่า\t{00FF00}$%d\n\
				ปลาแซลม่อน\t{00FF00}$%d\n\
				ปลากระเบน\t{00FF00}$%d\n\
				ปลาฉลาม\t{00FF00}$%d",
				"ขาย", "ออก",
				SUN_Jobcash[0],
				SUN_Jobcash[1],
				SUN_Jobcash[2],
				SUN_Jobcash[3],
				SUN_Jobcash[4],
				SUN_Jobcash[5],
				SUN_Jobcash[6],
				SUN_Jobcash[7],
				SUN_Jobcash[8],
				SUN_Jobcash[9],
				SUN_Jobcash[10]);
        }
	}
	if (newkeys & KEY_CTRL_BACK && !IsPlayerInAnyVehicle(playerid))
	{
		if (auto_farm[playerid] == 0)
		{
			for(new i = 0; i < sizeof(sun_fishData); i++)
			{
				if (IsPlayerInRangeOfPoint(playerid, 2.5, sun_fishData[i][sun_fishPosX], sun_fishData[i][sun_fishPosY], sun_fishData[i][sun_fishPosZ]))
				{
					auto_farm[playerid] = 1;
					SendClientMessage(playerid, COLOR_YELLOW, "[NEW!] {FFFFFF}เปิดออโต้ฟาร์ม");
				}
			}
		}
		else if (auto_farm[playerid] == 1)
		{
			for(new i = 0; i < sizeof(sun_fishData); i++)
			{
				if (IsPlayerInRangeOfPoint(playerid, 2.5, sun_fishData[i][sun_fishPosX], sun_fishData[i][sun_fishPosY], sun_fishData[i][sun_fishPosZ]))
				{
					auto_farm[playerid] = 0;
					SendClientMessage(playerid, COLOR_YELLOW, "[NEW!] {FFFFFF}ปิดออโต้ฟาร์ม");
				}
			}
		}
	}
	return 1;
}

Dialog:DSUN_SELLFISH(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
	            new name[128];
	            name = "ปลาเก๋า";
			    new ammo = Inventory_Count(playerid, name);
			    new price = ammo*SUN_Jobcash[0];
			    

			    if (ammo <= 0)
			        return SendClientMessageEx(playerid, COLOR_RED, "[WARNING] {FFFFFF} ไม่มี %s",  name);

		        GivePlayerMoneyEx(playerid, price);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ร้านรับซื้อปลา] {FFFFFF}เงินเขียว +{00FF00}%s {FFFFFF}จากการขาย {00FF00}%d {FFFFFF}ตัว", FormatMoney(price), name, ammo);
				Inventory_Remove(playerid, name, ammo);
		    }
		    case 1:
	        {
	            new name[128];
	            name = "ปลาช่อน";
			    new ammo = Inventory_Count(playerid, name);
			    new price = ammo*SUN_Jobcash[1];


			    if (ammo <= 0)
			        return SendClientMessageEx(playerid, COLOR_RED, "[WARNING] {FFFFFF} ไม่มี %s",  name);

		        GivePlayerMoneyEx(playerid, price);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ร้านรับซื้อปลา] {FFFFFF}เงินเขียว +{00FF00}%s {FFFFFF}จากการขาย {00FF00}%d {FFFFFF}ตัว", FormatMoney(price), name, ammo);
				Inventory_Remove(playerid, name, ammo);
		    }
	        case 2:
	        {
	            new name[128];
	            name = "ปลาดอลลี่";
			    new ammo = Inventory_Count(playerid, name);
			    new price = ammo*SUN_Jobcash[2];


			    if (ammo <= 0)
			        return SendClientMessageEx(playerid, COLOR_RED, "[WARNING] {FFFFFF} ไม่มี %s",  name);

		        GivePlayerMoneyEx(playerid, price);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ร้านรับซื้อปลา] {FFFFFF}เงินเขียว +{00FF00}%s {FFFFFF}จากการขาย {00FF00}%d {FFFFFF}ตัว", FormatMoney(price), name, ammo);
				Inventory_Remove(playerid, name, ammo);
		    }
		    case 3:
	        {
	            new name[128];
	            name = "ปลานิล";
			    new ammo = Inventory_Count(playerid, name);
			    new price = ammo*SUN_Jobcash[3];


			    if (ammo <= 0)
			        return SendClientMessageEx(playerid, COLOR_RED, "[WARNING] {FFFFFF} ไม่มี %s",  name);

		        GivePlayerMoneyEx(playerid, price);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ร้านรับซื้อปลา] {FFFFFF}เงินเขียว +{00FF00}%s {FFFFFF}จากการขาย {00FF00}%d {FFFFFF}ตัว", FormatMoney(price), name, ammo);
				Inventory_Remove(playerid, name, ammo);
		    }
		    case 4:
	        {
	            new name[128];
	            name = "ปลากระพง";
			    new ammo = Inventory_Count(playerid, name);
			    new price = ammo*SUN_Jobcash[4];


			    if (ammo <= 0)
			        return SendClientMessageEx(playerid, COLOR_RED, "[WARNING] {FFFFFF} ไม่มี %s",  name);

		        GivePlayerMoneyEx(playerid, price);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ร้านรับซื้อปลา] {FFFFFF}เงินเขียว +{00FF00}%s {FFFFFF}จากการขาย {00FF00}%d {FFFFFF}ตัว", FormatMoney(price), name, ammo);
				Inventory_Remove(playerid, name, ammo);
		    }
		    case 5:
	        {
	            new name[128];
	            name = "ปลาทับทิม";
			    new ammo = Inventory_Count(playerid, name);
			    new price = ammo*SUN_Jobcash[5];


			    if (ammo <= 0)
			        return SendClientMessageEx(playerid, COLOR_RED, "[WARNING] {FFFFFF} ไม่มี %s",  name);

		        GivePlayerMoneyEx(playerid, price);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ร้านรับซื้อปลา] {FFFFFF}เงินเขียว +{00FF00}%s {FFFFFF}จากการขาย {00FF00}%d {FFFFFF}ตัว", FormatMoney(price), name, ammo);
				Inventory_Remove(playerid, name, ammo);
		    }
		    case 6:
	        {
	            new name[128];
	            name = "ปลาดุก";
			    new ammo = Inventory_Count(playerid, name);
			    new price = ammo*SUN_Jobcash[6];


			    if (ammo <= 0)
			        return SendClientMessageEx(playerid, COLOR_RED, "[WARNING] {FFFFFF} ไม่มี %s",  name);

		        GivePlayerMoneyEx(playerid, price);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ร้านรับซื้อปลา] {FFFFFF}เงินเขียว +{00FF00}%s {FFFFFF}จากการขาย {00FF00}%d {FFFFFF}ตัว", FormatMoney(price), name, ammo);
				Inventory_Remove(playerid, name, ammo);
		    }
		    case 7:
	        {
	            new name[128];
	            name = "ปลาทูน่า";
			    new ammo = Inventory_Count(playerid, name);
			    new price = ammo*SUN_Jobcash[7];


			    if (ammo <= 0)
			        return SendClientMessageEx(playerid, COLOR_RED, "[WARNING] {FFFFFF} ไม่มี %s",  name);

		        GivePlayerMoneyEx(playerid, price);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ร้านรับซื้อปลา] {FFFFFF}เงินเขียว +{00FF00}%s {FFFFFF}จากการขาย {00FF00}%d {FFFFFF}ตัว", FormatMoney(price), name, ammo);
				Inventory_Remove(playerid, name, ammo);
		    }
		    case 8:
	        {
	            new name[128];
	            name = "ปลาแซลม่อน";
			    new ammo = Inventory_Count(playerid, name);
			    new price = ammo*SUN_Jobcash[8];


			    if (ammo <= 0)
			        return SendClientMessageEx(playerid, COLOR_RED, "[WARNING] {FFFFFF} ไม่มี %s",  name);

		        GivePlayerMoneyEx(playerid, price);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ร้านรับซื้อปลา] {FFFFFF}เงินเขียว +{00FF00}%s {FFFFFF}จากการขาย {00FF00}%d {FFFFFF}ตัว", FormatMoney(price), name, ammo);
				Inventory_Remove(playerid, name, ammo);
		    }
		    case 9:
	        {
	            new name[128];
	            name = "ปลากระเบน";
			    new ammo = Inventory_Count(playerid, name);
			    new price = ammo*SUN_Jobcash[9];


			    if (ammo <= 0)
			        return SendClientMessageEx(playerid, COLOR_RED, "[WARNING] {FFFFFF} ไม่มี %s",  name);

		        GivePlayerMoneyEx(playerid, price);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ร้านรับซื้อปลา] {FFFFFF}เงินเขียว +{00FF00}%s {FFFFFF}จากการขาย {00FF00}%d {FFFFFF}ตัว", FormatMoney(price), name, ammo);
				Inventory_Remove(playerid, name, ammo);
		    }
		    case 10:
	        {
	            new name[128];
	            name = "ปลาฉลาม";
			    new ammo = Inventory_Count(playerid, name);
			    new price = ammo*SUN_Jobcash[10];


			    if (ammo <= 0)
			        return SendClientMessageEx(playerid, COLOR_RED, "[WARNING] {FFFFFF} ไม่มี %s",  name);

		        GivePlayerMoneyEx(playerid, price);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ร้านรับซื้อปลา] {FFFFFF}เงินเขียว +{00FF00}%s {FFFFFF}จากการขาย {00FF00}%d {FFFFFF}ตัว", FormatMoney(price), name, ammo);
				Inventory_Remove(playerid, name, ammo);
		    }
		}
	}
	return 1;
}

sun_fishing_finish(playerid)
{
	sun_fishTake[playerid] = 0;
	RemovePlayerAttachedObject(playerid, 0);
    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	ClearAnimations(playerid);

	new rand = randomEx(1, 200);
	new randexp1 = randomEx(20, 25);
	new randexp2 = randomEx(25, 30);
	new randexp3 = randomEx(30, 50);
	new randexp4 = randomEx(60, 100);
	new randexp5 = randomEx(500, 1000);
	switch(rand)
	{
	    case 1..15: 
		{
			SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}เสียใจด้วย คุณตกไม่ได้ปลาอะไรเลย!"); 
			
		}
	    case 16..40:
	    {
			new id = Inventory_Add(playerid, "ปลาเก๋า", 1);

			if (Inventory_Count(playerid, "ปลาเก๋า") > 20)
			    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณมีจำนวนของสูงสุดแล้ว! นำมันไปขายก่อน");

			if (id == -1)
			    return SendClientMessageEx(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ความจุของกระเป๋าไม่เพียงพอ (%d/%d)", Inventory_Items(playerid), playerData[playerid][pMaxItem]);

			GivePlayerExp(playerid, randexp1);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
			ClearAnimations(playerid);
			SendClientMessage(playerid, COLOR_WHITE, "คุณได้รับ {00FF00}ปลาเก๋า +1{FFFFFF} ตัว");
			
	    }
	    case 41..60:
	    {
			new id = Inventory_Add(playerid, "ปลาช่อน", 1);

			if (Inventory_Count(playerid, "ปลาช่อน") > 20)
			    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณมีจำนวนของสูงสุดแล้ว! นำมันไปขายก่อน");

			if (id == -1)
			    return SendClientMessageEx(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ความจุของกระเป๋าไม่เพียงพอ (%d/%d)", Inventory_Items(playerid), playerData[playerid][pMaxItem]);

			GivePlayerExp(playerid, randexp2);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
			ClearAnimations(playerid);
			SendClientMessage(playerid, COLOR_WHITE, "คุณได้รับ {00FF00}ปลาช่อน +1{FFFFFF} ตัว");
			
	    }
	    case 61..75:
	    {
			new id = Inventory_Add(playerid, "ปลาดอลลี่", 1);

			if (Inventory_Count(playerid, "ปลาดอลลี่") > 20)
			    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณมีจำนวนของสูงสุดแล้ว! นำมันไปขายก่อน");

			if (id == -1)
			    return SendClientMessageEx(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ความจุของกระเป๋าไม่เพียงพอ (%d/%d)", Inventory_Items(playerid), playerData[playerid][pMaxItem]);

			GivePlayerExp(playerid, randexp2);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
			ClearAnimations(playerid);
			SendClientMessage(playerid, COLOR_WHITE, "คุณได้รับ {00FF00}ปลาดอลลี่ +1{FFFFFF} ตัว");
			
	    }
	    case 76..85:
	    {
			new id = Inventory_Add(playerid, "ปลานิล", 1);

			if (Inventory_Count(playerid, "ปลานิล") > 20)
			    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณมีจำนวนของสูงสุดแล้ว! นำมันไปขายก่อน");

			if (id == -1)
			    return SendClientMessageEx(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ความจุของกระเป๋าไม่เพียงพอ (%d/%d)", Inventory_Items(playerid), playerData[playerid][pMaxItem]);

			GivePlayerExp(playerid, randexp2);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
			ClearAnimations(playerid);
			SendClientMessage(playerid, COLOR_WHITE, "คุณได้รับ {00FF00}ปลานิล +1{FFFFFF} ตัว");
			
	    }
	    case 86..99:
	    {
			new id = Inventory_Add(playerid, "ปลากระพง", 1);

			if (Inventory_Count(playerid, "ปลากระพง") > 20)
			    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณมีจำนวนของสูงสุดแล้ว! นำมันไปขายก่อน");

			if (id == -1)
			    return SendClientMessageEx(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ความจุของกระเป๋าไม่เพียงพอ (%d/%d)", Inventory_Items(playerid), playerData[playerid][pMaxItem]);

			GivePlayerExp(playerid, randexp2);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
			ClearAnimations(playerid);
			SendClientMessage(playerid, COLOR_WHITE, "คุณได้รับ {00FF00}ปลากระพง +1{FFFFFF} ตัว");
			
	    }
	    case 100..130:
	    {
			new id = Inventory_Add(playerid, "ปลาทับทิม", 1);

			if (Inventory_Count(playerid, "ปลาทับทิม") > 20)
			    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณมีจำนวนของสูงสุดแล้ว! นำมันไปขายก่อน");

			if (id == -1)
			    return SendClientMessageEx(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ความจุของกระเป๋าไม่เพียงพอ (%d/%d)", Inventory_Items(playerid), playerData[playerid][pMaxItem]);

			GivePlayerExp(playerid, randexp3);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
			ClearAnimations(playerid);
			SendClientMessage(playerid, COLOR_WHITE, "คุณได้รับ {00FF00}ปลาทับทิม +1{FFFFFF} ตัว");
			
	    }
	    case 131..140:
	    {
			new id = Inventory_Add(playerid, "ปลาดุก", 1);

			if (Inventory_Count(playerid, "ปลาดุก") > 20)
			    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณมีจำนวนของสูงสุดแล้ว! นำมันไปขายก่อน");

			if (id == -1)
			    return SendClientMessageEx(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ความจุของกระเป๋าไม่เพียงพอ (%d/%d)", Inventory_Items(playerid), playerData[playerid][pMaxItem]);

			GivePlayerExp(playerid, randexp3);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
			ClearAnimations(playerid);
			SendClientMessage(playerid, COLOR_WHITE, "คุณได้รับ {00FF00}ปลาดุก +1{FFFFFF} ตัว");
			
	    }
	    case 141..160:
	    {
			new id = Inventory_Add(playerid, "ปลาทูน่า", 1);

			if (Inventory_Count(playerid, "ปลาทูน่า") > 20)
			    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณมีจำนวนของสูงสุดแล้ว! นำมันไปขายก่อน");

			if (id == -1)
			    return SendClientMessageEx(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ความจุของกระเป๋าไม่เพียงพอ (%d/%d)", Inventory_Items(playerid), playerData[playerid][pMaxItem]);

			GivePlayerExp(playerid, randexp4);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
			ClearAnimations(playerid);
			SendClientMessage(playerid, COLOR_WHITE, "คุณได้รับ {00FF00}ปลาทูน่า +1{FFFFFF} ตัว");
			
	    }
	    case 161..170:
	    {
			new id = Inventory_Add(playerid, "ปลาแซลม่อน", 1);

			if (Inventory_Count(playerid, "ปลาแซลม่อน") > 15)
			    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณมีจำนวนของสูงสุดแล้ว! นำมันไปขายก่อน");

			if (id == -1)
			    return SendClientMessageEx(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ความจุของกระเป๋าไม่เพียงพอ (%d/%d)", Inventory_Items(playerid), playerData[playerid][pMaxItem]);

			GivePlayerExp(playerid, randexp4);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
			ClearAnimations(playerid);
			SendClientMessage(playerid, COLOR_WHITE, "คุณได้รับ {00FF00}ปลาแซลม่อน +1{FFFFFF} ตัว");
			
	    }
	    case 171..180:
	    {
			new id = Inventory_Add(playerid, "ปลากระเบน", 1);

			if (Inventory_Count(playerid, "ปลากระเบน") > 10)
			    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณมีจำนวนของสูงสุดแล้ว! นำมันไปขายก่อน");

			if (id == -1)
			    return SendClientMessageEx(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ความจุของกระเป๋าไม่เพียงพอ (%d/%d)", Inventory_Items(playerid), playerData[playerid][pMaxItem]);

			GivePlayerExp(playerid, randexp4);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
			ClearAnimations(playerid);
			SendClientMessage(playerid, COLOR_WHITE, "คุณได้รับ {00FF00}ปลากระเบน +1{FFFFFF} ตัว");
			
	    }
	    case 181..194:
		{
			SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}เสียใจด้วย คุณตกไม่ได้ปลาอะไรเลย!");
			
		}
		case 195..200:
	    {
			new id = Inventory_Add(playerid, "ปลาฉลาม", 1);

			if (Inventory_Count(playerid, "ปลาฉลาม") > 3)
			    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณมีจำนวนของสูงสุดแล้ว! นำมันไปขายก่อน");

			if (id == -1)
			    return SendClientMessageEx(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ความจุของกระเป๋าไม่เพียงพอ (%d/%d)", Inventory_Items(playerid), playerData[playerid][pMaxItem]);

			GivePlayerExp(playerid, randexp5);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
			ClearAnimations(playerid);
			SendClientMessage(playerid, COLOR_WHITE, "คุณได้รับ {00FF00}ปลาฉลาม +1{FFFFFF} ตัว");
			
	    }
	}

	if (auto_farm[playerid] == 1)
	{
		for(new i = 0; i < sizeof(sun_fishData); i++)
		{
			if (IsPlayerInRangeOfPoint(playerid, 3.0, sun_fishData[i][sun_fishPosX], sun_fishData[i][sun_fishPosY], sun_fishData[i][sun_fishPosZ]))
			{

				sun_fishTake[playerid] = 1;
				auto_farm[playerid] = 1;
				//SetPlayerPos(playerid, sun_fishData[i][sun_fishPosX], sun_fishData[i][sun_fishPosY], sun_fishData[i][sun_fishPosZ]);

				new randx = randomEx(100, 200);
				Start_loadType1(playerid, randx, 0, INVALID_OBJECT_ID);
									
				Inventory_Remove(playerid, "เหยื่อ", 1);

				SetPlayerFacingAngle(playerid, sun_fishData[i][sun_fishPosA]);

				ApplyAnimation(playerid, "SWORD", "sword_block", 50.0, 0, 0, 0, 1, 1);
				SetPlayerAttachedObject(playerid, 0, 18632, 6, 0.079376, 0.037070, 0.007706, 181.482910, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000);

				SendClientMessage(playerid, COLOR_YELLOW, "[AUTO FARM!] {FFFFFF}เหวี่ยงเบ็ด...");
				//break;	
			}
		}	
	}
	return 1;
}

hook OnloadType1_Finish(playerid, objectid)
{
	if(sun_fishTake[playerid] == 1)
		sun_fishing_finish(playerid);

	return Y_HOOKS_CONTINUE_RETURN_0;
}

hook OnloadType1_Update(playerid, progress, objectid)
{
	if(sun_fishTake[playerid] == 1)
	{
		ApplyAnimation(playerid, "SWORD", "sword_block", 50.0, 0, 1, 0, 1, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}
	return Y_HOOKS_CONTINUE_RETURN_0;
}
