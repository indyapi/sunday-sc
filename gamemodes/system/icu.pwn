// Hospital
#include	<YSI_Coding\y_hooks>
#include 	<YSI_Coding\y_timers>

#define COLOR_GRAD2 0xBFC0C2FF

new BedHospital[11], InHospital[MAX_PLAYERS], BeforeSleep[MAX_PLAYERS];

hook OnGameModeInit()
{
    SetTimer("HospitalTime", 5000, 1);
    // Hospital

    Create3DTextLabel("[โรงพยาบาล]\n{FFFFFF}พิมพ์ /icu เพื่อนอนเพิ่มเลือด", COLOR_YELLOW, 871.0461,-3163.9607,18.6334, 10.0,0);
    Create3DTextLabel("[โรงพยาบาล]\n{FFFFFF}พิมพ์ /icu เพื่อนอนเพิ่มเลือด", COLOR_YELLOW, 868.6420,-3164.0698,18.6602, 10.0,0);
    Create3DTextLabel("[โรงพยาบาล]\n{FFFFFF}พิมพ์ /icu เพื่อนอนเพิ่มเลือด", COLOR_YELLOW, 865.8694,-3164.2217,18.6602, 10.0,0);
    Create3DTextLabel("[โรงพยาบาล]\n{FFFFFF}พิมพ์ /icu เพื่อนอนเพิ่มเลือด", COLOR_YELLOW, 863.4456,-3164.0730,18.6202, 10.0,0);
    Create3DTextLabel("[โรงพยาบาล]\n{FFFFFF}พิมพ์ /icu เพื่อนอนเพิ่มเลือด", COLOR_YELLOW, 860.8159,-3164.2668,18.6502, 10.0,0);
    //vip
    Create3DTextLabel("[โรงพยาบาล]\n{FFFFFF}พิมพ์ /icu เพื่อนอนเพิ่มเลือด", COLOR_YELLOW, 855.7526,-3169.7537,18.5769, 10.0,0);
    Create3DTextLabel("[โรงพยาบาล]\n{FFFFFF}พิมพ์ /icu เพื่อนอนเพิ่มเลือด", COLOR_YELLOW, 850.8312,-3169.6526,18.6325, 10.0,0);
    Create3DTextLabel("[โรงพยาบาล]\n{FFFFFF}พิมพ์ /icu เพื่อนอนเพิ่มเลือด", COLOR_YELLOW, 846.5151,-3169.2048,18.5713, 10.0,0);
    Create3DTextLabel("[โรงพยาบาล]\n{FFFFFF}พิมพ์ /icu เพื่อนอนเพิ่มเลือด", COLOR_YELLOW, 841.8488,-3169.5171,18.5674, 10.0,0);
    Create3DTextLabel("[โรงพยาบาล]\n{FFFFFF}พิมพ์ /icu เพื่อนอนเพิ่มเลือด", COLOR_YELLOW, 837.1129,-3169.1519,18.5874, 10.0,0);
    Create3DTextLabel("[โรงพยาบาล]\n{FFFFFF}พิมพ์ /icu เพื่อนอนเพิ่มเลือด", COLOR_YELLOW, 832.1167,-3169.3694,18.5375, 10.0,0);
    //ฉีดยา
    Create3DTextLabel("[โรงพยาบาล]\n{FFFFFF}จุดฉีดยา\n[สำหรับหมอ]", COLOR_YELLOW, 862.3708,-3124.0952,18.5602, 10.0,0);

    BedHospital[0] = 0;
	BedHospital[1] = 0;
	BedHospital[2] = 0;
	BedHospital[3] = 0;
	BedHospital[4] = 0;
	BedHospital[5] = 0;
	BedHospital[6] = 0;
	BedHospital[7] = 0;
	BedHospital[8] = 0;
	BedHospital[9] = 0;
	BedHospital[10] = 0;
	return 1;
}
hook OnPlayerConnect(playerid)
{
    InHospital[playerid] = 0;
    BeforeSleep[playerid] = 0;
	return 1;
}
// Hospital System
alias:heal("ฉีดยา")
CMD:heal(playerid, params[])
{
	static
	    userid;

    if (GetFactionType(playerid) != FACTION_MEDIC)
	    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ช่องทางนี้สำหรับเจ้าหน้าที่เท่านั้น!");

    if (sscanf(params, "u", userid))
	    return SendClientMessage(playerid, COLOR_WHITE, "/ฉีดยา [ไอดี/ชื่อ]");

    if (!IsPlayerInRangeOfPoint(playerid, 3.0, 862.3708,-3124.0952,18.5602))
	    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณไม่ได้อยู่ที่จุดฉีดยา");

	if (userid == INVALID_PLAYER_ID)
	    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ผู้เล่นไอดีนี้ไม่ได้อยู่ในเกม");

	if (userid == playerid)
	    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ไม่สามารถรักษาตัวเองได้");

	if (IsPlayerInAnyVehicle(playerid))
	    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณต้องไม่อยู่ในรถ");

	if (IsPlayerInAnyVehicle(userid))
	    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ผู้เล่นไอดีนี้ต้องไม่อยู่ในรถ");

	new Float:hp;
	GetPlayerHealth(userid, hp);

	if (hp > 70)
	    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ผู้เล่นไอดีนี้ไม่ได้อยู่ในสถานะขาดเลือด");

	SetPlayerHealth(userid, 100);

    SendClientMessageEx(playerid, COLOR_WHITE, "คุณได้รักษา {33CCFF}%s{FFFFFF}", GetPlayerNameEx(userid));
    SendClientMessageEx(userid, COLOR_LIGHTBLUE, "%s {FFFFFF}ได้รักษาคุณ", GetPlayerNameEx(playerid));
    SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s ได้รักษา %s", GetPlayerNameEx(playerid), GetPlayerNameEx(userid));
	return 1;
}

