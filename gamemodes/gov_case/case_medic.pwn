#include <YSI_Coding\y_hooks>

#define 	CPR_PRICE 	900
#define     HEAL_PRICE1 300
#define     HEAL_PRICE2  500

new CheckMedic[MAX_PLAYERS] = 0;
new IdCheckMedic[MAX_PLAYERS] = 0;
new playerNearSelectMedic[MAX_PLAYERS][20];
new CallMedic[MAX_PLAYERS];
new MedicType[MAX_PLAYERS];
new HealMType[MAX_PLAYERS];
new playerNearSelectCpr[MAX_PLAYERS][20];
new playerNearSelectHeal[MAX_PLAYERS][20];
new InjuredID[MAX_PLAYERS];
new InjuredCallMedic[MAX_PLAYERS] = 0;
new InjuredCallMedicEx[MAX_PLAYERS] = 0;

hook OnPlayerConnect(playerid)
{
    CheckMedic[playerid] = 0;
    IdCheckMedic[playerid] = 0;
    CallMedic[playerid] = 0;
    MedicType[playerid] = 0;
}
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	/*if(newkeys & KEY_WALK)
	{
        if(GetFactionType(playerid) == FACTION_MEDIC){
			Dialog_Show(playerid, Dialog_MEDIC_TYPE, DIALOG_STYLE_LIST, "{FA492D}เมนูสำหรับแพทย์", "\
		        {FA492D}+ {FFFFFF}รายชื่อผู้บาดเจ็บ\n\
		        {FA492D}+ {FFFFFF}ยกเลิกรายชื่อผู้บาดเจ็บ\n\
				{FA492D}+ {FFFFFF}กล่องปฐมพยาบาล\n\
		        {FA492D}+ {FFFFFF}การฉีดยา", "ตกลง", "ปิด");

		}
	}*/
	if(newkeys & KEY_NO)
	{
		if (playerData[playerid][pInjured] == 1)
		{
			new Float:x, Float:y, Float:z;
			GetPlayerPos(playerid, x, y, z);

					//SendFactionMessageEx(FACTION_MEDIC, COLOR_LIGHTRED, "911 CALL: %s พิกัด (%.4f, %.4f, %.4f)", GetPlayerNameEx(playerid), x, y, z);
			SendFactionMessageEx(FACTION_MEDIC, COLOR_LIGHTRED, "[WARNING]: มีเคสเข้า รีบดูเร็ว!!");
			SendFactionMessageEx(FACTION_MEDIC, COLOR_LIGHTRED, "[WARNING]: มีเคสเข้า รีบดูเร็ว!!");
			SendFactionMessageEx(FACTION_MEDIC, COLOR_LIGHTRED, "[WARNING]: มีเคสเข้า รีบดูเร็ว!!");

			CallMedic[playerid] = 1;
			MedicType[playerid] = 1;
			InjuredCD[playerid] = 60*5;
			SendClientMessage(playerid, COLOR_LIGHTRED, "เรียกหมอ : {ffffff}คุณได้แจ้งขอความช่วยเหลือจากหน่วยแพทย์ที่ออนไลน์แล้ว");

  			/*foreach (new i : Player)
			{
				if(GetFactionType(i) == FACTION_MEDIC)
				{
					new Float:X, Float:Y, Float:Z;
			    	GetPlayerPos(playerid, X,Y,Z);
			    
				    SetPlayerCheckpoint(i, X, Y, Z, 7.0);

				   	SendClientMessage(i, -1, "|========================================================|");
					SendClientMessage(i, COLOR_LIGHTRED, "Dispatch : รายงานแจ้งมาว่ามีผู้บาดเจ็บใน San Andreas");
					SendClientMessage(i, COLOR_LIGHTRED, "Dispatch : ตำแหน่ง Checkpoint ถูกแสดงขึ้นบนแผนที่แล้ว");
     				SendClientMessage(i, -1, "|========================================================|");

					MedicCP[i] = 1;
				}
			}*/
		}
	}
    return 1;
}
Dialog:Dialog_MEDIC_TYPE(playerid, response, listitem, inputtext[])
{
	new
		str[1024],
		count;

    if(response)
    {
        if (incase[playerid] == 0)
			return ErrorMsg(playerid, "คุณต้องเข้าเวรก่อน !");
		if(listitem == 0)
        {
			foreach (new i : Player)
			{
				new Float:x, Float:y, Float:z;
				GetPlayerPos(i, x,y,z);

				if (CallMedic[i] == 1)
				{
					format(str, sizeof(str), "%s {F90F04}(ไอดี:%d) %s\t{ffffff}อาการ : %s\t{ffffff}%.1fm\n", str, i, GetPlayerNameEx(i), MEDIC_Name(i), GetPlayerDistanceFromPoint(playerid, x, y, z));
					playerNearSelectMedic[playerid][count] = i;
					count++;

					if(count == 20) break;
				}
			}
		 	if(!count) ErrorMsg(playerid, "ไม่พบผู้บาดเจ็บ!");
		  	else Dialog_Show(playerid, Dialog_NearMedic, DIALOG_STYLE_TABLIST, "{F95A04}[ รายชื่อผู้บาดเจ็บหรืออุ้มเอ๋อ ]", str, "ตกลง", "ปิด");
		}
        if(listitem == 1)
        {
			foreach (new i : Player)
			{
				new Float:x, Float:y, Float:z;
				GetPlayerPos(i, x,y,z);

				if (CallMedic[i] == 1)
				{
					format(str, sizeof(str), "%s {F90F04}(ไอดี:%d) %s\t{ffffff}อาการ : %s\t{ffffff}%.1fm\n", str, i, GetPlayerNameEx(i), MEDIC_Name(i), GetPlayerDistanceFromPoint(playerid, x, y, z));
					playerNearSelectMedic[playerid][count] = i;
					count++;

					if(count == 20) break;
				}
			}
		 	if(!count) ErrorMsg(playerid, "ไม่พบผู้ที่ต้องการหมอ!");
		  	else Dialog_Show(playerid, Dialog_CANCEL_MEDIC, DIALOG_STYLE_TABLIST, "{F95A04}[ ยกเลิกรายชื่อผู้บาดเจ็บหรืออุ้มเอ๋อ ]", str, "ตกลง", "ปิด");
		}
		// ใช้กล่องปฐมพยาบาล
        if(listitem == 2)
        {
            foreach (new i : Player)
            {
                if(i == playerid) continue;
                new Float:x, Float:y, Float:z;
                new Float:xx, Float:yy, Float:zz;
                GetPlayerPos(i, xx,yy,zz);
                GetPlayerPos(playerid, x,y,z);
                if (isPlayerNearPos(i, 4.0, x,y,z) && GetPlayerInterior(playerid) == GetPlayerInterior(i) && GetPlayerVirtualWorld(playerid) == GetPlayerVirtualWorld(i))
                {

                    format(str, sizeof(str), "%s %s\t%.1fm\n", str, GetPlayerNameEx(i), GetPlayerDistanceFromPoint(playerid, xx, yy, zz));
                    playerNearSelectCpr[playerid][count] = i;
                    count++;

                    if(count == 20) break;
                }
            }
            if(!count) SendClientMessage(playerid, COLOR_RED, "ไม่พบผู้เล่นอยู่ใกล้กับคุณ !");
            else Dialog_Show(playerid, Dialog_NearCpr, DIALOG_STYLE_TABLIST, "{FA492D}cpr", str, "ตกลง", "ปิด");
        }
        // การฉีดยา
        if(listitem == 3)
        {
            foreach (new i : Player)
            {
                if(i == playerid) continue;
                new Float:x, Float:y, Float:z;
                new Float:xx, Float:yy, Float:zz;
                GetPlayerPos(i, xx,yy,zz);
                GetPlayerPos(playerid, x,y,z);
                if (isPlayerNearPos(i, 4.0, x,y,z) && GetPlayerInterior(playerid) == GetPlayerInterior(i) && GetPlayerVirtualWorld(playerid) == GetPlayerVirtualWorld(i))
                {

                    format(str, sizeof(str), "%s %s\t%.1fm\n", str, GetPlayerNameEx(i), GetPlayerDistanceFromPoint(playerid, xx, yy, zz));
                    playerNearSelectHeal[playerid][count] = i;
                    count++;

                    if(count == 20) break;
                }
            }
            if(!count) SendClientMessage(playerid, COLOR_RED, "ไม่พบผู้เล่นอยู่ใกล้กับคุณ !");
            else Dialog_Show(playerid, Dialog_NearHeal, DIALOG_STYLE_TABLIST, "{FA492D}การฉีดยา", str, "ตกลง", "ปิด");
        }
		if(listitem == 5)
        {
			Dialog_Show(playerid, DIALOG_SAMPVOICE, DIALOG_STYLE_LIST, "{0FFBFC}[SAMPVOICE]", "ช่องทางคุยกลุ่มและหน่วยงาน", "ตกลง", "ออก");
		}
		if(listitem == 6)
        {
			callcmd::fquit(playerid, "/1");
		}
	}
	return 1;
}

