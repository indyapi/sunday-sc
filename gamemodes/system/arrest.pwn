#include	<YSI_Coding\y_hooks>

/*hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid))
    {
        if(Arrest_Nearest(playerid) != -1)
        {
	        new id = Arrest_Nearest(playerid), userid;
            new params[500];

			if(GetFactionType(playerid) != FACTION_POLICE)
				return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ช่องทางนี้สำหรับเจ้าหน้าที่เท่านั้น!");

			if (id == -1)
			    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณไม่ได้อยู่จุดส่งผู้ต้องหาเข้าคุก");

			if (sscanf(params, "u", userid))
			    return SendClientMessage(playerid, COLOR_WHITE, "/arrest [ไอดี/ชื่อ]");

			if (userid == INVALID_PLAYER_ID)
			    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ผู้เล่นไอดีนี้ไม่ได้อยู่ในเกม");

			if (userid == playerid)
			    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ไม่สามารถส่งตัวเองเข้าคุกได้");

			if (!IsPlayerNearPlayer(playerid, userid, 5.0))
			    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ผู้เล่นไอดีนี้ไม่ได้อยู่ใกล้คุณ");

			new string100[4096];
			new string2[4096];

			format(string100, sizeof(string100), "ดาว\tนาที\tค่าปรับ\n");
			strcat(string2,string100);

			format(string100, sizeof(string100), "1 ดาว\t3 นาที\t$2,000\n");
			strcat(string2,string100);

			format(string100, sizeof(string100), "2 ดาว\t6 นาที\t$4,000\n");
			strcat(string2,string100);

			format(string100, sizeof(string100), "3 ดาว\t9 นาที\t$6,000\n");
			strcat(string2,string100);

			format(string100, sizeof(string100), "4 ดาว\t12 นาที\t$8,000\n");
			strcat(string2,string100);

			format(string100, sizeof(string100), "5 ดาว\t15 นาที\t$10,000\n");
			strcat(string2,string100);

			format(string100, sizeof(string100), "6 ดาว\t18 นาที\t$12,000\n");
			strcat(string2,string100);

			format(string100, sizeof(string100), "ครอบครองของผิดกฎหมาย\t20 นาที\t$5,000\n");
			strcat(string2,string100);

			format(string100, sizeof(string100), "ทำร้ายร่างกาย\t10 นาที\t$5,000\n");
			strcat(string2,string100);

			format(string100, sizeof(string100), "ทะเลาะวิวาท\t15 นาที\t$5,000\n");
			strcat(string2,string100);

			format(string100, sizeof(string100), "ฆ่าตำรวจ\t30 นาที\t$50,000\n");
			strcat(string2,string100);

			ArrestIDType[playerid] = userid;
			Dialog_Show(playerid, DIALOG_ARREST, DIALOG_STYLE_TABLIST_HEADERS, "{FFFFFF}[ส่งเข้าคุก{FFFFFF}]", string2, "ตกลง", "ยกเลิก");
            return 1;
		}
    }
    return 1;
}*/

