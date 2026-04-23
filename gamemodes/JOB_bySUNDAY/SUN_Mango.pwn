#include	<YSI_Coding\y_hooks>
#include 	<YSI_Coding\y_timers>

#define     MAX_SUN_MANGO      		24
#define     SUN_MANGOOBJECT         669
#define     SUN_MANGOTEXT           "( JOB : MANGO ){FFFFFF}[ ใช้ 'N' เพื่อเก็บ ]!"
#define     SUN_MANGONAME           "มะม่วง"
#define     SUN_MANGOPACK           "แพ็กมะม่วง"
#define		SUN_MANGOTIMER      	0

// { "ตะกร้า" },

static SUN_MANGOTake[MAX_PLAYERS];
static MangoActor;
static SUN_MANGOPack[MAX_PLAYERS];


enum
{
	SUN_MANGO_STATE_NORMAL,
	SUN_MANGO_STATE_TAKING
};

enum SUN_MANGO_DATA
{
    SUN_MANGOID,
    SUN_MANGOObject,
    Float: SUN_MANGOPosX,
	Float: SUN_MANGOPosY,
	Float: SUN_MANGOPosZ,
    Text3D: SUN_MANGO3D,
    SUN_MANGO3DMSG[80],
    SUN_MANGOState
};
new const SUN_MANGOData[MAX_SUN_MANGO][SUN_MANGO_DATA] =
{
	{ INVALID_STREAMER_ID, SUN_MANGOOBJECT, -1124.98010, -915.51508, 126.38094,   Text3D: INVALID_3DTEXT_ID, SUN_MANGOTEXT, SUN_MANGO_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_MANGOOBJECT, -1132.53223, -915.55841, 126.38090,   Text3D: INVALID_3DTEXT_ID, SUN_MANGOTEXT, SUN_MANGO_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_MANGOOBJECT, -1140.59814, -915.66626, 126.38090,   Text3D: INVALID_3DTEXT_ID, SUN_MANGOTEXT, SUN_MANGO_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_MANGOOBJECT, -1147.64502, -915.81470, 126.38090,   Text3D: INVALID_3DTEXT_ID, SUN_MANGOTEXT, SUN_MANGO_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_MANGOOBJECT, -1155.54199, -916.08563, 126.38090,   Text3D: INVALID_3DTEXT_ID, SUN_MANGOTEXT, SUN_MANGO_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_MANGOOBJECT, -1163.22827, -916.42303, 126.38090,   Text3D: INVALID_3DTEXT_ID, SUN_MANGOTEXT, SUN_MANGO_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_MANGOOBJECT, -1125.02368, -923.06165, 126.38090,   Text3D: INVALID_3DTEXT_ID, SUN_MANGOTEXT, SUN_MANGO_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_MANGOOBJECT, -1132.42578, -923.09949, 126.38090,   Text3D: INVALID_3DTEXT_ID, SUN_MANGOTEXT, SUN_MANGO_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_MANGOOBJECT, -1140.44189, -923.58368, 126.38090,   Text3D: INVALID_3DTEXT_ID, SUN_MANGOTEXT, SUN_MANGO_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_MANGOOBJECT, -1147.62402, -923.41602, 126.38090,   Text3D: INVALID_3DTEXT_ID, SUN_MANGOTEXT, SUN_MANGO_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_MANGOOBJECT, -1155.69666, -923.26105, 126.38090,   Text3D: INVALID_3DTEXT_ID, SUN_MANGOTEXT, SUN_MANGO_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_MANGOOBJECT, -1162.74854, -923.67719, 126.38090,   Text3D: INVALID_3DTEXT_ID, SUN_MANGOTEXT, SUN_MANGO_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_MANGOOBJECT, -1125.05115, -930.20673, 126.38090,   Text3D: INVALID_3DTEXT_ID, SUN_MANGOTEXT, SUN_MANGO_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_MANGOOBJECT, -1132.12439, -930.06323, 126.38090,   Text3D: INVALID_3DTEXT_ID, SUN_MANGOTEXT, SUN_MANGO_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_MANGOOBJECT, -1140.17261, -930.20203, 126.38090,   Text3D: INVALID_3DTEXT_ID, SUN_MANGOTEXT, SUN_MANGO_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_MANGOOBJECT, -1147.75464, -930.34485, 126.38090,   Text3D: INVALID_3DTEXT_ID, SUN_MANGOTEXT, SUN_MANGO_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_MANGOOBJECT, -1155.44153, -930.43286, 126.38090,   Text3D: INVALID_3DTEXT_ID, SUN_MANGOTEXT, SUN_MANGO_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_MANGOOBJECT, -1162.25696, -930.64789, 126.38090,   Text3D: INVALID_3DTEXT_ID, SUN_MANGOTEXT, SUN_MANGO_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_MANGOOBJECT, -1125.01709, -936.47980, 126.38090,   Text3D: INVALID_3DTEXT_ID, SUN_MANGOTEXT, SUN_MANGO_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_MANGOOBJECT, -1132.18213, -936.77814, 126.38090,   Text3D: INVALID_3DTEXT_ID, SUN_MANGOTEXT, SUN_MANGO_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_MANGOOBJECT,  -1140.09180, -936.72943, 126.38090,   Text3D: INVALID_3DTEXT_ID, SUN_MANGOTEXT, SUN_MANGO_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_MANGOOBJECT,  -1147.62756, -936.98260, 126.38090,   Text3D: INVALID_3DTEXT_ID, SUN_MANGOTEXT, SUN_MANGO_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_MANGOOBJECT,  -1155.08252, -937.04724, 126.38090,   Text3D: INVALID_3DTEXT_ID, SUN_MANGOTEXT, SUN_MANGO_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_MANGOOBJECT,  -1161.74438, -937.08081, 126.38090,   Text3D: INVALID_3DTEXT_ID, SUN_MANGOTEXT, SUN_MANGO_STATE_NORMAL }
};

