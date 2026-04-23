#include	<YSI_Coding\y_hooks>

#include 	<discord-cmd>
#include 	<discord-connector>
#define 	DISCORD_CMD_PREFIX '?'

new DCC_Channel:SavagesCity_Discord;
new DCC_Channel:Savages_EveryOne;
new DCC_Channel:Savages_BannedChannel;
new DCC_Channel:SavagesCity_Discord_Whitelist;
new DCC_Channel:SavagesCity_Discord_Ban;
new DCC_Channel:SavagesCity_Discord_Donate;
/*new DCC_Channel:Medic_OnDuty;
new DCC_Channel:Medic_OffDuty;
*/
new DCC_Channel:C_Discord_Login;
new DCC_Channel:C_Discord_Logout;
new DCC_Channel:Dc_Send_Whitelist;
new DCC_Channel:DC_ALLBLUE_ONLINE;
#define     CH_DCC_ID     "1007911197980500009" //ใส่ ID ช่อง Discord ที่จะให้ข้อความแสดง
//959809121887088651
task OnlineDiscord[60000*5](){
	new str[1700];
    format(str, sizeof(str), "\
	[ :wrench: ] ช่างออนไลน์ (%d)\n\
	[ :police_officer: ] ตำรวจออนไลน์(%d)\n\
	[ :hospital: ] แพทย์ออนไลน์ (%d)\n\
	[ :crown: ] นายกออนไลน์ (%d)\n\
	[ :Champion_League__Icon__Fortnite: ] ผู้เล่นออนไลน์ทั้งหมด ($d)\
	", MechanicOnline(),CopOnline(),MedicOnline(),GovOnline(),PlayerOnline());
	new DCC_Embed:ONLINE_EMBED = DCC_CreateEmbed("[ONLINE]");
    DCC_SetEmbedUrl(ONLINE_EMBED, "https://web.facebook.com/gtaunitytown/");//ลิ้งเวลากด caption
    DCC_SetEmbedColor(ONLINE_EMBED, 0x00FFFF);//สีของ embed
    DCC_SetEmbedThumbnail(ONLINE_EMBED, "https://image.pngaaa.com/922/3513922-small.png");//ลิ้งรูปภาพ
    DCC_AddEmbedField(ONLINE_EMBED,DCC_ReturnTimedata(), str, true);//ข้อความคำอธิบาย
    DCC_SendChannelEmbedMessage(DC_ALLBLUE_ONLINE, ONLINE_EMBED); //ส่งข้อความ
}
hook OnGameModeInit()
{
    SavagesCity_Discord = DCC_FindChannelById("956735199645958154");
    Savages_EveryOne = DCC_FindChannelById("1012354815197708298");
    Savages_BannedChannel = DCC_FindChannelById("1012353023542038568");

        
	SavagesCity_Discord_Whitelist = DCC_FindChannelById("1009439350116847707");
    SavagesCity_Discord_Ban = DCC_FindChannelById("1009439350116847707");
    SavagesCity_Discord_Donate = DCC_FindChannelById("1009439350116847707");

    DC_ALLBLUE_ONLINE = DCC_FindChannelById("1007911197980500009");
    
    C_Discord_Login = DCC_FindChannelById("1012347493771661322"); // Discord channel ID
	C_Discord_Logout = DCC_FindChannelById("1012347493771661322"); // Discord channel ID
	Dc_Send_Whitelist = DCC_FindChannelById("1012351272910868532");

	DC_SendEmbedMessage(CH_DCC_ID, "SV ONLINE !!", "https://web.facebook.com/gtaunitytown/",  DCC_ReturnTimedata(), "---------------------------------\nSUNDAY.BOT", 0x66FF33, "https://image.pngaaa.com/922/3513922-small.png");
    
	new str[1700];
    
    format(str, sizeof(str), "\
	[ :wrench: ] ช่างออนไลน์ (%d)\n\
	[ :police_officer: ] ตำรวจออนไลน์(%d)\n\
	[ :hospital: ] แพทย์ออนไลน์ (%d)\n\
	[ :crown: ] นายกออนไลน์ (%d)\n\
	[ :Champion_League__Icon__Fortnite: ] ผู้เล่นออนไลน์ทั้งหมด ($d)\
	", MechanicOnline(),CopOnline(),MedicOnline(),GovOnline(),PlayerOnline());
	new DCC_Embed:ONLINE_EMBED = DCC_CreateEmbed("[ONLINE]");
    DCC_SetEmbedUrl(ONLINE_EMBED, "https://web.facebook.com/gtaunitytown/");//ลิ้งเวลากด caption
    DCC_SetEmbedColor(ONLINE_EMBED, 0x00FFFF);//สีของ embed
    DCC_SetEmbedThumbnail(ONLINE_EMBED, "https://image.pngaaa.com/922/3513922-small.png");//ลิ้งรูปภาพ
    DCC_AddEmbedField(ONLINE_EMBED,DCC_ReturnTimedata(), str, true);//ข้อความคำอธิบาย
    DCC_SendChannelEmbedMessage(DC_ALLBLUE_ONLINE, ONLINE_EMBED); //ส่งข้อความ
}
hook OnGameModeExit()
{
    DC_SendEmbedMessage(CH_DCC_ID, "SV SAVE !!", "https://web.facebook.com/gtaunitytown/",  DCC_ReturnTimedata(), "---------------------------------\nSUNDAY.BOT", 0x990000, "https://image.pngaaa.com/148/958148-small.png");
    return 1;
}


