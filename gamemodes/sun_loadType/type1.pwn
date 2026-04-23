#include	<YSI_Coding\y_hooks>

new loadType1_Limit[MAX_PLAYERS],
	loadType1_Count[MAX_PLAYERS],
	Timer:loadType1_Timer[MAX_PLAYERS],
	loadType1_State[MAX_PLAYERS],
	loadType1_Object[MAX_PLAYERS];
//////////////////// Progress  ////////////////////////
    
forward OnloadType1_Update(playerid, progress, objectid);
forward OnloadType1_Finish(playerid, objectid);


Start_loadType1(playerid, duration, startvalue = 0, objectid)
{
	if(loadType1_State[playerid] == 1)
		return 0;

	stop loadType1_Timer[playerid];
	loadType1_Timer[playerid] = repeat loadType1_Update(playerid, objectid);

	loadType1_Limit[playerid] = duration;
	loadType1_Count[playerid] = startvalue;
	loadType1_State[playerid] = 1;
	loadType1_Object[playerid] = objectid;

	new string[32];

	format(string, sizeof string, "GTA UNITY TOWN");
	PlayerTextDrawSetString(playerid, loadText_Type1[playerid], string);
	SetPlayerProgressBarMaxValue(playerid, loadBar_Type1[playerid], loadType1_Limit[playerid]);
	SetPlayerProgressBarValue(playerid, loadBar_Type1[playerid], loadType1_Count[playerid]);
	
	PlayerTextDrawShow(playerid, sun_TDType1[playerid][0]);	
	PlayerTextDrawShow(playerid, sun_TDType1[playerid][1]);
	PlayerTextDrawShow(playerid, loadText_Type1[playerid]);
	ShowPlayerProgressBar(playerid, loadBar_Type1[playerid]);
		
	return 1;
}

Stop_loadType1(playerid)
{
	if(loadType1_State[playerid] == 0)
		return 0;

	stop loadType1_Timer[playerid];
	loadType1_Limit[playerid] = 0;
	loadType1_Count[playerid] = 0;
	loadType1_State[playerid] = 0;
	loadType1_Object[playerid] = INVALID_STREAMER_ID;

	PlayerTextDrawHide(playerid, sun_TDType1[playerid][0]);	
	PlayerTextDrawHide(playerid, sun_TDType1[playerid][1]);
	PlayerTextDrawHide(playerid, loadText_Type1[playerid]);
	HidePlayerProgressBar(playerid, loadBar_Type1[playerid]);

	//PlayerTextDrawHide(playerid, sun_loadText[playerid]);
    //HidePlayerProgressBar(playerid, sun_loadType1[playerid]);
	ClearAnimations(playerid);

	return 1;
}