CMD:icu(playerid, params[])
{
 	if(IsPlayerConnected(playerid))
    {
		    if (IsPlayerInRangeOfPoint(playerid, 2.0, 871.0461,-3163.9607,18.6334) && InHospital[playerid] == 0)
		    {
			    if (BedHospital[0] == 0 && BeforeSleep[playerid] == 0) // ตรวจสอบว่าเตียงว่าง
			    {
			            if (GetPlayerMoneyEx(playerid) < 300) return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณมีเงินไม่เพียงพอ ($300)");

			            BedHospital[0] = 1;
			            InHospital[playerid] = 1;

			            //TogglePlayerControllable(playerid, 0);

			            SendClientMessage(playerid, COLOR_LIGHTRED, "กรุณารอสักครู่, ทางโรงพยาบาลกำลังเตรียมเตียงให้พร้อมสำหรับท่าน ...");
			            SetTimerEx("BedHospitalOne", 2000, false, "i", playerid);

			            GivePlayerMoneyEx(playerid, -1000);
			            SendClientMessage(playerid, COLOR_LIGHTRED, "EMT : {FFFFFF}คุณเสียค่าใช้จ่ายจำนวน $1000 สำหรับค่ารักษาพยาบาล");
			    }
			        else SendClientMessage(playerid, COLOR_GRAD2, "เตียงไม่ว่าง, มีผู้เล่นใช้งานอยู่ .. โปรดรอสักครู่");
			}

			if (IsPlayerInRangeOfPoint(playerid, 2.0, 868.6420,-3164.0698,18.6602)  && InHospital[playerid] == 0)
		    {
			    if (BedHospital[1] == 0  && BeforeSleep[playerid] == 0) // ตรวจสอบว่าเตียงว่าง
			    {
			            if (GetPlayerMoneyEx(playerid) < 300) return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณมีเงินไม่เพียงพอ ($300)");

			            BedHospital[1] = 1;
			            InHospital[playerid] = 1;

			            TogglePlayerControllable(playerid, 0);

			            SendClientMessage(playerid, COLOR_LIGHTRED, "กรุณารอสักครู่, ทางโรงพยาบาลกำลังเตรียมเตียงให้พร้อมสำหรับท่าน ...");
			            SetTimerEx("BedHospitalTwo", 2000, false, "i", playerid);

			            GivePlayerMoneyEx(playerid, -1000);
			            SendClientMessage(playerid, COLOR_LIGHTRED, "EMT : {FFFFFF}คุณเสียค่าใช้จ่ายจำนวน $1000 สำหรับค่ารักษาพยาบาล");
			    }
			        else SendClientMessage(playerid, COLOR_GRAD2, "เตียงไม่ว่าง, มีผู้เล่นใช้งานอยู่ .. โปรดรอสักครู่");
			}

		    if (IsPlayerInRangeOfPoint(playerid, 2.0, 865.8694,-3164.2217,18.6602)  && InHospital[playerid] == 0)
			{
			    if (BedHospital[2] == 0  && BeforeSleep[playerid] == 0) // ตรวจสอบว่าเตียงว่าง
			    {
			            if (GetPlayerMoneyEx(playerid) < 300) return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณมีเงินไม่เพียงพอ ($300)");

			            BedHospital[2] = 1;
			            InHospital[playerid] = 1;

			            TogglePlayerControllable(playerid, 0);

			            SendClientMessage(playerid, COLOR_LIGHTRED, "กรุณารอสักครู่, ทางโรงพยาบาลกำลังเตรียมเตียงให้พร้อมสำหรับท่าน ...");
			            SetTimerEx("BedHospitalThree", 2000, false, "i", playerid);

			            GivePlayerMoneyEx(playerid, -1000);
			            SendClientMessage(playerid, COLOR_LIGHTRED, "EMT : {FFFFFF}คุณเสียค่าใช้จ่ายจำนวน $1000 สำหรับค่ารักษาพยาบาล");
			    }
			        else SendClientMessage(playerid, COLOR_GRAD2, "เตียงไม่ว่าง, มีผู้เล่นใช้งานอยู่ .. โปรดรอสักครู่");
			}

			if (IsPlayerInRangeOfPoint(playerid, 2.0, 863.4456,-3164.0730,18.6202)  && InHospital[playerid] == 0)
			{
			    if (BedHospital[3] == 0  && BeforeSleep[playerid] == 0) // ตรวจสอบว่าเตียงว่าง
			    {
			            if (GetPlayerMoneyEx(playerid) < 300) return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณมีเงินไม่เพียงพอ ($300)");

			            BedHospital[3] = 1;
			            InHospital[playerid] = 1;

			            TogglePlayerControllable(playerid, 0);

			            SendClientMessage(playerid, COLOR_LIGHTRED, "กรุณารอสักครู่, ทางโรงพยาบาลกำลังเตรียมเตียงให้พร้อมสำหรับท่าน ...");
			            SetTimerEx("BedHospitalFour", 2000, false, "i", playerid);

			            GivePlayerMoneyEx(playerid, -1000);
			            SendClientMessage(playerid, COLOR_LIGHTRED, "EMT : {FFFFFF}คุณเสียค่าใช้จ่ายจำนวน $1000 สำหรับค่ารักษาพยาบาล");
			    }
			        else SendClientMessage(playerid, COLOR_GRAD2, "เตียงไม่ว่าง, มีผู้เล่นใช้งานอยู่ .. โปรดรอสักครู่");
			}

            if (IsPlayerInRangeOfPoint(playerid, 2.0, 860.8159,-3164.2668,18.6502)  && InHospital[playerid] == 0)
			{
			    if (BedHospital[4] == 0  && BeforeSleep[playerid] == 0) // ตรวจสอบว่าเตียงว่าง
			    {
			            if (GetPlayerMoneyEx(playerid) < 300) return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณมีเงินไม่เพียงพอ ($300)");

			            BedHospital[4] = 1;
			            InHospital[playerid] = 1;

			            TogglePlayerControllable(playerid, 0);

			            SendClientMessage(playerid, COLOR_LIGHTRED, "กรุณารอสักครู่, ทางโรงพยาบาลกำลังเตรียมเตียงให้พร้อมสำหรับท่าน ...");
			            SetTimerEx("BedHospitalFive", 2000, false, "i", playerid);

			            GivePlayerMoneyEx(playerid, -1000);
			            SendClientMessage(playerid, COLOR_LIGHTRED, "EMT : {FFFFFF}คุณเสียค่าใช้จ่ายจำนวน $1000 สำหรับค่ารักษาพยาบาล");
			    }
			        else SendClientMessage(playerid, COLOR_GRAD2, "เตียงไม่ว่าง, มีผู้เล่นใช้งานอยู่ .. โปรดรอสักครู่");
			}

            if (IsPlayerInRangeOfPoint(playerid, 2.0, 855.7526,-3169.7537,18.5769)  && InHospital[playerid] == 0)
			{
			    if (BedHospital[5] == 0  && BeforeSleep[playerid] == 0) // ตรวจสอบว่าเตียงว่าง
			    {
			            if (GetPlayerMoneyEx(playerid) < 300) 
                            return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณมีเงินไม่เพียงพอ ($300)");

                        if (playerData[playerid][pVip] < 0) 
                            return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณไม่ใช่VIP");
                        
			            BedHospital[5] = 1;
			            InHospital[playerid] = 1;

			            TogglePlayerControllable(playerid, 0);

			            SendClientMessage(playerid, COLOR_LIGHTRED, "กรุณารอสักครู่, ทางโรงพยาบาลกำลังเตรียมเตียงให้พร้อมสำหรับท่าน ...");
			            SetTimerEx("BedHospitalvipone", 2000, false, "i", playerid);

			            GivePlayerMoneyEx(playerid, -1000);
			            SendClientMessage(playerid, COLOR_LIGHTRED, "EMT : {FFFFFF}คุณเสียค่าใช้จ่ายจำนวน $1000 สำหรับค่ารักษาพยาบาล");
			    }
			        else SendClientMessage(playerid, COLOR_GRAD2, "เตียงไม่ว่าง, มีผู้เล่นใช้งานอยู่ .. โปรดรอสักครู่");
			}

            if (IsPlayerInRangeOfPoint(playerid, 2.0, 850.8312,-3169.6526,18.6325)  && InHospital[playerid] == 0)
			{
			    if (BedHospital[6] == 0  && BeforeSleep[playerid] == 0) // ตรวจสอบว่าเตียงว่าง
			    {
			            if (GetPlayerMoneyEx(playerid) < 300) 
                            return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณมีเงินไม่เพียงพอ ($300)");

                        if (playerData[playerid][pVip] < 0) 
                            return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณไม่ใช่VIP");

			            BedHospital[6] = 1;
			            InHospital[playerid] = 1;

			            TogglePlayerControllable(playerid, 0);

			            SendClientMessage(playerid, COLOR_LIGHTRED, "กรุณารอสักครู่, ทางโรงพยาบาลกำลังเตรียมเตียงให้พร้อมสำหรับท่าน ...");
			            SetTimerEx("BedHospitalviptwo", 2000, false, "i", playerid);

			            GivePlayerMoneyEx(playerid, -1000);
			            SendClientMessage(playerid, COLOR_LIGHTRED, "EMT : {FFFFFF}คุณเสียค่าใช้จ่ายจำนวน $1000 สำหรับค่ารักษาพยาบาล");
			    }
			        else SendClientMessage(playerid, COLOR_GRAD2, "เตียงไม่ว่าง, มีผู้เล่นใช้งานอยู่ .. โปรดรอสักครู่");
			}

            if (IsPlayerInRangeOfPoint(playerid, 2.0, 846.5151,-3169.2048,18.5713)  && InHospital[playerid] == 0)
			{
			    if (BedHospital[7] == 0  && BeforeSleep[playerid] == 0) // ตรวจสอบว่าเตียงว่าง
			    {
			            if (GetPlayerMoneyEx(playerid) < 300) 
                            return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณมีเงินไม่เพียงพอ ($300)");

                        if (playerData[playerid][pVip] < 0) 
                            return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณไม่ใช่VIP");

			            BedHospital[7] = 1;
			            InHospital[playerid] = 1;

			            TogglePlayerControllable(playerid, 0);

			            SendClientMessage(playerid, COLOR_LIGHTRED, "กรุณารอสักครู่, ทางโรงพยาบาลกำลังเตรียมเตียงให้พร้อมสำหรับท่าน ...");
			            SetTimerEx("BedHospitalvipthree", 2000, false, "i", playerid);

			            GivePlayerMoneyEx(playerid, -1000);
			            SendClientMessage(playerid, COLOR_LIGHTRED, "EMT : {FFFFFF}คุณเสียค่าใช้จ่ายจำนวน $1000 สำหรับค่ารักษาพยาบาล");
			    }
			        else SendClientMessage(playerid, COLOR_GRAD2, "เตียงไม่ว่าง, มีผู้เล่นใช้งานอยู่ .. โปรดรอสักครู่");
			}

            if (IsPlayerInRangeOfPoint(playerid, 2.0, 841.8488,-3169.5171,18.5674)  && InHospital[playerid] == 0)
			{
			    if (BedHospital[8] == 0  && BeforeSleep[playerid] == 0) // ตรวจสอบว่าเตียงว่าง
			    {
			            if (GetPlayerMoneyEx(playerid) < 300) 
                            return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณมีเงินไม่เพียงพอ ($300)");

                        if (playerData[playerid][pVip] < 0) 
                            return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณไม่ใช่VIP");

			            BedHospital[8] = 1;
			            InHospital[playerid] = 1;

			            TogglePlayerControllable(playerid, 0);

			            SendClientMessage(playerid, COLOR_LIGHTRED, "กรุณารอสักครู่, ทางโรงพยาบาลกำลังเตรียมเตียงให้พร้อมสำหรับท่าน ...");
			            SetTimerEx("BedHospitalvipFroue", 2000, false, "i", playerid);

			            GivePlayerMoneyEx(playerid, -1000);
			            SendClientMessage(playerid, COLOR_LIGHTRED, "EMT : {FFFFFF}คุณเสียค่าใช้จ่ายจำนวน $1000 สำหรับค่ารักษาพยาบาล");
			    }
			        else SendClientMessage(playerid, COLOR_GRAD2, "เตียงไม่ว่าง, มีผู้เล่นใช้งานอยู่ .. โปรดรอสักครู่");
			}

            if (IsPlayerInRangeOfPoint(playerid, 2.0, 837.1129,-3169.1519,18.5874)  && InHospital[playerid] == 0)
			{
			    if (BedHospital[9] == 0  && BeforeSleep[playerid] == 0) // ตรวจสอบว่าเตียงว่าง
			    {
			            if (GetPlayerMoneyEx(playerid) < 300) 
                            return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณมีเงินไม่เพียงพอ ($300)");

                        if (playerData[playerid][pVip] < 0) 
                            return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณไม่ใช่VIP");

			            BedHospital[9] = 1;
			            InHospital[playerid] = 1;

			            TogglePlayerControllable(playerid, 0);

			            SendClientMessage(playerid, COLOR_LIGHTRED, "กรุณารอสักครู่, ทางโรงพยาบาลกำลังเตรียมเตียงให้พร้อมสำหรับท่าน ...");
			            SetTimerEx("BedHospitalvipFive", 2000, false, "i", playerid);

			            GivePlayerMoneyEx(playerid, -1000);
			            SendClientMessage(playerid, COLOR_LIGHTRED, "EMT : {FFFFFF}คุณเสียค่าใช้จ่ายจำนวน $1000 สำหรับค่ารักษาพยาบาล");
			    }
			        else SendClientMessage(playerid, COLOR_GRAD2, "เตียงไม่ว่าง, มีผู้เล่นใช้งานอยู่ .. โปรดรอสักครู่");
			}

            if (IsPlayerInRangeOfPoint(playerid, 2.0, 832.1167,-3169.3694,18.5375)  && InHospital[playerid] == 0)
			{
			    if (BedHospital[10] == 0  && BeforeSleep[playerid] == 0) // ตรวจสอบว่าเตียงว่าง
			    {
			            if (GetPlayerMoneyEx(playerid) < 300) 
                            return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณมีเงินไม่เพียงพอ ($300)");

                        if (playerData[playerid][pVip] < 0) 
                            return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณไม่ใช่VIP");

			            BedHospital[10] = 1;
			            InHospital[playerid] = 1;

			            TogglePlayerControllable(playerid, 0);

			            SendClientMessage(playerid, COLOR_LIGHTRED, "กรุณารอสักครู่, ทางโรงพยาบาลกำลังเตรียมเตียงให้พร้อมสำหรับท่าน ...");
			            SetTimerEx("BedHospitalvipsix", 2000, false, "i", playerid);

			            GivePlayerMoneyEx(playerid, -1000);
			            SendClientMessage(playerid, COLOR_LIGHTRED, "EMT : {FFFFFF}คุณเสียค่าใช้จ่ายจำนวน $1000 สำหรับค่ารักษาพยาบาล");
			    }
			        else SendClientMessage(playerid, COLOR_GRAD2, "เตียงไม่ว่าง, มีผู้เล่นใช้งานอยู่ .. โปรดรอสักครู่");
			}
	}
		else SendClientMessage(playerid, COLOR_GREY, "คุณยังไม่ได้เข้าสู่เซิร์ฟเวอร์");
    return 1;
}

