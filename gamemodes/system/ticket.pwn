#include <YSI_Coding\y_hooks>

#define MAX_PLAYER_TICKETS (10)
enum ticketData {
	ticketID,
	ticketExists,
	ticketFee,
	ticketDate[36],
	ticketReason[64]
};
new TicketData[MAX_PLAYERS][MAX_PLAYER_TICKETS][ticketData];

new Float:ticketPoints[][] = {
	{ 764.1409,1453.1310,-74.1940 },
	{ 1169.8281,-1348.1047,2423.0461 }
};

Ticket_Add(suspectid, price, reason[])
{
	new
	    string[160];

	for (new i = 0; i != MAX_PLAYER_TICKETS; i ++) if (!TicketData[suspectid][i][ticketExists])
	{
	    TicketData[suspectid][i][ticketExists] = true;
	    TicketData[suspectid][i][ticketFee] = price;

	    format(TicketData[suspectid][i][ticketDate], 36, ReturnDate());
	    format(TicketData[suspectid][i][ticketReason], 64, reason);

		format(string, sizeof(string), "INSERT INTO `tickets` (`ID`, `ticketFee`, `ticketDate`, `ticketReason`) VALUES('%d', '%d', '%s', '%s')", playerData[suspectid][pID], price, TicketData[suspectid][i][ticketDate], SQL_ReturnEscaped(reason));
		mysql_tquery(g_SQL, string, "OnTicketCreated", "dd", suspectid, i);

		return i;
	}
	return -1;
}

Ticket_Remove(playerid, ticketid)
{
	if (ticketid != -1 && TicketData[playerid][ticketid][ticketExists])
	{
	    new
	        string[90];

		format(string, sizeof(string), "DELETE FROM `tickets` WHERE `ID` = '%d' AND `ticketID` = '%d'", playerData[playerid][pID], TicketData[playerid][ticketid][ticketID]);
		mysql_tquery(g_SQL, string);

	    TicketData[playerid][ticketid][ticketExists] = false;
	    TicketData[playerid][ticketid][ticketID] = 0;
	    TicketData[playerid][ticketid][ticketFee] = 0;
	}
	return 1;
}

hook OnPlayerConnect(playerid)
{
	for (new i = 0; i != MAX_PLAYER_TICKETS; i ++) {
	    TicketData[playerid][i][ticketID] = 0;
		TicketData[playerid][i][ticketExists] = false;
		TicketData[playerid][i][ticketFee] = 0;
	}
}

hook OnGameModeInit()
{
	for(new i = 0; i < sizeof(ticketPoints); i ++) {

	    CreateDynamicPickup(1239, 23, ticketPoints[i][0], ticketPoints[i][1], ticketPoints[i][2], -1);
	    CreateDynamic3DTextLabel("{F30707}จ่ายใบสั่ง\n{FFFFFF}พิมพ์ '/tickets' เพื่อจ่ายใบสั่ง\n{F98282}(หากคุณไม่จ่ายใบสั่งคุณจะถูกจับกุม)", COLOR_LIGHTRED, ticketPoints[i][0], ticketPoints[i][1], ticketPoints[i][2], 30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 40.0);
	}
}

stock IsPlayerNearTicketPoint(playerid) {
	for(new x = 0; x < sizeof(ticketPoints); x ++) {
	    if(IsPlayerInRangeOfPoint(playerid, 3.0, ticketPoints[x][0], ticketPoints[x][1], ticketPoints[x][2])) {
	        return 1;
		}
	}
	return 0;
}

forward OnTicketCreated(playerid, ticketid);
public OnTicketCreated(playerid, ticketid)
{
	TicketData[playerid][ticketid][ticketID] = cache_insert_id();
	return 1;
}

Dialog:MyTickets(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    if (!TicketData[playerid][listitem][ticketExists])
	        return SendClientMessage(playerid, COLOR_LIGHTRED,  "ไม่มีใบสั่งในช่องที่เลือกนี้");

		if (GetPlayerMoneyEx(playerid) < TicketData[playerid][listitem][ticketFee])
		    return SendClientMessage(playerid, COLOR_LIGHTRED,  "คุณไม่สามารถจ่ายใบสั่งนี้ได้");

		GivePlayerMoneyEx(playerid, -TicketData[playerid][listitem][ticketFee]);
        Tax_AddMoney(TicketData[playerid][listitem][ticketFee]);

		SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "คุณได้จ่าย %s ให้กับใบสั่งเป็นจำนวน \"%s\"", FormatNumber(TicketData[playerid][listitem][ticketFee]), TicketData[playerid][listitem][ticketReason]);
		Ticket_Remove(playerid, listitem);
	}
	return 1;
}