Dialog:DIALOG_ARREST(playerid, response, listitem, inputtext[])
{
	new userid = ArrestIDType[playerid], factionid = playerData[playerid][pFaction];
	if (response)
	{
		switch(listitem)
		{
		    case 0:
		    {
				playerData[userid][pPrisoned] = 1;
				playerData[userid][pJailTime] = 3 * 60; // time * 60

				//playerData[userid][pPrisonOut] = id;

				StopDragging(userid);
				SetPlayerInPrison(userid);

				ResetPlayerWeaponsEx(userid);
				ResetPlayer(userid);

				playerData[userid][pCuffed] = 0;

				GivePlayerMoneyEx(userid, -2000);
				//GivePlayerMoneyEx(playerid, 2000);

				factionData[factionid][fLocker][5] += 2000;

				ResetPlayerWantedLevelEx(userid);

			    SetPlayerSpecialAction(userid, SPECIAL_ACTION_NONE);

			    SendClientMessageToAllEx(COLOR_LIGHTRED, ">>> ผู้ต้องหา %s ถูกนำตัวเข้าคุกเป็นเวลา 3 นาที <<<", GetPlayerNameEx(userid));
			}
		    case 1:
		    {
				playerData[userid][pPrisoned] = 1;
				playerData[userid][pJailTime] = 6 * 60; // time * 60

				//playerData[userid][pPrisonOut] = id;

				StopDragging(userid);
				SetPlayerInPrison(userid);

				ResetPlayerWeaponsEx(userid);
				ResetPlayer(userid);

				playerData[userid][pCuffed] = 0;

				GivePlayerMoneyEx(userid, -4000);
				//GivePlayerMoneyEx(playerid, 4000);
				factionData[factionid][fLocker][5] += 4000;

				ResetPlayerWantedLevelEx(userid);

			    SetPlayerSpecialAction(userid, SPECIAL_ACTION_NONE);

			    SendClientMessageToAllEx(COLOR_LIGHTRED, ">>> ผู้ต้องหา %s ถูกนำตัวเข้าคุกเป็นเวลา 6 นาที <<<", GetPlayerNameEx(userid));
			}
		    case 2:
		    {
				playerData[userid][pPrisoned] = 1;
				playerData[userid][pJailTime] = 9 * 60; // time * 60

				//playerData[userid][pPrisonOut] = id;

				StopDragging(userid);
				SetPlayerInPrison(userid);

				ResetPlayerWeaponsEx(userid);
				ResetPlayer(userid);

				playerData[userid][pCuffed] = 0;

				GivePlayerMoneyEx(userid, -6000);
				//GivePlayerMoneyEx(playerid, 6000);
				factionData[factionid][fLocker][5] += 6000;

				ResetPlayerWantedLevelEx(userid);

			    SetPlayerSpecialAction(userid, SPECIAL_ACTION_NONE);

			    SendClientMessageToAllEx(COLOR_LIGHTRED, ">>> ผู้ต้องหา %s ถูกนำตัวเข้าคุกเป็นเวลา 9 นาที <<<", GetPlayerNameEx(userid));
			}
		    case 3:
		    {
				playerData[userid][pPrisoned] = 1;
				playerData[userid][pJailTime] = 12 * 60; // time * 60

				//playerData[userid][pPrisonOut] = id;

				StopDragging(userid);
				SetPlayerInPrison(userid);

				ResetPlayerWeaponsEx(userid);
				ResetPlayer(userid);

				playerData[userid][pCuffed] = 0;

				GivePlayerMoneyEx(userid, -8000);
				//GivePlayerMoneyEx(playerid, 8000);
				factionData[factionid][fLocker][5] += 8000;

				ResetPlayerWantedLevelEx(userid);

			    SetPlayerSpecialAction(userid, SPECIAL_ACTION_NONE);

			    SendClientMessageToAllEx(COLOR_LIGHTRED, ">>> ผู้ต้องหา %s ถูกนำตัวเข้าคุกเป็นเวลา 12 นาที <<<", GetPlayerNameEx(userid));
			}
		    case 4:
		    {
				playerData[userid][pPrisoned] = 1;
				playerData[userid][pJailTime] = 15 * 60; // time * 60

				//playerData[userid][pPrisonOut] = id;

				StopDragging(userid);
				SetPlayerInPrison(userid);

				ResetPlayerWeaponsEx(userid);
				ResetPlayer(userid);

				playerData[userid][pCuffed] = 0;

				GivePlayerMoneyEx(userid, -10000);
				//GivePlayerMoneyEx(playerid, 10000);
				factionData[factionid][fLocker][5] += 10000;

				ResetPlayerWantedLevelEx(userid);

			    SetPlayerSpecialAction(userid, SPECIAL_ACTION_NONE);

			    SendClientMessageToAllEx(COLOR_LIGHTRED, ">>> ผู้ต้องหา %s ถูกนำตัวเข้าคุกเป็นเวลา 15 นาที <<<", GetPlayerNameEx(userid));
			}
		    case 5:
		    {
				playerData[userid][pPrisoned] = 1;
				playerData[userid][pJailTime] = 18 * 60; // time * 60

				//playerData[userid][pPrisonOut] = id;

				StopDragging(userid);
				SetPlayerInPrison(userid);

				ResetPlayerWeaponsEx(userid);
				ResetPlayer(userid);

				playerData[userid][pCuffed] = 0;

				GivePlayerMoneyEx(userid, -12000);
				//GivePlayerMoneyEx(playerid, 12000);
				factionData[factionid][fLocker][5] += 12000;

				ResetPlayerWantedLevelEx(userid);

			    SetPlayerSpecialAction(userid, SPECIAL_ACTION_NONE);

			    SendClientMessageToAllEx(COLOR_LIGHTRED, ">>> ผู้ต้องหา %s ถูกนำตัวเข้าคุกเป็นเวลา 18 นาที <<<", GetPlayerNameEx(userid));
			}
		    case 6:
		    {
				playerData[userid][pPrisoned] = 1;
				playerData[userid][pJailTime] = 20 * 60; // time * 60

				//playerData[userid][pPrisonOut] = id;

				StopDragging(userid);
				SetPlayerInPrison(userid);

				ResetPlayerWeaponsEx(userid);
				ResetPlayer(userid);

				playerData[userid][pCuffed] = 0;

				GivePlayerMoneyEx(userid, -5000);
				//GivePlayerMoneyEx(playerid, 5000);
				factionData[factionid][fLocker][5] += 5000;

				ResetPlayerWantedLevelEx(userid);

			    SetPlayerSpecialAction(userid, SPECIAL_ACTION_NONE);

			    SendClientMessageToAllEx(COLOR_LIGHTRED, ">>> ผู้ต้องหา %s ถูกนำตัวเข้าคุกเป็นเวลา 20 นาที <<<", GetPlayerNameEx(userid));
			}
		    case 7:
		    {
				playerData[userid][pPrisoned] = 1;
				playerData[userid][pJailTime] = 10 * 60; // time * 60

				//playerData[userid][pPrisonOut] = id;

				StopDragging(userid);
				SetPlayerInPrison(userid);

				ResetPlayerWeaponsEx(userid);
				ResetPlayer(userid);

				playerData[userid][pCuffed] = 0;

				GivePlayerMoneyEx(userid, -5000);
				//GivePlayerMoneyEx(playerid, 5000);
				factionData[factionid][fLocker][5] += 5000;

				ResetPlayerWantedLevelEx(userid);

			    SetPlayerSpecialAction(userid, SPECIAL_ACTION_NONE);

			    SendClientMessageToAllEx(COLOR_LIGHTRED, ">>> ผู้ต้องหา %s ถูกนำตัวเข้าคุกเป็นเวลา 10 นาที <<<", GetPlayerNameEx(userid));
			}
		    case 9:
		    {
				playerData[userid][pPrisoned] = 1;
				playerData[userid][pJailTime] = 30 * 60; // time * 60

				//playerData[userid][pPrisonOut] = id;

				StopDragging(userid);
				SetPlayerInPrison(userid);

				ResetPlayerWeaponsEx(userid);
				ResetPlayer(userid);

				playerData[userid][pCuffed] = 0;

				GivePlayerMoneyEx(userid, -50000);
				//GivePlayerMoneyEx(playerid, 50000);
				factionData[factionid][fLocker][5] += 50000;

				ResetPlayerWantedLevelEx(userid);

			    SetPlayerSpecialAction(userid, SPECIAL_ACTION_NONE);

			    SendClientMessageToAllEx(COLOR_LIGHTRED, ">>> ผู้ต้องหา %s ถูกนำตัวเข้าคุกเป็นเวลา 30 นาที <<<", GetPlayerNameEx(userid));
			}
		}
		ArrestIDType[playerid] = -1;
	}
	return 1;
}