forward HospitalTime(playerid);
public HospitalTime(playerid)
{
    new Float:health;
    GetPlayerHealth(playerid,health);

    if (BeforeSleep[playerid] == 1)
    {
        if (health == 100)
        {
            if (BedHospital[0] == 1)
                BedHospital[0] = 0;

            if (BedHospital[1] == 1)
                BedHospital[1] = 0;

            if (BedHospital[2] == 1)
                BedHospital[2] = 0;

            if (BedHospital[3] == 1)
                BedHospital[3] = 0;

			if (BedHospital[4] == 1)
                BedHospital[4] = 0;

			if (BedHospital[5] == 1)
                BedHospital[5] = 0;

			if (BedHospital[6] == 1)
                BedHospital[6] = 0;

			if (BedHospital[7] == 1)
                BedHospital[7] = 0;

			if (BedHospital[8] == 1)
                BedHospital[8] = 0;

			if (BedHospital[9] == 1)
                BedHospital[9] = 0;

			if (BedHospital[10] == 1)
                BedHospital[10] = 0;

            SendClientMessage(playerid, COLOR_LIGHTRED, "ขอบคุณสำหรับการรักษาพยาบาลกับเรา!!");
            InHospital[playerid] = 0;
            BeforeSleep[playerid] = 0;

            TogglePlayerControllable(playerid, 1);
            GameTextForPlayer(playerid, "~w~HOSPITAL~n~~g~COMPLETE", 1000, 4);
        }

        if (health <= 95)
        {
	        switch(playerData[playerid][pVip])
	        {
	            case 1: 
                {
                    SetPlayerHealth(playerid, health+5.0);
                    GameTextForPlayer(playerid, "~g~IN VIP HOSPITAL~n~~w~PLEASE WAIT...", 2000, 4);
                }
	            case 2: 
                {
                    SetPlayerHealth(playerid, health+7.0);
                    GameTextForPlayer(playerid, "~g~IN VIP HOSPITAL~n~~w~PLEASE WAIT...", 2000, 4);
                }
	            case 3: 
                {
                    SetPlayerHealth(playerid, health+10.0);
                    GameTextForPlayer(playerid, "~g~IN VIP HOSPITAL~n~~w~PLEASE WAIT...", 2000, 4);
                }
	        }

            SetPlayerHealth(playerid, health+2.0);
            GameTextForPlayer(playerid, "~g~IN HOSPITAL~n~~w~PLEASE WAIT...", 2000, 4);
        }
    }
	return 1;
}

