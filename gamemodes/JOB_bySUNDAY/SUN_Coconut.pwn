#include	<YSI_Coding\y_hooks>
#include 	<YSI_Coding\y_timers>

#define     MAX_SUN_COCONUT         10
#define     SUN_COCONUTOBJECT         620
#define     SUN_COCONUTTEXT           "( JOB : COCONUT ){FFFFFF}[ ใช้ 'N' เพื่อเก็บ ]!"
#define     SUN_COCONUTNAME           "มะพร้าว"
#define     SUN_COCONUTPACK           "แพ็กมะพร้าว"
#define		SUN_COCONUTTIMER      	  0

// { "ตะกร้า" },

static SUN_COCONUTTake[MAX_PLAYERS];
static COCONUTActor;
static SUN_COCONUTPack[MAX_PLAYERS];


enum
{
	SUN_COCONUT_STATE_NORMAL,
	SUN_COCONUT_STATE_TAKING
};

enum SUN_COCONUT_DATA
{
    SUN_COCONUTID,
    SUN_COCONUTObject,
    Float: SUN_COCONUTPosX,
	Float: SUN_COCONUTPosY,
	Float: SUN_COCONUTPosZ,
    Text3D: SUN_COCONUT3D,
    SUN_COCONUT3DMSG[80],
    SUN_COCONUTState
};
new const SUN_COCONUTData[MAX_SUN_COCONUT][SUN_COCONUT_DATA] =
{
	{ INVALID_STREAMER_ID, SUN_COCONUTOBJECT, 689.7466, -1301.2974, 13.5960, Text3D: INVALID_3DTEXT_ID, SUN_COCONUTTEXT, SUN_COCONUT_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_COCONUTOBJECT, -1042.7891, -1001.3947, 129.2188, Text3D: INVALID_3DTEXT_ID, SUN_COCONUTTEXT, SUN_COCONUT_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_COCONUTOBJECT, -1029.0374, -1001.7350, 129.2126, Text3D: INVALID_3DTEXT_ID, SUN_COCONUTTEXT, SUN_COCONUT_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_COCONUTOBJECT, -1015.8328, -1001.8414, 129.2126, Text3D: INVALID_3DTEXT_ID, SUN_COCONUTTEXT, SUN_COCONUT_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_COCONUTOBJECT, -1014.8762, -985.6601, 129.2188, Text3D: INVALID_3DTEXT_ID, SUN_COCONUTTEXT, SUN_COCONUT_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_COCONUTOBJECT, -1027.5660, -986.2614, 129.2126, Text3D: INVALID_3DTEXT_ID, SUN_COCONUTTEXT, SUN_COCONUT_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_COCONUTOBJECT, -1041.2897, -986.3354,  129.2188, Text3D: INVALID_3DTEXT_ID, SUN_COCONUTTEXT, SUN_COCONUT_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_COCONUTOBJECT, -1042.2762, -969.0147, 129.2188, Text3D: INVALID_3DTEXT_ID, SUN_COCONUTTEXT, SUN_COCONUT_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_COCONUTOBJECT, -1028.8815, -969.1156, 129.2188, Text3D: INVALID_3DTEXT_ID, SUN_COCONUTTEXT, SUN_COCONUT_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_COCONUTOBJECT, -1015.1091, -970.2184, 129.2188, Text3D: INVALID_3DTEXT_ID, SUN_COCONUTTEXT, SUN_COCONUT_STATE_NORMAL }
};

hook OnPlayerConnect(playerid)
{
	SUN_COCONUTTake[playerid] = 0;
	SUN_COCONUTPack[playerid] = 0;
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	if (SUN_COCONUTTake[playerid] != 0)
	{
		if (SUN_COCONUTData[ProgressObject[playerid]][SUN_COCONUTState] == SUN_COCONUT_STATE_TAKING)
		{
			SUN_COCONUTData[ProgressObject[playerid]][SUN_COCONUTState] = SUN_COCONUT_STATE_NORMAL;
			StopProgress(playerid);
		}
	}
	if(SUN_COCONUTPack[playerid] != 0)
	{
	    SUN_COCONUTPack[playerid] = 0;
	    StopProgress(playerid);
	}
	return 1;
}

