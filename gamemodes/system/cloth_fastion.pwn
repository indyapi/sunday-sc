#include	<YSI_Coding\y_hooks>

/*hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid))
    {
        if (IsPlayerInRangeOfPoint(playerid, 3.0, 1466.2948,-1148.4103,24.3976))
		{
			cl_buying[playerid]= BUYZIP;

			new str[4096];

			for(new i=0;i!=sizeof(cl_ZipData);++i) format(str, 4096, "%s %d.%s\t{3FFA3C}$%d"EMBED_WHITE"\n", str, i, cl_ZipData[i][e_name], cl_ZipData[i][e_price]);
			Dialog_Show(playerid, DIALOG_BUY_CLOTHING, DIALOG_STYLE_TABLIST, "{FFFFFF}[{03BB0C}ร้านขายของแต่งตัว{FFFFFF}]", str, "ตกลง", "ยกเลิก");

			return 1;

			Dialog_Show(playerid,DIALOG_SUIT,DIALOG_STYLE_LIST,"{FFFFFF}[{16D603}ของแต่งตัว{FFFFFF}]","[+] ชุดธรรมดา\n[+] ชุดโดเนท","ตกลง","ยกเลิก");

		}
	}
	return 1;
}*/

// ระบบแต่งตัว
Dialog:DIALOG_BUY_CLOTHING(playerid, response, listitem, inputtext[])
{
	if (response) {

		switch(cl_buying[playerid])
		{
		    case BUYSPORTS:
		    {
				if (playerData[playerid][pCoin] < cl_SportsData[listitem][e_price])
				    return SendClientMessage(playerid, COLOR_LIGHTRED, "* คุณมี Coin ไม่เพียงพอ");

		        //GivePlayerMoneyEx(playerid, -cl_SportsData[listitem][e_price]);
		        playerData[playerid][pCoin] -= cl_SportsData[listitem][e_price];

		        Inventory_Add(playerid, cl_SportsData[listitem][e_name], 1);
				SendClientMessageEx(playerid, COLOR_YELLOW, "คุณได้รับ %s เรียบร้อยแล้ว", cl_SportsData[listitem][e_name]);
		    }

		    case BUYZIP:
		    {
				if (GetPlayerMoneyEx(playerid) < cl_ZipData[listitem][e_price])
				    return SendClientMessage(playerid, COLOR_LIGHTRED, "* คุณมีเงินไม่เพียงพอ");

		        GivePlayerMoneyEx(playerid, -cl_ZipData[listitem][e_price]);

		        Inventory_Add(playerid, cl_ZipData[listitem][e_name], 1);
				SendClientMessageEx(playerid, COLOR_YELLOW, "คุณได้รับ %s เรียบร้อยแล้ว", cl_ZipData[listitem][e_name]);
		    }
		}
		cl_buying[playerid]=0;
	}
	return 1;
}

Dialog:DIALOG_SUIT(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		switch(listitem)
  		{
			case 0:
			{
				cl_buying[playerid]= BUYZIP;

				new str[777777];

				for(new i=0;i!=sizeof(cl_ZipData);++i) format(str, 4096, "%s %d.%s\t{3FFA3C}$%d"EMBED_WHITE"\n", str, i, cl_ZipData[i][e_name], cl_ZipData[i][e_price]);
				Dialog_Show(playerid, DIALOG_BUY_CLOTHING, DIALOG_STYLE_TABLIST, "{FFFFFF}[{03BB0C}ร้านขายของแต่งตัว{FFFFFF}]", str, "ตกลง", "ยกเลิก");

				return 1;
			}
			case 1:
			{
				cl_buying[playerid]=BUYSPORTS;

				new str[111111];

				for(new i=0;i!=sizeof(cl_SportsData);++i) format(str, 4096, "%s %d.%s\t{FDEC1C}%d {FFFFFF}Coin"EMBED_WHITE"\n", str, i, cl_SportsData[i][e_name], cl_SportsData[i][e_price]);
				Dialog_Show(playerid, DIALOG_BUY_CLOTHING, DIALOG_STYLE_TABLIST, "{FFFFFF}[{03BB0C}ร้านขายของแต่งตัว{FFFFFF}]", str, "Ok", "Cancel");
				return 1;
			}
		}
	}
	return 1;
}
