//ระบบสตอรี่ By : HarVestDev Developer
#include	<YSI_Coding\y_hooks>

static			pStoryId[MAX_PLAYERS], pStoryHours[MAX_PLAYERS], pStoryMsg[MAX_PLAYERS];

CMD:story(playerid, params[])
{
    if (playerData[playerid][pFactionRank] < factionData[playerData[playerid][pFaction]][factionRanks] - 1)
	    return SendClientMessageEx(playerid, COLOR_RED, "[ ! ] {FFFFFF}คุณต้องมียศอย่างน้อยระดับ %d", factionData[playerData[playerid][pFaction]][factionRanks] - 1);

	new string[1000], string2[1000], var[15], count;
	foreach(new i : Player)
	{
		if (i == playerid) continue;
				
		if (IsPlayerNearPlayer(playerid, i, 5.0) && playerData[i][pFactionRank] > factionData[playerData[i][pFaction]][factionRanks] - 1)
		{
			format(string, sizeof(string), "%s\t%s\n", GetPlayerNameEx(i), Faction_GetName(i));
			strcat(string2,string);
			format(var, sizeof(var), "STORYID%d", count);
			SetPVarInt(playerid, var, i);
			count++;
		}
	}
	Dialog_Show(playerid, Dialog_Story, DIALOG_STYLE_TABLIST, "Auto Story", string2, "ตกลง", "ออก");
    return 1;
}

Dialog:Dialog_Story(playerid, response, listitem, inputtext[])
{
	if (response)
	{
		new var[15];
		format(var, sizeof(var), "STORYID%d", listitem);
	    new userid = GetPVarInt(playerid, var);

		pStoryId[playerid] = userid;
        pStoryId[userid] = playerid;
		Dialog_Show(playerid,Dialog_Story2,DIALOG_STYLE_INPUT,"Auto Story","ใส่จำนวนชั่วโมงที่ต้องการจะเล่นสตอรี่กับ %s {FFFF00}(สูงสุด 72 ชั่วโมง)","ตกลง","ยกเลิก", Faction_GetName(userid));
	}
	return 1;
}

Dialog:Dialog_Story2(playerid, response, listitem, inputtext[])
{
	if (response)
	{
		new hours, var[32];
		format(var, sizeof(var), "STORYID%d", listitem);
	    new userid = GetPVarInt(playerid, var);
	    //new userid = pStoryId[playerid];

		if(sscanf(inputtext, "d", hours))
			return Dialog_Show(playerid,Dialog_Story2,DIALOG_STYLE_INPUT,"Auto Story","ใส่จำนวนชั่วโมงที่ต้องการจะเล่นสตอรี่กับ %s {FFFF00}(สูงสุด 72 ชั่วโมง)","ตกลง","ยกเลิก", Faction_GetName(userid));	

        if (hours < 1 || hours > 72)
	    return Dialog_Show(playerid,Dialog_Story2,DIALOG_STYLE_INPUT,"Auto Story","ใส่จำนวนชั่วโมงที่ต้องการจะเล่นสตอรี่กับ %s {FFFF00}(สูงสุด 72 ชั่วโมง)","ตกลง","ยกเลิก", Faction_GetName(userid));
		
		pStoryHours[playerid] = strval(inputtext);

		pStoryHours[userid] = hours;
		Dialog_Show(playerid,Dialog_Story3,DIALOG_STYLE_INPUT,"Auto Story","กรุณากรอกข้อตกลงในการเล่นสตอรี่กับ %s {FFFF00}(สูงสุด 100 อักษร)","ตกลง","ยกเลิก", Faction_GetName(userid));
	}
	return 1;
}

Dialog:Dialog_Story3(playerid, response, listitem, inputtext[])
{
	if (response)
	{
		new msg;
        new hours = pStoryHours[playerid];
	    new userid = pStoryId[playerid];

		if(sscanf(inputtext, "s[100]", msg))
			return Dialog_Show(playerid,Dialog_Story3,DIALOG_STYLE_INPUT,"Auto Story","กรุณากรอกข้อตกลงในการเล่นสตอรี่กับ %s {FFFF00}(สูงสุด 100 อักษร)","ตกลง","ยกเลิก", Faction_GetName(userid));

        pStoryMsg[playerid] = strval(inputtext);
        pStoryMsg[userid] = strval(inputtext);
        pStoryHours[userid] = hours;

		new Player[330];
		format(Player, sizeof Player, "\
			คุณอาศัย : ที่ประเทศ {FF8040}UNITY TOWN\n\
			{00FFFF}แก๊ง %s {FFFFFF}ได้ขอเปิดสตอรี่กับแก๊งของคุณ\n\
			{00FFFF}เป็นเวลา %d ชั่วโมง\n\
            {FFFFFF}กฏสตอรี่ : %s",
		Faction_GetName(playerid), hours, msg);
		Dialog_Show(userid, Dialog_StoryAnswer, DIALOG_STYLE_MSGBOX, "[ยืนยันการเปิดแก๊ง]", Player, "ยืนยัน", "กลับ");
	}
	return 1;
}

CMD:st1(playerid, params[])
{
    new userid;
    if(GetFactionType(playerid) != FACTION_GANG)
    {
        return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณไม่ใช่แก็ง");
    }
    new Player[650];
    format(Player, sizeof Player, "\
    คุณอาศัย : ที่ประเทศ {FF8040}UNITY TOWN\n\
    {00FFFF}แก๊ง %s {FFFFFF}ได้ขอเปิดสตอรี่กับแก๊งของคุณ", Faction_GetName(userid));
    Dialog_Show(playerid, Only, DIALOG_STYLE_MSGBOX, "[ยืนยันการเปิดแก๊ง]", Player, "ยืนยัน", "กลับ");
    return 1;
}

Dialog:Dialog_StoryAnswer(playerid, response, listitem, inputtext[])
{
    if (response)
    {
        new string[500];
        new userid = pStoryId[playerid];

		format(string, sizeof(string), "{FF6600}[สภาแก๊ง] {FFFFFF}%s ได้ตกลงที่จะเปิดสตอรี่กับแก๊ง %s แล้ว", Faction_GetName(userid), Faction_GetName(playerid));
		SendClientMessageToAllEx(COLOR_ORANGE, string);
    }
	return 1;
}