hook OnPlayerConnect(playerid)
{
	SUN_MANGOTake[playerid] = 0;
	SUN_MANGOPack[playerid] = 0;
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	if (SUN_MANGOTake[playerid] != 0)
	{
		if (SUN_MANGOData[ProgressObject[playerid]][SUN_MANGOState] == SUN_MANGO_STATE_TAKING)
		{
			SUN_MANGOData[ProgressObject[playerid]][SUN_MANGOState] = SUN_MANGO_STATE_NORMAL;
			StopProgress(playerid);
		}
	}
	if(SUN_MANGOPack[playerid] != 0)
	{
	    SUN_MANGOPack[playerid] = 0;
	    StopProgress(playerid);
	}
	return 1;
}

hook OnGameModeInit()
{
	for(new i = 0; i < sizeof(SUN_MANGOData); i++)
	{
		SUN_MANGOData[i][SUN_MANGOID] = CreateDynamicObject(SUN_MANGOData[i][SUN_MANGOObject], SUN_MANGOData[i][SUN_MANGOPosX], SUN_MANGOData[i][SUN_MANGOPosY], SUN_MANGOData[i][SUN_MANGOPosZ], 0.0, 0.0, 0.0);
		SUN_MANGOData[i][SUN_MANGO3D] = CreateDynamic3DTextLabel(SUN_MANGOData[i][SUN_MANGO3DMSG], COLOR_GREEN, SUN_MANGOData[i][SUN_MANGOPosX], SUN_MANGOData[i][SUN_MANGOPosY], SUN_MANGOData[i][SUN_MANGOPosZ] + 1.5, 5.0);
	}
	//CreateDynamicPickup(1239, 23, 672.9932,-1275.4833,13.6333);
	CreateDynamic3DTextLabel("(SELL:"#SUN_MANGONAME")\n[ ใช้ 'N' เพื่อขาย]", COLOR_GREEN, 672.9932,-1275.4833,13.6333, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);

    CreateDynamicPickup(1239, 23, -1124.1614,-955.5469,129.4005);
    CreateDynamic3DTextLabel("(SELL:"#SUN_MANGONAME")\n[ ใช้ 'N' เพื่อแพ็ก]", COLOR_GREEN, -1124.1614,-955.5469,129.4005, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);

	MangoActor = CreateActor(1, 672.9932,-1275.4833,13.6333,267.6405);
	ApplyActorAnimation(MangoActor, "COP_AMBIENT", "Coplook_loop", 4.1, 0, 1, 1, 1, 1);

	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid))
	{
        for(new i = 0; i < sizeof SUN_MANGOData; i++)
        {
            GetDynamicObjectPos(SUN_MANGOData[i][SUN_MANGOID], SUN_MANGOData[i][SUN_MANGOPosX], SUN_MANGOData[i][SUN_MANGOPosY], SUN_MANGOData[i][SUN_MANGOPosZ]);
            if(IsPlayerInRangeOfPoint(playerid, 3.0, SUN_MANGOData[i][SUN_MANGOPosX], SUN_MANGOData[i][SUN_MANGOPosY], SUN_MANGOData[i][SUN_MANGOPosZ]))
            {
                if(IsValidDynamicObject(SUN_MANGOData[i][SUN_MANGOID]) && SUN_MANGOData[i][SUN_MANGOState] == SUN_MANGO_STATE_NORMAL)
                {
					
					if (playerData[playerid][pWorkOn] == i)
					    return SendClientMessage(playerid, COLOR_RED, "[WARNING]: {FFFFFF}ไปเก็บจุดอื่น...!");
					    
                    if(!Inventory_Count(playerid, "ตะกร้า"))
			    		return SendClientMessageEx(playerid, COLOR_LIGHTRED, "[WARNING]: ไม่มี ตะกร้า");
					    
                    if (SUN_MANGOTake[playerid] != 0)
					    return SendClientMessage(playerid, COLOR_RED, "[WARNING]: {FFFFFF}กำลังเก็บ...!");
					    
					new ammo = Inventory_Count(playerid, SUN_MANGONAME)+1;
					
					if(ammo > playerData[playerid][pItemAmount])
						return SendClientMessage(playerid, COLOR_RED, "[WARNING] {FFFFFF}{00FF00}"#SUN_MANGONAME" {FFFFFF}เต็ม เอาไปแพ็กเลย");

					new rand = randomEx(70, 170);
					SUN_MANGOData[i][SUN_MANGOState] = SUN_MANGO_STATE_TAKING;
					Start_loadType1(playerid, rand, 0, i);
					SUN_MANGOTake[playerid] = 1;
					SendClientMessageEx(playerid, COLOR_YELLOW, "[NEW]: เริ่มเก็บ....");
					break;
                }
            }
        }
        if (IsPlayerInRangeOfPoint(playerid, 2.5, 672.9932,-1275.4833,13.6333))
        {
            Dialog_Show(playerid, DIALOG_SELLSUN_MANGO, DIALOG_STYLE_TABLIST_HEADERS, "[SELL:"#SUN_MANGONAME"]", "\
				ชื่อรายการ\tราคา\n\
				"#SUN_MANGONAME"\t{00FF00}$%d", "ขาย", "ออก", SUN_Jobcash[11]);
        }
        
        if (IsPlayerInRangeOfPoint(playerid, 2.5, -1124.1614,-955.5469,129.4005))
        {
            if(SUN_MANGOPack[playerid] == 1)
                return SendClientMessageEx(playerid, COLOR_LIGHTRED, "[WARNING]: กำลังแพ็ก....");
            
            new ammo = Inventory_Count(playerid, SUN_MANGOPACK)+1;
            
            if(ammo > playerData[playerid][pItemAmount])
				return SendClientMessageEx(playerid, COLOR_RED, "[WARNING] {FFFFFF}{00FF00}"#SUN_MANGOPACK" {FFFFFF}เต็ม เอาไปขายเลย (/gps > จุดขายสินค้า > ขายมะม่วง)");
            
            if(Inventory_Count(playerid, SUN_MANGONAME) < 5)
				return SendClientMessageEx(playerid, COLOR_RED, "[WARNING] {FFFFFF}{00FF00}"#SUN_MANGONAME" {FFFFFF}ไม่พอ");

            SUN_MANGOPack[playerid] = 1;
            new rand = randomEx(20, 100);
            Start_loadType1(playerid, rand, 0, INVALID_OBJECT_ID);
        }
	}
	return 1;
}

Dialog:DIALOG_SELLSUN_MANGO(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
			    new ammo = Inventory_Count(playerid, SUN_MANGOPACK);
			    new price = ammo*SUN_Jobcash[11];

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_RED, "[WARNING] {FFFFFF}ไม่มี"#SUN_MANGOPACK"");

		        GivePlayerMoneyEx(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[WARNING] {FFFFFF}เงินเขียว +{00FF00}%s {FFFFFF}จากการขาย"#SUN_MANGOPACK" {00FF00}%d {FFFFFF}แพ็ก", FormatMoney(price), ammo);
				Inventory_Remove(playerid, SUN_MANGOPACK, ammo);
		    }
		}
	}
	return 1;
}

PlayerSUN_MANGOUnfreeze(playerid, objectid)
{
	playerData[playerid][pWorkOn] = objectid;
	ClearAnimations(playerid);

	SUN_MANGOData[objectid][SUN_MANGOState] = SUN_MANGO_STATE_NORMAL;
	SUN_MANGOTake[playerid] = 0;
	
	new id = Inventory_Add(playerid, SUN_MANGONAME, 1);

	if (id == -1)
	    return SendClientMessageEx(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ความจุของกระเป๋าไม่เพียงพอ (%d/%d)", Inventory_Items(playerid), playerData[playerid][pMaxItem]);

	new giveExp = randomEx(20, 50);
	GivePlayerExp(playerid, giveExp);
    SendClientMessage(playerid, COLOR_GREEN, "[+]{00FF00}"#SUN_MANGONAME" +1");
    
    return 1;
}

SUN_MANGOPackFinish(playerid)
{
    new giveExp = randomEx(10, 25);
	GivePlayerExp(playerid, giveExp);
	
	ClearAnimations(playerid);
    SUN_MANGOPack[playerid] = 0;
    Inventory_Remove(playerid, #SUN_MANGONAME, 5);
    Inventory_Add(playerid, #SUN_MANGOPACK, 1);
    SendClientMessageEx(playerid, COLOR_LIGHTRED, "[-]: "#SUN_MANGONAME" -5");
    SendClientMessageEx(playerid, COLOR_GREEN, "[+]: "#SUN_MANGOPACK" +1");
	return 1;
}

hook OnloadType1_Finish(playerid, objectid)
{
    if(SUN_MANGOPack[playerid] == 1)
    	SUN_MANGOPackFinish(playerid);
    
	if(SUN_MANGOTake[playerid] == 1)
		PlayerSUN_MANGOUnfreeze(playerid, objectid);

	return Y_HOOKS_CONTINUE_RETURN_0;
}
hook OnloadType1_Update(playerid, progress, objectid)
{
    if(SUN_MANGOPack[playerid] == 1)
    {
		ApplyAnimation(playerid, "BD_FIRE","wash_up", 4.1, 1, 0, 0, 0, 1, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}
    
	if(SUN_MANGOTake[playerid] == 1)
	{
		ApplyAnimation(playerid, "BSKTBALL", "BBALL_Dnk", 4.0, 1, 0, 0, 1, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}

	return Y_HOOKS_CONTINUE_RETURN_0;
}