forward BedHospitalOne(playerid);
public BedHospitalOne(playerid)
{
    TogglePlayerControllable(playerid, 0);
    SetPlayerPos(playerid, 871.0461,-3163.9607,18.6334);
    SetPlayerFacingAngle(playerid, 357.7947);

    ApplyAnimation(playerid, "CRACK","crckidle2", 4.1, 1, 1, 1, 0, 1);
    BeforeSleep[playerid] = 1;
    SendClientMessage(playerid, COLOR_YELLOW, "โรงพยาบาล : {FFFFFF}ขณะนี้ทางโรงพยาบาลกำลังรักษาท่าน, โปรดรอจนกว่าเลือดจะเต็ม!");

    return 1;
}

forward BedHospitalTwo(playerid);
public BedHospitalTwo(playerid)
{
    TogglePlayerControllable(playerid, 0);
    SetPlayerPos(playerid, 868.6420,-3164.0698,18.6602);
    SetPlayerFacingAngle(playerid, 359.3615);

    ApplyAnimation(playerid, "CRACK","crckidle2", 4.1, 1, 1, 1, 0, 0, 1);
    BeforeSleep[playerid] = 1;
    SendClientMessage(playerid, COLOR_YELLOW, "โรงพยาบาล : {FFFFFF}ขณะนี้ทางโรงพยาบาลกำลังรักษาท่าน, โปรดรอจนกว่าเลือดจะเต็ม!");

    return 1;
}

