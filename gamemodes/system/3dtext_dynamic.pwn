#include 	<YSI_Coding\y_hooks>

#define MAX_LABEL 2000
enum  enum_labelex
{
	Exitis,
	Float:LabelPos[3],
	Text3DPickupid,
	Namelabel1[255],
    Namelabel2[255],
    Pickuplabel,
	Text3D:Labeldynamic,
}

new Dynamic3DTextInfo[MAX_LABEL][enum_labelex];
new EditView3dText[MAX_PLAYERS];

CMD:textcmds(playerid,params[])
{
	SendClientMessage(playerid, COLOR_GREEN, "==========[ ระบบ Text โดย Porhayhaa ]==========");
	SendClientMessage(playerid, COLOR_GREY, "คำสั่ง: /createtext, /edit3dtext, /checkid_message, /remove3dtext");
	return 1;
}

CMD:createtext(playerid,params[])
{
	if (playerData[playerid][pAdmin] < 6)
	{
	    SendClientMessage(playerid, COLOR_GREY, "คุณมียศแอดมินไม่ถึง 6 นะครับ");
	    return 1;
	}
	new Float:x,Float:y,Float:z;
	GetPlayerPos(playerid,x,y,z);
	new text[500],text2[500],pickupid;
	if(sscanf(params, "s[500]s[500]d",text,text2,pickupid))
	{
		SendClientMessage(playerid, -1, "USAGE: /createtext [ข้อความบรรทัดแรก] [ข้อความบรรทัดสอง] [pickid]");
		return 1;
	}
	Create_3DTextDynamic(playerid,text,text2,pickupid,x,y,z);
	return 1;
}

alias:checkid_message("near3D")
CMD:checkid_message(playerid,params[])
{
	new string[128];
	if (playerData[playerid][pAdmin] < 3)
	{
	    SendClientMessage(playerid, COLOR_GREY, "คุณมียศแอดมินไม่ถึง 3 นะครับ");
	    return 1;
	}
	for(new i = 1; i < MAX_LABEL; i++)
	{
		if(Dynamic3DTextInfo[i][Exitis])
		{
		    if(PlayerToPoint(1.0,playerid,Dynamic3DTextInfo[i][LabelPos][0],Dynamic3DTextInfo[i][LabelPos][1],Dynamic3DTextInfo[i][LabelPos][2]))
			{
			    format(string, sizeof(string), "3DTextDynamicID : %d",i);
				SendClientMessage(playerid,-1, string);
			}
		}
	}
	return 1;
}

CMD:edit3dtext(playerid,params[])
{
	new typegroup;
	if(IsPlayerConnected(playerid))
	{
 		if (playerData[playerid][pAdmin] < 6)
		{
		    SendClientMessage(playerid, COLOR_GREY, "คุณมียศแอดมินไม่ถึง 6 นะครับ");
		    return 1;
		}
	    if(sscanf(params, "d",typegroup))
		{
			SendClientMessage(playerid, -1, "USAGE: /edit3dtext [id3dtextlabel]");
			return 1;
		}
		if(!Dynamic3DTextInfo[typegroup][Exitis])
		{
		    SendClientMessage(playerid, -1, "ไอดีที่ค้นหายังไม่ถูกสร้าง");
		    return 1;
		}
		Viewgroup3DText(playerid);
		EditView3dText[playerid] = typegroup;
		return 1;
	}
	return 1;
}

CMD:remove3dtext(playerid,params[])
{
	new typegroup, string[128];
	if(IsPlayerConnected(playerid))
	{
	    if (playerData[playerid][pAdmin] < 6)
		{
		    SendClientMessage(playerid, COLOR_GREY, "คุณมียศแอดมินไม่ถึง 6 นะครับ");
		    return 1;
		}
	    if(sscanf(params, "d",typegroup))
		{
			SendClientMessage(playerid, -1, "USAGE: /remove3dtext [id3dtextlabel]");
			return 1;
		}
		if(!Dynamic3DTextInfo[typegroup][Exitis])
		{
		    SendClientMessage(playerid, -1, "ไอดีที่ค้นหายังไม่ถูกสร้าง");
		    return 1;
		}
		Dynamic3DTextInfo[typegroup][Exitis] = false;
		DestroyDynamicPickup(Dynamic3DTextInfo[typegroup][Pickuplabel]);
		DestroyDynamic3DTextLabel(Dynamic3DTextInfo[typegroup][Labeldynamic]);
		format(string, sizeof(string), "คุณได้ลบไอดี %d",typegroup);
		SendClientMessage(playerid,-1, string);
		new query[64];
		mysql_format(g_SQL, query, sizeof(query), "DELETE FROM dtextlabeldynamic WHERE ID=%d", typegroup);
		mysql_tquery(g_SQL, query);
		return 1;
	}

	return 1;
}

