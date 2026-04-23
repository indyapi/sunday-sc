#include <YSI_Coding\y_hooks>

new ACWarning[MAX_PLAYERS],
    ACWarningCode2[MAX_PLAYERS],
    toggleACChat[MAX_PLAYERS],
	StopACWarning[MAX_PLAYERS];

new const CHEAT_NAME[][] =
{
	{"AirBreak (onfoot)"},//1
	{"AirBreak (in vehicle)"},//2
	{"teleport hack (onfoot)"},//3
	{"teleport hack (in vehicle)"},//4
	{"teleport hack (into/between vehicles)"},//5
	{"teleport hack (vehicle to player)"},//6
	{"teleport hack (pickups)"},//7
	{"FlyHack (onfoot)"},//8
	{"FlyHack (in vehicle)"},//9
	{"SpeedHack (onfoot)"},//10
	{"SpeedHack (in vehicle)"},//11
	{"Health hack (in vehicle)"},//12
	{"Health hack (onfoot)"},//13
	{"Armour hack"},//14
	{"Money hack"},//15
	{"Weapon hack"},//16
	{"Ammo hack (add)"},//17
	{"Ammo hack (infinite)"},//18
	{"Special actions hack"},//18
	{"GodMode from bullets (onfoot)"},//20
	{"GodMode from bullets (in vehicle)"},//21
	{"Invisible hack"},//22
	{"lagcomp-spoof"},//23
	{"Tuning hack"},//24
	{"Parkour mod"},//25
	{"Quick turn"},//26
	{"Rapid fire"},//27
	{"FakeSpawn"},//28
	{"FakeKill"},//29
	{"Pro Aim"},//30
	{"CJ run"},//31
	{"CarShot"},//32
	{"CarJack"},//33
	{"UnFreeze"},//34
	{"AFK Ghost"},//35
	{"Full Aiming"},//36
	{"Fake NPC"},//37
	{"Reconnect"},//38
	{"High ping"},//39
	{"Dialog hack"},//40
	{"Protection from the sandbox"},//41
	{"Protection against an invalid version"},//42
	{"Rcon hack"},//43
	{"Tuning crasher"},//44
	{"Invalid seat crasher"},//45
	{"Dialog crasher"},//46
	{"Attached object crasher"},//47
	{"Weapon Crasher"},//48
	{"Flood protection connects to one slot"},//49
	{"callback functions"},//50
	{"change seat"},//51
	{"Ddos"},//52
	{"NOP's}"}//53
};



hook OnPlayerConnect(playerid) {
	ACWarning[playerid] = 0;
	ACWarningCode2[playerid] = 0;
    toggleACChat{playerid} = false;
    return 1;
}

ptask WarningRemove[30000](playerid) {
	if (ACWarning[playerid]) {
		ACWarning[playerid]--;
	}	

	if (ACWarningCode2[playerid]) {
		ACWarningCode2[playerid]--;
	}
}

forward OnCheatDetected(playerid, const ip_address[], type, code); 
public OnCheatDetected(playerid, const ip_address[], type, code) 
{	
	if(playerData[playerid][IsLoggedIn] == true) {

		if(type) {
			if(playerData[playerid][pAdmin] == 0 && isPlayerAndroid(playerid) != 0) {
				SendAdminMessage(COLOR_YELLOW, "ANTI-CHEAT: IP %s ถูกสงสัยว่าใช้โปรแกรมโกงรหัส %s (#%d)", ip_address, CHEAT_NAME[code], code);
				// BlockIpAddress(ip_address, 0);
			}
		}
		else 
		{ 
			switch(code) 
			{
				case 5, 6, 11, /*22,*/ 26/*, 27*/: return 1;
				case 12: {
					new Float:hp;
					AntiCheatGetHealth(playerid, hp);
					SetPlayerHealth(playerid, hp);
					return 1; 
				}
				case 13: {
					new Float:hp;
					AntiCheatGetHealth(playerid, hp);
					SetPlayerHealth(playerid, hp);
					return 1;
				}
				case 14: {
					new Float:hp;
					AntiCheatGetArmour(playerid, hp);
					SetPlayerArmour(playerid, hp);
					return 1; 
				}
				case 15:
				{ 
					// new a = AntiCheatGetMoney(playerid); 
					ResetPlayerMoney(playerid); 
					GivePlayerMoney(playerid, playerData[playerid][pMoney]); 
					return 1; 
				}
			}

			if(playerData[playerid][pAdmin] == 0) 
			{
				if (code == 44 || code == 21 || code == 24 || code == 33 || code == 36 || code == 39)  {
				
					return 1;
				}
				
				if (code == 15 || code == 16 || code == 2)
				{
					if(StopACWarning[playerid] == 0)
					{
						SendAdminMessage(COLOR_YELLOW, "ANTI-CHEAT: [%d]%s ถูกเตะเนื่องจากถุกเตือนด่วยโค๊ตรุนแรง %s (#%d)", playerid, GetPlayerNameEx(playerid),CHEAT_NAME[code], code);
						SendClientMessageEx(playerid, -1, "คุณโดน ANTI-CHEAT เตะออกจากเซิฟเวอร์สาเหตุ %s (#%d)",CHEAT_NAME[code], code); 
						Kick(playerid);
						return 1;
					}
					else return 1;
				}

				if (isPlayerAndroid(playerid) != 0 && (code == 4 || code == 32 || code == 39 || code == 52 || code == 47/* || code == 21*/)) {
					return 1;
				}

				if (isPlayerAndroid(playerid) == 0) SendAdminMessage(COLOR_YELLOW, "ANTI-CHEAT: [%d]%s ถูกสงสัยว่าใช้โปรแกรมโกงรหัส %s (#%d) (%d)", playerid, GetPlayerNameEx(playerid), CHEAT_NAME[code], code, ACWarning[playerid]);
				else SendAdminMessage(COLOR_YELLOW, "ANTI-CHEAT: [%d]%s ถูกสงสัยว่าใช้โปรแกรมโกงรหัส %s (#%d) (%d) [เล่นบน Android]", playerid, GetPlayerNameEx(playerid), CHEAT_NAME[code], code, ACWarning[playerid]);
				
				ACWarning[playerid]++;

				if (ACWarning[playerid] >= 3) {
					SendAdminMessage(COLOR_YELLOW, "ANTI-CHEAT: [%d]%s ถูกเตะเนื่องจากถูกเตือนมากกว่า 3 ครั้งจาก Nex-AC", playerid, GetPlayerNameEx(playerid));
					SendClientMessageEx(playerid, -1, "คุณโดน ANTI-CHEAT เตะออกจากเซิฟเวอร์สาเหตุ %s (#%d)",CHEAT_NAME[code], code); 
					Kick(playerid);
					return 1;
				}
			}
		}
	}
    return 1; 
}