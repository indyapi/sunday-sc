#include	<YSI_Coding\y_hooks>
#include 	<YSI_Coding\y_timers>

#define     MAX_SUN_LYCHEE      		12
#define     SUN_LYCHEEOBJECT         769
#define     SUN_LYCHEETEXT           "( JOB : LYCHEE ){FFFFFF}[ ใช้ 'N' เพื่อเก็บ ]!"
#define     SUN_LYCHEENAME           "ลิ้นจี่"
#define     SUN_LYCHEEPACK           "แพ็กลิ้นจี่"
#define		SUN_LYCHEETIMER      	0

// { "ตะกร้า" },

static SUN_LYCHEETake[MAX_PLAYERS];
static LYCHEEActor;
static SUN_LYCHEEPack[MAX_PLAYERS];


enum
{
	SUN_LYCHEE_STATE_NORMAL,
	SUN_LYCHEE_STATE_TAKING
};

enum SUN_LYCHEE_DATA
{
    SUN_LYCHEEID,
    SUN_LYCHEEObject,
    Float: SUN_LYCHEEPosX,
	Float: SUN_LYCHEEPosY,
	Float: SUN_LYCHEEPosZ,
    Text3D: SUN_LYCHEE3D,
    SUN_LYCHEE3DMSG[80],
    SUN_LYCHEEState
};
new const SUN_LYCHEEData[MAX_SUN_LYCHEE][SUN_LYCHEE_DATA] =
{
	{ INVALID_STREAMER_ID, SUN_LYCHEEOBJECT, -1012.90540, -950.91626, 128.54160,   Text3D: INVALID_3DTEXT_ID, SUN_LYCHEETEXT, SUN_LYCHEE_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_LYCHEEOBJECT, -1013.07092, -940.45917, 128.54160,   Text3D: INVALID_3DTEXT_ID, SUN_LYCHEETEXT, SUN_LYCHEE_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_LYCHEEOBJECT, -1013.08856, -929.08447, 128.54160,   Text3D: INVALID_3DTEXT_ID, SUN_LYCHEETEXT, SUN_LYCHEE_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_LYCHEEOBJECT, -1013.40479, -918.74243, 128.54160,   Text3D: INVALID_3DTEXT_ID, SUN_LYCHEETEXT, SUN_LYCHEE_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_LYCHEEOBJECT, -1022.56787, -950.80243, 128.54160,   Text3D: INVALID_3DTEXT_ID, SUN_LYCHEETEXT, SUN_LYCHEE_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_LYCHEEOBJECT, -1022.18597, -940.53601, 128.54160,   Text3D: INVALID_3DTEXT_ID, SUN_LYCHEETEXT, SUN_LYCHEE_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_LYCHEEOBJECT, -1022.21619, -929.75671, 128.54160,   Text3D: INVALID_3DTEXT_ID, SUN_LYCHEETEXT, SUN_LYCHEE_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_LYCHEEOBJECT, -1022.16827, -919.32104, 128.54160,   Text3D: INVALID_3DTEXT_ID, SUN_LYCHEETEXT, SUN_LYCHEE_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_LYCHEEOBJECT, -1032.12573, -950.62427, 128.54160,   Text3D: INVALID_3DTEXT_ID, SUN_LYCHEETEXT, SUN_LYCHEE_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_LYCHEEOBJECT, -1032.18250, -941.03583, 128.54160,   Text3D: INVALID_3DTEXT_ID, SUN_LYCHEETEXT, SUN_LYCHEE_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_LYCHEEOBJECT, -1032.68896, -930.64264, 128.54160,   Text3D: INVALID_3DTEXT_ID, SUN_LYCHEETEXT, SUN_LYCHEE_STATE_NORMAL },
	{ INVALID_STREAMER_ID, SUN_LYCHEEOBJECT, -1033.53845, -920.00952, 128.54160,   Text3D: INVALID_3DTEXT_ID, SUN_LYCHEETEXT, SUN_LYCHEE_STATE_NORMAL }
};

hook OnPlayerConnect(playerid)
{
	SUN_LYCHEETake[playerid] = 0;
	SUN_LYCHEEPack[playerid] = 0;
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	if (SUN_LYCHEETake[playerid] != 0)
	{
		if (SUN_LYCHEEData[ProgressObject[playerid]][SUN_LYCHEEState] == SUN_LYCHEE_STATE_TAKING)
		{
			SUN_LYCHEEData[ProgressObject[playerid]][SUN_LYCHEEState] = SUN_LYCHEE_STATE_NORMAL;
			StopProgress(playerid);
		}
	}
	if(SUN_LYCHEEPack[playerid] != 0)
	{
	    SUN_LYCHEEPack[playerid] = 0;
	    StopProgress(playerid);
	}
	return 1;
}

