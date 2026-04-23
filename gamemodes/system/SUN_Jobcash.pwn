#include	<YSI_Coding\y_hooks>

hook OnGameModeInit()
{
    CreateDynamicPickup(1212, 23, 1920.0289,-1773.2719,13.5828);
	CreateDynamic3DTextLabel("[24/7 เช็คราคาสินค้า]\n{FFFFFF}[ ใช้ 'N' เพื่อดู ]", COLOR_RED, 1920.0289,-1773.2719,13.5828, 10.0);
	return 1;
}


hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid))
    {
		if (IsPlayerInRangeOfPoint(playerid, 3.0, 1920.0289,-1773.2719,13.5828))
		{
			new string100[7777];
			new string2[7777];

			format(string100, sizeof(string100), "สินค้า\tราคา\n");
			strcat(string2,string100);

   			format(string100, sizeof(string100), "ปลาเก๋า\t{07FB07}$%d\n" , SUN_Jobcash[0]);
			strcat(string2,string100);

			format(string100, sizeof(string100), "ปลาช่อน\t{07FB07}$%d\n" , SUN_Jobcash[1]);
			strcat(string2,string100);

			format(string100, sizeof(string100), "ปลาดอลลี่\t{07FB07}$%d\n" , SUN_Jobcash[2]);
			strcat(string2,string100);

			format(string100, sizeof(string100), "ปลานิล\t{07FB07}$%d\n" , SUN_Jobcash[3]);
			strcat(string2,string100);

			format(string100, sizeof(string100), "ปลากระพง\t{07FB07}$%d\n" , SUN_Jobcash[4]);
			strcat(string2,string100);

			format(string100, sizeof(string100), "ปลาทับทิม\t{07FB07}$%d\n" , SUN_Jobcash[5]);
			strcat(string2,string100);

			format(string100, sizeof(string100), "ปลาดุก\t{07FB07}$%d\n" , SUN_Jobcash[6]);
			strcat(string2,string100);

			format(string100, sizeof(string100), "ปลาทูน่า\t{07FB07}$%d\n" , SUN_Jobcash[7]);
			strcat(string2,string100);

			format(string100, sizeof(string100), "ปลาแซลม่อน\t{07FB07}$%d\n" , SUN_Jobcash[8]);
			strcat(string2,string100);

			format(string100, sizeof(string100), "ปลากระเบน\t{07FB07}$%d\n" , SUN_Jobcash[9]);
			strcat(string2,string100);

			format(string100, sizeof(string100), "ปลาฉลาม\t{07FB07}$%d\n" , SUN_Jobcash[10]);
			strcat(string2,string100);
			
			format(string100, sizeof(string100), "แพ็กมะม่วง\t{07FB07}$%d\n" , SUN_Jobcash[11]);
			strcat(string2,string100);
			
			format(string100, sizeof(string100), "แพ็กมะเขือเทศ\t{07FB07}$%d\n" , SUN_Jobcash[12]);
			strcat(string2,string100);
			
			format(string100, sizeof(string100), "แพ็กลิ้นจี่\t{07FB07}$%d\n" , SUN_Jobcash[13]);
			strcat(string2,string100);
			
			format(string100, sizeof(string100), "แพ็กมะพร้าว\t{07FB07}$%d\n" , SUN_Jobcash[14]);
			strcat(string2,string100);
			
			format(string100, sizeof(string100), "แพ็กแอปเปิ้ล\t{07FB07}$%d\n" , SUN_Jobcash[15]);
			strcat(string2,string100);


			Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_TABLIST_HEADERS, "{07FB07}[{45F745}24/7 ผุพัง{07FB07}]", string2, "ตกลง", "ยกเลิก");
		}
 	}
 	return 1;
}
