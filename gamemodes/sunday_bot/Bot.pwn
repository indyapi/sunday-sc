
/*
	Copyright 2022 Phayakko_Phayakka, Scum Samp Thai

    ระบบส่วนใหญ่ในนี้ถูกสร้างโดย Phayakko_Phayakka หรือ Scum Samp Thai เกือบทั้งหมด หากท่านนำสคริปนี้ไปดัดแปลงหรือแจกจ่ายต่อ โปรดให้เครดิตเราด้วย

    โปรดอ่านและทำตาม
        - อนุญาตให้สามารถนำผลงานไปใช้ ทำซ้ำ แจกจ่าย หรือดัดแปลงงานนั้นได้ แต่ห้ามใช้เพื่อการค้า เว้นแต่ว่าจะได้รับอนุญาตจากเจ้าของ
        - อนุญาตให้สามารถนำผลงานไปใช้ ทำซ้ำ แจกจ่าย หรือดัดแปลงงานนั้นได้ แต่ต้องให้เครดิตที่มาของเจ้าของผลงาน ซึ่งถ้าอยากจะใช้ผลงานนั้นโดยไม่มีเครดิตชื่อเจ้าของผลงานกำกับ จะต้องทำการขอนุญาตเจ้าของผลงานก่อน

    ติดเราต่อที่ 	FACEBOOK: https://www.facebook.com/Scum-Samp-Thai-100298101913111
		        YOUTUBE:  https://www.youtube.com/channel/UCyDWF1QX4NBU2J7M_iX_LZQ

*/ 
//อย่าลืมลง log-core2.dll ในโฟลเดอร์ของท่านด้วย
//โปรด Check Token และ Channel Id ให้ดี

#include	<YSI_Coding\y_hooks>
#include 	<discord-connector>
#include 	<discord-cmd>

//#define     CH_DCC_ID     "1007911197980500009" //ใส่ ID ช่อง Discord ที่จะให้ข้อความแสดง

hook OnGameModeInit()
{
    DC_SendEmbedMessage(CH_DCC_ID, "SV ONLINE !!", "https://web.facebook.com/gtaunitytown/",  DCC_ReturnTimedata(), "---------------------------------\nSUNDAY.BOT", 0x66FF33, "https://image.pngaaa.com/922/3513922-small.png");
    return 1;
}

hook OnGameModeExit()
{
    DC_SendEmbedMessage(CH_DCC_ID, "SV SAVE & OFFLINE !!", "https://web.facebook.com/gtaunitytown/",  DCC_ReturnTimedata(), "---------------------------------\nSUNDAY.BOT", 0x990000, "https://image.pngaaa.com/148/958148-small.png");
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

stock DiscordMessageEmbed(const channel[], const caption[], const fmat[], va_args<>)
{
    new str[256];
    va_format(str, sizeof (str), fmat, va_start<3>);
 
    new DCC_Embed:embed = DCC_CreateEmbed(caption);
    DCC_SetEmbedColor(embed, 0x33FA00);
    DCC_SetEmbedDescription(embed, str);
    DCC_SendChannelEmbedMessage(DCC_FindChannelById(channel), embed);
}