hook OnGameModeInit()
{
	for(new i = 0; i < sizeof(SUN_LYCHEEData); i++)
	{
		SUN_LYCHEEData[i][SUN_LYCHEEID] = CreateDynamicObject(SUN_LYCHEEData[i][SUN_LYCHEEObject], SUN_LYCHEEData[i][SUN_LYCHEEPosX], SUN_LYCHEEData[i][SUN_LYCHEEPosY], SUN_LYCHEEData[i][SUN_LYCHEEPosZ], 0.0, 0.0, 0.0);
		SUN_LYCHEEData[i][SUN_LYCHEE3D] = CreateDynamic3DTextLabel(SUN_LYCHEEData[i][SUN_LYCHEE3DMSG], COLOR_GREEN, SUN_LYCHEEData[i][SUN_LYCHEEPosX], SUN_LYCHEEData[i][SUN_LYCHEEPosY], SUN_LYCHEEData[i][SUN_LYCHEEPosZ] + 1.5, 5.0);
	}
	//CreateDynamicPickup(1239, 23, 689.7172,-1270.1031,13.5594);
	CreateDynamic3DTextLabel("(SELL:"#SUN_LYCHEENAME")\n[ ใช้ 'N' เพื่อขาย]", COLOR_GREEN, 689.7172,-1270.1031,13.5594, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);

    LYCHEEActor = CreateActor(223, 689.7172,-1270.1031,13.5594,87.5421);
	ApplyActorAnimation(LYCHEEActor, "COP_AMBIENT", "Coplook_loop", 4.1, 0, 1, 1, 1, 1);


    CreateDynamicPickup(1239, 23, -1051.4320,-956.7904,129.4005);
    CreateDynamic3DTextLabel("(SELL:"#SUN_LYCHEENAME")\n[ ใช้ 'N' เพื่อแพ็ก]", COLOR_GREEN, -1051.4320,-956.7904,129.4005, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);

	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid))
	{
        for(new i = 0; i < sizeof SUN_LYCHEEData; i++)
        {
            GetDynamicObjectPos(SUN_LYCHEEData[i][SUN_LYCHEEID], SUN_LYCHEEData[i][SUN_LYCHEEPosX], SUN_LYCHEEData[i][SUN_LYCHEEPosY], SUN_LYCHEEData[i][SUN_LYCHEEPosZ]);
            if(IsPlayerInRangeOfPoint(playerid, 3.0, SUN_LYCHEEData[i][SUN_LYCHEEPosX], SUN_LYCHEEData[i][SUN_LYCHEEPosY], SUN_LYCHEEData[i][SUN_LYCHEEPosZ]))
            {
                if(IsValidDynamicObject(SUN_LYCHEEData[i][SUN_LYCHEEID]) && SUN_LYCHEEData[i][SUN_LYCHEEState] == SUN_LYCHEE_STATE_NORMAL)
                {
					
					if (playerData[playerid][pWorkOn] == i)
					    return SendClientMessage(playerid, COLOR_RED, "[WARNING]: {FFFFFF}ไปเก็บจุดอื่น...!");
					    
                    if(!Inventory_Count(playerid, "ตะกร้า"))
			    		return SendClientMessageEx(playerid, COLOR_LIGHTRED, "[WARNING]: ไม่มี ตะกร้า");
					    
                    if (SUN_LYCHEETake[playerid] != 0)
					    return SendClientMessage(playerid, COLOR_RED, "[WARNING]: {FFFFFF}กำลังเก็บ...!");
					    
					new ammo = Inventory_Count(playerid, SUN_LYCHEENAME)+1;
					
					if(ammo > playerData[playerid][pItemAmount])
						return SendClientMessage(playerid, COLOR_RED, "[WARNING] {FFFFFF}{00FF00}"#SUN_LYCHEENAME" {FFFFFF}เต็ม เอาไปแพ็กเลย");

					new rand = randomEx(70, 170);
					SUN_LYCHEEData[i][SUN_LYCHEEState] = SUN_LYCHEE_STATE_TAKING;
					Start_loadType1(playerid, rand, 0, i);
					SUN_LYCHEETake[playerid] = 1;
					SendClientMessageEx(playerid, COLOR_YELLOW, "[NEW]: เริ่มเก็บ....");
					break;
                }
            }
        }
        if (IsPlayerInRangeOfPoint(playerid, 2.5, 689.7172,-1270.1031,13.5594))
        {
            Dialog_Show(playerid, DIALOG_SELLSUN_LYCHEE, DIALOG_STYLE_TABLIST_HEADERS, "[SELL:"#SUN_LYCHEENAME"]", "\
				ชื่อรายการ\tราคา\n\
				"#SUN_LYCHEENAME"\t{00FF00}$%d", "ขาย", "ออก", SUN_Jobcash[13]);
        }
        
        if (IsPlayerInRangeOfPoint(playerid, 5.0, -1051.4320,-956.7904,129.4005))
        {
            if(SUN_LYCHEEPack[playerid] == 1)
                return SendClientMessageEx(playerid, COLOR_LIGHTRED, "[WARNING]: กำลังแพ็ก....");
            
            new ammo = Inventory_Count(playerid, SUN_LYCHEEPACK)+1;
            
            if(ammo > playerData[playerid][pItemAmount])
				return SendClientMessage(playerid, COLOR_RED, "[WARNING] {FFFFFF}{00FF00}"#SUN_LYCHEEPACK" {FFFFFF}เต็ม เอาไปขายเลย (/gps > จุดขายสินค้า > ขาย"#SUN_LYCHEENAME")");
            
            if(Inventory_Count(playerid, SUN_LYCHEENAME)  < 5)
				return SendClientMessage(playerid, COLOR_RED, "[WARNING] {FFFFFF}{00FF00}"#SUN_LYCHEENAME" {FFFFFF}ไม่พอ");

            SUN_LYCHEEPack[playerid] = 1;
            new rand = randomEx(20, 100);
            Start_loadType1(playerid, rand, 0, INVALID_OBJECT_ID);
        }
	}
	return 1;
}

Dialog:DIALOG_SELLSUN_LYCHEE(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
			    new ammo = Inventory_Count(playerid, SUN_LYCHEEPACK);
			    new price = ammo*SUN_Jobcash[13];

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_RED, "[WARNING] {FFFFFF}ไม่มี"#SUN_LYCHEEPACK"");

		        GivePlayerMoneyEx(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[SELL:"#SUN_LYCHEENAME"] {FFFFFF}เงินเขียว +{00FF00}%s {FFFFFF}จากการขาย"#SUN_LYCHEEPACK" {00FF00}%d {FFFFFF}แพ็ก", FormatMoney(price), ammo);
				Inventory_Remove(playerid, SUN_LYCHEEPACK, ammo);
		    }
		}
	}
	return 1;
}

PlayerSUN_LYCHEEUnfreeze(playerid, objectid)
{
	playerData[playerid][pWorkOn] = objectid;
	ClearAnimations(playerid);

	SUN_LYCHEEData[objectid][SUN_LYCHEEState] = SUN_LYCHEE_STATE_NORMAL;
	SUN_LYCHEETake[playerid] = 0;
	
	new id = Inventory_Add(playerid, SUN_LYCHEENAME, 1);

	if (id == -1)
	    return SendClientMessageEx(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ความจุของกระเป๋าไม่เพียงพอ (%d/%d)", Inventory_Items(playerid), playerData[playerid][pMaxItem]);

	new giveExp = randomEx(20, 50);
	GivePlayerExp(playerid, giveExp);
    SendClientMessage(playerid, COLOR_GREEN, "[+]{00FF00}"#SUN_LYCHEENAME" +1");
    
    return 1;
}

SUN_LYCHEEPackFinish(playerid)
{
    new giveExp = randomEx(10, 25);
	GivePlayerExp(playerid, giveExp);
	
	ClearAnimations(playerid);
    SUN_LYCHEEPack[playerid] = 0;
    Inventory_Remove(playerid, #SUN_LYCHEENAME, 5);
    Inventory_Add(playerid, #SUN_LYCHEEPACK, 1);
    SendClientMessageEx(playerid, COLOR_LIGHTRED, "[-]: "#SUN_LYCHEENAME" -5");
    SendClientMessageEx(playerid, COLOR_GREEN, "[+]: "#SUN_LYCHEEPACK" +1");
	return 1;
}

hook OnloadType1_Finish(playerid, objectid)
{
    if(SUN_LYCHEEPack[playerid] == 1)
    	SUN_LYCHEEPackFinish(playerid);
    
	if(SUN_LYCHEETake[playerid] == 1)
		PlayerSUN_LYCHEEUnfreeze(playerid, objectid);

	return Y_HOOKS_CONTINUE_RETURN_0;
}
hook OnloadType1_Update(playerid, progress, objectid)
{
    if(SUN_LYCHEEPack[playerid] == 1)
    {
		ApplyAnimation(playerid, "BD_FIRE","wash_up", 4.1, 1, 0, 0, 0, 1, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}
    
	if(SUN_LYCHEETake[playerid] == 1)
	{
		ApplyAnimation(playerid, "BSKTBALL", "BBALL_Dnk", 4.0, 1, 0, 0, 1, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}

	return Y_HOOKS_CONTINUE_RETURN_0;
}