Dialog:Dialog_CANCEL_MEDIC(playerid, response, listitem, inputtext[])
{
    if(!response) return 1;

    if(listitem != -1 && listitem != 21)
    {
        if (playerNearSelectMedic[playerid][listitem] == playerid)
            return ErrorMsg(playerid, "คุณไม่สามารถยกเลิกตัวเองได้!");

        CallMedic[playerNearSelectMedic[playerid][listitem]] = 0;

        SendClientMessageEx(playerNearSelectMedic[playerid][listitem], COLOR_LIGHTRED, "[!] หมอ %s ได้ยกเลิกการต้องการความช่วยเหลือของคุณแล้ว !", GetPlayerNameEx(playerid));
        SendFactionMessageEx(FACTION_MEDIC, COLOR_LIGHTRED, "[!] {ffffff}%s ได้ยกเลิกการต้องการความช่วยเหลือของ %s แล้ว", GetPlayerNameEx(playerid), GetPlayerNameEx(playerNearSelectMedic[playerid][listitem]));

		return true;
    }
    return 1;
}

Dialog:Dialog_NearMedic(playerid, response, listitem, inputtext[])
{
    if(!response) return 1;

    if(listitem != -1 && listitem != 21)
    {
        if (playerNearSelectMedic[playerid][listitem] == playerid)
            return ErrorMsg(playerid, "คุณไม่สามารถค้นหาตัวเองได้!");

        new Float:x,Float:y,Float:z;
        GetPlayerPos(playerNearSelectMedic[playerid][listitem], x,y,z);
        SetPlayerCheckpoint(playerid, x,y,z, 1.5);
        GPSOn[playerid] = 1;
     	GPSNavigateToPoint(playerid, x,y,z);

        IdCheckMedic[playerid] = playerNearSelectMedic[playerid][listitem];
        CheckMedic[playerid] = 1;

        CallMedic[playerNearSelectMedic[playerid][listitem]] = 0;
        MedicType[playerNearSelectMedic[playerid][listitem]] = 0;

        SendClientMessageEx(playerNearSelectMedic[playerid][listitem], COLOR_YELLOW, "[!] หมอ %s กำลังออกตามหาคุณ !", GetPlayerNameEx(playerid));
        SendFactionMessageEx(FACTION_MEDIC, COLOR_YELLOW, "[!] {ffffff}%s ได้ตอบรับการต้องการความช่วยเหลือจาก %s แล้ว", GetPlayerNameEx(playerid), GetPlayerNameEx(playerNearSelectMedic[playerid][listitem]));

		return true;
    }
    return 1;
}

