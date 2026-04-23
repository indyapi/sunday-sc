#include	<YSI_Coding\y_hooks>
#include 	<YSI_Coding\y_timers>

#define     MAX_SUN_APPLE      	  20
#define     SUN_APPLEOBJECT         792
#define     SUN_APPLETEXT           "( JOB : APPLE ){FFFFFF}[ ใช้ 'N' เพื่อเก็บ ]!"
#define     SUN_APPLENAME           "แอปเปิ้ล"
#define     SUN_APPLEPACK           "แพ็กแอปเปิ้ล"
#define		SUN_APPLETIMER      	  0

// { "ตะกร้า" },

static SUN_APPLETake[MAX_PLAYERS];
static APPLEActor;
static SUN_APPLEPack[MAX_PLAYERS];


enum
{
	SUN_APPLE_STATE_NORMAL,
	SUN_APPLE_STATE_TAKING
};

enum SUN_APPLE_DATA
{
    SUN_APPLEID,
    SUN_APPLEObject,
    Float: SUN_APPLEPosX,
	Float: SUN_APPLEPosY,
	Float: SUN_APPLEPosZ,
    Text3D: SUN_APPLE3D,
    SUN_APPLE3DMSG[80],
    SUN_APPLEState
};
new const SUN_APPLEData[MAX_SUN_APPLE][SUN_APPLE_DATA] =
{
	{ INVALID_STREAMER_ID, SUN_APPLEOBJECT, -1013.60040, -1055.15381, 128.39709,   Text3D: INVALID_3DTEXT_ID, SUN_APPLETEXT, SUN_APPLE_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_APPLEOBJECT, -1013.59167, -1046.88525, 128.39709,   Text3D: INVALID_3DTEXT_ID, SUN_APPLETEXT, SUN_APPLE_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_APPLEOBJECT, -1013.62573, -1037.94958, 128.39709,   Text3D: INVALID_3DTEXT_ID, SUN_APPLETEXT, SUN_APPLE_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_APPLEOBJECT, -1013.30005, -1029.93689, 128.39709,   Text3D: INVALID_3DTEXT_ID, SUN_APPLETEXT, SUN_APPLE_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_APPLEOBJECT, -1013.40118, -1019.59778, 128.39709,   Text3D: INVALID_3DTEXT_ID, SUN_APPLETEXT, SUN_APPLE_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_APPLEOBJECT, -1022.92053, -1055.16614, 128.39709,   Text3D: INVALID_3DTEXT_ID, SUN_APPLETEXT, SUN_APPLE_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_APPLEOBJECT, -1022.76715, -1046.87805, 128.39709,   Text3D: INVALID_3DTEXT_ID, SUN_APPLETEXT, SUN_APPLE_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_APPLEOBJECT, -1022.55310, -1037.87122, 128.39709,   Text3D: INVALID_3DTEXT_ID, SUN_APPLETEXT, SUN_APPLE_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_APPLEOBJECT, -1022.42334, -1029.78882, 128.39709,   Text3D: INVALID_3DTEXT_ID, SUN_APPLETEXT, SUN_APPLE_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_APPLEOBJECT, -1022.39966, -1019.40094, 128.39709,   Text3D: INVALID_3DTEXT_ID, SUN_APPLETEXT, SUN_APPLE_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_APPLEOBJECT, -1030.49573, -1055.27295, 128.39709,   Text3D: INVALID_3DTEXT_ID, SUN_APPLETEXT, SUN_APPLE_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_APPLEOBJECT, -1030.55554, -1046.69531, 128.39709,   Text3D: INVALID_3DTEXT_ID, SUN_APPLETEXT, SUN_APPLE_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_APPLEOBJECT, -1030.21826, -1037.66736, 128.39709,   Text3D: INVALID_3DTEXT_ID, SUN_APPLETEXT, SUN_APPLE_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_APPLEOBJECT, -1030.00610, -1029.76917, 128.39709,   Text3D: INVALID_3DTEXT_ID, SUN_APPLETEXT, SUN_APPLE_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_APPLEOBJECT, -1029.82007, -1019.22119, 128.39709,   Text3D: INVALID_3DTEXT_ID, SUN_APPLETEXT, SUN_APPLE_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_APPLEOBJECT, -1037.72571, -1019.04211, 128.39709,   Text3D: INVALID_3DTEXT_ID, SUN_APPLETEXT, SUN_APPLE_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_APPLEOBJECT, -1037.71533, -1030.33154, 128.39709,   Text3D: INVALID_3DTEXT_ID, SUN_APPLETEXT, SUN_APPLE_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_APPLEOBJECT, -1038.97668, -1037.42725, 128.39709,   Text3D: INVALID_3DTEXT_ID, SUN_APPLETEXT, SUN_APPLE_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_APPLEOBJECT, -1038.32788, -1046.22253, 128.39709,   Text3D: INVALID_3DTEXT_ID, SUN_APPLETEXT, SUN_APPLE_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_APPLEOBJECT, -1038.72156, -1054.81018, 128.39709,   Text3D: INVALID_3DTEXT_ID, SUN_APPLETEXT, SUN_APPLE_STATE_NORMAL }
};