Dialog:edit3dtextdialog(playerid, response, listitem, inputtext[])
{
	new id = EditView3dText[playerid];
	new string100[256];
	new string2[256];
	if(response)
	{
        switch(listitem)
		{
			case 1:
			{
                format(string100, sizeof(string100), "ใส่ข้อความบรรทัดบนที่ต้องการปัจจุบันใช้ข้อความ '%s'\n",Dynamic3DTextInfo[id][Namelabel1]);
				strcat(string2,string100);
				Dialog_Show(playerid,edit3dtextdialog1,DIALOG_STYLE_INPUT,"> แก้ไขกลุ่ม",string2,"ตกลง","ยกเลิก");
			}
			case 2:
			{
			    format(string100, sizeof(string100), "ใส่ข้อความบรรทัดบนที่ต้องการปัจจุบันใช้ข้อความ '%s'\n",Dynamic3DTextInfo[id][Namelabel2]);
				strcat(string2,string100);
				Dialog_Show(playerid,edit3dtextdialog2,DIALOG_STYLE_INPUT,"> แก้ไขกลุ่ม",string2,"ตกลง","ยกเลิก");
			}
			case 3:
			{
			    format(string100, sizeof(string100), "ใส่เลขไอดี Pickupid ที่ต้องการปัจจุบันใช้ %d\n",Dynamic3DTextInfo[id][Text3DPickupid]);
				strcat(string2,string100);
				Dialog_Show(playerid,edit3dtextdialog3,DIALOG_STYLE_INPUT,"> แก้ไขกลุ่ม",string2,"ตกลง","ยกเลิก");
			}
		}
	}
}

Dialog:edit3dtextdialog1(playerid, response, listitem, inputtext[])
{

	new id = EditView3dText[playerid];
	new string[256];
	if(response)
	{
	    format(Dynamic3DTextInfo[id][Namelabel1], 255, "%s", inputtext);
	    format(string, sizeof(string), "ข้อความใหม่คือ %s",inputtext);
		SendClientMessage(playerid, -1, string);
		UpdateLabelDynamic(id);
		Save_3DText(id);
	}
}

Dialog:edit3dtextdialog2(playerid, response, listitem, inputtext[])
{

	new id = EditView3dText[playerid];
	new string[256];
	if(response)
	{
	    format(Dynamic3DTextInfo[id][Namelabel2], 255, "%s", inputtext);
	    format(string, sizeof(string), "ข้อความใหม่คือ %s",inputtext);
		SendClientMessage(playerid, -1, string);
		UpdateLabelDynamic(id);
		Save_3DText(id);
	}
}

Dialog:edit3dtextdialog3(playerid, response, listitem, inputtext[])
{

	new id = EditView3dText[playerid];
	new string[256];
	if(response)
	{
		DestroyDynamicPickup(Dynamic3DTextInfo[id][Pickuplabel]);
	    Dynamic3DTextInfo[id][Text3DPickupid] =  strval(inputtext);
	    format(string, sizeof(string), "ข้อความใหม่คือ %s",inputtext);
		SendClientMessage(playerid, -1, string);
		Dynamic3DTextInfo[id][Pickuplabel] = CreateDynamicPickup(Dynamic3DTextInfo[id][Text3DPickupid],1,Dynamic3DTextInfo[id][LabelPos][0],Dynamic3DTextInfo[id][LabelPos][1],Dynamic3DTextInfo[id][LabelPos][2]);
		Save_3DText(id);
	}
}

forward UpdateLabelDynamic(id);
public UpdateLabelDynamic(id)
{
    new PropertyString[256];
	format(PropertyString,sizeof(PropertyString),"%s\n%s",Dynamic3DTextInfo[id][Namelabel1],Dynamic3DTextInfo[id][Namelabel2]);
	UpdateDynamic3DTextLabelText(Dynamic3DTextInfo[id][Labeldynamic] , -1, PropertyString);
}

forward Viewgroup3DText(playerid);
public Viewgroup3DText(playerid)
{
    new id = EditView3dText[playerid];
    new string100[256];
	new string2[256];
    format(string100, sizeof(string100), "แก้ไข ID : %d\n",id);
	strcat(string2,string100);
	format(string100, sizeof(string100), "ข้อความบรรทัดบน : %s\n",Dynamic3DTextInfo[id][Namelabel1]);
	strcat(string2,string100);
	format(string100, sizeof(string100), "ข้อความบรรทัดล่าง : %s\n",Dynamic3DTextInfo[id][Namelabel2]);
	strcat(string2,string100);
	format(string100, sizeof(string100), "Pickupid : %d\n",Dynamic3DTextInfo[id][Text3DPickupid]);
	strcat(string2,string100);
	Dialog_Show(playerid,edit3dtextdialog,DIALOG_STYLE_LIST,"> แก้ไขกลุ่ม",string2,"ตกลง","ยกเลิก");
	return 1;

}

Save_3DText(id){

	new query[512];
    format(query,sizeof(query),"UPDATE `dtextlabeldynamic` SET");
	format(query,sizeof(query),"%s Namelabel1='%s',",query,Dynamic3DTextInfo[id][Namelabel1]);
	format(query,sizeof(query),"%s Namelabel2='%s',",query,Dynamic3DTextInfo[id][Namelabel2]);
	format(query,sizeof(query),"%s Text3DPickupid='%d'",query,Dynamic3DTextInfo[id][Text3DPickupid]);
	format(query,sizeof(query),"%s WHERE `id` ='%d'",query,id);
	mysql_tquery(g_SQL, query);

}