hook OnGameModeInit()
{
	for(new i = 0; i < sizeof(SUN_COCONUTData); i++)
	{
		SUN_COCONUTData[i][SUN_COCONUTID] = CreateDynamicObject(SUN_COCONUTData[i][SUN_COCONUTObject], SUN_COCONUTData[i][SUN_COCONUTPosX], SUN_COCONUTData[i][SUN_COCONUTPosY], SUN_COCONUTData[i][SUN_COCONUTPosZ], 0.0, 0.0, 0.0);
		SUN_COCONUTData[i][SUN_COCONUT3D] = CreateDynamic3DTextLabel(SUN_COCONUTData[i][SUN_COCONUT3DMSG], COLOR_GREEN, SUN_COCONUTData[i][SUN_COCONUTPosX], SUN_COCONUTData[i][SUN_COCONUTPosY], SUN_COCONUTData[i][SUN_COCONUTPosZ] + 1.5, 5.0);
	}
	//CreateDynamicPickup(1239, 23, 689.7172,-1270.1031,13.5594);
	CreateDynamic3DTextLabel("(SELL:"#SUN_COCONUTNAME")\n[ ใช้ 'N' เพื่อขาย]", COLOR_GREEN, 689.7349,-1253.8657,13.6174, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);

    COCONUTActor = CreateActor(30, 689.7349,-1253.8657,13.6174,91.5920);
	ApplyActorAnimation(COCONUTActor, "COP_AMBIENT", "Coplook_loop", 4.1, 0, 1, 1, 1, 1);


    CreateDynamicPickup(1239, 23, -1052.6508,-1006.7433,129.4005);
    CreateDynamic3DTextLabel("(SELL:"#SUN_COCONUTNAME")\n[ ใช้ 'N' เพื่อแพ็ก]", COLOR_GREEN, -1052.6508,-1006.7433,129.4005, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);

	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid))
	{
        for(new i = 0; i < sizeof SUN_COCONUTData; i++)
        {
            GetDynamicObjectPos(SUN_COCONUTData[i][SUN_COCONUTID], SUN_COCONUTData[i][SUN_COCONUTPosX], SUN_COCONUTData[i][SUN_COCONUTPosY], SUN_COCONUTData[i][SUN_COCONUTPosZ]);
            if(IsPlayerInRangeOfPoint(playerid, 3.0, SUN_COCONUTData[i][SUN_COCONUTPosX], SUN_COCONUTData[i][SUN_COCONUTPosY], SUN_COCONUTData[i][SUN_COCONUTPosZ]))
            {
                if(IsValidDynamicObject(SUN_COCONUTData[i][SUN_COCONUTID]) && SUN_COCONUTData[i][SUN_COCONUTState] == SUN_COCONUT_STATE_NORMAL)
                {
					
					if (playerData[playerid][pWorkOn] == i)
					    return SendClientMessage(playerid, COLOR_RED, "[WARNING]: {FFFFFF}ไปเก็บจุดอื่น...!");
					    
                    if(!Inventory_Count(playerid, "ตะกร้า"))
			    		return SendClientMessageEx(playerid, COLOR_LIGHTRED, "[WARNING]: ไม่มี ตะกร้า");
					    
                    if (SUN_COCONUTTake[playerid] != 0)
					    return SendClientMessage(playerid, COLOR_RED, "[WARNING]: {FFFFFF}กำลังเก็บ...!");
					    
					new ammo = Inventory_Count(playerid, SUN_COCONUTNAME)+1;
					
					if(ammo > playerData[playerid][pItemAmount])
						return SendClientMessage(playerid, COLOR_RED, "[WARNING] {FFFFFF}{00FF00}"#SUN_COCONUTNAME" {FFFFFF}เต็ม เอาไปแพ็กเลย");

					new rand = randomEx(70, 170);
					SUN_COCONUTData[i][SUN_COCONUTState] = SUN_COCONUT_STATE_TAKING;
					Start_loadType1(playerid, rand, 0, i);
					SUN_COCONUTTake[playerid] = 1;
					SendClientMessageEx(playerid, COLOR_YELLOW, "[NEW]: เริ่มเก็บ....");
					break;
                }
            }
        }
        if (IsPlayerInRangeOfPoint(playerid, 2.5, 689.7349,-1253.8657,13.6174))
        {
            Dialog_Show(playerid, DIALOG_SELLSUN_COCONUT, DIALOG_STYLE_TABLIST_HEADERS, "[SELL:"#SUN_COCONUTNAME"]", "\
				ชื่อรายการ\tราคา\n\
				"#SUN_COCONUTNAME"\t{00FF00}$%d", "ขาย", "ออก", SUN_Jobcash[14]);
        }
        
        if (IsPlayerInRangeOfPoint(playerid, 5.0, -1052.6508,-1006.7433,129.4005))
        {
            if(SUN_COCONUTPack[playerid] == 1)
                return SendClientMessageEx(playerid, COLOR_LIGHTRED, "[WARNING]: กำลังแพ็ก....");
            
            new ammo = Inventory_Count(playerid, SUN_COCONUTPACK)+1;
            
            if(ammo > playerData[playerid][pItemAmount])
				return SendClientMessage(playerid, COLOR_RED, "[WARNING] {FFFFFF}{00FF00}"#SUN_COCONUTPACK" {FFFFFF}เต็ม เอาไปขายเลย (/gps > จุดขายสินค้า> ขาย"#SUN_COCONUTNAME")");
            
            if(Inventory_Count(playerid, SUN_COCONUTNAME)  < 5)
				return SendClientMessage(playerid, COLOR_RED, "[WARNING] {FFFFFF}{00FF00}"#SUN_COCONUTNAME" {FFFFFF}ไม่พอ");

            SUN_COCONUTPack[playerid] = 1;
            new rand = randomEx(20, 100);
            Start_loadType1(playerid, rand, 0, INVALID_OBJECT_ID);
        }
	}
	return 1;
}

Dialog:DIALOG_SELLSUN_COCONUT(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
			    new ammo = Inventory_Count(playerid, SUN_COCONUTPACK);
			    new price = ammo*SUN_Jobcash[14];

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_RED, "[WARNING] {FFFFFF}ไม่มี"#SUN_COCONUTPACK"");

		        GivePlayerMoneyEx(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[SELL:"#SUN_COCONUTNAME"] {FFFFFF}เงินเขียว +{00FF00}%s {FFFFFF}จากการขาย"#SUN_COCONUTPACK" {00FF00}%d {FFFFFF}แพ็ก", FormatMoney(price), ammo);
				Inventory_Remove(playerid, SUN_COCONUTPACK, ammo);
		    }
		}
	}
	return 1;
}

PlayerSUN_COCONUTUnfreeze(playerid, objectid)
{
	playerData[playerid][pWorkOn] = objectid;
	ClearAnimations(playerid);

	SUN_COCONUTData[objectid][SUN_COCONUTState] = SUN_COCONUT_STATE_NORMAL;
	SUN_COCONUTTake[playerid] = 0;
	
	new id = Inventory_Add(playerid, SUN_COCONUTNAME, 1);

	if (id == -1)
	    return SendClientMessageEx(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ความจุของกระเป๋าไม่เพียงพอ (%d/%d)", Inventory_Items(playerid), playerData[playerid][pMaxItem]);

	new giveExp = randomEx(20, 50);
	GivePlayerExp(playerid, giveExp);
    SendClientMessage(playerid, COLOR_GREEN, "[+]{00FF00}"#SUN_COCONUTNAME" +1");
    
    return 1;
}

SUN_COCONUTPackFinish(playerid)
{
    new giveExp = randomEx(10, 25);
	GivePlayerExp(playerid, giveExp);
	
	ClearAnimations(playerid);
    SUN_COCONUTPack[playerid] = 0;
    Inventory_Remove(playerid, #SUN_COCONUTNAME, 5);
    Inventory_Add(playerid, #SUN_COCONUTPACK, 1);
    SendClientMessageEx(playerid, COLOR_LIGHTRED, "[-]: "#SUN_COCONUTNAME" -5");
    SendClientMessageEx(playerid, COLOR_GREEN, "[+]: "#SUN_COCONUTPACK" +1");
	return 1;
}

hook OnloadType1_Finish(playerid, objectid)
{
    if(SUN_COCONUTPack[playerid] == 1)
    	SUN_COCONUTPackFinish(playerid);
    
	if(SUN_COCONUTTake[playerid] == 1)
		PlayerSUN_COCONUTUnfreeze(playerid, objectid);

	return Y_HOOKS_CONTINUE_RETURN_0;
}
hook OnloadType1_Update(playerid, progress, objectid)
{
    if(SUN_COCONUTPack[playerid] == 1)
    {
		ApplyAnimation(playerid, "BD_FIRE","wash_up", 4.1, 1, 0, 0, 0, 1, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}
    
	if(SUN_COCONUTTake[playerid] == 1)
	{
		ApplyAnimation(playerid, "BSKTBALL", "BBALL_Dnk", 4.0, 1, 0, 0, 1, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}

	return Y_HOOKS_CONTINUE_RETURN_0;
}