forward BedHospitalThree(playerid);
public BedHospitalThree(playerid)
{
    TogglePlayerControllable(playerid, 0);
    SetPlayerPos(playerid, 865.8694,-3164.2217,18.6602);
    SetPlayerFacingAngle(playerid, 359.3616);

    ApplyAnimation(playerid, "CRACK","crckidle2", 4.1, 1, 1, 1, 0, 0, 1);
    BeforeSleep[playerid] = 1;
    SendClientMessage(playerid, COLOR_YELLOW, "โรงพยาบาล : {FFFFFF}ขณะนี้ทางโรงพยาบาลกำลังรักษาท่าน, โปรดรอจนกว่าเลือดจะเต็ม!");

    return 1;
}

forward BedHospitalFour(playerid);
public BedHospitalFour(playerid)
{
    TogglePlayerControllable(playerid, 0);
    SetPlayerPos(playerid, 863.4456,-3164.0730,18.6202);
    SetPlayerFacingAngle(playerid, 358.7350);

    ApplyAnimation(playerid, "CRACK","crckidle2", 4.1, 1, 1, 1, 0, 0, 1);
    BeforeSleep[playerid] = 1;
    SendClientMessage(playerid, COLOR_YELLOW, "โรงพยาบาล : {FFFFFF}ขณะนี้ทางโรงพยาบาลกำลังรักษาท่าน, โปรดรอจนกว่าเลือดจะเต็ม!");

    return 1;
}

