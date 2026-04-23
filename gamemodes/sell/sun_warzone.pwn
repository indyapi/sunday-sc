/* 
/////////// เขียนขึ้นโดย ..... SUNDAY.dev
////// วันที่ 8/9/65
// ราคา 100บาท


ข้อตกลงการซื้อขายกับแอดซัน

 - ขอความร่วมมือ "ห้ามนำไปแจก" นะครับ
 - นำไปขายต่อได้ ราคาไม่จำกัด
 - ห้ามลบเครดิตผู้เขียนนะครับ
 - ห้ามเอาไปแจกแม้แต่เศษเสี้ยวเลยน้าา ไม่งั้นแอดจะแจกบ้างถ้ามีคนเอาไปแจก
   แจกระบบนี้แหละ ไม่ไปแจกระบบใหม่อะไร

 */
#include    <a_samp>
#include	<YSI_Coding\y_hooks>

#define     PlayerInZone    OnPlayerEnterDynamicArea
#define     PlayerOutZone   OnPlayerLeaveDynamicArea


new Warzone_card[MAX_PLAYERS];
new Warzone_pink;
new Warzone_pink2;
new Warzone_pink3;


hook OnGameModeInit()
{
    Warzone_pink = GangZoneCreate(1400, -2625, 2126, -2387);
    Warzone_pink = CreateDynamicRectangle(1400, -2625, 2126, -2387, -1, -1, -1);

    Warzone_pink2 = GangZoneCreate(1855.9921875, -2388.9921875, 2125.9921875, -2233.9921875);
    Warzone_pink2 = CreateDynamicRectangle(1855.9921875, -2388.9921875, 2125.9921875, -2233.9921875, -1, -1, -1);

    Warzone_pink3 = GangZoneCreate(-80.0078125, 2430.5078125, 438.9921875, 2569.5078125);
    Warzone_pink3 = CreateDynamicRectangle(-80.0078125, 2430.5078125, 438.9921875, 2569.5078125, -1, -1, -1);

    return 1;
}

hook OnPlayerConnect(playerid)
{
    Warzone_card[playerid] = 0;
    return 1;
}

hook OnPlayerSpawn(playerid)
{
    GangZoneShowForAll(Warzone_pink, 0xFF007FFF);
    GangZoneShowForAll(Warzone_pink2, 0xFF007FFF);
    GangZoneShowForAll(Warzone_pink3, 0xFF007FFF);
    return 1;
}

hook PlayerInZone(playerid, areaid)
{
	if(areaid == Warzone_pink)
	{
	    Warzone_card[playerid] = 1;
	}
    if(areaid == Warzone_pink2)
	{
	    Warzone_card[playerid] = 1;
	}
    if(areaid == Warzone_pink3)
	{
	    Warzone_card[playerid] = 1;
	}
	return 1;
}

hook PlayerOutZone(playerid, areaid)
{
	if(areaid == Warzone_pink)
	{
        Warzone_card[playerid] = 0;
        ResetPlayerWeaponsEx(playerid);
	}
    if(areaid == Warzone_pink2)
	{
        Warzone_card[playerid] = 0;
        ResetPlayerWeaponsEx(playerid);
	}
    if(areaid == Warzone_pink3)
	{
        Warzone_card[playerid] = 0;
        ResetPlayerWeaponsEx(playerid);
    }
	return 1;
}

hook OnPlayerUpdate(playerid)
{
    new Float:X, Float:Y, Float:Z;
	GetPlayerPos(playerid, X,Y,Z);

	if (Warzone_card[playerid] == 1)
	{
        if(playerData[playerid][pInjured] == 1)
        {
            playerData[playerid][pInjuredTime] = 5;
            GivePlayerMoneyEx(playerid, -20);
            SendClientMessage(playerid, COLOR_LIGHTRED, "[-] {FFFFFF}เงินเขียว -20 จากเลเบล");
            ResetPlayerWeaponsEx(playerid);
        }
	}
    return 1;
}