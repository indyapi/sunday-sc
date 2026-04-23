#include	<YSI_Coding\y_hooks>

new CocainAmount[9] = 10;
new Text3D:gCocainText[9];
new CocainCooldown[9] = 0;
new CocainRestart[9] = 0;

new isTakeCocain[MAX_PLAYERS] = 0;
new cocainPoints[MAX_PLAYERS] = 0;

hook OnGameModeInit()
{
    CreateDynamicObject(941, 852.5734,-1059.9767,25.1068-0.6,   0.00000, 0.00000, 213.5756);

    CreateDynamicObject(1279, 851.8753,-1060.6108,25.9823-0.9,   0.00000, 0.00000, 335.2717);
   	CreateDynamicObject(1279, 852.9047,-1059.7194,25.9823-0.9,   0.00000, 0.00000, 338.7184);

    CreateDynamicPickup(1239, 23, 853.0689,-1061.0676,25.1068, -1);
    CreateDynamic3DTextLabel("{FFFFFF}[{ABFD07}แพ็คโคเคน{FFFFFF}]\n{ABFD07}กดปุ่ม N", COLOR_LIGHTRED, 853.0689,-1061.0676,25.1068, 30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 40.0);

	CreateDynamic3DTextLabel("{FFFFFF}[{FAF60B}ขายโคเคนแพ็ค{FFFFFF}]\n{FAF60B}กดปุ่ม N", COLOR_GREEN, 1414.8125,2026.9429,14.7396+1.0, 30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);
	NPCPoon = CreateActor(2, 1414.8125,2026.9429,14.7396,269.5176);
	ApplyActorAnimation(NPCPoon, "COP_AMBIENT", "Coplook_loop", 4.1, 0, 1, 1, 1, -1);

    // Cocain Hangar
    
    CreateDynamicObject(941, 1916.0488,152.7940,37.2361-0.6,   0.00000, 0.00000, 158.0917);

    CreateDynamicObject(1279, 1915.2302,152.8617+0.1,38.1116-0.9,   0.00000, 0.00000, 335.2717);
   	CreateDynamicObject(1279, 1915.9446+0.4,152.7304,38.1116-0.9,   0.00000, 0.00000, 338.7184);

    CreateDynamicPickup(1239, 23, 1915.3663,151.9097,37.2371, -1);
    CreateDynamic3DTextLabel("{FFFFFF}[{ABFD07}แปรรูปใบโคคา{FFFFFF}]\n{ABFD07}กดปุ่ม N", COLOR_LIGHTRED, 1915.3663,151.9097,37.2371, 30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 40.0);

    CocainAmount[0] = 10,CocainAmount[1] = 10,CocainAmount[2] = 10,CocainAmount[3] = 10,
    CocainAmount[4] = 10,CocainAmount[5] = 10,CocainAmount[6] = 10,CocainAmount[7] = 10, CocainAmount[8] = 10;

    CocainCooldown[0] = 0,CocainCooldown[1] = 0,CocainCooldown[2] = 0,CocainCooldown[3] = 0,
    CocainCooldown[4] = 0,CocainCooldown[5] = 0,CocainCooldown[6] = 0,CocainCooldown[7] = 0, CocainCooldown[8] = 0;

	CreateObject(765, 1979.7238,221.3690,27.8349-0.8,   0.00000, 0.00000, 0.00000);
    CreateDynamicPickup(1239, 23, 1980.3739,232.0379,27.8293, -1);
    gCocainText[0] = CreateDynamic3DTextLabel("{F88103}ต้นโคเคน\n\nจำนวน 10 ชิ้น\nกดปุ่ม N เพื่อเก็บ", COLOR_LIGHTRED, 1980.3739,232.0379,27.8293, 30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 40.0);

	CreateObject(765, 1988.7657,220.6908,27.3070-0.8,   0.00000, 0.00000, 0.00000);
    CreateDynamicPickup(1239, 23, 1989.3484,230.2488,27.3826, -1);
    gCocainText[1] = CreateDynamic3DTextLabel("{F88103}ต้นโคเคน\n\nจำนวน 10 ชิ้น\nกดปุ่ม N เพื่อเก็บ", COLOR_LIGHTRED, 1989.3484,230.2488,27.3826, 30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 40.0);

	CreateObject(765, 1998.7163,219.9445,26.8984-0.8,   0.00000, 0.00000, 0.00000);
    CreateDynamicPickup(1239, 23, 1998.2654,228.3400,27.2397, -1);
    gCocainText[2] = CreateDynamic3DTextLabel("{F88103}ต้นโคเคน\n\nจำนวน 10 ชิ้น\nกดปุ่ม N เพื่อเก็บ", COLOR_LIGHTRED, 1998.2654,228.3400,27.2397, 30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 40.0);

	CreateObject(765, 1978.5946,213.3218,27.8762-0.8,   0.00000, 0.00000, 0.00000);
    CreateDynamicPickup(1239, 23, 1998.0369,220.0695,26.9085, -1);
    gCocainText[3] = CreateDynamic3DTextLabel("{F88103}ต้นโคเคน\n\nจำนวน 10 ชิ้น\nกดปุ่ม N เพื่อเก็บ", COLOR_LIGHTRED, 1998.0369,220.0695,26.9085, 30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 40.0);

	CreateObject(765, 1987.7291,212.1487,27.3415-0.8,   0.00000, 0.00000, 0.00000);
    CreateDynamicPickup(1239, 23, 1988.1306,220.7315,27.3441, -1);
    gCocainText[4] = CreateDynamic3DTextLabel("{F88103}ต้นโคเคน\n\nจำนวน 10 ชิ้น\nกดปุ่ม N เพื่อเก็บ", COLOR_LIGHTRED, 1988.1306,220.7315,27.3441, 30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 40.0);

	CreateObject(765, 1998.2380,211.2653,26.7277-0.8,   0.00000, 0.00000, 0.00000);
    CreateDynamicPickup(1239, 23, 1978.7554,221.4449,27.8914, -1);
    gCocainText[5] = CreateDynamic3DTextLabel("{F88103}ต้นโคเคน\n\nจำนวน 10 ชิ้น\nกดปุ่ม N เพื่อเก็บ", COLOR_LIGHTRED, 1978.7554,221.4449,27.8914, 30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 40.0);

	CreateObject(765, 1980.8831,232.0022,27.7996-0.8,   0.00000, 0.00000, 0.00000);
    CreateDynamicPickup(1239, 23, 1977.9329,213.4061,27.9150, -1);
    gCocainText[6] = CreateDynamic3DTextLabel("{F88103}ต้นโคเคน\n\nจำนวน 10 ชิ้น\nกดปุ่ม N เพื่อเก็บ", COLOR_LIGHTRED, 1977.9329,213.4061,27.9150, 30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 40.0);

	CreateObject(765, 1989.8447,230.2300,27.3782-0.8,   0.00000, 0.00000, 0.00000);
    CreateDynamicPickup(1239, 23, 1987.0758,212.1204,27.3794, -1);
    gCocainText[7] = CreateDynamic3DTextLabel("{F88103}ต้นโคเคน\n\nจำนวน 10 ชิ้น\nกดปุ่ม N เพื่อเก็บ", COLOR_LIGHTRED, 1987.0758,212.1204,27.3794, 30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 40.0);

	CreateObject(765, 1998.8905,228.2498,27.2315-0.8,   0.00000, 0.00000, 0.00000);
    CreateDynamicPickup(1239, 23, 1997.7841,211.2354,26.7540, -1);
    gCocainText[8] = CreateDynamic3DTextLabel("{F88103}ต้นโคเคน\n\nจำนวน 10 ชิ้น\nกดปุ่ม N เพื่อเก็บ", COLOR_LIGHTRED, 1997.7841,211.2354,26.7540, 30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 40.0);

	return 1;
}