MEDIC_Name(playerid)
{
	new MedicName[64];
	switch(MedicType[playerid])
	{
	    case 1: MedicName = "{F95A04}บาดเจ็บสาหัส";
	    case 2: MedicName = "{F95A04}กำลังอุ้มเอ๋อ";
	}
	return MedicName;
}

Dialog:Dialog_NearCpr(playerid, response, listitem, inputtext[])
{
    if(!response) return 1;

    if(listitem != -1 && listitem != 21)
    {
        new string[20009];
        new price = CPR_PRICE;
        new userid = playerNearSelectCpr[playerid][listitem];

        if (playerNearSelectCpr[playerid][listitem] == playerid)
            return ErrorMsg(playerid, "ไม่สามารถปั้มหัวใจตัวเองได้!");

        if(!Inventory_HasItem(playerid, "กล่องชุบ"))
            return ErrorMsg(playerid, "คุณไม่มี'กล่องชุบ ' กรุณาไปรับที่โรงพยาบาล");

        /*format(str, sizeof(str), "กรุณาระบุราคา(ในการ(ชุบCPR)ผู้เล่น %s", str, GetPlayerNameEx(i), GetPlayerDistanceFromPoint(playerid, x, y, z));
        Dialog_Show(playerid, Dialog_NearChm, DIALOG_STYLE_TABLIST, "{FA492D}รายชื่อผู้บาดเจ็บ", str, "ตกลง", "ปิด");
*/
        playerData[playerid][pMedicOfferID] = userid;
		playerData[playerid][pMedicOfferPrice] = price;
		playerData[userid][pMedicOfferID] = playerid;
		playerData[userid][pMedicOfferPrice] = price;
        
		format(string, sizeof string, "{FFFFFF}ตอบรับการรักษาจากหมอ (ชุบ CPR) %s ราคา %s", GetPlayerNameEx(playerid), FormatMoney(price));
	    Dialog_Show(userid, DIALOG_ACCEPT555, DIALOG_STYLE_MSGBOX, "[ยืนยัน]", string, "ยืนยัน", "ปิด");
    }
    return 1;
}