hook OnPlayerConnect(playerid)
{
	new str[356];
    format(str, sizeof(str), "ผู้เล่น %s เชื่อมต่อกับเซิฟเวอร์!", GetPlayerNameEx(playerid));
	new DCC_Embed:embed = DCC_CreateEmbed("[LOGIN]");
    DCC_SetEmbedUrl(embed, "https://web.facebook.com/gtaunitytown/");//ลิ้งเวลากด caption
    DCC_SetEmbedColor(embed, 0x66FF33);//สีของ embed
    DCC_SetEmbedThumbnail(embed, "https://cdn.discordapp.com/attachments/983410749214973982/1012349008737468477/Unity_Logo.png");//ลิ้งรูปภาพ
    DCC_AddEmbedField(embed,DCC_ReturnTimedata(), str, true);//ข้อความคำอธิบาย
    DCC_SendChannelEmbedMessage(C_Discord_Login, embed); //ส่งข้อความ
}
hook OnPlayerDisconnect(playerid, reason)
{
	new str[356];
    format(str, sizeof(str), "ผู้เล่น %s ตัดการเชื่อมต่อจากเซิฟเวอร์", GetPlayerNameEx(playerid));
	new DCC_Embed:embed = DCC_CreateEmbed("[LOGOUT]");
    DCC_SetEmbedUrl(embed, "https://web.facebook.com/gtaunitytown/");//ลิ้งเวลากด caption
    DCC_SetEmbedColor(embed, 0x990000);//สีของ embed
    DCC_SetEmbedThumbnail(embed, "https://cdn.discordapp.com/attachments/983410749214973982/1012349008737468477/Unity_Logo.png");//ลิ้งรูปภาพ
    DCC_AddEmbedField(embed,DCC_ReturnTimedata(), str, true);//ข้อความคำอธิบาย
    DCC_SendChannelEmbedMessage(C_Discord_Logout, embed); //ส่งข้อความ
}
DCMD:help(user, channel, params[])
{
	if (channel != SavagesCity_Discord)
	    return DCC_SendChannelMessage(channel, "`อะไรกัน” : คุณต้องพิมพ์ห้องที่กำหนด`");

    new str[356];

    format(str,sizeof(str),"`|===========================================================================|`");
    DCC_SendChannelMessage(SavagesCity_Discord, str);

	format(str,sizeof(str),"`คำสั่งสำหรับแอดมิน : เซิฟเวอร์ GTA UNITY TOWN`");
    DCC_SendChannelMessage(SavagesCity_Discord, str);

	format(str,sizeof(str),"`+ .whitelist [ชื่อผู้เล่น] ให้ไวริส`");
    DCC_SendChannelMessage(SavagesCity_Discord, str);

	format(str,sizeof(str),"`+ .del_whitelist [ชื่อผู้เล่น] ลบไวริส`");
    DCC_SendChannelMessage(SavagesCity_Discord, str);

	format(str,sizeof(str),"`+ .ban [ชื่อผู้เล่น] แบนผู้เล่น`");
    DCC_SendChannelMessage(SavagesCity_Discord, str);

	format(str,sizeof(str),"`+ .givecoin [ชื่อผู้เล่น] [จำนวน] เสกคอยเข้าตัว`");
    DCC_SendChannelMessage(SavagesCity_Discord, str);

    format(str,sizeof(str),"`|===========================================================================|`");
	DCC_SendChannelMessage(SavagesCity_Discord, str);

	return 1;
}