hook OnPlayerConnect(playerid)
{
	SUN_APPLETake[playerid] = 0;
	SUN_APPLEPack[playerid] = 0;
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	if (SUN_APPLETake[playerid] != 0)
	{
		if (SUN_APPLEData[ProgressObject[playerid]][SUN_APPLEState] == SUN_APPLE_STATE_TAKING)
		{
			SUN_APPLEData[ProgressObject[playerid]][SUN_APPLEState] = SUN_APPLE_STATE_NORMAL;
			StopProgress(playerid);
		}
	}
	if(SUN_APPLEPack[playerid] != 0)
	{
	    SUN_APPLEPack[playerid] = 0;
	    StopProgress(playerid);
	}
	return 1;
}

hook OnGameModeInit()
{
	for(new i = 0; i < sizeof(SUN_APPLEData); i++)
	{
		SUN_APPLEData[i][SUN_APPLEID] = CreateDynamicObject(SUN_APPLEData[i][SUN_APPLEObject], SUN_APPLEData[i][SUN_APPLEPosX], SUN_APPLEData[i][SUN_APPLEPosY], SUN_APPLEData[i][SUN_APPLEPosZ], 0.0, 0.0, 0.0);
		SUN_APPLEData[i][SUN_APPLE3D] = CreateDynamic3DTextLabel(SUN_APPLEData[i][SUN_APPLE3DMSG], COLOR_GREEN, SUN_APPLEData[i][SUN_APPLEPosX], SUN_APPLEData[i][SUN_APPLEPosY], SUN_APPLEData[i][SUN_APPLEPosZ] + 1.5, 5.0);
	}
	//CreateDynamicPickup(1239, 23, 689.7172,-1270.1031,13.5594);
	CreateDynamic3DTextLabel("(SELL:"#SUN_APPLENAME")\n[ ใช้ 'N' เพื่อขาย]", COLOR_GREEN, 689.7466,-1301.2974,13.5960, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);

    APPLEActor = CreateActor(27, 689.7466,-1301.2974,13.5960,83.7119);
	ApplyActorAnimation(APPLEActor, "COP_AMBIENT", "Coplook_loop", 4.1, 0, 1, 1, 1, 1);


    CreateDynamicPickup(1239, 23, -1054.5399,-1058.0518,129.4005);
    CreateDynamic3DTextLabel("(SELL:"#SUN_APPLENAME")\n[ ใช้ 'N' เพื่อแพ็ก]", COLOR_GREEN, -1054.5399,-1058.0518,129.4005, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);

	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid))
	{
        for(new i = 0; i < sizeof SUN_APPLEData; i++)
        {
            GetDynamicObjectPos(SUN_APPLEData[i][SUN_APPLEID], SUN_APPLEData[i][SUN_APPLEPosX], SUN_APPLEData[i][SUN_APPLEPosY], SUN_APPLEData[i][SUN_APPLEPosZ]);
            if(IsPlayerInRangeOfPoint(playerid, 3.0, SUN_APPLEData[i][SUN_APPLEPosX], SUN_APPLEData[i][SUN_APPLEPosY], SUN_APPLEData[i][SUN_APPLEPosZ]))
            {
                if(IsValidDynamicObject(SUN_APPLEData[i][SUN_APPLEID]) && SUN_APPLEData[i][SUN_APPLEState] == SUN_APPLE_STATE_NORMAL)
                {
					
					if (playerData[playerid][pWorkOn] == i)
					    return SendClientMessage(playerid, COLOR_RED, "[WARNING]: {FFFFFF}ไปเก็บจุดอื่น...!");
					    
                    if(!Inventory_Count(playerid, "ตะกร้า"))
			    		return SendClientMessageEx(playerid, COLOR_LIGHTRED, "[WARNING]: ไม่มี ตะกร้า");
					    
                    if (SUN_APPLETake[playerid] != 0)
					    return SendClientMessage(playerid, COLOR_RED, "[WARNING]: {FFFFFF}กำลังเก็บ...!");
					    
					new ammo = Inventory_Count(playerid, SUN_APPLENAME)+1;
					
					if(ammo > playerData[playerid][pItemAmount])
						return SendClientMessage(playerid, COLOR_RED, "[WARNING] {FFFFFF}{00FF00}"#SUN_APPLENAME" {FFFFFF}เต็ม เอาไปแพ็กเลย");

					new rand = randomEx(70, 170);
					SUN_APPLEData[i][SUN_APPLEState] = SUN_APPLE_STATE_TAKING;
					Start_loadType1(playerid, rand, 0, i);
					SUN_APPLETake[playerid] = 1;
					SendClientMessageEx(playerid, COLOR_YELLOW, "[NEW]: เริ่มเก็บ....");
					break;
                }
            }
        }
        if (IsPlayerInRangeOfPoint(playerid, 2.5, 689.7466,-1301.2974,13.5960))
        {
            Dialog_Show(playerid, DIALOG_SELLSUN_APPLE, DIALOG_STYLE_TABLIST_HEADERS, "[SELL:"#SUN_APPLENAME"]", "\
				ชื่อรายการ\tราคา\n\
				"#SUN_APPLENAME"\t{00FF00}$%d", "ขาย", "ออก", SUN_Jobcash[15]);
        }
        
        if (IsPlayerInRangeOfPoint(playerid, 5.0, -1054.5399,-1058.0518,129.4005))
        {
            if(SUN_APPLEPack[playerid] == 1)
                return SendClientMessageEx(playerid, COLOR_LIGHTRED, "[WARNING]: กำลังแพ็ก....");
            
            new ammo = Inventory_Count(playerid, SUN_APPLEPACK)+1;
            
            if(ammo > playerData[playerid][pItemAmount])
				return SendClientMessage(playerid, COLOR_RED, "[WARNING] {FFFFFF}{00FF00}"#SUN_APPLEPACK" {FFFFFF}เต็ม เอาไปขายเลย (/gps > จุดขายสินค้า > ขาย"#SUN_APPLENAME")");
            
            if(Inventory_Count(playerid, SUN_APPLENAME)  < 5)
				return SendClientMessage(playerid, COLOR_RED, "[WARNING] {FFFFFF}{00FF00}"#SUN_APPLENAME" {FFFFFF}ไม่พอ");

            SUN_APPLEPack[playerid] = 1;
            new rand = randomEx(20, 100);
            Start_loadType1(playerid, rand, 0, INVALID_OBJECT_ID);
        }
	}
	return 1;
}

Dialog:DIALOG_SELLSUN_APPLE(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
			    new ammo = Inventory_Count(playerid, SUN_APPLEPACK);
			    new price = ammo*SUN_Jobcash[15];

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_RED, "[WARNING] {FFFFFF}ไม่มี"#SUN_APPLEPACK"");

		        GivePlayerMoneyEx(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[SELL:"#SUN_APPLENAME"] {FFFFFF}เงินเขียว +{00FF00}%s {FFFFFF}จากการขาย"#SUN_APPLEPACK" {00FF00}%d {FFFFFF}แพ็ก", FormatMoney(price), ammo);
				Inventory_Remove(playerid, SUN_APPLEPACK, ammo);
		    }
		}
	}
	return 1;
}

PlayerSUN_APPLEUnfreeze(playerid, objectid)
{
	playerData[playerid][pWorkOn] = objectid;
	ClearAnimations(playerid);

	SUN_APPLEData[objectid][SUN_APPLEState] = SUN_APPLE_STATE_NORMAL;
	SUN_APPLETake[playerid] = 0;
	
	new id = Inventory_Add(playerid, SUN_APPLENAME, 1);

	if (id == -1)
	    return SendClientMessageEx(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ความจุของกระเป๋าไม่เพียงพอ (%d/%d)", Inventory_Items(playerid), playerData[playerid][pMaxItem]);

	new giveExp = randomEx(20, 50);
	GivePlayerExp(playerid, giveExp);
    SendClientMessage(playerid, COLOR_GREEN, "[+]{00FF00}"#SUN_APPLENAME" +1");
    
    return 1;
}

SUN_APPLEPackFinish(playerid)
{
    new giveExp = randomEx(10, 25);
	GivePlayerExp(playerid, giveExp);
	
	ClearAnimations(playerid);
    SUN_APPLEPack[playerid] = 0;
    Inventory_Remove(playerid, #SUN_APPLENAME, 5);
    Inventory_Add(playerid, #SUN_APPLEPACK, 1);
    SendClientMessageEx(playerid, COLOR_LIGHTRED, "[-]: "#SUN_APPLENAME" -5");
    SendClientMessageEx(playerid, COLOR_GREEN, "[+]: "#SUN_APPLEPACK" +1");
	return 1;
}

hook OnloadType1_Finish(playerid, objectid)
{
    if(SUN_APPLEPack[playerid] == 1)
    	SUN_APPLEPackFinish(playerid);
    
	if(SUN_APPLETake[playerid] == 1)
		PlayerSUN_APPLEUnfreeze(playerid, objectid);

	return Y_HOOKS_CONTINUE_RETURN_0;
}
hook OnloadType1_Update(playerid, progress, objectid)
{
    if(SUN_APPLEPack[playerid] == 1)
    {
		ApplyAnimation(playerid, "BD_FIRE","wash_up", 4.1, 1, 0, 0, 0, 1, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}
    
	if(SUN_APPLETake[playerid] == 1)
	{
		ApplyAnimation(playerid, "BSKTBALL", "BBALL_Dnk", 4.0, 1, 0, 0, 1, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}

	return Y_HOOKS_CONTINUE_RETURN_0;
}