forward BedHospitalFive(playerid);
public BedHospitalFive(playerid)
{
    TogglePlayerControllable(playerid, 0);
    SetPlayerPos(playerid, 860.8159,-3164.2668,18.6502);
    SetPlayerFacingAngle(playerid, 358.7350);

    ApplyAnimation(playerid, "CRACK","crckidle2", 4.1, 1, 1, 1, 0, 0, 1);
    BeforeSleep[playerid] = 1;
    SendClientMessage(playerid, COLOR_YELLOW, "โรงพยาบาล : {FFFFFF}ขณะนี้ทางโรงพยาบาลกำลังรักษาท่าน, โปรดรอจนกว่าเลือดจะเต็ม!");

    return 1;
}

forward BedHospitalvipone(playerid);
public BedHospitalvipone(playerid)
{
    TogglePlayerControllable(playerid, 0);
    SetPlayerPos(playerid, 855.7526,-3169.7537,18.5769);
    SetPlayerFacingAngle(playerid, 358.7350);

    ApplyAnimation(playerid, "CRACK","crckidle2", 4.1, 1, 1, 1, 0, 0, 1);
    BeforeSleep[playerid] = 1;
    SendClientMessage(playerid, COLOR_YELLOW, "โรงพยาบาล : {FFFFFF}ขณะนี้ทางโรงพยาบาลกำลังรักษาท่าน, โปรดรอจนกว่าเลือดจะเต็ม!");

    return 1;
}