hook OnPlayerConnect(playerid)
{
	isTakeCocain[playerid] = 0;
	cocainPoints[playerid] = 0;

	return 1;
}

ptask CocainTimerWorking[100](playerid)
{
	new string[256];
	if (isTakeCocain[playerid] == 1)
	{
	    cocainPoints[playerid] ++;
		ApplyAnimation(playerid, "Knife", "kill_knife_player", 4.1, 0, 1, 1, 1, 0, 1);

		format(string, sizeof(string), "~n~~n~~n~~n~~n~~g~Cocain : ~w~%d/100", cocainPoints[playerid]);
		GameTextForPlayer(playerid,  string, 2000, 5);

		if (cocainPoints[playerid] >= 100)
		{
		    isTakeCocain[playerid] = 0;
		    cocainPoints[playerid] = 0;

			ClearAnimations(playerid);

			if (Inventory_Count(playerid, "ใบคาโค") > 30)
				return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณมีจำนวนของสูงสุดแล้ว! นำมันไปขายที่ตลาดก่อน");

			Inventory_Add(playerid, "ใบคาโค", 5);
			
			SendClientMessage(playerid, -1, "{B9F803}ใบคาโค {FFFFFF}+ 5");
			SendClientMessageEx(playerid, -1, "{05BD1E}คุณมีใบคาโคทั้งหมด %d", Inventory_Count(playerid, "ใบคาโค"));
		}
	}

	if (isTakeCocain[playerid] == 2)
	{
	    cocainPoints[playerid] ++;
		ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 1, 1, 1, 0, 1);

		format(string, sizeof(string), "~n~~n~~n~~n~~n~~r~Coca Pack : ~w~%d/100", cocainPoints[playerid]);
		GameTextForPlayer(playerid,  string, 2000, 5);

		if (cocainPoints[playerid] >= 100)
		{
		    isTakeCocain[playerid] = 0;
		    cocainPoints[playerid] = 0;

			ClearAnimations(playerid);

			if (Inventory_Count(playerid, "โคเคนผง") > 30)
				return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณมีจำนวนของสูงสุดแล้ว! นำมันไปขายที่ตลาดก่อน");

			Inventory_Remove(playerid, "ใบคาโค", 2);
			Inventory_Add(playerid, "โคเคนผง", 1);

            SendClientMessage(playerid, COLOR_RED, "|====== ทำตัวยา ======|");
			SendClientMessage(playerid, -1, "ใบคาโค {F32A06}- 2");
			SendClientMessage(playerid, -1, "โคเคนผง {09AD05}+ 1");
		}
	}

	if (isTakeCocain[playerid] == 3)
	{
	    cocainPoints[playerid] ++;
		ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 1, 1, 1, 0, 1);

		format(string, sizeof(string), "~n~~n~~n~~n~~n~~b~Cocain Pack : ~w~%d/100", cocainPoints[playerid]);
		GameTextForPlayer(playerid,  string, 2000, 5);

		if (cocainPoints[playerid] >= 100)
		{
		    isTakeCocain[playerid] = 0;
		    cocainPoints[playerid] = 0;

			ClearAnimations(playerid);

			if (Inventory_Count(playerid, "แพ็คโคเคน") > 30)
				return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณมีจำนวนของสูงสุดแล้ว! นำมันไปขายที่ตลาดก่อน");

			Inventory_Remove(playerid, "โคเคนผง", 1);
			Inventory_Add(playerid, "แพ็คโคเคน", 1);

            SendClientMessage(playerid, COLOR_YELLOW, "|====== แพ็คของ ======|");
			SendClientMessage(playerid, -1, "โคเคนผง {F32A06}- 1");
			SendClientMessage(playerid, -1, "แพ็คโคเคน {09AD05}+ 1");
		}
	}

	if (isTakeCocain[playerid] == 4)
	{
		if (CopOnline() < 2)
	 		return SendClientMessage(playerid, COLOR_LIGHTRED, "ต้องมีตำรวจออนไลน์มากกว่า 2");

	    cocainPoints[playerid] ++;
		ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 1, 1, 1, 0, 1);

		format(string, sizeof(string), "~n~~n~~n~~n~~n~~r~Sell Cocain : ~w~%d/100", cocainPoints[playerid]);
		GameTextForPlayer(playerid,  string, 2000, 5);

		if (cocainPoints[playerid] >= 100)
		{
			// --> ผู้เล่นตีกันแล้วแจ้งตำรวจ
			new Float:X, Float:Y, Float:Z;
			GetPlayerPos(playerid, X, Y, Z);

			foreach (new i : Player)
			{
				if(GetFactionType(i) == FACTION_POLICE)
				{
					SetPlayerCheckpoint(i, X,Y,Z, 15.0);

					SendClientMessage(i, COLOR_LIGHTBLUE, "Dispatch : มีพลเมืองดีรายงานว่า 'มีคนกำลังขายโคเคน'");
					SendClientMessage(i, COLOR_LIGHTBLUE, "Dispatch : ตำแหน่ง Checkpoint ถูกแสดงขึ้นบนแผนที่แล้ว");

					PoliceCP[i] = 1;
				}
            }

		    new amount = Inventory_Count(playerid, "แพ็คโคเคน"), cash = amount * JobCash[20];
		
		    isTakeCocain[playerid] = 0;
		    cocainPoints[playerid] = 0;

			ClearAnimations(playerid);

			Inventory_Remove(playerid, "แพ็คโคเคน", amount);
			playerData[playerid][pRedMoney] += cash;
			
			GivePlayerWanted(playerid, 6);

            SendClientMessage(playerid, COLOR_RED, "|====== ส่งของ ======|");
            SendClientMessageEx(playerid, -1, "คุณส่งโคเคนจำนวน %d แพ็คได้รับเงิน $%s", amount, FormatNumber(cash));
			SendClientMessage(playerid, COLOR_LIGHTRED, "* ตอนนี้คุณมีคดีอยู่ 6 ดาว หากคุณออกเกมหรือหลุด");
			SendClientMessage(playerid, COLOR_LIGHTRED, "* ของผิดกฎหมายทั้งหมดจะหายไปจากตัวของคุณ");
		}
	}

	return 1;
}

