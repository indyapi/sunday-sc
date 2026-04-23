#include <YSI_Coding\y_hooks>

new CheckCase[MAX_PLAYERS] = 0;
new IdCheckCase[MAX_PLAYERS] = 0;
new playerNearSelectCase[MAX_PLAYERS][20];
new CallCase[MAX_PLAYERS];
new CaseType[MAX_PLAYERS];

hook OnPlayerConnect(playerid)
{
    CheckCase[playerid] = 0;
    IdCheckCase[playerid] = 0;
    CallCase[playerid] = 0;
    CaseType[playerid] = 0;
}

alias:checkcase("6")
CMD:checkcase(playerid, params[])
{
	if (GetFactionType(playerid) == FACTION_POLICE)
	{
		Dialog_Show(playerid, D_PoliceMenu, DIALOG_STYLE_LIST, "{037DE4}[ MDC ]", "{037DE4}+ {ffffff}ดูรายชื่อผู้ทำงานผิดกฎหมาย\n{037DE4}+ {ffffff}ยกเลิกรายชื่อผู้ทำงานผิดกฎหมาย", "ตกลง", "ปิด");
	}
	else if (GetFactionType(playerid) == FACTION_MEDIC)
	{
  		Dialog_Show(playerid, Dialog_MEDIC_TYPE, DIALOG_STYLE_LIST, "{F95A04}[ MDC ]", "{F95A04}+ {ffffff}ดูรายชื่อผู้บาดเจ็บหรืออุ้มเอ๋อ\n{F95A04}+ {ffffff}ยกเลิกรายชื่อผู้บาดเจ็บหรืออุ้มเอ๋อ", "ตกลง", "ปิด");
	}
	else if (GetFactionType(playerid) == FACTION_MEC)
	{
  		Dialog_Show(playerid, Dialog_MEC_TYPE, DIALOG_STYLE_LIST, "{5A5657}[ MDC ]", "{5A5657}+ {ffffff}ดูรายชื่อผู้ที่ต้องการช่างซ่อมรถ\n{5A5657}+ {ffffff}ยกเลิกรายชื่อผู้ที่ต้องการช่างซ่อมรถ", "ตกลง", "ปิด");
	}
	else ErrorMsg(playerid, "สำหรับตำรวจหรือแพทย์หรือช่างซ่อมรถเท่านั้น!");
	return 1;
}

Dialog:D_PoliceMenu(playerid, response, listitem, inputtext[])
{
	new
		str[1024],
		count;

    if(response)
    {
        if (!playerData[playerid][pOnDuty])
            return SendClientMessage(playerid, COLOR_RED, "[!]{ffffff}คุณต้องเข้าเวรก่อน!!");

        if(listitem == 0)
        {
			foreach (new i : Player)
			{
				new Float:x, Float:y, Float:z;
				GetPlayerPos(i, x,y,z);

				if (CallCase[i] == 1)
				{
					format(str, sizeof(str), "%s {50DCFB}(ไอดี:%d) %s\t{ffffff}ความผิด:%s\t{ffffff}%.1fm\n", str, i, GetPlayerNameEx(i), CASE_Name(i), GetPlayerDistanceFromPoint(playerid, x, y, z));
					playerNearSelectCase[playerid][count] = i;
					count++;

					if(count == 20) break;
				}
			}
		 	if(!count) ErrorMsg(playerid, "ไม่พบผู้ทำงานผิดกฎหมาย!");
		  	else Dialog_Show(playerid, Dialog_NearCase, DIALOG_STYLE_TABLIST, "{037DE4}[ รายชื่อผู้ทำงานผิดกฎหมาย ]", str, "ตกลง", "ปิด");
		}
        if(listitem == 1)
        {
			foreach (new i : Player)
			{
				new Float:x, Float:y, Float:z;
				GetPlayerPos(i, x,y,z);

				if (CallCase[i] == 1)
				{
					format(str, sizeof(str), "%s {FB9E6C}(ไอดี:%d) %s\t{ffffff}ความผิด:%s\t{ffffff}%.1fm\n", str, i, GetPlayerNameEx(i), CASE_Name(i), GetPlayerDistanceFromPoint(playerid, x, y, z));
					playerNearSelectCase[playerid][count] = i;
					count++;

					if(count == 20) break;
				}
			}
		 	if(!count) ErrorMsg(playerid, "ไม่พบผู้ทำงานผิดกฎหมาย!");
		  	else Dialog_Show(playerid, Dialog_CANCEL_CASE, DIALOG_STYLE_TABLIST, "{ED381F}[ ยกเลิกรายชื่อผู้ทำงานผิดกฎหมาย ]", str, "ตกลง", "ปิด");
		}
		if(listitem == 2)
        {
			Dialog_Show(playerid, DIALOG_SAMPVOICE, DIALOG_STYLE_LIST, "{0FFBFC}[SAMPVOICE]", "ช่องทางคุยกลุ่มและหน่วยงาน", "ตกลง", "ออก");
		}
		if(listitem == 3)
        {
			callcmd::fquit(playerid, "/1");
		}
	}
	return 1;
}