DCMD:whitelist(user, channel, params[])
{
	new str[2000];

	if (channel != SavagesCity_Discord_Whitelist)
	    return DCC_SendChannelMessage(channel, "`กรุณาอ่าน” : กรูราพิมพ์คำสั่งในช่องที่กำหนดสำหรับแอดมินเท่านั้น`");

	if (isnull(params))
		return DCC_SendChannelMessage(channel, "`คำสั่ง: .whitelist [ชื่อผู้เล่น]`");

	new str_Whitelist[128];

	format(str_Whitelist, sizeof(str_Whitelist), "UPDATE `players` SET `playerWhitelist` = %d WHERE `playerName` = '%s'", 1, SQL_ReturnEscaped(params));
	mysql_tquery(g_SQL, str_Whitelist);

	new string[356];
    format(string, sizeof(string), "ผู้เล่น %s ได้รับไวริสเรียบร้อย",params);
	new DCC_Embed:embed = DCC_CreateEmbed("[WHITE_LIST]");
    DCC_SetEmbedUrl(embed, "https://web.facebook.com/gtaunitytown/");//ลิ้งเวลากด caption
    DCC_SetEmbedColor(embed, 0x66FF33);//สีของ embed
    DCC_SetEmbedThumbnail(embed, "https://cdn.discordapp.com/attachments/983410749214973982/1012349008737468477/Unity_Logo.png");//ลิ้งรูปภาพ
    DCC_AddEmbedField(embed,DCC_ReturnTimedata(), string, true);//ข้อความคำอธิบาย
    DCC_SendChannelEmbedMessage(Dc_Send_Whitelist, embed); //ส่งข้อความ

	format(str,sizeof(str),"`%s ได้รับไวริสแล้ว`", params);
	DCC_SendChannelMessage(SavagesCity_Discord_Whitelist, str);


	/*format(str,sizeof(str),"`เธÿเธฃเธฐเธÿเธฒเธจ : %s เธ–เธนเธÿเน€เธÿเธดเนÿเธกเนÿเธงเธฃเธดเธชเน€เธÿเนÿเธฒเธชเธนเนÿเธÿเธฃเธฐเน€เธ—เธจเน€เธฃเธตเธขเธÿเธฃเนÿเธญเธขเนÿเธฅเนÿเธง` @everyone", params);
	DCC_SendChannelMessage(Savages_EveryOne, str);
*/
    
	return 1;
}