task RefreshCocain[1000]()
{
	new string[512];

	format(string, sizeof(string), "{C4F803}[ต้นโคเคน]\n{03F897}จำนวน %d ผล\n{FFFFFF}กดปุ่ม N เพื่อเก็บผลไม้", CocainAmount[0]);
	UpdateDynamic3DTextLabelText(gCocainText[0], COLOR_YELLOW, string);

	format(string, sizeof(string), "{C4F803}[ต้นโคเคน]\n{03F897}จำนวน %d ผล\n{FFFFFF}กดปุ่ม N เพื่อเก็บผลไม้", CocainAmount[1]);
	UpdateDynamic3DTextLabelText(gCocainText[1], COLOR_YELLOW, string);

	format(string, sizeof(string), "{C4F803}[ต้นโคเคน]\n{03F897}จำนวน %d ผล\n{FFFFFF}กดปุ่ม N เพื่อเก็บผลไม้", CocainAmount[2]);
	UpdateDynamic3DTextLabelText(gCocainText[2], COLOR_YELLOW, string);

	format(string, sizeof(string), "{C4F803}[ต้นโคเคน]\n{03F897}จำนวน %d ผล\n{FFFFFF}กดปุ่ม N เพื่อเก็บผลไม้", CocainAmount[3]);
	UpdateDynamic3DTextLabelText(gCocainText[3], COLOR_YELLOW, string);

	format(string, sizeof(string), "{C4F803}[ต้นโคเคน]\n{03F897}จำนวน %d ผล\n{FFFFFF}กดปุ่ม N เพื่อเก็บผลไม้", CocainAmount[4]);
	UpdateDynamic3DTextLabelText(gCocainText[4], COLOR_YELLOW, string);

	format(string, sizeof(string), "{C4F803}[ต้นโคเคน]\n{03F897}จำนวน %d ผล\n{FFFFFF}กดปุ่ม N เพื่อเก็บผลไม้", CocainAmount[5]);
	UpdateDynamic3DTextLabelText(gCocainText[5], COLOR_YELLOW, string);

	format(string, sizeof(string), "{C4F803}[ต้นโคเคน]\n{03F897}จำนวน %d ผล\n{FFFFFF}กดปุ่ม N เพื่อเก็บผลไม้", CocainAmount[6]);
	UpdateDynamic3DTextLabelText(gCocainText[6], COLOR_YELLOW, string);

	format(string, sizeof(string), "{C4F803}[ต้นโคเคน]\n{03F897}จำนวน %d ผล\n{FFFFFF}กดปุ่ม N เพื่อเก็บผลไม้", CocainAmount[7]);
	UpdateDynamic3DTextLabelText(gCocainText[7], COLOR_YELLOW, string);

	format(string, sizeof(string), "{C4F803}[ต้นโคเคน]\n{03F897}จำนวน %d ผล\n{FFFFFF}กดปุ่ม N เพื่อเก็บผลไม้", CocainAmount[8]);
	UpdateDynamic3DTextLabelText(gCocainText[8], COLOR_YELLOW, string);

	for (new i = 0; i < 9; i ++)
	{
	    if (CocainRestart[i] == 1)
	    {
		    if (CocainCooldown[i] > 0)
		    {
		        CocainCooldown[i] --;
		    }

		    if (CocainCooldown[i] < 0)
		    {
		        CocainCooldown[i] = 0;
		    }
		}
		
		// --> ถ้าจำนวนโคเคนน้อยกว่า 0
	    if (CocainAmount[i] <= 0)
	    {
	        if (CocainRestart[i] == 0)
	        {
		        CocainCooldown[i] = 15; // คูลดาวน์ 15 วินาที
		        CocainRestart[i] = 1;
			}
	    
			format(string, sizeof(string), "{C4F803}[ต้นโคเคน]\n{03F897}จะเก็บได้อีกภายใน %d วิข้างหน้า", CocainCooldown[i]);
			UpdateDynamic3DTextLabelText(gCocainText[i], COLOR_YELLOW, string);
			
			if (CocainCooldown[i] == 0)
			{
			    CocainAmount[i] = 10;
			    CocainCooldown[i] = 0;
			    CocainRestart[i] = 0;
			    
				format(string, sizeof(string), "{C4F803}[ต้นโคเคน]\n{03F897}จำนวน %d ผล\n{FFFFFF}กดปุ่ม N เพื่อเก็บผลไม้", CocainAmount[i]);
				UpdateDynamic3DTextLabelText(gCocainText[i], COLOR_YELLOW, string);
			}
	    }
	}

	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(newkeys == KEY_NO)
	{
	    // --> แปรรูป ใบโคคา
	    if (IsPlayerInRangeOfPoint(playerid, 2.0, 1915.3663,151.9097,37.2371))
		{
			if (Inventory_Count(playerid, "ใบคาโค") < 2)
			    return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณต้องมีใบคาโคมากกว่า 2 ใบ");
		
	        if (isTakeCocain[playerid] != 0)
	            return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณอยู่ระหว่างการแปรรูปใบโคคา");

	        isTakeCocain[playerid] = 2;
		}
		
		if (IsPlayerInRangeOfPoint(playerid, 2.0, 853.0689,-1061.0676,25.1068))
		{
			if (Inventory_Count(playerid, "โคเคนผง") < 1)
			    return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณต้องมีโคเคนผงมากกว่า 1");

	        if (isTakeCocain[playerid] != 0)
	            return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณอยู่ระหว่างการแพ็คโคเคน");

	        isTakeCocain[playerid] = 3;
		}
		
		if (IsPlayerInRangeOfPoint(playerid, 2.0, 1414.8125,2026.9429,14.7396))
		{
			if (Inventory_Count(playerid, "แพ็คโคเคน") <= 0)
			    return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณต้องมี แพ็คโคเคน มากกว่า 1 แพ็ค");

	        if (isTakeCocain[playerid] != 0)
	            return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณอยู่ระหว่างการขาย แพ็คโคเคน");

	        isTakeCocain[playerid] = 4;
		}
	
	    // --> เก็บ ใบโคคา
	    if (IsPlayerInRangeOfPoint(playerid, 2.0, 1980.3739,232.0379,27.8293))
	    {
			if (playerData[playerid][pLevel] < 3)
			    return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณต้องเลเวลมากกว่า 3");

			if (CopOnline() < 2)
			    return SendClientMessage(playerid, COLOR_LIGHTRED, "ต้องมีตำรวจออนไลน์มากกว่า 2");

	        if (CocainAmount[0] <= 0)
	            return SendClientMessage(playerid, COLOR_LIGHTRED, "กรุณารอการเกิดใหม่ของต้นโคเคน!");
	    
	        if (isTakeCocain[playerid] == 1)
	            return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณอยู่ระหว่างการเก็บใบคาโค!");

	        isTakeCocain[playerid] = 1;
	        CocainAmount[0] --;
	    }

	    if (IsPlayerInRangeOfPoint(playerid, 2.0, 1989.3484,230.2488,27.3826))
	    {
			if (playerData[playerid][pLevel] < 3)
			    return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณต้องเลเวลมากกว่า 3");

			if (CopOnline() < 2)
			    return SendClientMessage(playerid, COLOR_LIGHTRED, "ต้องมีตำรวจออนไลน์มากกว่า 2");

	        if (CocainAmount[1] <= 0)
	            return SendClientMessage(playerid, COLOR_LIGHTRED, "กรุณารอการเกิดใหม่ของต้นโคเคน!");

	        if (isTakeCocain[playerid] == 1)
	            return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณอยู่ระหว่างการเก็บใบคาโค!");

	        isTakeCocain[playerid] = 1;
	        CocainAmount[1] --;
	    }

	    if (IsPlayerInRangeOfPoint(playerid, 2.0, 1998.2654,228.3400,27.2397))
	    {
			if (playerData[playerid][pLevel] < 3)
			    return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณต้องเลเวลมากกว่า 3");

			if (CopOnline() < 2)
			    return SendClientMessage(playerid, COLOR_LIGHTRED, "ต้องมีตำรวจออนไลน์มากกว่า 2");

	        if (CocainAmount[2] <= 0)
	            return SendClientMessage(playerid, COLOR_LIGHTRED, "กรุณารอการเกิดใหม่ของต้นโคเคน!");

	        if (isTakeCocain[playerid] == 1)
	            return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณอยู่ระหว่างการเก็บใบคาโค!");

	        isTakeCocain[playerid] = 1;
	        CocainAmount[2] --;
	    }

	    if (IsPlayerInRangeOfPoint(playerid, 2.0, 1998.0369,220.0695,26.9085))
	    {
			if (playerData[playerid][pLevel] < 3)
			    return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณต้องเลเวลมากกว่า 3");

			if (CopOnline() < 2)
			    return SendClientMessage(playerid, COLOR_LIGHTRED, "ต้องมีตำรวจออนไลน์มากกว่า 2");

	        if (CocainAmount[3] <= 0)
	            return SendClientMessage(playerid, COLOR_LIGHTRED, "กรุณารอการเกิดใหม่ของต้นโคเคน!");

	        if (isTakeCocain[playerid] == 1)
	            return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณอยู่ระหว่างการเก็บใบคาโค!");

	        isTakeCocain[playerid] = 1;
	        CocainAmount[3] --;
	    }

	    if (IsPlayerInRangeOfPoint(playerid, 2.0, 1988.1306,220.7315,27.3441))
	    {
			if (playerData[playerid][pLevel] < 3)
			    return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณต้องเลเวลมากกว่า 3");

			if (CopOnline() < 2)
			    return SendClientMessage(playerid, COLOR_LIGHTRED, "ต้องมีตำรวจออนไลน์มากกว่า 2");

	        if (CocainAmount[4] <= 0)
	            return SendClientMessage(playerid, COLOR_LIGHTRED, "กรุณารอการเกิดใหม่ของต้นโคเคน!");

	        if (isTakeCocain[playerid] == 1)
	            return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณอยู่ระหว่างการเก็บใบคาโค!");

	        isTakeCocain[playerid] = 1;
	        CocainAmount[4] --;
	    }

	    if (IsPlayerInRangeOfPoint(playerid, 2.0, 1978.7554,221.4449,27.8914))
	    {
			if (playerData[playerid][pLevel] < 3)
			    return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณต้องเลเวลมากกว่า 3");

			if (CopOnline() < 2)
			    return SendClientMessage(playerid, COLOR_LIGHTRED, "ต้องมีตำรวจออนไลน์มากกว่า 2");

	        if (CocainAmount[5] <= 0)
	            return SendClientMessage(playerid, COLOR_LIGHTRED, "กรุณารอการเกิดใหม่ของต้นโคเคน!");

	        if (isTakeCocain[playerid] == 1)
	            return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณอยู่ระหว่างการเก็บใบคาโค!");

	        isTakeCocain[playerid] = 1;
	        CocainAmount[5] --;
	    }

	    if (IsPlayerInRangeOfPoint(playerid, 2.0, 1977.9329,213.4061,27.9150))
	    {
			if (playerData[playerid][pLevel] < 3)
			    return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณต้องเลเวลมากกว่า 3");

			if (CopOnline() < 2)
			    return SendClientMessage(playerid, COLOR_LIGHTRED, "ต้องมีตำรวจออนไลน์มากกว่า 2");

	        if (CocainAmount[6] <= 0)
	            return SendClientMessage(playerid, COLOR_LIGHTRED, "กรุณารอการเกิดใหม่ของต้นโคเคน!");

	        if (isTakeCocain[playerid] == 1)
	            return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณอยู่ระหว่างการเก็บใบคาโค!");

	        isTakeCocain[playerid] = 1;
	        CocainAmount[6] --;
	    }

	    if (IsPlayerInRangeOfPoint(playerid, 2.0, 1987.0758,212.1204,27.3794))
	    {
			if (playerData[playerid][pLevel] < 3)
			    return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณต้องเลเวลมากกว่า 3");

			if (CopOnline() < 2)
			    return SendClientMessage(playerid, COLOR_LIGHTRED, "ต้องมีตำรวจออนไลน์มากกว่า 2");

	        if (CocainAmount[7] <= 0)
	            return SendClientMessage(playerid, COLOR_LIGHTRED, "กรุณารอการเกิดใหม่ของต้นโคเคน!");

	        if (isTakeCocain[playerid] == 1)
	            return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณอยู่ระหว่างการเก็บใบคาโค!");

	        isTakeCocain[playerid] = 1;
	        CocainAmount[7] --;
	    }

	    if (IsPlayerInRangeOfPoint(playerid, 2.0, 1997.7841,211.2354,26.7540))
	    {
			if (playerData[playerid][pLevel] < 3)
			    return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณต้องเลเวลมากกว่า 3");

			if (CopOnline() < 2)
			    return SendClientMessage(playerid, COLOR_LIGHTRED, "ต้องมีตำรวจออนไลน์มากกว่า 2");

	        if (CocainAmount[8] <= 0)
	            return SendClientMessage(playerid, COLOR_LIGHTRED, "กรุณารอการเกิดใหม่ของต้นโคเคน!");

	        if (isTakeCocain[playerid] == 1)
	            return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณอยู่ระหว่างการเก็บใบคาโค!");

	        isTakeCocain[playerid] = 1;
	        CocainAmount[8] --;
	    }
	}
	return 1;
}


