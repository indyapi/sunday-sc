#include	<YSI_Coding\y_hooks>

new rentvehicle[MAX_PLAYERS];
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (newkeys & KEY_NO)
    {
		new id = -1;
		if ((id = Gate_Nearest(playerid)) != -1)
		{
		if (id != -1)
		{
		if (strlen(GateData[id][gatePass]))
		{
		    Dialog_Show(playerid, GatePass, DIALOG_STYLE_INPUT, "Enter Password", "Please enter the password for this gate below:", "Submit", "Cancel");
		}
		else
		{
		    if (GateData[id][gateFaction] != -1 && playerData[playerid][pFaction] != GetFactionByID(GateData[id][gateFaction]))
				return SendClientMessage(playerid,  0xFFFFFFAA,"คุณไม่สามารถเปิดประตูนี้ได้");

			Gate_Operate(id);

			switch (GateData[id][gateOpened])
			{
			    case 0:
				    //ShowPlayerFooter(playerid, "You have ~r~closed~w~ the gate!");
				    SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s ปิดประตู", GetPlayerNameEx(playerid));

                case 1:
        			//ShowPlayerFooter(playerid, "You have ~g~opened~w~ the gate!");
        			SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s เปิดประตู", GetPlayerNameEx(playerid));
					}
				}
			}
		}
	}
    if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid))
    {
        if (Shop_Nearest(playerid) != -1)
	    {
			new shopid = Shop_Nearest(playerid);

			if (shopData[shopid][shopType] == 1)
			{
				Dialog_Show(playerid, DIALOG_BUY, DIALOG_STYLE_TABLIST_HEADERS, "[ร้านขายของชำ]",
				"รายการสินค้า\tราคา\n\
				เลื่อยตัดไม้\t{00FF00}$1,000\n\
				เบ็ดตกปลา\t{00FF00}$500\n\
				เหยื่อ\t{00FF00}$5\n\
				เบ็ดฝรั่ง\t{00FF00}$1,000\n\
				ตะกร้า\t{00FF00}$100\n\
				ค้อนทุบหิน\t{00FF00}$1,000\n\
				", "ซื้อ", "ออก");
				return 1;
			}
			if (shopData[shopid][shopType] == 2)
			{
				Dialog_Show(playerid, DIALOG_BUYSKIN, DIALOG_STYLE_INPUT, "[ร้านสกิน]",
				"{FFFFFF}กรอก ID สกินของคุณ\n\
				ถ้าคุณต้องการเปลี่ยนสกิน คุณจะเสียค่าสกินตัวละ ราคา $2,000\n\
				ถ้าคุณต้องการจะซื้อ ให้กด 'ยืนยัน'\
				", "ยืนยัน", "ออก");
				return 1;
			}
			if (shopData[shopid][shopType] == 3)
			{
				Dialog_Show(playerid, DIALOG_BUYFASHION, DIALOG_STYLE_TABLIST_HEADERS, "[ร้านแฟชั่น]",
				"รายการสินค้า\tราคา\n\
				หมวกกันน็อคสีแดง\t{00FF00}$1,500\n\
				หมวกกันน็อคสีม่วง\t{00FF00}$1,800\n\
				หมวกกันน็อคสีน้ำเงิน\t{00FF00}$2,000\n\
				แว่นตา\t{00FF00}$1,000\n\
				ผ้าปิดปาก\t{00FF00}$1,000\n\
				ลำโพงติดหลัง\t{00FF00}$3,000\n\
				กระเป๋าติดหลัง\t{00FF00}$4,000\
				", "ซื้อ", "ออก");
				return 1;
			}
			if (shopData[shopid][shopType] == 4)
			{
				Dialog_Show(playerid,DIALOG_SUIT,DIALOG_STYLE_LIST,"{FFFFFF}[{16D603}ของแต่งตัว{FFFFFF}]",
				"[+] แฟชั่นธรรมดา\n[+] แฟชั่นโดเนท","ตกลง","ยกเลิก");
				return 1;
			}
			if (shopData[shopid][shopType] == 5)
			{
				if (GetFactionType(playerid) != FACTION_POLICE)
		        	return SendClientMessage(playerid, COLOR_LIGHTRED, "[WARNING] สำหรับตำรวจเท่านั้น");

				Dialog_Show(playerid, DIALOG_POLICE_LOCKER, DIALOG_STYLE_TABLIST_HEADERS, 
				"{FFFFFF}[{F5FD05}คลังเก็บหลักฐาน{FFFFFF}]", 
				"รายการ\tจำนวน\n\
				{FFFFFF}+ กัญชา\t{F92504}%d\n\
				{FFFFFF}+ โคเคน\t{F92504}%d\n\
				{FFFFFF}+ ปูน\t{F92504}%d\n\
				{FFFFFF}+ แพ็คยาบ้า\t{F92504}%d\n\
				{FFFFFF}+ เงินแดง\t{F92504}%s\n\
				{FFFFFF}+ ใบคาโค\t{F92504}%s\n\
				{FFFFFF}+ โคเคนผง\t{F92504}%s\n\
				{FFFFFF}+ แพ็คโคเคน\t{F92504}%s\n\
				{FFFFFF}+ เงินค่าปรับ\t{F92504}%s\n\
				{F5FD05}+ จัดอันดับเจ้าหน้าที่ดีเด่น!", "ตกลง", "ยกเลิก", factionData[playerData[playerid][pFaction]][fLocker][0], factionData[playerData[playerid][pFaction]][fLocker][1], factionData[playerData[playerid][pFaction]][fLocker][2], factionData[playerData[playerid][pFaction]][fLocker][3], FormatMoney(factionData[playerData[playerid][pFaction]][fLocker][4]), FormatNumber(factionData[playerData[playerid][pFaction]][fLocker][6]), FormatNumber(factionData[playerData[playerid][pFaction]][fLocker][7]), FormatNumber(factionData[playerData[playerid][pFaction]][fLocker][8]), FormatMoney(factionData[playerData[playerid][pFaction]][fLocker][5]));
				return 1;
			}
			if (shopData[shopid][shopType] == 6)
			{
				if (GetFactionType(playerid) != FACTION_MEDIC)
		        	return SendClientMessage(playerid, COLOR_LIGHTRED, "[WARNING] สำหรับหมอเท่านั้น");

				Dialog_Show(playerid, DIALOG_MEDIC_LOCKER, DIALOG_STYLE_TABLIST_HEADERS,
				"{FFFFFF}[{F5FD05}คลังเก็บเงิน{FFFFFF}]",
				"รายการ\tจำนวน\n\
				+ {87FF00}Money\t{87FF00}%d\n\
				+ {87FF00}แพทย์ดีเด่น",
				"ดู", "ยกเลิก", FormatMoney(factionData[playerData[playerid][pFaction]][fLocker][9]));
				
				return 1;
			}
			if (shopData[shopid][shopType] == 8)
			{
				Dialog_Show(playerid, DIALOG_BUYFOOD, DIALOG_STYLE_TABLIST_HEADERS, "[ร้านอาหาร]",
				"รายการอาหาร \t ราคา  \n\
				[MENU] {FEBD00} ผัดกระเพรา \t {00FF00}$50  \n\
				[MENU] {FEBD00} พิซซ่า \t {00FF00}$99  \n\
				[MENU] {FEBD00} ปลาทูทอด \t {00FF00}$100  \n\
				[MENU] {FEBD00} ไก่อบ \t {00FF00}$199  \n\
				[MENU] {FEBD00} ปลานิลเผา \t {00FF00}$200  \n\
				[MENU] {FEBD00} สเต็ก \t {00FF00}$299  \n\
				[MENU] {FEBD00} ดอลลี่ทอด \t {00FF00}$300  \n\
				[MENU] {FEBD00} ปิ่นโต \t {00FF00}$2,000  \
				", "Select", "Close");
				return 1;
			}
			if (shopData[shopid][shopType] == 9)
			{
				Dialog_Show(playerid, DIALOG_BUYFJUICE, DIALOG_STYLE_TABLIST_HEADERS, "[ร้านเครื่องดื่ม]",
				"รายการอาหาร \t ราคา  \n\
				[MENU] {FEBD00} น้ำเปล่า \t {00FF00}$50  \n\
				[MENU] {FEBD00} นมสด \t {00FF00}$100  \n\
				[MENU] {FEBD00} ชาเขียว \t {00FF00}$100  \n\
				[MENU] {FEBD00} ชาเย็น \t {00FF00}$100  \n\
				[MENU] {FEBD00} โซดา \t {00FF00}$200  \n\
				[MENU] {FEBD00} เหล้า \t {00FF00}$750  \n\
				[MENU] {FEBD00} เบียร์ \t {00FF00}$500  \n\
				[MENU] {FEBD00} ไวน์องุ่น \t {00FF00}$1,000  \
				", "Select", "Close");
				return 1;
			}
		}
		
		if (ATM_Nearest(playerid) != -1)
		{
		
  			ShowATM(playerid);
				//Dialog_Show(playerid, DIALOG_BANK, DIALOG_STYLE_LIST, "[บัญชีธนาคาร]", "ยอดเงินปัจจุบัน: %s", "เลือก", "ปิด", FormatMoney(playerData[playerid][pBankMoney]));
			return 1;
		}
		
		if (buycar_Nearest(playerid) != -1)
	    {
	        return Dialog_Show(playerid, DIALOG_PICKCARZ, DIALOG_STYLE_LIST, "{03E682}(ร้านขายรถ)", "{03E682}[+] {FFFFFF}รถจักรยานยนต์\n{03E682}[+] {FFFFFF}รถยนต์\n{03E682}[+] {FFFFFF}รถสปอร์ต", "เลือก", "ยกเลิก");

	    }
	    
	    if (rentcar_Nearest(playerid) != -1)
	    {
	       /* new Float:x, Float:y, Float:z, Float:a;
	        new vehicleid;

	        DestroyVehicle(vehicleid);
	        GivePlayerMoneyEx(playerid, -500);
	        GetPlayerPos(playerid, x, y, z);
			GetPlayerFacingAngle(playerid, a);

			vehicleid = CreateVehicle(481, x, y, z, a, 147, 0, -1);
			PutPlayerInVehicle(playerid, vehicleid, 0);
            return 1;*/

			if (GetPlayerMoneyEx(playerid) < 500)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณมีเงินไม่เพียงพอ ($500)");

			DestroyVehicle(rentvehicle[playerid]);

			new Float:x, Float:y, Float:z, Float:a; // defines variables which we will use
			GetPlayerPos(playerid, x, y, z);
			GetPlayerFacingAngle(playerid, a);

			rentvehicle[playerid] = CreateVehicle(481, x, y, z, a, 1, 1, 600000); // creates the vehicle
			PutPlayerInVehicle(playerid, rentvehicle[playerid], 0); // puts the player in the vehicle.
			vehicleFuel[rentvehicle[playerid]] = 100;
			//vehicleFaction[rentvehicle[playerid]] = -1;
			carData[rentvehicle[playerid]][carFaction] = -1;

			GivePlayerMoneyEx(playerid, -500);

			SendClientMessage(playerid, COLOR_WHITE, "คุณได้เรียกรถ {07C60A}Faggio {FFFFFF}ออกมาใช้งาน");
			SendClientMessage(playerid, COLOR_WHITE, "คุณเสียเงินจำนวน {1DBD07}$500 {FFFFFF}จากการเบิกรถ");
	 	}

		if (Pump_Nearest(playerid) != -1)
		{
			if (PumpFuelcar[playerid] == 1)
			{
				TogglePlayerControllable(playerid, true);
				PumpFuelcar[playerid] = 0;
			}
			return 1;
		}

		if (GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
		{
			if (garageveh_Nearest(playerid) != -1)
			{
				new vid = garageveh_Nearest(playerid);
				if (garagevehData[vid][garagevehType] == 3)
				{
					new string[MAX_SPAWNED_VEHICLES * 64], count;

					string = "#\tชื่อรุ่น";

					for(new i = 1; i < MAX_VEHICLES; i ++)
					{
						if(IsValidVehicle(i) && carData[i][carID] > 0 && IsVehicleOwner(playerid, i))
						{
							format(string, sizeof(string), "%s\n%d\t%s", string, count + 1, ReturnVehicleName(i));
							count++;
						}
					}

					if(!count)
					{
						SendClientMessage(playerid, COLOR_RED, "[ ! ] {FFFFFF}ไม่มีรถของคุณจอดอยู่ในเซิร์ฟเวอร์ตอนนี้");
					}
					else
					{
						Dialog_Show(playerid, DIALOG_SPAWNCARBROK, DIALOG_STYLE_TABLIST_HEADERS, "[รถที่คุณต้องการพาวน์]", string, "ตกลง", "ปิด");
					}
				}
			}
			return 1;
		}

		if (IsPlayerInRangeOfPoint(playerid, 2.0, -2406.0327,2217.8274,4.9844))
    	{
			new string100[1024];
			new string2[1024];

			format(string100, sizeof(string100), "{29E1F7}ข้อแนะนำในการเล่น โปรดอ่านสำคัญมาก !!\n\n");
			strcat(string2,string100);
			
			format(string100, sizeof(string100), "{29E1F7}* ข้อแรก : {FFFFFF}เมื่อคุณเบิกรถส่วนตัวมาให้เก็บทุกครั้ง\nไม่เช่นนั้นคุณจะต้องไปพาวน์รถซึ่ง 1 วันจะสามารถ พาวน์ได้ฟรี 1 ครั้ง ถ้าพาวน์ครบแล้วต้องเสียเงิน 1,500$ ในการพาวน์\n\n");
			strcat(string2,string100);

			format(string100, sizeof(string100), "{29E1F7}* ข้อสอง : {FFFFFF}ห้ามทำผิดกฏเซิฟเวอร์ไม่ว่าจะเป็นการ DB DM Toxic หรืออะไรต่างๆที่ก่อให้เกิดความรำคาญให้แก่ผู้เล่นท่านอื่น\n\n");
			strcat(string2,string100);

			format(string100, sizeof(string100), "{29E1F7}* ข้อสาม : {FFFFFF}หากมีปัญหาบัคใดๆก็ตามที่คุณพบเจอ คุณต้อง 'Report' ทันที หากคุณรู้แล้วไม่ 'Report' \nทางเราจะทำการลบตัวละครในฐานข้อมูลของคุณทันที\n\n");
			strcat(string2,string100);

			format(string100, sizeof(string100), "{29E1F7}* ข้อสี่ : {FFFFFF}คุณต้องเล่นให้สมกับบทบาทตัวละครที่คุณเป็นผู้กำหนดขึ้นมา\nเพราะเซิฟเวอร์เราทำเป็นแนวทาง Community+Five M เพื่อให้สมกับแนวทางของทางเรา\n\n");
			strcat(string2,string100);

			format(string100, sizeof(string100), "{29E1F7}* ข้อห้า : {FFFFFF}หากพบเจอผู้เล่นทำผิดใดๆก็ตามแล้วคุณต้อง 'Report' พร้อมแจ้งหลักฐาน รูปภาพวิดีโอ\nหรือใดๆก็ตามที่สามารถเอาผิดกับคนที่ทำผิดได้ ส่งมาทางเพจหรือทางแอดมินในดิสคอร์ด\n\n");
			strcat(string2,string100);

			format(string100, sizeof(string100), "{F9C34F}* อย่างสุดท้าย ขอให้ปฏิบัติตามกฏด้วยนะครับเพื่อความสนุกและสังคมที่ดี");
			strcat(string2,string100);

			Dialog_Show(playerid,ShowOnly,DIALOG_STYLE_MSGBOX,"{A7DEFC}[ UNITY TOWN ]",string2,"ตกลง","");
	   	}
	}
    return 1;
}
