#include 	<YSI_Coding\y_hooks>

// --> เงินตก
new MoneyPickup[MAX_PLAYERS];
new MoneyAmount[MAX_PLAYERS];
new Float:MoneyPos[MAX_PLAYERS][3];
new Text3D:MoneyText[MAX_PLAYERS];
new MoneyActive[MAX_PLAYERS];

hook OnPlayerDeath(playerid, killerid, reason)
{
	// เงินตก
	new money = GetPlayerMoneyEx(playerid), strinzg[256];
	new cash = money*2/100;

	if(cash > 0)
	{
		if(MoneyActive[playerid] == 1)
		{
			DestroyDynamicPickup(MoneyPickup[playerid]);
			DestroyDynamic3DTextLabel(MoneyText[playerid]);
			MoneyPos[playerid][0]=0.0,MoneyPos[playerid][1]=0.0,MoneyPos[playerid][2]=0.0;
			MoneyActive[playerid] = 0;
		}

		new Float:x,Float:y,Float:z;
		GetPlayerPos(playerid,x,y,z);
		GivePlayerMoneyEx(playerid, -cash);

		MoneyPickup[playerid] = CreateDynamicPickup(1550, 23, x,y,z);
		MoneyAmount[playerid] = cash;
		MoneyPos[playerid][0] = x, MoneyPos[playerid][1] = y, MoneyPos[playerid][2] = z;

		format(strinzg,sizeof(strinzg),"{FFFFFF}เจ้าของเงิน : [{FFFF00}%s{FFFFFF}]\n{FFFFFF}จำนวน : [{FFFF00}$%d{FFFFFF}]\n[{FFFF00}แนะนำ{FFFFFF}] : กดปุ่ม {FFFF00}N {FFFFFF}เพื่อเก็บเงิน",GetPlayerNameEx(playerid),cash);
		MoneyText[playerid] = CreateDynamic3DTextLabel(strinzg, 0xFFFFFFFF,x,y,z, 40.0);

		MoneyActive[playerid] = 1;
		SendClientMessageEx(playerid, COLOR_GREY, "[!] เนื่องจากคุณเสียชีวิตทำให้เงินคุณหล่นหาย 10% ($%d)", cash);
	}
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if (newkeys & KEY_NO)
    {
	    // เงินตก
		foreach (new i : Player)
		{
	        if(IsPlayerInRangeOfPoint(playerid,2.0,MoneyPos[i][0],MoneyPos[i][1],MoneyPos[i][2]))
	        {
	        	GivePlayerMoneyEx(playerid, MoneyAmount[i]);
				DestroyDynamicPickup(MoneyPickup[i]);
				DestroyDynamic3DTextLabel(MoneyText[i]);
				ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0);
				MoneyPos[i][0]=0.0,MoneyPos[i][1]=0.0,MoneyPos[i][2]=0.0;
				SendClientMessageEx(playerid, COLOR_YELLOW, "[เงินตก] : {FFFFFF}คุณได้เก็บเงินจำนวน {FFFF00}$%d {FFFFFF}จากผู้เล่น {FFFF00}%s", MoneyAmount[i], GetPlayerNameEx(i));
				return 1;
			}
		}
    }
    return 1;
}

