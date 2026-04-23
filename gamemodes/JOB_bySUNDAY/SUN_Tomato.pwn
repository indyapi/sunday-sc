#include	<YSI_Coding\y_hooks>
#include 	<YSI_Coding\y_timers>

#define     MAX_SUN_TOMATO      		18
#define     SUN_TOMATOOBJECT         644
#define     SUN_TOMATOTEXT           "( JOB : TOMATO ){FFFFFF}[ ใช้ 'N' เพื่อเก็บ ]!"
#define     SUN_TOMATONAME           "มะเขือเทศ"
#define     SUN_TOMATOPACK           "แพ็กมะเขือเทศ"
#define		SUN_TOMATOTIMER      	0

// { "ตะกร้า" },

static SUN_TOMATOTake[MAX_PLAYERS];
static TOMATOActor;
static SUN_TOMATOPack[MAX_PLAYERS];


enum
{
	SUN_TOMATO_STATE_NORMAL,
	SUN_TOMATO_STATE_TAKING
};

enum SUN_TOMATO_DATA
{
    SUN_TOMATOID,
    SUN_TOMATOObject,
    Float: SUN_TOMATOPosX,
	Float: SUN_TOMATOPosY,
	Float: SUN_TOMATOPosZ,
    Text3D: SUN_TOMATO3D,
    SUN_TOMATO3DMSG[80],
    SUN_TOMATOState
};
new const SUN_TOMATOData[MAX_SUN_TOMATO][SUN_TOMATO_DATA] =
{
	{ INVALID_STREAMER_ID, SUN_TOMATOOBJECT, -1077.68628, -917.66766, 128.52660,   Text3D: INVALID_3DTEXT_ID, SUN_TOMATOTEXT, SUN_TOMATO_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_TOMATOOBJECT, -1084.85925, -917.85394, 128.52660,   Text3D: INVALID_3DTEXT_ID, SUN_TOMATOTEXT, SUN_TOMATO_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_TOMATOOBJECT, -1092.37683, -917.73401, 128.52660,   Text3D: INVALID_3DTEXT_ID, SUN_TOMATOTEXT, SUN_TOMATO_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_TOMATOOBJECT, -1099.11523, -917.68323, 128.52660,   Text3D: INVALID_3DTEXT_ID, SUN_TOMATOTEXT, SUN_TOMATO_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_TOMATOOBJECT, -1105.10388, -917.57739, 128.52660,   Text3D: INVALID_3DTEXT_ID, SUN_TOMATOTEXT, SUN_TOMATO_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_TOMATOOBJECT, -1111.82043, -917.63721, 128.52660,   Text3D: INVALID_3DTEXT_ID, SUN_TOMATOTEXT, SUN_TOMATO_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_TOMATOOBJECT, -1077.56262, -924.61517, 128.52660,   Text3D: INVALID_3DTEXT_ID, SUN_TOMATOTEXT, SUN_TOMATO_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_TOMATOOBJECT, -1084.44336, -924.91937, 128.52660,   Text3D: INVALID_3DTEXT_ID, SUN_TOMATOTEXT, SUN_TOMATO_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_TOMATOOBJECT, -1091.95300, -924.67639, 128.52660,   Text3D: INVALID_3DTEXT_ID, SUN_TOMATOTEXT, SUN_TOMATO_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_TOMATOOBJECT, -1098.95117, -924.49774, 128.52660,   Text3D: INVALID_3DTEXT_ID, SUN_TOMATOTEXT, SUN_TOMATO_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_TOMATOOBJECT, -1105.11157, -924.37384, 128.52660,   Text3D: INVALID_3DTEXT_ID, SUN_TOMATOTEXT, SUN_TOMATO_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_TOMATOOBJECT, -1111.73376, -924.28406, 128.52660,   Text3D: INVALID_3DTEXT_ID, SUN_TOMATOTEXT, SUN_TOMATO_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_TOMATOOBJECT, -1077.33826, -930.98456, 128.52660,   Text3D: INVALID_3DTEXT_ID, SUN_TOMATOTEXT, SUN_TOMATO_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_TOMATOOBJECT, -1084.02283, -931.12402, 128.52660,   Text3D: INVALID_3DTEXT_ID, SUN_TOMATOTEXT, SUN_TOMATO_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_TOMATOOBJECT, -1090.90662, -931.58319, 128.52660,   Text3D: INVALID_3DTEXT_ID, SUN_TOMATOTEXT, SUN_TOMATO_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_TOMATOOBJECT, -1098.52441, -931.95715, 128.52660,   Text3D: INVALID_3DTEXT_ID, SUN_TOMATOTEXT, SUN_TOMATO_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_TOMATOOBJECT, -1104.81335, -931.84204, 128.52660,   Text3D: INVALID_3DTEXT_ID, SUN_TOMATOTEXT, SUN_TOMATO_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_TOMATOOBJECT, -1111.66736, -931.24054, 128.52660,   Text3D: INVALID_3DTEXT_ID, SUN_TOMATOTEXT, SUN_TOMATO_STATE_NORMAL }
};

