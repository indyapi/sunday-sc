#include <a_samp>
#undef MAX_PLAYERS
#define MAX_PLAYERS 100
#include <discord-connector>
#include <discord-cmd>
#include <foreach>
#include <sscanf2>
#include <zcmd>
#include <dini>
#define DCMD_PREFIX '!'
#define function%0(%1)     forward %0(%1); public %0(%1)
#define DB_MAIN "sun"
#define SERVER_NAME "SUNDAY-Gameplay"
#define MAX_INI_ENTRY_TEXT 80

new DCC_Channel:whitelist;
new DCC_Channel:login;
new DCC_Channel:logout;
new DCC_Channel:cmd;
new DCC_Channel:usersay;

stock GetName(playerid)
{
	new name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, sizeof(name));
	return name;
}
function LoadPlayer(playerid)
{
	new query[256];
	format(query, sizeof(query), "%s.txt", GetName(playerid));
	if(dini_Exists(query))
	{
	    SendClientMessage(playerid, -1, "[WHITELIST] You're Account has been Whitelisted at Database.");
	}
	else
	{
	    KickTime(playerid);
	    SendClientMessage(playerid, -1, "[WHITELIST] You're Account has not whitelisted at Database.");
	}
	return 1;
}

public OnFilterScriptInit()
{
	print("===========================");
	print("SA:MP Discord Batch Script");
	print("By Naomi Manakuslagi");
	print("Loaded.");
	print("===========================");
	
	login = DCC_FindChannelById("997085403326730270");
	logout = DCC_FindChannelById("997086461763522632");
	cmd = DCC_FindChannelById("997086596912394300");
	usersay = DCC_FindChannelById("997086653271257140");
	whitelist = DCC_FindChannelById("997086702948581436");
	return 1;
}

public OnPlayerConnect(playerid)
{
	LoadPlayer(playerid);
	new query[256];
	format(query, sizeof(query), "[DISCORD]%s Has logged in %s", GetName(playerid), SERVER_NAME);
	DCC_SendChannelMessage(login, query);
	SendClientMessageToAll(-1, query);
	return 1;
}

public OnPlayerText(playerid, text[])
{
	new dChat[267];
	format(dChat, sizeof(dChat), "> [CHAT] %s(%d) : %s", GetName(playerid), playerid, text);
	DCC_SendChannelMessage(usersay, dChat);
	return 1;
}

function KickTime(playerid)
{
	SetTimerEx("KickDong", 1, false, "i", playerid);
	return 1;
}

stock KickDong(playerid)
{
	Kick(playerid);
	return 1;
}

public OnPlayerCommandPerformed(playerid, cmdtext[], success)
{
    new dChat[267];
	format(dChat, sizeof(dChat), "> [CMD] %s(%d) : %s", GetName(playerid), playerid, cmdtext);
	DCC_SendChannelMessage(cmd, dChat);
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	new query[256];
	format(query, sizeof(query), "[DISCORD]%s Has out from %s", GetName(playerid), SERVER_NAME);
	DCC_SendChannelMessage(logout, query);
	SendClientMessageToAll(-1, query);
	return 1;
}

DCMD:whitelist(user, channel, params[])
{
	if(channel == whitelist)
	{
		if(sscanf(params, "s[64]", params[0])) return DCC_SendChannelMessage(channel, "___```!whitelist [Nama_Players]```___");
		new queen[266];
		format(queen, sizeof(queen), "%s.txt", params[0]);
		if(dini_Exists(queen))
		{
		    DCC_SendChannelMessage(channel, "___***The name is already at the database***___");
		}
		else
		{
			new Kj[256];
		    format(Kj, sizeof(Kj), "%s.txt", params[0]);
		    dini_Create(Kj);
			new query[256];
			format(query, sizeof(query), "**```You has been add %s to the database```**", params[0]);
			DCC_SendChannelMessage(channel, query);
			playerData[playerid][pWhitelist] = 1;
		}
	}
	else
	{
		return DCC_SendChannelMessage(channel, "***___Anda tidak berada di whitelidt channel___***");
	}
	return 1;
}

DCMD:help(user, channel, params[])
{
	DCC_SendChannelMessage(channel, "```Help Command : !help, !whitelist```");
	return 1;
}

CMD:test(playerid)
{
	SendClientMessage(playerid, -1, "test");
	return 1;
}