// Cpr Box
Dialog:Dialog_NearCpr_person(playerid, response, listitem, inputtext[])
{
    if(!response) return 1;

    if(listitem != -1 && listitem != 21)
    {
        if (playerNearSelectCpr[playerid][listitem] == playerid)
            return ErrorMsg(playerid, "ไม่สามารถปั้มหัวใจตัวเองได้!");

        if(!Inventory_HasItem(playerid, "กล่องชุบ"))
            return ErrorMsg(playerid, "คุณไม่มี'กล่องชุบ' กรุณาไปรับที่ล็อคเกอร์");

        InjuredID[playerid] = playerNearSelectCpr[playerid][listitem];
        InjuredID[playerNearSelectCpr[playerid][listitem]] = playerid;
        new string[128];
        format(string, sizeof(string), "{00ff00}%s {ffffff}ต้องการที่จะ {00ffff}ปั้มหัวใจ{ffffff} ให้กับคุณ", GetPlayerNameEx(playerid));
        Dialog_Show(playerNearSelectCpr[playerid][listitem], Dialog_NearCpr_person, DIALOG_STYLE_MSGBOX, "Cpr", string, "ตกลง", "ยกเลิก");
        return true;
    }
    return 1;
}

Dialog:CprMenu_Medic(playerid, response, listitem, inputtext[])
{
	if(!response)
	{
		SendClientMessageEx(InjuredID[playerid], COLOR_RED, "ผู้บาดเจ็บ %s ได้ปฏิเสธการรักษาของคุณ", GetPlayerNameEx(playerid));
		InjuredID[InjuredID[playerid]] = 999;
		InjuredID[playerid] = 999;
		return 1;
	}

	if(response)
	{
        SendClientMessageEx(playerid, COLOR_RED, "[!] {ffffff}%s กำลังรักษาให้คุณ", GetPlayerNameEx(InjuredID[playerid]));
        SendClientMessageEx(InjuredID[playerid], COLOR_RED, "[!] {ffffff}คุณกำลังรักษาให้กับ %s ", GetPlayerNameEx(playerid));
        Inventory_Remove(InjuredID[playerid], "กล่องชุบ", 1);
		SetPlayerHealth(playerid,50);
		playerData[playerid][pInjured] = 0;
		playerData[playerid][pInjuredTime] = 0;
		ApplyAnimation(InjuredID[playerid], "MEDIC", "CPR", 4.1, 0, 0, 0, 0, 0, 1);
		ClearAnimations(playerid);
        TogglePlayerControllable(playerid, 1);
       
		SetPlayerColor(playerid, 0xFFFFFFFF);
		InjuredID[InjuredID[playerid]] = 999;
		InjuredID[playerid] = 999;
        InjuredCallMedic[playerid] = 0;
        InjuredCallMedicEx[playerid] = 0;
	}
	return 1;
}

// Heal Box

Dialog:Dialog_NearHeal_Police(playerid, response, listitem, inputtext[])
{
    if(!response) return 1;

    if(listitem != -1 && listitem != 21)
    {
        if (playerNearSelectCpr[playerid][listitem] == playerid)
            return ErrorMsg(playerid, "ไม่สามารถปั้มหัวใจตัวเองได้!");

        if(!Inventory_HasItem(playerid, "Heal PoliceBox"))
            return ErrorMsg(playerid, "คุณไม่มีกล่องชุบ กรุณาไปรับที่ล็อคเกอร์ตำรวจ");

        InjuredID[playerid] = playerNearSelectCpr[playerid][listitem];
        InjuredID[playerNearSelectCpr[playerid][listitem]] = playerid;
        new string[128];
        format(string, sizeof(string), "{00ff00}%s {ffffff}ต้องการที่จะ {00ffff}ชุบชีวิต{ffffff} ให้กับคุณ", GetPlayerNameEx(playerid));
        Dialog_Show(playerNearSelectCpr[playerid][listitem], HealMenu_Police, DIALOG_STYLE_MSGBOX, "Cpr", string, "ตกลง", "ยกเลิก");
        return true;
    }
    return 1;
}