DCMD:del_whitelist(user, channel, params[])
{
	new str_Whitelist[512], str[512];

	if (channel != SavagesCity_Discord_Whitelist)
	    return DCC_SendChannelMessage(channel, "`กรุณาอ่าน” : กรูราพิมพ์คำสั่งในช่องที่กำหนดสำหรับแอดมินเท่านั้น`");

	if (isnull(params))
		return DCC_SendChannelMessage(channel, "`คำสั่ง : .del_whitelist [ชื่อผู้เล่น]`");

	foreach (new i : Player)
	{
	    if (!strcmp(GetPlayerNameEx(i), params, true))
	    {
		    playerData[i][pWhitelist] = 0;
		    UpdateplayerData(i);
		    SendClientMessage(i, COLOR_RED, "AllBlue Bot : {F96E62}คุณถูกเชิญออกจากเซิร์ฟเวอร์, เหตุผล : เนื่องจากคุณถูกถอดไวริสออกจากเซิร์ฟเวอร์");
		    DelayedKick(i);
	    }
	}

	format(str_Whitelist, sizeof(str_Whitelist), "UPDATE `players` SET `playerWhitelist` = %d WHERE `playerName` = '%s'", 0, SQL_ReturnEscaped(params));
	mysql_tquery(g_SQL, str_Whitelist);

	format(str,sizeof(str),"`ถอดไวริส :  %s ถูกถอดไวริสออกจากเซิฟเวอร์แล้ว`", params);
	DCC_SendChannelMessage(SavagesCity_Discord_Whitelist, str);

	/*format(str,sizeof(str),"`ถอดไวริส : %s ถูกถอดไวริสแล้ว` @everyone", params);
	DCC_SendChannelMessage(Savages_EveryOne, str);*/

	new string[356];
    format(string, sizeof(string), "ผู้เล่น %s ถูกถอดไวริสออกจากเซิฟเวอร์",params);
	new DCC_Embed:embed = DCC_CreateEmbed("[WHITE_LIST]");
    DCC_SetEmbedUrl(embed, "https://web.facebook.com/gtaunitytown/");//ลิ้งเวลากด caption
    DCC_SetEmbedColor(embed, 0xFF0000);//สีของ embed
    DCC_SetEmbedThumbnail(embed, "https://cdn.discordapp.com/attachments/983410749214973982/1012349008737468477/Unity_Logo.png");//ลิ้งรูปภาพ
    DCC_AddEmbedField(embed,DCC_ReturnTimedata(), string, true);//ข้อความคำอธิบาย
    DCC_SendChannelEmbedMessage(Dc_Send_Whitelist, embed); //ส่งข้อความ

	return 1;
}

DCMD:ban(user, channel, params[])
{
	new str_Whitelist[512], str[512];

	if (channel != SavagesCity_Discord_Ban)
	    return DCC_SendChannelMessage(channel, "`กรุณาอ่าน” : กรูราพิมพ์คำสั่งในช่องที่กำหนดสำหรับแอดมินเท่านั้น`");

	if (isnull(params))
		return DCC_SendChannelMessage(channel, "`คำสั่ง : .ban [ชื่อผู้เล่น]`");

	foreach (new i : Player)
	{
	    if (!strcmp(GetPlayerNameEx(i), params, true))
	    {
			SendClientMessageToAllEx(COLOR_LIGHTRED, "SUNDAY: %s ถูกแบนโดย SERVER, สาเหตุ: Discord-Banned", GetPlayerNameEx(i));
			playerData[i][pBan] = 1;
			Ban(i);
			DelayedKick(i);
	    }
	}

	mysql_format(g_SQL, str_Whitelist, sizeof str_Whitelist, "UPDATE `players` SET `playerBan` = 1 , `playerBanReason` = 'Discord-Banned' WHERE `playerName` = '%s'", SQL_ReturnEscaped(params));
	mysql_tquery(g_SQL, str_Whitelist);

	format(str,sizeof(str),"`การแบน : %s ถูกแบนออกจากเซิฟเวอร์`", params);
	DCC_SendChannelMessage(SavagesCity_Discord_Ban, str);

	format(str,sizeof(str),"`การแบน : %s ถูกแบนออกจากเซิฟเวอร์แล้ว` @everyone", params);
	DCC_SendChannelMessage(Savages_BannedChannel, str);

	return 1;
}

DCMD:givecoin(user, channel, params[])
{
	new str_Whitelist[512], str[512];

    new playerName[32], amount;

	if (channel != SavagesCity_Discord_Donate)
	   return DCC_SendChannelMessage(channel, "`กรุณาอ่าน” : กรูราพิมพ์คำสั่งในช่องที่กำหนดสำหรับแอดมินเท่านั้น`");

    if(sscanf(params, "s[32]d", playerName, amount))
		return DCC_SendChannelMessage(channel, "`คำสั่ง : .givecoin [ชื่อผู้เล่น] [จำนวน]`");

	foreach (new i : Player)
	{
	    if (!strcmp(GetPlayerNameEx(i), params, true))
	    {
	        UpdateplayerData(i);
			playerData[i][pCoin] += amount;
		    SendClientMessageEx(i, -1, "{00FFFF}SUNDAY-BOT : {A0CBFB}คุณได้รับ 'Coin' เพิ่มจำนวน '%s' จากการเติมเงินเข้าเกม", FormatNumber(amount));
	    }
	}

	mysql_format(g_SQL, str_Whitelist, sizeof str_Whitelist, "UPDATE `players` SET `Coin`=`Coin`+%d WHERE `playerName`='%s'", amount, SQL_ReturnEscaped(playerName));
	mysql_tquery(g_SQL, str_Whitelist);

	format(str,sizeof(str),"`การเติมเงิน : คุณ %s ได้เติมเงิน จำนวน %s coin `", playerName, FormatNumber(amount));
	DCC_SendChannelMessage(SavagesCity_Discord_Donate, str);

	format(str,sizeof(str),"`การเติมเงิน : คุณ %s ได้เติมเงินสนับสนุนประเทศ จำนวน %s Coin` @everyone", playerName, FormatNumber(amount));
	DCC_SendChannelMessage(Savages_EveryOne, str);

	return 1;
}

