#include <YSI_Coding\y_hooks>

#include <sampvoice>

// ตัวแปรโกลบอล (Global Variables)
new SV_GSTREAM:PoliceTalk;
new SV_GSTREAM:MedicTalk;
new SV_GSTREAM:MecTalk;

new bool:ConnectPolice[MAX_PLAYERS];
new bool:ConnectMedic[MAX_PLAYERS];
new bool:ConnectMec[MAX_PLAYERS];

hook OnGameModeInit()
{
	new string[64];

	// --> สร้างไมค์สำหรับ ตำรวจ
	format(string, sizeof(string), "Police");
	PoliceTalk = SvCreateGStream(COLOR_LIGHTBLUE, string);

	// --> สร้างไมค์สำหรับ หมอและแพทย์
	format(string, sizeof(string), "Medic");
	MedicTalk = SvCreateGStream(COLOR_RED, string);

	// --> สร้างไมค์สำหรับ หมอและแพทย์
	format(string, sizeof(string), "Mechanic");
	MecTalk = SvCreateGStream(COLOR_ORANGE, string);
}

hook OnPlayerConnect(playerid)
{
	ConnectPolice[playerid] = false;
	ConnectMedic[playerid] = false;
	ConnectMec[playerid] = false;
}

Dialog:DIALOG_SAMPVOICE(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		switch(listitem)
		{
			case 0:{
				if (SvGetVersion(playerid) == SV_NULL) Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "{F1220D}ตรวจสอบระบบไมค์!", "คุณไม่มีตัวเสริมระบบไมค์ของเซิร์ฟเวอร์", "ปิด", "");

				if(GetFactionType(playerid) == FACTION_POLICE)
				{
					if(!ConnectPolice[playerid])
					{
						ConnectPolice[playerid] = true;
						SvAttachListenerToStream(PoliceTalk, playerid);
						SvAttachSpeakerToStream(PoliceTalk, playerid);
						Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "{0D7FF1}วิทยุหน่วยงาน: ตำรวจ", "คุณได้ทำการเชื่อมต่อ 'ไมค์โครโฟน' ไปยังกลุ่มและหน่วยงาน..", "ปิด", "");
					}
					else{
						ConnectPolice[playerid] = false;
						SvDetachListenerFromStream(PoliceTalk, playerid);
						SvDetachSpeakerFromStream(PoliceTalk, playerid);
						Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "{0D7FF1}วิทยุหน่วยงาน: ตำรวจ", "คุณได้ทำการถอดการเชื่อมต่อออกจากกลุ่มและหน่วยงาน..", "ปิด", "");
					}
				}

				else if(GetFactionType(playerid) == FACTION_MEDIC){
					if(!ConnectMedic[playerid])
					{
						ConnectMedic[playerid] = true;
						SvAttachListenerToStream(MedicTalk, playerid);
						SvAttachSpeakerToStream(MedicTalk, playerid);
						Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "{F10D7F}วิทยุหน่วยงาน: หมอ", "คุณได้ทำการเชื่อมต่อ 'ไมค์โครโฟน' ไปยังกลุ่มและหน่วยงาน..", "ปิด", "");
					}
					else{
						ConnectMedic[playerid] = false;
						SvDetachListenerFromStream(MedicTalk, playerid);
						SvDetachSpeakerFromStream(MedicTalk, playerid);
						Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "{F10D7F}วิทยุหน่วยงาน: หมอ", "คุณได้ทำการถอดการเชื่อมต่อออกจากกลุ่มและหน่วยงาน..", "ปิด", "");
					}
				}

				else if(GetFactionType(playerid) == FACTION_MEC){
					if(!ConnectMec[playerid])
					{
						ConnectMec[playerid] = true;
						SvAttachListenerToStream(MecTalk, playerid);
						SvAttachSpeakerToStream(MecTalk, playerid);
						Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "{F1710D}วิทยุหน่วยงาน: ช่างซ่อมรถ", "คุณได้ทำการเชื่อมต่อ 'ไมค์โครโฟน' ไปยังกลุ่มและหน่วยงาน..", "ปิด", "");
					}
					else{
						ConnectMec[playerid] = false;
						SvDetachListenerFromStream(MecTalk, playerid);
						SvDetachSpeakerFromStream(MecTalk, playerid);
						Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "{F1710D}วิทยุหน่วยงาน: ช่างซ่อมรถ", "คุณได้ทำการถอดการเชื่อมต่อออกจากกลุ่มและหน่วยงาน..", "ปิด", "");
					}
				}
			}
		}
	}
	return 1;
}

alias:onradio("cr")
CMD:onradio(playerid)
{
	if (GetFactionType(playerid) != FACTION_POLICE && GetFactionType(playerid) != FACTION_MEDIC && GetFactionType(playerid) != FACTION_MEC)
	    return SendClientMessage(playerid, COLOR_RED, "[ ! ] {FFFFFF}ช่องทางนี้สำหรับรัฐบาลเท่านั้น!");

	return Dialog_Show(playerid, DIALOG_SAMPVOICE, DIALOG_STYLE_LIST, "{F1E70D}วิทยุหน่วยงาน", "\
 		ช่องทางคุยกลุ่มและหน่วยงาน", "ตกลง", "ออก");
}