Dialog:HealMenu_Police(playerid, response, listitem, inputtext[])
{
	if(!response)
	{
		SendClientMessageEx(InjuredID[playerid], COLOR_RED, "ผู้บาดเจ็บ %s ได้ปฏิเสธการรักษาของคุณ", GetPlayerNameEx(playerid));
		InjuredID[InjuredID[playerid]] = 999;
		InjuredID[playerid] = 999;
		return 1;
	}

	if(response)
	{
        SendClientMessageEx(playerid, COLOR_RED, "[!] {ffffff}%s กำลังรักษาให้คุณ", GetPlayerNameEx(InjuredID[playerid]));
        SendClientMessageEx(InjuredID[playerid], COLOR_RED, "[!] {ffffff}คุณกำลังรักษาให้กับ %s ", GetPlayerNameEx(playerid));
        Inventory_Remove(InjuredID[playerid], "Heal PoliceBox", 1);
		SetPlayerHealth(playerid,100);
		playerData[playerid][pInjured] = 0;
		playerData[playerid][pInjuredTime] = 0;
		ApplyAnimation(InjuredID[playerid], "MEDIC", "CPR", 4.1, 0, 0, 0, 0, 0, 1);
		ClearAnimations(playerid);
        TogglePlayerControllable(playerid, 1);
        
		SetPlayerColor(playerid, 0xFFFFFFFF);
		InjuredID[InjuredID[playerid]] = 999;
		InjuredID[playerid] = 999;
        InjuredCallMedic[playerid] = 0;
        InjuredCallMedicEx[playerid] = 0;
	}
	return 1;
}
/*
Dialog:Dialog_NearCpr(playerid, response, listitem, inputtext[])
{
    if(!response) return 1;

    if(listitem != -1 && listitem != 21)
    {
        new string[20009];
        new price = CPR_PRICE;
        new userid = playerNearSelectCpr[playerid][listitem];

        if (playerNearSelectCpr[playerid][listitem] == playerid)
            return ErrorMsg(playerid, "ไม่สามารถปั้มหัวใจตัวเองได้!");

        if(!Inventory_HasItem(playerid, "กล่องปฐมพยาบาล"))
            return ErrorMsg(playerid, "คุณไม่มี'กล่องปฐมพยาบาล ' กรุณาไปรับที่โรงพยาบาล");
*/
        /*format(str, sizeof(str), "กรุณาระบุราคา(ในการ(ชุบCPR)ผู้เล่น %s", str, GetPlayerNameEx(i), GetPlayerDistanceFromPoint(playerid, x, y, z));
        Dialog_Show(playerid, Dialog_NearChm, DIALOG_STYLE_TABLIST, "{FA492D}รายชื่อผู้บาดเจ็บ", str, "ตกลง", "ปิด");
*/
        /*playerData[playerid][pMedicOfferID] = userid;
		playerData[playerid][pMedicOfferPrice] = price;
		playerData[userid][pMedicOfferID] = playerid;
		playerData[userid][pMedicOfferPrice] = price;
        
		format(string, sizeof string, "{FFFFFF}ตอบรับการรักษาจากหมอ (ชุบ CPR) %s ราคา %s", GetPlayerNameEx(playerid), FormatMoney(price));
	    Dialog_Show(userid, DIALOG_ACCEPT555, DIALOG_STYLE_MSGBOX, "[ยืนยัน]", string, "ยืนยัน", "ปิด");

    }
    return 1;
}*/
Dialog:DIALOG_ACCEPT555(playerid, response, listitem, inputtext[])
{
	new userid = playerData[playerid][pMedicOfferID];
	new price = playerData[playerid][pMedicOfferPrice];
	if (response)
	{
		Inventory_Remove(userid, "กล่องชุบ", 1);

		StartCpr(userid,playerid);
		Add_Ticket(playerData[playerid][pID], userid, price, "รักษาบาดแผลตามร่างกาย (CPR)");

	    SendClientMessageEx(userid, COLOR_WHITE, "คุณได้รักษาอาการบาดเจ็บให้ {33CCFF}%s{FFFFFF} เป็นจำนวนเงิน $%d", GetPlayerNameEx(playerid), price);
	    SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "%s {FFFFFF}ได้รักษาอาการบาดเจ็บให้คุณ เป็นจำนวนเงิน $%d", GetPlayerNameEx(userid), price);
	    SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s ได้รักษาอาการบาดเจ็บให้ %s", GetPlayerNameEx(userid), GetPlayerNameEx(playerid));
        InjuredID[userid] = 999;
		InjuredID[playerid] = 999;
        InjuredCallMedic[userid] = 0;
        InjuredCallMedicEx[userid] = 0;
		ApplyAnimation(playerid, "MEDIC","CPR", 4.1, 1, 0, 0, 1, 0, 1);
		ApplyAnimation(userid, "CARRY", "crry_prtial", 4.0, 0, 0, 0, 0, 1);
		ClearAnimations(userid);
/*
		playerData[userid][pMedicOfferID] = INVALID_PLAYER_ID;
		playerData[userid][pMedicOfferPrice] = 0;
		playerData[playerid][pMedicOfferID] = INVALID_PLAYER_ID;
		playerData[playerid][pMedicOfferPrice] = 0;
*/
	}
	else
	{
		playerData[userid][pMedicOfferID] = INVALID_PLAYER_ID;
		playerData[userid][pMedicOfferPrice] = 0;
		playerData[playerid][pMedicOfferID] = INVALID_PLAYER_ID;
		playerData[playerid][pMedicOfferPrice] = 0;
		ClearAnimations(userid);
	}
	return 1;
}
Dialog:Dialog_NearHeal(playerid, response, listitem, inputtext[])
{
    if(!response) return 1;

    if(listitem != -1 && listitem != 21)
    {
        if (playerNearSelectHeal[playerid][listitem] == playerid)
            return ErrorMsg(playerid, "ไม่สามารถฉีดยาตัวเองได้!");

		new userid = playerNearSelectCpr[playerid][listitem];

        playerData[playerid][pMedicOfferID] = userid;
		playerData[userid][pMedicOfferID] = playerid;


        /*if(!Inventory_HasItem(playerid, "Heal Box"))
            return ErrorMsg(playerid, "คุณไม่มีกล่องฮิว กรุณาไปรับที่โรงพยาบาล");*/

        /*HealID[playerid] = playerNearSelectHeal[playerid][listitem];
        HealID[playerNearSelectHeal[playerid][listitem]] = playerid;
        new string[128];
        format(string, sizeof(string), "{00ff00}%s {ffffff}ต้องการที่จะ {00ffff}ฮิวเลือด{ffffff} ให้กับคุณ", GetPlayerNameEx(playerid));
        Dialog_Show(playerNearSelectHeal[playerid][listitem], HealMenu, DIALOG_STYLE_MSGBOX, "Heal", string, "ตกลง", "ยกเลิก");
		*/
		Dialog_Show(playerid, Dialog_TypeHeal, DIALOG_STYLE_TABLIST, "{FA492D}การฉีดยา", "{FA492D}+ {FFFFFF}เข็มเล็ก\n{FA492D}+ {FFFFFF}เข็มใหญ่", "ตกลง", "ปิด");
		return true;
    }
    return 1;
}
Dialog:Dialog_TypeHeal(playerid, response, listitem, inputtext[])
{
    if(!response) return 1;

	new userid = playerData[playerid][pMedicOfferID];
    new price;
	if(response)
    {
        switch(listitem)
        {
            case 0:
            {
                HealMType[userid] = 1;
                price = HEAL_PRICE1;
				new string[128];
		        format(string, sizeof(string), "{00ff00}%s {ffffff}ต้องการที่จะ {00ffff}ฉีดยา 'เข็มเล็ก'{ffffff} ให้กับคุณ ในราคา %d", GetPlayerNameEx(playerid),price);
		        Dialog_Show(userid, HealMenu, DIALOG_STYLE_MSGBOX, "{FA492D}ฉีดยา: {FFFFFF}เข็มเล็ก", string, "ตกลง", "ยกเลิก");
			}
			case 1:
			{
			    price = HEAL_PRICE2;
			    HealMType[userid] = 2;
		        new string[128];
		        format(string, sizeof(string), "{00ff00}%s {ffffff}ต้องการที่จะ {00ffff}ฉีดยา 'เข็มใหญ่'{ffffff} ให้กับคุณ ในราคา %d", GetPlayerNameEx(playerid),price);
		        Dialog_Show(userid, HealMenu, DIALOG_STYLE_MSGBOX, "{FA492D}ฉีดยา: {FFFFFF}เข็มใหญ่", string, "ตกลง", "ยกเลิก");
			}
		}
		playerData[playerid][pMedicOfferPrice] = price;
		playerData[userid][pMedicOfferPrice] = price;

	}
	return 1;
}