forward BedHospitalviptwo(playerid);
public BedHospitalviptwo(playerid)
{
    TogglePlayerControllable(playerid, 0);
    SetPlayerPos(playerid, 850.8312,-3169.6526,18.6325);
    SetPlayerFacingAngle(playerid, 358.7350);

    ApplyAnimation(playerid, "CRACK","crckidle2", 4.1, 1, 1, 1, 0, 0, 1);
    BeforeSleep[playerid] = 1;
    SendClientMessage(playerid, COLOR_YELLOW, "โรงพยาบาล : {FFFFFF}ขณะนี้ทางโรงพยาบาลกำลังรักษาท่าน, โปรดรอจนกว่าเลือดจะเต็ม!");

    return 1;
}

forward BedHospitalvipthree(playerid);
public BedHospitalvipthree(playerid)
{
    TogglePlayerControllable(playerid, 0);
    SetPlayerPos(playerid, 846.5151,-3169.2048,18.5713);
    SetPlayerFacingAngle(playerid, 358.7350);

    ApplyAnimation(playerid, "CRACK","crckidle2", 4.1, 1, 1, 1, 0, 0, 1);
    BeforeSleep[playerid] = 1;
    SendClientMessage(playerid, COLOR_YELLOW, "โรงพยาบาล : {FFFFFF}ขณะนี้ทางโรงพยาบาลกำลังรักษาท่าน, โปรดรอจนกว่าเลือดจะเต็ม!");

    return 1;
}