CMD:fquit(playerid, params[])
{
	if (playerData[playerid][pFaction] == -1)
	    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณไม่ใช่หนึ่งในสมาชิกของกลุ่มใด ๆ");

	if (GetFactionType(playerid) == FACTION_POLICE)
	{
	    SetPlayerArmour(playerid, 0);
	    ResetPlayerWeapons(playerid);
	}
	SendClientMessageEx(playerid, COLOR_SERVER, "คุณได้ออกจากกลุ่ม \"%s\" (ยศล่าสุดของคุณคือ %d)", Faction_GetName(playerid), playerData[playerid][pFactionRank]);
    ResetFaction(playerid);
    return 1;
}

Dialog:DIALOG_SAMPVOICE(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		switch(listitem)
		{
			case 0:
			{
				if (SvGetVersion(playerid) == SV_NULL) Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "{ff0000}(sampvoice)", "คุณไม่มีตัวเสริมระบบไมค์ของเซิร์ฟเวอร์", "ปิด", "");		
				
				if(GetFactionType(playerid) == FACTION_POLICE)
				{
					if (!playerData[playerid][pOnDuty])
	                {
						playerData[playerid][pOnDuty] = true;
						SvAttachListenerToStream(PoliceTalk, playerid);
						SvAttachSpeakerToStream(PoliceTalk, playerid);
						Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "{00ff00}(sampvoice)", "คุณได้ทำการเชื่อมต่อ 'ไมค์โครโฟน' ไปยังกลุ่มและหน่วยงาน..", "ปิด", "");					
					}
					else
					{
						playerData[playerid][pOnDuty] = false;
						SvDetachListenerFromStream(PoliceTalk, playerid);
						SvDetachSpeakerFromStream(PoliceTalk, playerid);
						Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "{ff0000}(sampvoice)", "คุณได้ทำการถอดการเชื่อมต่อออกจากกลุ่มและหน่วยงาน..", "ปิด", "");
					}
				}

				else if(GetFactionType(playerid) == FACTION_MEDIC)
				{
					if (!playerData[playerid][pOnDuty])
	                {
						playerData[playerid][pOnDuty] = true;
						SvAttachListenerToStream(MedicTalk, playerid);
						SvAttachSpeakerToStream(MedicTalk, playerid);
						Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "{00ff00}(sampvoice)", "คุณได้ทำการเชื่อมต่อ 'ไมค์โครโฟน' ไปยังกลุ่มและหน่วยงาน..", "ปิด", "");					
					}
					else
					{
						playerData[playerid][pOnDuty] = false;
						SvDetachListenerFromStream(MedicTalk, playerid);
						SvDetachSpeakerFromStream(MedicTalk, playerid);
						Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "{ff0000}(sampvoice)", "คุณได้ทำการถอดการเชื่อมต่อออกจากกลุ่มและหน่วยงาน..", "ปิด", "");
					}					
				}

				else if(GetFactionType(playerid) == FACTION_MEC)
				{
					if(!playerData[playerid][pOnDuty])
					{
						playerData[playerid][pOnDuty] = true;
						SvAttachListenerToStream(MecTalk, playerid);
						SvAttachSpeakerToStream(MecTalk, playerid);
						Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "{00ff00}(sampvoice)", "คุณได้ทำการเชื่อมต่อ 'ไมค์โครโฟน' ไปยังกลุ่มและหน่วยงาน..", "ปิด", "");					
					}
					else
					{
						playerData[playerid][pOnDuty] = false;
						SvDetachListenerFromStream(MecTalk, playerid);
						SvDetachSpeakerFromStream(MecTalk, playerid);
						Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "{ff0000}(sampvoice)", "คุณได้ทำการถอดการเชื่อมต่อออกจากกลุ่มและหน่วยงาน..", "ปิด", "");
					}					
				}				
			}
		}
	}
	return 1;
}