Dialog:HealMenu(playerid, response, listitem, inputtext[])
{
	new Float:hp;
	GetPlayerHealth(playerid, hp);
	new userid = playerData[playerid][pMedicOfferID];
	new price = playerData[playerid][pMedicOfferPrice];
	if(!response)
	{
		SendClientMessageEx(userid, COLOR_RED, "%s ได้ปฏิเสธการ 'ฉีดยา:เข็มเล็ก'", GetPlayerNameEx(playerid));
		playerData[userid][pMedicOfferID] = INVALID_PLAYER_ID;
		playerData[userid][pMedicOfferPrice] = 0;
		playerData[playerid][pMedicOfferID] = INVALID_PLAYER_ID;
		playerData[playerid][pMedicOfferPrice] = 0;

		return 1;
	}

	if(response)
	{
	    switch(HealMType[playerid]){
	        case 1:{
	            Add_Ticket(playerData[playerid][pID], userid, price, "รักษาจากอาการบาดเจ็บ (Heal)");

		        SendClientMessageEx(playerid, COLOR_RED, "[!] {ffffff}%s กำลัง 'ฉีดยา:เข็มเล็ก' ให้คุณ ได้รับบิลราคา '%d' 1ใบ", GetPlayerNameEx(userid),price);
		        SendClientMessageEx(userid, COLOR_RED, "[!] {ffffff}คุณกำลัง 'ฉีดยา:เข็มเล็ก' ให้กับ %s และได้ให้บิลราคา '%d'", GetPlayerNameEx(playerid),price);
				SetPlayerHealth(playerid,hp + 30.0);
				ClearAnimations(playerid);
		        TogglePlayerControllable(playerid, 1);
				SendClientMessage(playerid, COLOR_WHITE, "คุณได้รับเลือดเพิ่มจำนวน {F52F0F}'30.0' {F96952}HP สำหรับการฉีดยา {FAE80B}'เข็มเล็ก'");
                playerData[userid][pMedicOfferID] = INVALID_PLAYER_ID;
				playerData[userid][pMedicOfferPrice] = 0;
				playerData[playerid][pMedicOfferID] = INVALID_PLAYER_ID;
				playerData[playerid][pMedicOfferPrice] = 0;
			}
			case 2:{
	            Add_Ticket(playerData[playerid][pID], userid, price, "รักษาจากอาการบาดเจ็บ (Heal)");

		        SendClientMessageEx(playerid, COLOR_RED, "[!] {ffffff}%s กำลัง 'ฉีดยา:เข็มใหญ่' ให้คุณ ได้รับบิลราคา '%d' 1ใบ", GetPlayerNameEx(userid),price);
		        SendClientMessageEx(userid, COLOR_RED, "[!] {ffffff}คุณกำลัง 'ฉีดยา:เข็มใหญ่' ให้กับ %s และได้ให้บิลราคา '%d'", GetPlayerNameEx(playerid),price);
				SetPlayerHealth(playerid,hp + 50.0);
				ClearAnimations(playerid);
		        TogglePlayerControllable(playerid, 1);
				SendClientMessage(playerid, COLOR_WHITE, "คุณได้รับเลือดเพิ่มจำนวน {F52F0F}'50.0' {F96952}HP สำหรับการฉีดยา {FAE80B}'เข็มใหญ่'");
                playerData[userid][pMedicOfferID] = INVALID_PLAYER_ID;
				playerData[userid][pMedicOfferPrice] = 0;
				playerData[playerid][pMedicOfferID] = INVALID_PLAYER_ID;
				playerData[playerid][pMedicOfferPrice] = 0;
			}
		}
	}
	return 1;
}
