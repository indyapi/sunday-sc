#include	<YSI_Coding\y_hooks>

/*======================================================================================================
										[Main]
=======================================================================================================*/

#define MAX_TICKET (20000)
enum ticketData {
    TicketID,
    Exitis,
    TicketMoney,
    TicketOwner,
    TicketText[255],
    TicketGive,
    TicketName[129],
    TicketSQLID,
};

new TicketData[MAX_TICKET][ticketData];

hook OnGameModeInit()
{
	CreateDynamicPickup(1240, 23, 361.829895, 173.499114, 1008.382812);
	CreateDynamic3DTextLabel("{F55D3F}[ จ่ายบิลค่ารักษาของแพทย์ ]\n{F9F10E}(( {ffffff}คุณสามารถจ่าย 'บิลค่ารักษา' ของคุณได้ที่นี่ {F9F10E}))", COLOR_LIGHTRED, 361.829895, 173.499114, 1008.382812, 20.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);

	CreateDynamicPickup(1240, 23, 376.313995, 181.155212, 1008.382812);
	CreateDynamic3DTextLabel("{F9CB0E}[ {F9F20E}แลกแต้มการทำงานของแพทย์ {F9CB0E}]\n{ffffff}กดปุ่ม N", COLOR_LIGHTRED, 376.313995, 181.155212, 1008.382812, 20.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);
}

Add_Ticket(ownerid, give, money, text[])
{
    for (new i = 0; i != MAX_TICKET; i ++)
    {       
        if (!TicketData[i][Exitis])
        {
            TicketData[i][Exitis] = true;
            TicketData[i][TicketOwner] = ownerid;
			TicketData[i][TicketGive] = give;
            TicketData[i][TicketMoney] = money;
            format(TicketData[i][TicketText], 255, text);
            format(TicketData[i][TicketName], 129, GetPlayerNameEx(give));
            TicketData[i][TicketSQLID] = playerData[give][pID];
            
			mysql_tquery(g_SQL, "INSERT INTO `tickets` (`TicketMoney`) VALUES(0)", "OnTicketCreated", "d", i);

            return i;
        }
    }    
    return 1;
}

forward OnTicketCreated(ticketid);
public OnTicketCreated(ticketid)
{
	if (ticketid == -1 || !TicketData[ticketid][Exitis])
	    return 0;

	TicketData[ticketid][TicketID] = cache_insert_id();
	Ticket_Save(ticketid);

	return 1;
}

Ticket_Save(ticketid)
{
	static
	    query[1024];

	format(query, sizeof(query), "UPDATE `tickets` SET  `TicketMoney` = '%d', `TicketOwner` = '%d', `TicketText` = '%s', `TicketGive` = '%d', `TicketName` = '%s', `TicketSQLID` = '%d' WHERE `TicketID` = '%d'",
        TicketData[ticketid][TicketMoney],
        TicketData[ticketid][TicketOwner],
        TicketData[ticketid][TicketText],
		TicketData[ticketid][TicketGive],
		TicketData[ticketid][TicketName],
		TicketData[ticketid][TicketSQLID],
	    TicketData[ticketid][TicketID]
	);
	return mysql_tquery(g_SQL, query);
}

forward Ticket_Load();
public Ticket_Load()
{
	static
	    rows
	;

	cache_get_row_count(rows);

	for (new i = 0; i < rows; i ++) if (i < MAX_TICKET)
	{
	    TicketData[i][Exitis] = true;

	    cache_get_value_name_int(i, "TicketID", TicketData[i][TicketID]);
	    cache_get_value_name_int(i, "TicketMoney", TicketData[i][TicketMoney]);
	    cache_get_value_name_int(i, "TicketOwner", TicketData[i][TicketOwner]);
        cache_get_value_name(i, "TicketText", TicketData[i][TicketText], 255);
		cache_get_value_name_int(i, "TicketGive", TicketData[i][TicketGive]);
        cache_get_value_name(i, "TicketName", TicketData[i][TicketName], 129);
		cache_get_value_name_int(i, "TicketSQLID", TicketData[i][TicketSQLID]);
	}
	printf("[SERVER]: %d Ticket were loaded from \"%s\" database...", rows, MYSQL_DATABASE);
	return 1;
}

Ticket_Delete(ticketid)
{
	if (ticketid != -1 && TicketData[ticketid][Exitis])
	{
	    static
	        string[64];

		mysql_format(g_SQL, string, sizeof(string), "DELETE FROM `tickets` WHERE `TicketID` = '%d'", TicketData[ticketid][TicketID]);
		mysql_tquery(g_SQL, string);

		TicketData[ticketid][Exitis] = false;
		TicketData[ticketid][TicketID] = 0;
        TicketData[ticketid][TicketOwner] = -1;
        TicketData[ticketid][TicketMoney] = 0;
		TicketData[ticketid][TicketGive] = -1;
  		format(TicketData[ticketid][TicketName], 129, "None");
  		TicketData[ticketid][TicketSQLID] = -1;
	}
	return 1;
}

