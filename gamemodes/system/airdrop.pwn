#include	<YSI_Coding\y_hooks>

#define MAX_AIRDROP_BOX 5
#define FLOAT_INFINITY   (Float:0x7F800000)

enum E_BOX_DATA {
    bool:IsExist,
    ObjectBox,
    ObjectFlash,
    Text3D:ObjectText
}

new BoxInfo[MAX_AIRDROP_BOX][E_BOX_DATA];
new bool:IsGetBox[MAX_PLAYERS][MAX_AIRDROP_BOX];

new AirDropTake[MAX_PLAYERS];
new AirBox;

hook OnPlayerConnect(playerid)
{
	AirDropTake[playerid] = 0;
}

hook OnGameModeInit()
{
    AirBox = -1;
}

alias:spawnairdrop("เสกแอร์ดรอป")
CMD:spawnairdrop(playerid, params[])
{
    if (playerData[playerid][pAdmin] > 5)
    {
        new bool:checked;
        for(new i=0; i != MAX_AIRDROP_BOX; i++) {
            if(!BoxInfo[i][IsExist]) {
                BoxInfo[i][IsExist]=true;

                new Float:x ,Float:y ,Float:z;
                GetPlayerPos(playerid, x, y, z);

                BoxInfo[i][ObjectBox] = CreateDynamicObject(19054, x, y, z+90, 0, 0, 0);
                BoxInfo[i][ObjectFlash] = CreateDynamicObject(18728, x, y, z+85, 0, 0, 0); 
                MoveDynamicObject(BoxInfo[i][ObjectBox], x, y, z-0.4, 10.00);
                MoveDynamicObject(BoxInfo[i][ObjectFlash], x, y, z-1.2, 10.00);
                SetTimerEx("Box2",600000*10 , 0, "d", i);
                
                BoxInfo[i][ObjectText] = CreateDynamic3DTextLabel("[AirDrop]\n{FFFFFF}พิมพ์ '/airdrop' เพื่อเปิดกล่อง", COLOR_RED, x, y, z-0.4, 30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1);
                
                AirBox = i;
                AirDropStats = 0;

                foreach (new ga : Player)
                {
					SetPlayerCheckpoint(ga, x, y, z, 30.0);
				}
				SendClientMessageToAll(COLOR_RED, "(( AirDrop กำลังหล่นลงมาจากฟ้าแล้ว .. ))");

                SendClientMessageEx(playerid, -1, "เซิร์ฟเวอร์: คุณได้สร้าง Airdrop ไอดี "EMBED_ORANGE"%d"EMBED_WHITE"", i);

                checked = true;

                break;
            }
        }
        if(!checked) SendClientMessage(playerid, COLOR_LIGHTRED, "เซิร์ฟเวอร์: ถึงขีดจำกัดในการสร้างกล่อง Airdrop แล้ว");
    }
    else
    {
        SendClientMessage(playerid, -1, "เซิร์ฟเวอร์: คุณไม่ใช่แอดมินไม่สามารถปล่อยกล่องได้");
    }
    return 1;
}

forward Box2(id); // index from BoxInfo
public Box2(id)
{  
    DestroyDynamicObject(BoxInfo[id][ObjectBox]);     //เป็นการลบObject Box1
    DestroyDynamicObject(BoxInfo[id][ObjectFlash]);   //เป็นการลบObject flash1
    BoxInfo[id][IsExist]=false;
    DestroyDynamic3DTextLabel(BoxInfo[id][ObjectText]);

    foreach(new i : Player) {
        if(IsGetBox[i][id]) {
            IsGetBox[i][id]=false;
        }
        SendClientMessageEx(i, -1, "เซิร์ฟเวอร์: Airdrop ID "EMBED_ORANGE"%d"EMBED_WHITE" ได้ถูกทำลายแล้ว", id);
    }
    return 1;
}

CMD:airdrop(playerid, params[])
{
    new
        Float:fDistance = FLOAT_INFINITY,
        iIndex = -1
    ;

	if (AirDropStats == 1)
	    return SendClientMessage(playerid, COLOR_LIGHTRED, "* มีผู้เล่นกำลังเก็บ AirDrop ฆ่าเขาสะ!");

    for(new i=0; i != MAX_AIRDROP_BOX; i++) {
        if(BoxInfo[i][IsExist]) { // เฉพาะกล่องที่ถูกสร้าง

            new Float:x ,Float:y ,Float:z;
            GetDynamicObjectPos(BoxInfo[i][ObjectBox], x, y, z); 

            new
                Float:temp = GetPlayerDistanceFromPoint(playerid, x, y, z);

            if (temp < fDistance && temp <= 5.0)
            {
                fDistance = temp;
                iIndex = i;
            }
        }
    }

    if(iIndex != -1) {
        if(!IsGetBox[playerid][iIndex]) 
        {
            AirDropStats = 1;
            AirDropTake[playerid] = 1;
            IsGetBox[playerid][iIndex] = true;
            SendClientMessage(playerid, COLOR_RED, "* คุณได้เริ่มต้นการเก็บ AirDrop แล้ว +");
            //TogglePlayerControllable(playerid, false);
        }
        else return SendClientMessage(playerid, -1, "Server : คุณรับของไปแล้ว ไม่สามารถรับของได้อีก");
    }
    else {
        SendClientMessage(playerid, -1, "Server : คุณไม่ได้อยู่จุดที่กล่องดรอปหรือกล่องยังไม่ได้ดรอป");
    }
    return 1;
}

CMD:resetairdrop(playerid, params[])
{
    if (playerData[playerid][pAdmin] < 3)
        return SendClientMessage(playerid, COLOR_LIGHTRED, "* คุณไม่ได้รับอนุญาตให้ใช้งานคำสั่งนี้");

    AirDropStats = 0;
    SendClientMessage(playerid, COLOR_LIGHTRED, "(( คุณได้ทำการแก้บัค 'AirDrop' แล้ว ))");
    return 1;
}