timer loadType1_Update[100](playerid, objectid)
{
	if(loadType1_Count[playerid] >= loadType1_Limit[playerid])
	{
		Stop_loadType1(playerid);
		CallLocalFunction("OnloadType1_Finish", "dd", playerid, objectid);
		return;
	}

	SetPlayerProgressBarMaxValue(playerid, loadBar_Type1[playerid], loadType1_Limit[playerid]);
	SetPlayerProgressBarValue(playerid, loadBar_Type1[playerid], loadType1_Count[playerid]);
	ShowPlayerProgressBar(playerid, loadBar_Type1[playerid]);

	//PlayerTextDrawShow(playerid, sun_TDType1[playerid][0]);	
	//PlayerTextDrawShow(playerid, sun_TDType1[playerid][1]);

	CallLocalFunction("OnloadType1_Update", "ddd", playerid, loadType1_Count[playerid], objectid);

	static
		string[50];

	loadType1_Count[playerid]++;

	new Float:current_loadType1;
	if (loadType1_Limit[playerid] == 0)
	{ } else { current_loadType1 = (loadType1_Count[playerid]*100/loadType1_Limit[playerid]); }

	if (current_loadType1 > 1 && current_loadType1 < 8)
	{
		format(string, sizeof string, "~b~G~l~TA UNITY TOWN"); //GTA UNITY TOWN
		PlayerTextDrawSetString(playerid, loadText_Type1[playerid], string);
	}
	else if (current_loadType1 > 8 && current_loadType1 < 16)
	{
		format(string, sizeof string, "~b~GT~l~A UNITY TOWN"); //GTA UNITY TOWN
		PlayerTextDrawSetString(playerid, loadText_Type1[playerid], string);
	}
	else if (current_loadType1 > 16 && current_loadType1 < 24)
	{
		format(string, sizeof string, "~b~~h~GTA~l~ UNITY TOWN"); //GTA UNITY TOWN
		PlayerTextDrawSetString(playerid, loadText_Type1[playerid], string);
	}
	else if (current_loadType1 > 24 && current_loadType1 < 32)
	{
		format(string, sizeof string, "~b~~h~GTA U~l~NITY TOWN"); //GTA UNITY TOWN
		PlayerTextDrawSetString(playerid, loadText_Type1[playerid], string);
	}
	else if (current_loadType1 > 32 && current_loadType1 < 40)
	{
		format(string, sizeof string, "~b~~h~~h~GTA UN~l~ITY TOWN"); //GTA UNITY TOWN
		PlayerTextDrawSetString(playerid, loadText_Type1[playerid], string);
	}
	else if (current_loadType1 > 40 && current_loadType1 < 48)
	{
		format(string, sizeof string, "~b~~h~~h~GTA UNI~l~TY TOWN"); //GTA UNITY TOWN
		PlayerTextDrawSetString(playerid, loadText_Type1[playerid], string);
	}
	else if (current_loadType1 > 48 && current_loadType1 < 56)
	{
		format(string, sizeof string, "~b~~h~~h~~h~GTA UNIT~l~Y TOWN"); //GTA UNITY TOWN
		PlayerTextDrawSetString(playerid, loadText_Type1[playerid], string);
	}
	else if (current_loadType1 > 56 && current_loadType1 < 64)
	{
		format(string, sizeof string, "~b~~h~~h~~h~GTA UNITY~l~ TOWN"); //GTA UNITY TOWN
		PlayerTextDrawSetString(playerid, loadText_Type1[playerid], string);
	}
	else if (current_loadType1 > 64 && current_loadType1 < 72)
	{
		format(string, sizeof string, "~g~GTA UNITY T~l~OWN"); //GTA UNITY TOWN
		PlayerTextDrawSetString(playerid, loadText_Type1[playerid], string);
	}
	else if (current_loadType1 > 80 && current_loadType1 < 85)
	{
		format(string, sizeof string, "~g~~h~GTA UNITY TO~l~WN"); //GTA UNITY TOWN
		PlayerTextDrawSetString(playerid, loadText_Type1[playerid], string);
	}
    else if (current_loadType1 > 85 && current_loadType1 < 90)
	{
		format(string, sizeof string, "~g~~h~~h~GTA UNITY TOW~l~N"); //GTA UNITY TOWN
		PlayerTextDrawSetString(playerid, loadText_Type1[playerid], string);
	}
    else if (current_loadType1 > 90 && current_loadType1 < 100)
	{
		format(string, sizeof string, "~g~~h~~h~~h~GTA UNITY TOWN"); //GTA UNITY TOWN
		PlayerTextDrawSetString(playerid, loadText_Type1[playerid], string);
	}
	PlayerTextDrawShow(playerid, loadText_Type1[playerid]);
	return;
}

public OnloadType1_Finish(playerid, objectid)
{
    if(Fixcar[playerid] == 1)
		repairveh(playerid);

	if(Fixcar2[playerid] == 1)
		repairveh2(playerid);

	if(Fuelcar[playerid] == 1)
		refuelcar(playerid);

	if(PumpFuelcar[playerid] == 1)
		Pumprefuelcar(playerid);

	if(EatPizza[playerid] == 1)
		Foodpizza(playerid);

	if(EatSteak[playerid] == 1)
		FoodSteak(playerid);

	if(EatChick[playerid] == 1)
		FoodChick(playerid);

	if(EatKapao[playerid] == 1)
		FoodKapao(playerid);

	if(EatPinto[playerid] == 1)
		FoodPinto(playerid);

	if(EatApple[playerid] == 1)
		FoodApple(playerid);

	if(EatLynchee[playerid] == 1)
		FoodLynchee(playerid);

	if(EatCoconut[playerid] == 1)
		FoodCoconut(playerid);

	if(EatTomato[playerid] == 1)
		FoodTomato(playerid);

	if(EatMango[playerid] == 1)
		FoodMango(playerid);

	if(EatPlanil[playerid] == 1)
		FoodPlanil(playerid);

	if(EatDolly[playerid] == 1)
		FoodDolly(playerid);

	if(EatToona[playerid] == 1)
		FoodToona(playerid);

	if(DrinkWater[playerid] == 1)
		D_Water(playerid);

	if(DrinkNomSod[playerid] == 1)
		D_NomSod(playerid);

	if(DrinkChakiaw[playerid] == 1)
		D_Chakiaw(playerid);

	if(DrinkChaYen[playerid] == 1)
		D_ChaYen(playerid);

	if(DrinkHoney[playerid] == 1)
		D_Honey(playerid);

	if(DrinkNuAoi[playerid] == 1)
		D_NuAoi(playerid);

	if(DrinkSoda[playerid] == 1)
		D_Soda(playerid);
		
	if(DrinkLGH[playerid] == 1)
		D_LGHs(playerid);

	if(DrinkBeer[playerid] == 1)
		D_Beer(playerid);

	if(DrinkWine[playerid] == 1)
		D_Wine(playerid);
	
	return Y_HOOKS_CONTINUE_RETURN_0;
}