Dialog:DIALOG_BUY_TICKET(playerid, response, listitem, inputtext[])
{
	new var[32],string[256];
	format(var, sizeof(var), "TicketID%d", listitem+1);
	new ticketid = GetPVarInt(playerid, var);    
    if(response)
    {
        if (!IsPlayerInRangeOfPoint(playerid, 3.0, 361.829895, 173.499114, 1008.382812))
            return ErrorMsg(playerid, "คุณไม่ได้อยู่ที่โรงพยาบาล!");
    
        if (playerData[playerid][pMoney] < TicketData[ticketid][TicketMoney])
            return ErrorMsg(playerid, "คุณมีเงินสดไม่เพียงพอจ่ายค่าบิลการรักษาของคุณ");

        GivePlayerMoneyEx(playerid, -TicketData[ticketid][TicketMoney]);

		format(string, sizeof(string), "คุณได้จ่ายบิลรายการ %s เป็นเงินทั้งหมด %s เรียบร้อยแล้ว", TicketData[ticketid][TicketText], FormatNumber(TicketData[ticketid][TicketMoney]));
        SendClientMessage(playerid, COLOR_YELLOW, string);
	
        playerData[playerid][pTicket] --;
        playerData[playerid][pTicketHours] = 0;
        
        new ticket_Owner = GetConnectedOwnerTicketID(ticketid);
        if (ticket_Owner == -1)
        {
			// + แต้มแพทย์ให้กับผู้เล่น
			new query[512];
			mysql_format(g_SQL, query, sizeof(query), "SELECT * FROM `players` WHERE `playerName` = '%e'", TicketData[ticketid][TicketName]);
			mysql_tquery(g_SQL, query, "OnQueryFinished", "dd", playerid, THREAD_MEDICPOINTS);

        }
        else
        {
            playerData[ticket_Owner][pMedicPoints] ++;
            SendClientMessageEx(ticket_Owner, 0xF95F41FF, "บิล : {ffffff}%s {FBA594}ได้ทำการจ่ายบิลของคุณแล้ว, และคุณได้รับแต้ม {ffffff}+ 1", GetPlayerNameEx(playerid));
        }
        Ticket_Delete(ticketid);
    }
    return 1;
}

forward GetConnectedOwnerTicketID(ticketid);
public GetConnectedOwnerTicketID(ticketid)
{
	new owner_Bill = -1;
    foreach (new i : Player)
    {
        if (playerData[i][IsLoggedIn])
        {
            if (playerData[i][pID] == TicketData[ticketid][TicketSQLID])
            {
				owner_Bill = i;
            }
        }
    }
    return owner_Bill;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	// แลกคะแนนการรักษาพยาบาล
	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid))
	{
	    if (IsPlayerInRangeOfPoint(playerid, 3.0, 376.313995, 181.155212, 1008.382812))
	    {
	        if (GetFactionType(playerid) != FACTION_MEDIC)
				return ErrorMsg(playerid, "สำหรับหมอเท่านั้น!");
	    
			Dialog_Show(playerid, DIALOG_TRADE_POINTS, DIALOG_STYLE_INPUT, "{F9CB0E}[ {F9F20E}แลกแต้มการทำงานของแพทย์ {F9CB0E}]", "{F98366}อัตราการแลกคะแนน : {FEAB9F}1 คะแนน / $700\n{ffffff}คุณต้องการแลกเปลี่ยนคะแนนเป็นเงินทั้งหมดกี่คะแนน?\n{2CC3E8}คะแนนปัจจุบัน : {BCF0FD}%s คะแนน", "แลก", "ออก", FormatNumber(playerData[playerid][pMedicPoints]));
		}
	}
	return 1;
}

Dialog:DIALOG_TRADE_POINTS(playerid, response, listitem, inputtext[])
{
	new points = strval(inputtext), cash;
	if (response)
	{
 		if (GetFactionType(playerid) != FACTION_MEDIC)
			return ErrorMsg(playerid, "สำหรับหมอเท่านั้น!");

	    if (points <= 0)
	        return ErrorMsg(playerid, "คุณต้องระบุจำนวนแต้มมากว่า '0 แต้ม'!");

	    if (points > playerData[playerid][pMedicPoints])
	        return ErrorMsg(playerid, "คุณมีแต้มไม่เพียงพอ!");
	        
		cash = points * 600;
		GivePlayerMoneyEx(playerid, cash);
		playerData[playerid][pMedicPoints] -= points;
		
		SendClientMessageEx(playerid, -1, "{F89440}การแลกแต้ม : {FBCBA2}คุณได้รับเงินจำนวน {ffffff}%s {FBCBA2}จากการแลกแต้มทั้งหมด {ffffff}%s แต้ม", FormatMoney(cash), FormatNumber(points));
		SendFactionMessageEx(FACTION_MEDIC, -1, "{F12592}หน่วยงาน : {ffffff}%s {FEB7DD}ได้รับเงินจำนวน {ffffff}%s {FEB7DD}จากการแลกแต้มทั้งหมด {ffffff}%s แต้ม", GetPlayerNameEx(playerid), FormatMoney(cash), FormatNumber(points));

		UpdateplayerData(playerid);
		return 1;
	}
	return 1;
}
