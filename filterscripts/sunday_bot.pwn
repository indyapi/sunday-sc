#include <a_samp>
#include <discord-connector>
#include <discord-cmd>
#define DISCORD_CMD_PREFIX '?'

new MengNaomi;
new DCC_Channel:wahbagus;
main()
{
	wahbagus = DCC_FindChannelById("1009439350116847707");
}
public OnFilterScriptInit()
{
	print("Simple player online checker by naomi iwatani");
	return 1;
}
public OnPlayerConnect(playerid)
{
	MengNaomi = 1;
	new name[MAX_PLAYERS + 1];
    GetPlayerName(playerid, name, sizeof(name));
    new plrIP[16];
    GetPlayerIp(playerid, plrIP, sizeof(plrIP));
	new manaa[34];
	format(manaa, sizeof manaa, "%s Telah bergabung kedalam game IP : %s", name, plrIP);
	DCC_SendChannelMessage(wahbagus, manaa);
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    MengNaomi = 0;
	new manas[MAX_PLAYERS + 1]; 
    GetPlayerName(playerid, manas, sizeof(manas));
    new ipeh[16];
    GetPlayerIp(playerid, ipeh, sizeof(ipeh));
	new dasi[34];
	format(dasi, sizeof dasi, "%s Telah keluar dari game IP : %s", manas, ipeh);
	DCC_SendChannelMessage(wahbagus, dasi);
	return 1;
}

SendClientMessageToAllExx(color, const text[], {Float, _}:...)
{
	static
	    args,
	    str[144];

	/*
     *  Custom function that uses #emit to format variables into a string.
     *  This code is very fragile; touching any code here will cause crashing!
	*/
	if ((args = numargs()) == 2)
	{
	    SendClientMessageToAll(color, text);
	}
	else
	{
		while (--args >= 2)
		{
			#emit LCTRL 5
			#emit LOAD.alt args
			#emit SHL.C.alt 2
			#emit ADD.C 12
			#emit ADD
			#emit LOAD.I
			#emit PUSH.pri
		}
		#emit PUSH.S text
		#emit PUSH.C 144
		#emit PUSH.C str
		#emit LOAD.S.pri 8
		#emit ADD.C 4
		#emit PUSH.pri
		#emit SYSREQ.C format
		#emit LCTRL 5
		#emit SCTRL 4

		SendClientMessageToAll(color, str);

		#emit RETN
	}
	return 1;
}

DCMD:player(user, channel, params[])
{
	new hahaha[64];
	format(hahaha, sizeof hahaha, "Player Online [ %d ]", MengNaomi);
	DCC_SendChannelMessage(channel, hahaha);
	return 1;
}

ReturnIPi(playerid)
{
	new
	    ip[16];

	GetPlayerIp(playerid, ip, sizeof(ip));
	return ip;
}
