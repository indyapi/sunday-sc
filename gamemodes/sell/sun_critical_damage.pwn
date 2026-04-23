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

//เอาไปเชื่อมในสคริปต์เลย
//อ่านด้านล่างด้วย

new base_cri[MAX_PLAYERS]; 
new cane_cri[MAX_PLAYERS]; 

//ถ้าจะเพิ่ม ต่อจากตัวนี้เลย สร้างตัวแปลก่อน

hook OnPlayerConnect(playerid)
{
    base_cri[playerid] = 0;
    cane_cri[playerid] = 0;

    //เอาตัวแปลที่สร้าง มาทำให้มันกลายเป็น 0
    return 1;
}

hook OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid, bodypart) 
{
    if(issuerid != INVALID_PLAYER_ID)
    {
		new Float:health, Float:armour;
		
		GetPlayerHealth(playerid, health);
        GetPlayerArmour(playerid, armour);

        if (base_cri[issuerid] == 1) //ไม้เบสคริ
        {
            if (weaponid == 5)
            {
                if(armour > 0)
				{
                    switch (random(5))
                    {
                        case 0: SetPlayerArmour(playerid, armour-5);
                        case 1: SetPlayerArmour(playerid, armour-8);
                        case 2: SetPlayerArmour(playerid, armour-15);
                        case 3: SetPlayerArmour(playerid, armour-16);
                        case 4: SetPlayerArmour(playerid, armour-20);
                    }
                }
                else
				{
                    switch (random(3))
                    {
                        case 0: SetPlayerHealth(playerid, health -7.0);
                        case 1: SetPlayerHealth(playerid, health -8.0);
                        case 2: SetPlayerHealth(playerid, health -100.0);
                    }
                }
            }
        }

        if (cane_cri[issuerid] == 1) //ไม้แซ่คริ
        {
            if (weaponid == 15)
            {
                if(armour > 0)
				{
                    switch (random(5))
                    {
                        case 0: SetPlayerArmour(playerid, armour-5);
                        case 1: SetPlayerArmour(playerid, armour-8);
                        case 2: SetPlayerArmour(playerid, armour-15);
                        case 3: SetPlayerArmour(playerid, armour-16);
                        case 4: SetPlayerArmour(playerid, armour-20);
                    }
                }
                else
				{
                    switch (random(3))
                    {
                        case 0: SetPlayerHealth(playerid, health -7.0);
                        case 1: SetPlayerHealth(playerid, health -8.0);
                        case 2: SetPlayerHealth(playerid, health -100.0);
                    }
                }
            }
        }
        //เขียนตามตัวด้านบน ยกเว้น ตัวแปลของ if
    }
    return 1;
}

/*
//เอาไปวางใน OnPlayerUseItem #ดานล่างสุดของฟังชั่นนี้

    else if (!strcmp(name, "ไม้เบสคริ", true))
	{
        if (base_cri[playerid] == 0)
        {
            base_cri[playerid] = 1;
		    GivePlayerWeaponEx(playerid, 5, 20000);
	        SendNearbyMessage(playerid, 10.0, COLOR_PURPLE, "[BASE-CRITICAL] %s ใช้ไม้เบสคริ", GetPlayerNameEx(playerid));
        }
        esle
        {
            base_cri[playerid] = 0;
            ResetPlayerWeaponsEx(playerid)
            SendNearbyMessage(playerid, 10.0, COLOR_PURPLE, "[BASE-CRITICAL] %s เก็บไม้เบสคริ", GetPlayerNameEx(playerid));
        }
	}

    else if (!strcmp(name, "ไม้แซ่คริ", true))
	{
        if (cane_cri[playerid] == 0)
        {
            cane_cri[playerid] = 1;
		    GivePlayerWeaponEx(playerid, 15, 20000);
	        SendNearbyMessage(playerid, 10.0, COLOR_PURPLE, "[BASE-CRITICAL] %s ใช้ไม้เบสคริ", GetPlayerNameEx(playerid));
        }
        esle
        {
            cane_cri[playerid] = 0;
            ResetPlayerWeaponsEx(playerid)
            SendNearbyMessage(playerid, 10.0, COLOR_PURPLE, "[BASE-CRITICAL] %s เก็บไม้เบสคริ", GetPlayerNameEx(playerid));
        }
	}
    
     
     
     
     */