public OnloadType1_Update(playerid, progress, objectid)
{
    if(Fixcar[playerid] == 1)
	{
		ApplyAnimation(playerid, "INT_HOUSE","wash_up", 4.1, 1, 0, 0, 1, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}
	if(Fixcar2[playerid] == 1)
	{
		ApplyAnimation(playerid, "INT_HOUSE","wash_up", 4.1, 1, 0, 0, 1, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}
	if(Fuelcar[playerid] == 1)
	{
		ApplyAnimation(playerid, "INT_HOUSE","wash_up", 4.1, 1, 0, 0, 1, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}
	if(PumpFuelcar[playerid] == 1)
	{
		ApplyAnimation(playerid, "INT_HOUSE","wash_up", 4.1, 0, 0, 0, 1, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}
	if(EatPizza[playerid] == 1)
	{
		ApplyAnimation(playerid, "FOOD","EAT_Pizza", 4.1, 1, 0, 0, 0, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}
	if(EatSteak[playerid] == 1)
	{
		ApplyAnimation(playerid, "FOOD","EAT_Burger", 4.1, 1, 0, 0, 0, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}
	if(EatChick[playerid] == 1)
	{
		ApplyAnimation(playerid, "FOOD","EAT_Chicken", 4.1, 1, 0, 0, 0, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}
	if(EatKapao[playerid] == 1)
	{
		ApplyAnimation(playerid, "FOOD","EAT_Burger", 4.1, 1, 0, 0, 0, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}
	if(EatPinto[playerid] == 1)
	{
		ApplyAnimation(playerid, "FOOD","EAT_Burger", 4.1, 1, 0, 0, 0, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}
	if(EatApple[playerid] == 1)
	{
		ApplyAnimation(playerid, "FOOD","EAT_Burger", 4.1, 1, 0, 0, 0, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}
	if(EatLynchee[playerid] == 1)
	{
		ApplyAnimation(playerid, "FOOD","EAT_Burger", 4.1, 1, 0, 0, 0, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}
	if(EatCoconut[playerid] == 1)
	{
		ApplyAnimation(playerid, "FOOD","EAT_Burger", 4.1, 1, 0, 0, 0, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}
	if(EatTomato[playerid] == 1)
	{
		ApplyAnimation(playerid, "FOOD","EAT_Burger", 4.1, 1, 0, 0, 0, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}
	if(EatMango[playerid] == 1)
	{
		ApplyAnimation(playerid, "FOOD","EAT_Burger", 4.1, 1, 0, 0, 0, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}
	if(EatPlanil[playerid] == 1)
	{
		ApplyAnimation(playerid, "FOOD","EAT_Burger", 4.1, 1, 0, 0, 0, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}
	if(EatDolly[playerid] == 1)
	{
		ApplyAnimation(playerid, "FOOD","EAT_Burger", 4.1, 1, 0, 0, 0, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}
	if(EatToona[playerid] == 1)
	{
		ApplyAnimation(playerid, "FOOD","EAT_Burger", 4.1, 1, 0, 0, 0, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}
	if(DrinkWater[playerid] == 1)
	{
		if(playerData[playerid][pGender] == 2)
			ApplyAnimation(playerid, "BAR","dnk_stndF_loop", 4.1, 1, 0, 0, 0, 0, 1);
			
		if(playerData[playerid][pGender] == 1)
			ApplyAnimation(playerid, "BAR","dnk_stndM_loop", 4.1, 1, 0, 0, 0, 0, 1);

		return Y_HOOKS_BREAK_RETURN_1;
	}
	if(DrinkNomSod[playerid] == 1)
	{
		if(playerData[playerid][pGender] == 2)
			ApplyAnimation(playerid, "BAR","dnk_stndF_loop", 4.1, 1, 0, 0, 0, 0, 1);
			
		if(playerData[playerid][pGender] == 1)
			ApplyAnimation(playerid, "BAR","dnk_stndM_loop", 4.1, 1, 0, 0, 0, 0, 1);

		return Y_HOOKS_BREAK_RETURN_1;
	}
	if(DrinkChakiaw[playerid] == 1)
	{
		if(playerData[playerid][pGender] == 2)
			ApplyAnimation(playerid, "BAR","dnk_stndF_loop", 4.1, 1, 0, 0, 0, 0, 1);
			
		if(playerData[playerid][pGender] == 1)
			ApplyAnimation(playerid, "BAR","dnk_stndM_loop", 4.1, 1, 0, 0, 0, 0, 1);

		return Y_HOOKS_BREAK_RETURN_1;
	}
	if(DrinkChaYen[playerid] == 1)
	{
		if(playerData[playerid][pGender] == 2)
			ApplyAnimation(playerid, "BAR","dnk_stndF_loop", 4.1, 1, 0, 0, 0, 0, 1);
			
		if(playerData[playerid][pGender] == 1)
			ApplyAnimation(playerid, "BAR","dnk_stndM_loop", 4.1, 1, 0, 0, 0, 0, 1);

		return Y_HOOKS_BREAK_RETURN_1;
	}
	if(DrinkHoney[playerid] == 1)
	{
		if(playerData[playerid][pGender] == 2)
			ApplyAnimation(playerid, "BAR","dnk_stndF_loop", 4.1, 1, 0, 0, 0, 0, 1);
			
		if(playerData[playerid][pGender] == 1)
			ApplyAnimation(playerid, "BAR","dnk_stndM_loop", 4.1, 1, 0, 0, 0, 0, 1);

		return Y_HOOKS_BREAK_RETURN_1;
	}
	if(DrinkNuAoi[playerid] == 1)
	{
		if(playerData[playerid][pGender] == 2)
			ApplyAnimation(playerid, "BAR","dnk_stndF_loop", 4.1, 1, 0, 0, 0, 0, 1);
			
		if(playerData[playerid][pGender] == 1)
			ApplyAnimation(playerid, "BAR","dnk_stndM_loop", 4.1, 1, 0, 0, 0, 0, 1);

		return Y_HOOKS_BREAK_RETURN_1;
	}
	if(DrinkSoda[playerid] == 1)
	{
		if(playerData[playerid][pGender] == 2)
			ApplyAnimation(playerid, "BAR","dnk_stndF_loop", 4.1, 1, 0, 0, 0, 0, 1);
			
		if(playerData[playerid][pGender] == 1)
			ApplyAnimation(playerid, "BAR","dnk_stndM_loop", 4.1, 1, 0, 0, 0, 0, 1);

		return Y_HOOKS_BREAK_RETURN_1;
	}
	if(DrinkLGH[playerid] == 1)
	{
		if(playerData[playerid][pGender] == 2)
			ApplyAnimation(playerid, "BAR","dnk_stndF_loop", 4.1, 1, 0, 0, 0, 0, 1);
			
		if(playerData[playerid][pGender] == 1)
			ApplyAnimation(playerid, "BAR","dnk_stndM_loop", 4.1, 1, 0, 0, 0, 0, 1);

		return Y_HOOKS_BREAK_RETURN_1;
	}
	if(DrinkBeer[playerid] == 1)
	{
		if(playerData[playerid][pGender] == 2)
			ApplyAnimation(playerid, "BAR","dnk_stndF_loop", 4.1, 1, 0, 0, 0, 0, 1);
			
		if(playerData[playerid][pGender] == 1)
			ApplyAnimation(playerid, "BAR","dnk_stndM_loop", 4.1, 1, 0, 0, 0, 0, 1);

		return Y_HOOKS_BREAK_RETURN_1;
	}
	
	if(DrinkWine[playerid] == 1)
	{
		if(playerData[playerid][pGender] == 2)
			ApplyAnimation(playerid, "BAR","dnk_stndF_loop", 4.1, 1, 0, 0, 0, 0, 1);
			
		if(playerData[playerid][pGender] == 1)
			ApplyAnimation(playerid, "BAR","dnk_stndM_loop", 4.1, 1, 0, 0, 0, 0, 1);

		return Y_HOOKS_BREAK_RETURN_1;
	}
		
	return Y_HOOKS_CONTINUE_RETURN_0;
}


/**

Start_loadType1

OnloadType1_Update

OnloadType1_Finish

 */