DCMD:player(user, channel, params[])
{
	if (channel != SavagesCity_Discord_Donate)
	   return DCC_SendChannelMessage(channel, "`กรุณาอ่าน” : กรูราพิมพ์คำสั่งในช่องที่กำหนดสำหรับแอดมินเท่านั้น`");

	new str[1700];
    
    format(str, sizeof(str), "\
	[ :wrench: ] ช่างออนไลน์ (%d)\n\
	[ :police_officer: ] ตำรวจออนไลน์(%d)\n\
	[ :hospital: ] แพทย์ออนไลน์ (%d)\n\
	[ :crown: ] นายกออนไลน์ (%d)\n\
	[ :Champion_League__Icon__Fortnite: ] ผู้เล่นออนไลน์ทั้งหมด ($d)\
	", MechanicOnline(),CopOnline(),MedicOnline(),GovOnline(),PlayerOnline());
	new DCC_Embed:ONLINE_EMBED = DCC_CreateEmbed("[ONLINE]");
    DCC_SetEmbedUrl(ONLINE_EMBED, "https://web.facebook.com/gtaunitytown/");//ลิ้งเวลากด caption
    DCC_SetEmbedColor(ONLINE_EMBED, 0x00FFFF);//สีของ embed
    DCC_SetEmbedThumbnail(ONLINE_EMBED, "https://image.pngaaa.com/922/3513922-small.png");//ลิ้งรูปภาพ
    DCC_AddEmbedField(ONLINE_EMBED,DCC_ReturnTimedata(), str, true);//ข้อความคำอธิบาย
    DCC_SendChannelEmbedMessage(DC_ALLBLUE_ONLINE, ONLINE_EMBED); //ส่งข้อความ

	format(str,sizeof(str),"`Player Online : ผู้เล่นออนไลน์ [ %d ]`", PlayerOnline());
	DCC_SendChannelMessage(SavagesCity_Discord_Donate, str);

	return 1;
}

DCC_ReturnTimedata()
{
	new sendString[90], month, day, year;
	new hour, minute, second;
	gettime(hour, minute, second);
	getdate(year, month, day);

	format(sendString, sizeof(sendString), "<:timer:864657839879094343>     %d/%d/%d %02d:%02d:%02d", day, month, year, hour, minute, second);
	return sendString;
}
static DC_SendEmbedMessage(const channel[], const caption[], const url[], const description[], const description_2[], color, const image_url[])
{
    //System By Phayakko_Phayakka , Scum Samp Thai (ห้ามลบและแก้ไข)

    new DCC_Embed:embed = DCC_CreateEmbed(caption);
    DCC_SetEmbedUrl(embed, url);//ลิ้งเวลากด caption
    DCC_SetEmbedColor(embed, color);//สีของ embed
    DCC_SetEmbedThumbnail(embed, image_url);//ลิ้งรูปภาพ
    DCC_AddEmbedField(embed,description, description_2, true);//ข้อความคำอธิบาย
    DCC_SendChannelEmbedMessage(DCC_FindChannelById(channel), embed); //ส่งข้อความ
    return 0;
}
stock DiscordMessageEmbed(const channel[],const caption[], const fmat[])
{
    /*new str[256];
    format(str, sizeof (str), fmat, va_start<3>);
*/
    new DCC_Embed:embed = DCC_CreateEmbed(caption);
    DCC_SetEmbedColor(embed, 0x990000);
    DCC_SetEmbedDescription(embed,fmat);
    DCC_SendChannelEmbedMessage(DCC_FindChannelById(channel), embed);
}






