Dialog:Dialog_CANCEL_CASE(playerid, response, listitem, inputtext[])
{
    if(!response) return 1;

    if(listitem != -1 && listitem != 21)
    {
        if (playerNearSelectCase[playerid][listitem] == playerid)
            return ErrorMsg(playerid, "คุณไม่สามารถยกเลิกตัวเองได้!");

        CallCase[playerNearSelectCase[playerid][listitem]] = 0;

        SendClientMessageEx(playerNearSelectCase[playerid][listitem], COLOR_LIGHTRED, "[!] เจ้าหน้าที่ตำรวจ %s ได้ยกเลิกหมายจับของคุณ !", GetPlayerNameEx(playerid));
        SendFactionMessageEx(FACTION_POLICE, COLOR_LIGHTRED, "[!] {ffffff}%s ได้ยกเลิกหมายจับ %s", GetPlayerNameEx(playerid), GetPlayerNameEx(playerNearSelectCase[playerid][listitem]));
        return true;
    }
    return 1;
}

Dialog:Dialog_NearCase(playerid, response, listitem, inputtext[])
{
    if(!response) return 1;

    if(listitem != -1 && listitem != 21)
    {
        if (playerNearSelectCase[playerid][listitem] == playerid)
            return ErrorMsg(playerid, "คุณไม่สามารถค้นหาตัวเองได้!");

        new Float:x,Float:y,Float:z;
        GetPlayerPos(playerNearSelectCase[playerid][listitem], x,y,z);
        SetPlayerCheckpoint(playerid, x,y,z, 1.5);

        IdCheckCase[playerid] = playerNearSelectCase[playerid][listitem];
        CheckCase[playerid] = 1;

        CallCase[playerNearSelectCase[playerid][listitem]] = 0;
        CaseType[playerNearSelectCase[playerid][listitem]] = 0;
        
        SendClientMessageEx(playerNearSelectCase[playerid][listitem], COLOR_LIGHTBLUE, "[!] เจ้าหน้าที่ตำรวจ %s กำลังออกตามจับคุณแล้ว !", GetPlayerNameEx(playerid));
        SendFactionMessageEx(FACTION_POLICE, COLOR_LIGHTBLUE, "[!] {ffffff}%s ได้กำลังออกหมายจับผู้ต้องหา %s", GetPlayerNameEx(playerid), GetPlayerNameEx(playerNearSelectCase[playerid][listitem]));
        return true;
    }
    return 1;
}

CASE_Name(playerid)
{
	new casename[64];
	switch(CaseType[playerid])
	{
	    case 1: casename = "{F5543E}ทำการขน กัญชา";
	    case 2: casename = "{F5543E}ทำการขน NZT";
	    case 3: casename = "{F5543E}ทำการขน ปูน";
	    case 4: casename = "{F5543E}ทำการอุ้มเอ๋อ";
	    case 5: casename = "{F5543E}ทำการจกสายไฟ";
	}
	return casename;
}
