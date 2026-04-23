#include <YSI_Coding\y_hooks>

#define TIME 250 //Timer for check if player is cycling through weapons or received another weapon (in ms)
#define playercommand //comment this line to disable the /holdingweapon command for players

forward Enable(playerid);
forward Disable(playerid);
//forward AttachWeapon();
forward HoldingWeaponsForAll(boolean);
new wep[MAX_PLAYERS] = -1, timer, weps[12], d[MAX_PLAYERS] = 1, d1 = 1, camera[MAX_PLAYERS], bool:ToggleGunOn[MAX_PLAYERS];

hook OnGameModeInit()
{
	//timer = SetTimer("AttachWeapon", TIME, 1);
}

hook OnPlayerConnect(playerid)
{
    ToggleGunOn[playerid] = true;
}

hook OnGameModeExit()
{
	foreach (new i : Player) if(IsPlayerConnected(i)) if(!IsPlayerNPC(i))	for(new a = 0; a < 10; a++)	if(IsPlayerAttachedObjectSlotUsed(i, a)) RemovePlayerAttachedObject(i, a);
}

ptask AttachWeapon[200](playerid)
{
	if (!playerData[playerid][IsLoggedIn])
		return 0;

	if (!ToggleGunOn[playerid])
		return 0;

	/*if (IsPlayerInAnyVehicle(playerid))
	{
		for(new a = 0; a < 9; a++) if(IsPlayerAttachedObjectSlotUsed(playerid, a)) RemovePlayerAttachedObject(playerid, a);
		wep[playerid] = -1;
		return 1;
	}*/
	
	if(wep[playerid] != GetPlayerWeapon(playerid)) for(new a = 0; a < 12; a++)
	{
	    GetPlayerWeaponData(playerid, a, weps[a], weps[6]);

		switch(a)
		{
			case 0:
			{
				if(IsPlayerAttachedObjectSlotUsed(playerid, 0)) RemovePlayerAttachedObject(playerid, 0);
				if(weps[a] == 1 && GetPlayerWeapon(playerid) != 1) SetPlayerAttachedObject( playerid, 0, 331, 6, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000 );
			}
   			case 1:
   			{
				if(IsPlayerAttachedObjectSlotUsed(playerid, 1)) RemovePlayerAttachedObject(playerid, 1);
     			switch(weps[a])
				{
					case 2: if(GetPlayerWeapon(playerid) != 2) SetPlayerAttachedObject( playerid, 0, 333, 1, 0.488999, -0.130000, 0.179000, 0.000000, -122.300003, -2.600002, 1.000000, 1.000000, 1.000000);
					case 5: if(GetPlayerWeapon(playerid) != 5) SetPlayerAttachedObject( playerid, 0, 336, 1, 0.318999, -0.049999, 0.193000, 163.699890, -51.700206, -2.999988, 1.000000, 1.000000, 1.000000);
					case 6: if(GetPlayerWeapon(playerid) != 6) SetPlayerAttachedObject( playerid, 0, 337, 1, 0.346998, -0.040999, -0.110999, 22.800008, -58.100067, -62.299949, 1.000000, 1.000000, 1.000000);
					case 7: if(GetPlayerWeapon(playerid) != 7) SetPlayerAttachedObject( playerid, 0, 338, 1, 0.346999, -0.112999, -0.146000, 23.499988, -71.600059, 13.400053, 1.000000, 1.000000, 1.000000);
					case 8: if(GetPlayerWeapon(playerid) != 8) SetPlayerAttachedObject( playerid, 0, 339, 1, 0.398000, -0.012000, -0.027999, -142.399948, -111.500061, 84.999969, 1.000000, 1.000000, 1.000000);
					case 15: if(GetPlayerWeapon(playerid) != 15) SetPlayerAttachedObject( playerid, 0, 326, 1, -0.204999, -0.115000, -0.089000, 2.900004, 62.400035, 0.000000, 1.000000, 1.000000, 1.000000);
				}
    		}
		}
	}
	wep[playerid] = GetPlayerWeapon(playerid);
	return 1;
}

