#include	<YSI_Coding\y_hooks>

Map_a()
{
	

	for(new i = 0; i < MAX_PLAYERS; i++)
    {
        if(!IsPlayerConnected(i)) continue;
        OnPlayerConnect(i);
    }
    return 1;
}