forward Create_3DTextDynamic(playerid,namelabel1[],namelabel2[],pickupidex,Float:labelx,Float:labely,Float:labelz);
public Create_3DTextDynamic(playerid,namelabel1[],namelabel2[],pickupidex,Float:labelx,Float:labely,Float:labelz)
{
	new string[256];
    for(new i = 1; i < MAX_LABEL; i++)
	{
		if(!Dynamic3DTextInfo[i][Exitis])
		{
		    Dynamic3DTextInfo[i][Exitis] = true;
		    Dynamic3DTextInfo[i][LabelPos][0] = labelx;
		    Dynamic3DTextInfo[i][LabelPos][1] = labely;
		    Dynamic3DTextInfo[i][LabelPos][2] = labelz;
		    Dynamic3DTextInfo[i][Text3DPickupid] = pickupidex;
		    format(Dynamic3DTextInfo[i][Namelabel1], 255, "%s", namelabel1);
		    format(Dynamic3DTextInfo[i][Namelabel2], 255, "%s", namelabel2);
		    format(string, sizeof(string), "คุณได้สร้าง 3DTextLabel (ไอดี :%d) /edit3dtext เพื่อแก้ไขต่าง ๆ /remove3dtext เพื่อลบ ",i);
			SendClientMessage(playerid,-1, string);
			Dynamic3DTextInfo[i][Pickuplabel] = CreateDynamicPickup(Dynamic3DTextInfo[i][Text3DPickupid],1,Dynamic3DTextInfo[i][LabelPos][0],Dynamic3DTextInfo[i][LabelPos][1],Dynamic3DTextInfo[i][LabelPos][2]);
            new PropertyString[256];
			format(PropertyString,sizeof(PropertyString),"%s\n%s",Dynamic3DTextInfo[i][Namelabel1],Dynamic3DTextInfo[i][Namelabel2]);
			Dynamic3DTextInfo[i][Labeldynamic] = CreateDynamic3DTextLabel(PropertyString ,0xff0000ff,Dynamic3DTextInfo[i][LabelPos][0],Dynamic3DTextInfo[i][LabelPos][1],Dynamic3DTextInfo[i][LabelPos][2], 100, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, -1, -1, -1, 25.0);
			new query[512];
			mysql_format(g_SQL, query, sizeof(query), "INSERT INTO  dtextlabeldynamic SET ID=%d,Namelabel1='%s',Namelabel2='%s',Text3DPickupid=%d,X=%f,Y=%f,Z=%f",
			i,namelabel1,namelabel2,pickupidex,labelx,labely,labelz);
			mysql_tquery(g_SQL, query);
		    return 1;
		}
	}
	return 1;
}

forward Load_Create_3DTextDynamic();
public Load_Create_3DTextDynamic()
{
    new rows = cache_num_rows();
	new id,loaded;
 	if(rows)
  	{
		while(loaded < rows)
		{

		    cache_get_value_name_int(loaded,"ID",id);
			cache_get_value_name_float(loaded,"X",Dynamic3DTextInfo[id][LabelPos][0]);
			cache_get_value_name_float(loaded,"Y",Dynamic3DTextInfo[id][LabelPos][1]);
			cache_get_value_name_float(loaded,"Z",Dynamic3DTextInfo[id][LabelPos][2]);
			cache_get_value_name(loaded,"Namelabel1",Dynamic3DTextInfo[id][Namelabel1], .max_len = 255);
			cache_get_value_name(loaded,"Namelabel2",Dynamic3DTextInfo[id][Namelabel2], .max_len = 255);
			cache_get_value_name_int(loaded,"Text3DPickupid",Dynamic3DTextInfo[id][Text3DPickupid]);


			Dynamic3DTextInfo[id][Pickuplabel] = CreateDynamicPickup(Dynamic3DTextInfo[id][Text3DPickupid],1,Dynamic3DTextInfo[id][LabelPos][0],Dynamic3DTextInfo[id][LabelPos][1],Dynamic3DTextInfo[id][LabelPos][2]);


            new PropertyString[256];
			format(PropertyString,sizeof(PropertyString),"%s\n%s",Dynamic3DTextInfo[id][Namelabel1],Dynamic3DTextInfo[id][Namelabel2]);
			Dynamic3DTextInfo[id][Labeldynamic] = CreateDynamic3DTextLabel(PropertyString ,0xff0000ff,Dynamic3DTextInfo[id][LabelPos][0],Dynamic3DTextInfo[id][LabelPos][1],Dynamic3DTextInfo[id][LabelPos][2], 100, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, -1, -1, -1, 25.0);


			if(!Dynamic3DTextInfo[id][Exitis]){
			        Dynamic3DTextInfo[id][Exitis] = true;

		    }
			loaded++;
		}
	}
	printf("CreateDynamic3DTextLabel  (%d)", loaded);
}
