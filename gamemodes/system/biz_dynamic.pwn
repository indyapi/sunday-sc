#include 	<YSI_Coding\y_hooks>

enum pBMoney
{
	Exist,
	Float:bPosX,
	Float:bPosY,
	Float:bPosZ,
	bLeader,
	bLevel,
	bExp,
	bPickup
}
new bmoneyInfo[100][pBMoney];

CMD:uplevelgang(playerid,params[])
{
	if (playerData[playerid][pFaction] == -1)
	    return SendClientMessage(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณไม่ใช่หนึ่งในสมาชิกของกลุ่มใด ๆ");

	if (playerData[playerid][pFactionRank] < factionData[playerData[playerid][pFaction]][factionRanks] - 1)
	    return SendClientMessageEx(playerid, COLOR_RED, "[ระบบ] {FFFFFF}คุณต้องมียศอย่างน้อยระดับ %d", factionData[playerData[playerid][pFaction]][factionRanks] - 1);

	if (GetPlayerMoneyEx(playerid) > 5000000)
 	{
  		for(new i = 1; i < 100; i++)
		{
  			if(bmoneyInfo[i][bLevel] == 1)
	    	{
      			bmoneyInfo[i][bLevel] = 2;
		    }
		    else if(bmoneyInfo[i][bLevel] == 2)
		    {
      			bmoneyInfo[i][bLevel] = 3;
		    }
		    Save_BMoney(i);
		}
		SendClientMessage(playerid, COLOR_GREEN, " คุณได้อัพเลเวลกิจการสำเร็จ!");
		GivePlayerMoneyEx(playerid, -5000000);
	}

	return 1;
}

CMD:cbg(playerid,params[])
{
	if(IsPlayerConnected(playerid))
	{
		if(playerData[playerid][pAdmin] < 3)
		    return 1;
		    
	    new e1, e2, string[128];
	    
	    if (sscanf(params, "dd", e1, e2))
		{
			SendClientMessage(playerid, COLOR_GREY, "การใช้งาน : /cbg [leader] [level]");
			SendClientMessage(playerid, COLOR_GREY, "แนะนำ : Level เฉพาะ 1-3 เท่านั้น");
			return 1;
		}
		
		if(e2 < 1 || e2 > 3)
		{
		    SendClientMessage(playerid, COLOR_GREY, " ได้เฉพาะเลเวล 1-3 เท่านั้น!");
		    return 1;
		}
		
	    new Float:X,Float:Y,Float:Z;
		GetPlayerPos(playerid, X,Y,Z);
	    for(new i = 1; i < 100; i++)
		{
			if(!bmoneyInfo[i][Exist])
			{
			    bmoneyInfo[i][Exist] = true;
		    	bmoneyInfo[i][bPosX] = X;
				bmoneyInfo[i][bPosY] = Y;
				bmoneyInfo[i][bPosZ] = Z;
				bmoneyInfo[i][bLeader] = e1;
	            bmoneyInfo[i][bLevel] = e2;
	            bmoneyInfo[i][bExp] = 0;
				bmoneyInfo[i][bPickup] = CreatePickup(1550, 1, X,Y,Z);
				format(string, sizeof(string), " คุณได้สร้างถุงเงินสำหรับหลีดเบอร์ %d เลเวล %d สำเร็จ", e1, e2);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
				new query[512];
				mysql_format(g_SQL, query, sizeof(query), "INSERT INTO  bmoney SET ID=%d, bPosX='%f',bPosY='%f',bPosZ='%f',Leader='%d',Level='%d',Exp='%d'",i,X,Y,Z, e1, e2, bmoneyInfo[i][bExp]);
				mysql_tquery(g_SQL, query);
		        return 1;
			}
		}
	}
	return 1;
}

CMD:rdg(playerid,params[])
{
	new string[128], type;
	
	if(IsPlayerConnected(playerid))
	{
		if(playerData[playerid][pAdmin] < 3)
		    return 1;
		    
	    if (sscanf(params, "d", type))
		{
			SendClientMessage(playerid, COLOR_GREY, "การใช้งาน : /rdg [ไอดี]");
			return 1;
		}

	    if(!bmoneyInfo[type][Exist])
		{
		    SendClientMessage(playerid, COLOR_GREY, " ไอดีที่คุณจะลบ ! ยังไม่ถูกสร้างขึ้นเลย");
		    return 1;
		}
		
		DestroyPickup(bmoneyInfo[type][bPickup]);
		format(string, sizeof(string), " คุณได้ลบถุงเงินไอดี %d ออกจากฐานข้อมูลสำเร็จ",type);
		SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
		new query[64];
		bmoneyInfo[type][bPosX] = 0.0;
		bmoneyInfo[type][bPosY] = 0.0;
		bmoneyInfo[type][bPosZ] = 0.0;
		bmoneyInfo[type][bLeader] = 0;
		bmoneyInfo[type][bLevel] = 0;
		bmoneyInfo[type][bExp] = 0;
		mysql_format(g_SQL, query, sizeof(query), "DELETE FROM bmoney WHERE ID = %d", type);
		mysql_tquery(g_SQL, query, "", "");
		bmoneyInfo[type][Exist] = false;
		return 1;
	}
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	new string[128];
	if (newkeys & KEY_YES && !IsPlayerInAnyVehicle(playerid))
	{
		//static
		    //id = -1;

        for(new i = 1; i < 100; i++)
        {
            if (IsPlayerInRangeOfPoint(playerid, 2, bmoneyInfo[i][bPosX], bmoneyInfo[i][bPosY], bmoneyInfo[i][bPosZ]))
            {
                if(playerData[playerid][pFaction] == bmoneyInfo[i][bLeader])
                {
                    if(playerData[playerid][pPayday] == 0)
                    {
                        if(bmoneyInfo[i][bLevel] == 1)
                        {
		                    new gangmoney = randomEx(10000, 50000);
		                    format(string, sizeof(string), "* คุณได้รับเงินจากกิจการจำนวน $%d (เลเวลกิจการ 1)", gangmoney);
			                SendClientMessage(playerid, COLOR_YELLOW, string);
			                playerData[playerid][pPayday] = 1;
			                GivePlayerMoneyEx(playerid, gangmoney);
						}
                        else if(bmoneyInfo[i][bLevel] == 2)
                        {
		                    new gangmoney = randomEx(50000, 100000);
		                    format(string, sizeof(string), "* คุณได้รับเงินจากกิจการจำนวน $%d (เลเวลกิจการ 2)", gangmoney);
			                SendClientMessage(playerid, COLOR_YELLOW, string);
			                playerData[playerid][pPayday] = 1;
			                GivePlayerMoneyEx(playerid, gangmoney);
						}
                        else if(bmoneyInfo[i][bLevel] == 3)
                        {
		                    new gangmoney = randomEx(100000, 150000);
		                    format(string, sizeof(string), "* คุณได้รับเงินจากกิจการจำนวน $%d (เลเวลกิจการ 3)", gangmoney);
			                SendClientMessage(playerid, COLOR_YELLOW, string);
			                playerData[playerid][pPayday] = 1;
			                GivePlayerMoneyEx(playerid, gangmoney);
						}
					}
					else
					{
		                SendClientMessage(playerid, -1, " คุณรับเงินไปแล้ว กรุณารอเพเดหน้า!");
	                }
                }
				else
				{
	                SendClientMessage(playerid, -1, " คุณไม่ได้เป็นส่วนหนึ่งของทีมนี้!");
				}
            }
        }
	}
	return 1;
}

forward Save_BMoney(id);
public Save_BMoney(id)
{
	new query[2048];
   	format(query,sizeof(query),"UPDATE `bmoney` SET");
   	format(query,sizeof(query),"%s bPosX ='%f',",query,bmoneyInfo[id][bPosX]);
   	format(query,sizeof(query),"%s bPosY ='%f',",query,bmoneyInfo[id][bPosY]);
   	format(query,sizeof(query),"%s bPosZ ='%f',",query,bmoneyInfo[id][bPosZ]);
   	format(query,sizeof(query),"%s Leader ='%d',",query,bmoneyInfo[id][bLeader]);
   	format(query,sizeof(query),"%s Level ='%d',",query,bmoneyInfo[id][bLevel]);
   	format(query,sizeof(query),"%s Exp ='%d'",query,bmoneyInfo[id][bExp]);
	format(query,sizeof(query),"%s WHERE `ID` ='%d'",query,id);
	mysql_tquery(g_SQL,query,"","");
}

forward Load_BMoney();
public Load_BMoney()
{
    new rows = cache_num_rows();
	new id, loaded;
 	if(rows)
  	{
		while(loaded < rows)
		{
		    cache_get_value_name_int(loaded,"ID", id);
		    cache_get_value_name_float(loaded,"bPosX",bmoneyInfo[id][bPosX]);
		    cache_get_value_name_float(loaded,"bPosY",bmoneyInfo[id][bPosY]);
		    cache_get_value_name_float(loaded,"bPosZ",bmoneyInfo[id][bPosZ]);
		    cache_get_value_name_int(loaded,"Leader",bmoneyInfo[id][bLeader]);
		    cache_get_value_name_int(loaded,"Level",bmoneyInfo[id][bLevel]);
		    cache_get_value_name_int(loaded,"Exp",bmoneyInfo[id][bExp]);

		    bmoneyInfo[id][bPickup] = CreatePickup(1550, 1, bmoneyInfo[id][bPosX],bmoneyInfo[id][bPosY],bmoneyInfo[id][bPosZ]);
		    if(!bmoneyInfo[id][Exist])
		    {
		        bmoneyInfo[id][Exist] = true;
		    }
		    loaded ++;
		}

	}
	printf("Load_BMoney %d", loaded);
}