/*public AttachWeapon()
{
	foreach (new i : Player)
	{
	    if(IsPlayerNPC(i)) return 1;
	    if(IsPlayerInAnyVehicle(i)) {
			for(new a = 0; a < 9; a++) if(IsPlayerAttachedObjectSlotUsed(i, a)) RemovePlayerAttachedObject(i, a);
			wep[i] = -1;
			return 1;
		}
		if(!d[i]) return 1;
		if(camera[i]) return 1;

	    if(wep[i] != GetPlayerWeapon(i)) for(new a = 0; a < 12; a++)
		{
	    	GetPlayerWeaponData(i, a, weps[a], weps[6]);
			switch(a){
			    case 0: {
			        if(IsPlayerAttachedObjectSlotUsed(i, 0)) RemovePlayerAttachedObject(i, 0);
			        if(weps[a] == 1 && GetPlayerWeapon(i) != 1) SetPlayerAttachedObject( i, 0, 331, 6, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000 );
			    }
			    case 1: {
			        if(IsPlayerAttachedObjectSlotUsed(i, 1)) RemovePlayerAttachedObject(i, 1);
			        switch(weps[a]){
						case 2: if(GetPlayerWeapon(i) != 2) SetPlayerAttachedObject( i, 0, 333, 1, 0.488999, -0.130000, 0.179000, 0.000000, -122.300003, -2.600002, 1.000000, 1.000000, 1.000000);
						case 5: if(GetPlayerWeapon(i) != 5) SetPlayerAttachedObject( i, 0, 336, 1, 0.318999, -0.049999, 0.193000, 163.699890, -51.700206, -2.999988, 1.000000, 1.000000, 1.000000);
						case 7: if(GetPlayerWeapon(i) != 7) SetPlayerAttachedObject( i, 0, 338, 1, 0.346999, -0.112999, -0.146000, 23.499988, -71.600059, 13.400053, 1.000000, 1.000000, 1.000000);
						case 8: if(GetPlayerWeapon(i) != 8) SetPlayerAttachedObject( i, 0, 339, 1, 0.398000, -0.012000, -0.027999, -142.399948, -111.500061, 84.999969, 1.000000, 1.000000, 1.000000);
						case 15: if(GetPlayerWeapon(i) != 15) SetPlayerAttachedObject( i, 0, 326, 1, -0.204999, -0.115000, -0.089000, 2.900004, 62.400035, 0.000000, 1.000000, 1.000000, 1.000000);
					}
			    }
			}
	    }
	    wep[i] = GetPlayerWeapon(i);
	}
	return 1;
}*/

public Disable(playerid) {
    d[playerid] = 0;
    wep[playerid] = -1;
    for(new a = 0; a < 9; a++) if(IsPlayerAttachedObjectSlotUsed(playerid, a)) RemovePlayerAttachedObject(playerid, a);
	return 1;
}

public Enable(playerid) {
    d[playerid] = 1;
	return 1;
}

public HoldingWeaponsForAll(boolean) {
	if(boolean == 0){
 		if(!d1) return 1;
		foreach (new i : Player) for(new a = 0; a < 9; a++) if(IsPlayerAttachedObjectSlotUsed(i, a)) RemovePlayerAttachedObject(i, a);
		KillTimer(timer);
		d1 = 0;
	    return 1;
	}
	if(boolean == 1){
		if(d1) return 1;
		//timer = SetTimer("AttachWeapon", TIME, 1);
		d1 = 1;
		return 1;
	}
 	return 0;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys){
    if(newkeys == 128 && oldkeys != 128 && GetPlayerWeapon(playerid) == 43) {
        camera[playerid] = 1;
        for(new a = 0; a < 9; a++) if(IsPlayerAttachedObjectSlotUsed(playerid, a)) RemovePlayerAttachedObject(playerid, a);
    }
	if(newkeys != 128 && oldkeys == 128 && GetPlayerWeapon(playerid) == 43) camera[playerid] = 0;
	return 1;
}

CMD:togglegun(playerid, params[])
{
	if (!ToggleGunOn[playerid])
	{
	    ToggleGunOn[playerid] = true;
	    SendClientMessage(playerid, -1, "{11D3FE}แจ้งเตือน :: {C1F2FD}คุณได้เปิดการแสดงอาวุธติดหลังของคุณแล้ว!");
	}
	else
	{
	    ToggleGunOn[playerid] = false;
	    SendClientMessage(playerid, -1, "{F74B1D}แจ้งเตือน :: {FAC2B3}คุณได้ปิดการแสดงอาวุธติดหลังของคุณแล้ว!");
	}
	return 1;
}