CMD:tickets(playerid, params[])
{
	new
	    string[MAX_PLAYER_TICKETS * 64];

	if (!IsPlayerNearTicketPoint(playerid))
	    return SendClientMessage(playerid, COLOR_LIGHTRED,  "คุณจะต้องอยู่ที่สำนักงานตำรวจเพื่อจะจ่ายใบสั่งให้เรียบร้อย");
	
	string[0] = 0;

	for (new i = 0; i < MAX_PLAYER_TICKETS; i ++)
	{
	    if (TicketData[playerid][i][ticketExists])
	        format(string, sizeof(string), "%s%s (%s - %s)\n", string, TicketData[playerid][i][ticketReason], FormatNumber(TicketData[playerid][i][ticketFee]), TicketData[playerid][i][ticketDate]);

		else format(string, sizeof(string), "%sEmpty\n", string);
	}
	return Dialog_Show(playerid, MyTickets, DIALOG_STYLE_LIST, "ใบสั่ง", string, "จ่าย", "ออก");
}

alias:ticket("ให้ใบสั่ง")
CMD:ticket(playerid, params[])
{
	new
	    userid,
	    price,
	    reason[64];

	if (GetFactionType(playerid) != FACTION_POLICE)
		return SendClientMessage(playerid, COLOR_LIGHTRED,  "คุณต้องเป็นเจ้าหน้าที่ตำรวจ");

	if (sscanf(params, "uds[64]", userid, price, reason))
		return SendClientMessage(playerid, COLOR_GREY, "การใช้งาน : {FFFFFF}/ให้ใบสั่ง [playerid/name] [price] [reason]");

	if (userid == INVALID_PLAYER_ID || !IsPlayerNearPlayer(playerid, userid, 5.0))
	    return SendClientMessage(playerid, COLOR_LIGHTRED,  "ผู้เล่นนั้นตัดการเชื่อมต่อหรือไม่ได้อยู่ใกล้คุณ");

	if (userid == playerid)
	    return SendClientMessage(playerid, COLOR_LIGHTRED,  "คุณไม่สามารถเขียนใบสั่งให้ตัวเองได้");
	
	if (price < 1 || price > 100000)
	    return SendClientMessage(playerid, COLOR_LIGHTRED,  "ราคาต้องไม่ต่ำกว่า $1 หรือมากกว่า $100,000");

	new id = Ticket_Add(userid, price, reason);

	if (id != -1) {
	    SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "คุณได้เขียนใบสั่งให้ %s เป็นจำนวน %s สาเหตุ: %s", GetPlayerNameEx(userid), FormatNumber(price), reason);
	    SendClientMessageEx(userid, COLOR_LIGHTBLUE, "%s ได้เขียนใบสั่งให้คุณเป็นจำนวน %s สาเหตุ: %s", GetPlayerNameEx(playerid), FormatNumber(price), reason);

	    SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s ได้เขียนใบสั่งให้กับ %s", GetPlayerNameEx(playerid), GetPlayerNameEx(userid));
	}
	else {
	    SendClientMessageEx(playerid, COLOR_LIGHTRED,  "ผู้เล่นนั้นมีใบสั่ง %d ใบแล้ว", MAX_PLAYER_TICKETS);
	}
	return 1;
}

forward Ticket_Load(playerid);
public Ticket_Load(playerid)
{
	static
	    rows;

	cache_get_row_count(rows);

	for (new i = 0; i < rows && i < MAX_PLAYER_TICKETS; i ++)
	{
		cache_get_value_name(i, "ticketReason", TicketData[playerid][i][ticketReason], 32);
		cache_get_value_name(i, "ticketDate", TicketData[playerid][i][ticketDate], 32);

		TicketData[playerid][i][ticketExists] = true;
		
	    cache_get_value_name_int(i, "ticketID", TicketData[playerid][i][ticketID]);
	    cache_get_value_name_int(i, "ticketFee", TicketData[playerid][i][ticketFee]);
	}
	return 1;
}