forward BedHospitalvipFour(playerid);
public BedHospitalvipFour(playerid)
{
    TogglePlayerControllable(playerid, 0);
    SetPlayerPos(playerid, 841.8488,-3169.5171,18.5674);
    SetPlayerFacingAngle(playerid, 358.7350);

    ApplyAnimation(playerid, "CRACK","crckidle2", 4.1, 1, 1, 1, 0, 0, 1);
    BeforeSleep[playerid] = 1;
    SendClientMessage(playerid, COLOR_YELLOW, "โรงพยาบาล : {FFFFFF}ขณะนี้ทางโรงพยาบาลกำลังรักษาท่าน, โปรดรอจนกว่าเลือดจะเต็ม!");

    return 1;
}

forward BedHospitalvipFive(playerid);
public BedHospitalvipFive(playerid)
{
    TogglePlayerControllable(playerid, 0);
    SetPlayerPos(playerid, 837.1129,-3169.1519,18.5874);
    SetPlayerFacingAngle(playerid, 358.7350);

    ApplyAnimation(playerid, "CRACK","crckidle2", 4.1, 1, 1, 1, 0, 0, 1);
    BeforeSleep[playerid] = 1;
    SendClientMessage(playerid, COLOR_YELLOW, "โรงพยาบาล : {FFFFFF}ขณะนี้ทางโรงพยาบาลกำลังรักษาท่าน, โปรดรอจนกว่าเลือดจะเต็ม!");

    return 1;
}

forward BedHospitalvipsix(playerid);
public BedHospitalvipsix(playerid)
{
    TogglePlayerControllable(playerid, 0);
    SetPlayerPos(playerid, 832.1167,-3169.3694,18.5375);
    SetPlayerFacingAngle(playerid, 358.7350);

    ApplyAnimation(playerid, "CRACK","crckidle2", 4.1, 1, 1, 1, 0, 0, 1);
    BeforeSleep[playerid] = 1;
    SendClientMessage(playerid, COLOR_YELLOW, "โรงพยาบาล : {FFFFFF}ขณะนี้ทางโรงพยาบาลกำลังรักษาท่าน, โปรดรอจนกว่าเลือดจะเต็ม!");

    return 1;
}