hook OnPlayerConnect(playerid)
{
	SUN_TOMATOTake[playerid] = 0;
	SUN_TOMATOPack[playerid] = 0;
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	if (SUN_TOMATOTake[playerid] != 0)
	{
		if (SUN_TOMATOData[ProgressObject[playerid]][SUN_TOMATOState] == SUN_TOMATO_STATE_TAKING)
		{
			SUN_TOMATOData[ProgressObject[playerid]][SUN_TOMATOState] = SUN_TOMATO_STATE_NORMAL;
			StopProgress(playerid);
		}
	}
	if(SUN_TOMATOPack[playerid] != 0)
	{
	    SUN_TOMATOPack[playerid] = 0;
	    StopProgress(playerid);
	}
	return 1;
}

hook OnGameModeInit()
{
	for(new i = 0; i < sizeof(SUN_TOMATOData); i++)
	{
		SUN_TOMATOData[i][SUN_TOMATOID] = CreateDynamicObject(SUN_TOMATOData[i][SUN_TOMATOObject], SUN_TOMATOData[i][SUN_TOMATOPosX], SUN_TOMATOData[i][SUN_TOMATOPosY], SUN_TOMATOData[i][SUN_TOMATOPosZ], 0.0, 0.0, 0.0);
		SUN_TOMATOData[i][SUN_TOMATO3D] = CreateDynamic3DTextLabel(SUN_TOMATOData[i][SUN_TOMATO3DMSG], COLOR_GREEN, SUN_TOMATOData[i][SUN_TOMATOPosX], SUN_TOMATOData[i][SUN_TOMATOPosY], SUN_TOMATOData[i][SUN_TOMATOPosZ] + 1.5, 5.0);
	}
	//CreateDynamicPickup(1239, 23, 689.7486,-1283.6880,13.5659);
	CreateDynamic3DTextLabel("(SELL:"#SUN_TOMATONAME")\n[ ใช้ 'N' เพื่อขาย]", COLOR_GREEN, 689.7486,-1283.6880,13.5659, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);

    TOMATOActor = CreateActor(15, 689.7486,-1283.6880,13.5659,90.0488);
	ApplyActorAnimation(TOMATOActor, "COP_AMBIENT", "Coplook_loop", 4.1, 0, 1, 1, 1, 1);


    CreateDynamicPickup(1239, 23, -1073.6240,-955.0764,129.4005);
    CreateDynamic3DTextLabel("(SELL:"#SUN_TOMATONAME")\n[ ใช้ 'N' เพื่อแพ็ก]", COLOR_GREEN, -1073.6240,-955.0764,129.4005, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);

	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid))
	{
        for(new i = 0; i < sizeof SUN_TOMATOData; i++)
        {
            GetDynamicObjectPos(SUN_TOMATOData[i][SUN_TOMATOID], SUN_TOMATOData[i][SUN_TOMATOPosX], SUN_TOMATOData[i][SUN_TOMATOPosY], SUN_TOMATOData[i][SUN_TOMATOPosZ]);
            if(IsPlayerInRangeOfPoint(playerid, 3.0, SUN_TOMATOData[i][SUN_TOMATOPosX], SUN_TOMATOData[i][SUN_TOMATOPosY], SUN_TOMATOData[i][SUN_TOMATOPosZ]))
            {
                if(IsValidDynamicObject(SUN_TOMATOData[i][SUN_TOMATOID]) && SUN_TOMATOData[i][SUN_TOMATOState] == SUN_TOMATO_STATE_NORMAL)
                {
					
					if (playerData[playerid][pWorkOn] == i)
					    return SendClientMessage(playerid, COLOR_RED, "[WARNING]: {FFFFFF}ไปเก็บจุดอื่น...!");
					    
                    if(!Inventory_Count(playerid, "ตะกร้า"))
			    		return SendClientMessageEx(playerid, COLOR_LIGHTRED, "[WARNING]: ไม่มี ตะกร้า");
					    
                    if (SUN_TOMATOTake[playerid] != 0)
					    return SendClientMessage(playerid, COLOR_RED, "[WARNING]: {FFFFFF}กำลังเก็บ...!");
					    
					new ammo = Inventory_Count(playerid, SUN_TOMATONAME)+1;
					
					if(ammo > playerData[playerid][pItemAmount])
						return SendClientMessage(playerid, COLOR_RED, "[WARNING] {FFFFFF}{00FF00}"#SUN_TOMATONAME" {FFFFFF}เต็ม เอาไปแพ็กเลย");

					new rand = randomEx(70, 170);
					SUN_TOMATOData[i][SUN_TOMATOState] = SUN_TOMATO_STATE_TAKING;
					Start_loadType1(playerid, rand, 0, i);
					SUN_TOMATOTake[playerid] = 1;
					SendClientMessageEx(playerid, COLOR_YELLOW, "[NEW]: เริ่มเก็บ....");
					break;
                }
            }
        }
        if (IsPlayerInRangeOfPoint(playerid, 2.5, 689.7486,-1283.6880,13.5659))
        {
            Dialog_Show(playerid, DIALOG_SELLSUN_TOMATO, DIALOG_STYLE_TABLIST_HEADERS, "[SELL:"#SUN_TOMATONAME"]", "\
				ชื่อรายการ\tราคา\n\
				"#SUN_TOMATONAME"\t{00FF00}$%d", "ขาย", "ออก", SUN_Jobcash[12]);
        }
        
        if (IsPlayerInRangeOfPoint(playerid, 5.0, -1073.6240,-955.0764,129.4005))
        {
            if(SUN_TOMATOPack[playerid] == 1)
                return SendClientMessageEx(playerid, COLOR_LIGHTRED, "[WARNING]: กำลังแพ็ก....");
            
            new ammo = Inventory_Count(playerid, SUN_TOMATOPACK)+1;
            
            if(ammo > playerData[playerid][pItemAmount])
				return SendClientMessage(playerid, COLOR_RED, "[WARNING] {FFFFFF}{00FF00}"#SUN_TOMATOPACK" {FFFFFF}เต็ม เอาไปขายเลย (/gps > จุดขายสินค้า > ขาย"#SUN_TOMATONAME")");
            
            if(Inventory_Count(playerid, SUN_TOMATONAME)  < 5)
				return SendClientMessage(playerid, COLOR_RED, "[WARNING] {FFFFFF}{00FF00}"#SUN_TOMATONAME" {FFFFFF}ไม่พอ");

            SUN_TOMATOPack[playerid] = 1;
            new rand = randomEx(20, 100);
            Start_loadType1(playerid, rand, 0, INVALID_OBJECT_ID);
        }
	}
	return 1;
}

Dialog:DIALOG_SELLSUN_TOMATO(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
			    new ammo = Inventory_Count(playerid, SUN_TOMATOPACK);
			    new price = ammo*SUN_Jobcash[12];

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_RED, "[WARNING] {FFFFFF}ไม่มี"#SUN_TOMATOPACK"");

		        GivePlayerMoneyEx(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[SELL:"#SUN_TOMATONAME"] {FFFFFF}เงินเขียว +{00FF00}%s {FFFFFF}จากการขาย"#SUN_TOMATOPACK" {00FF00}%d {FFFFFF}แพ็ก", FormatMoney(price), ammo);
				Inventory_Remove(playerid, SUN_TOMATOPACK, ammo);
		    }
		}
	}
	return 1;
}

PlayerSUN_TOMATOUnfreeze(playerid, objectid)
{
	playerData[playerid][pWorkOn] = objectid;
	ClearAnimations(playerid);

	SUN_TOMATOData[objectid][SUN_TOMATOState] = SUN_TOMATO_STATE_NORMAL;
	SUN_TOMATOTake[playerid] = 0;
	
	new id = Inventory_Add(playerid, SUN_TOMATONAME, 1);

	if (id == -1)
	    return SendClientMessageEx(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ความจุของกระเป๋าไม่เพียงพอ (%d/%d)", Inventory_Items(playerid), playerData[playerid][pMaxItem]);

	new giveExp = randomEx(20, 50);
	GivePlayerExp(playerid, giveExp);
    SendClientMessage(playerid, COLOR_GREEN, "[+]{00FF00}"#SUN_TOMATONAME" +1");
    
    return 1;
}

SUN_TOMATOPackFinish(playerid)
{
    new giveExp = randomEx(10, 25);
	GivePlayerExp(playerid, giveExp);
	
	ClearAnimations(playerid);
    SUN_TOMATOPack[playerid] = 0;
    Inventory_Remove(playerid, #SUN_TOMATONAME, 5);
    Inventory_Add(playerid, #SUN_TOMATOPACK, 1);
    SendClientMessageEx(playerid, COLOR_LIGHTRED, "[-]: "#SUN_TOMATONAME" -5");
    SendClientMessageEx(playerid, COLOR_GREEN, "[+]: "#SUN_TOMATOPACK" +1");
	return 1;
}

hook OnloadType1_Finish(playerid, objectid)
{
    if(SUN_TOMATOPack[playerid] == 1)
    	SUN_TOMATOPackFinish(playerid);
    
	if(SUN_TOMATOTake[playerid] == 1)
		PlayerSUN_TOMATOUnfreeze(playerid, objectid);

	return Y_HOOKS_CONTINUE_RETURN_0;
}
hook OnloadType1_Update(playerid, progress, objectid)
{
    if(SUN_TOMATOPack[playerid] == 1)
    {
		ApplyAnimation(playerid, "BD_FIRE","wash_up", 4.1, 1, 0, 0, 0, 1, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}
    
	if(SUN_TOMATOTake[playerid] == 1)
	{
		ApplyAnimation(playerid, "BSKTBALL", "BBALL_Dnk", 4.0, 1, 0, 0, 1, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}

	return Y_HOOKS_CONTINUE_RETURN_0;
}


