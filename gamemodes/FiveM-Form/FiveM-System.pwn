#include	<YSI_Coding\y_hooks>




forward RepairCar(playerid);
public RepairCar(playerid)
{
	ClearAnimations(playerid);
    TogglePlayerControllable(playerid, true );
	playerData[playerid][pFixcar] = 0;
    new vehicleid = Vehicle_Nearest(playerid);

	RepairVehicle(vehicleid);
	SendClientMessage(playerid, COLOR_WHITE, "[REPAIR]:รถถูกซ่อมแล้ว");
	Inventory_Remove(playerid, "กล่องซ่อม", 1);
	return 1;
}

forward RepairCar2(playerid);
public RepairCar2(playerid)
{
    ClearAnimations(playerid);
    TogglePlayerControllable(playerid, true );
	playerData[playerid][pFixcar] = 0;
    new vehicleid = GetNearbyVehicle(playerid);

	RepairVehicle(vehicleid);
	SendClientMessage(playerid, COLOR_GREEN, "[REPAIR]:รถถูกซ่อมแล้ว");
	Inventory_Remove(playerid, "กล่องซ่อมใหญ่", 1);
	return 1;
}

forward RefuelCar(playerid);
public RefuelCar(playerid)
{
    ClearAnimations(playerid);
    TogglePlayerControllable(playerid, true );
	playerData[playerid][pFixcar] = 0;
	
    new vehicleid = GetNearbyVehicle(playerid);
    
    if (vehicleFuel[vehicleid] >= 100.0)
		return SendClientMessageEx(playerid, COLOR_RED, "[ระบบ] {FFFFFF}ไม่สามารถเติมน้ำมันมากกว่านี้ได้ (%.2f/%.2f)", vehicleFuel[vehicleid], 100.0);

	vehicleFuel[vehicleid] += 100;
	SendClientMessage(playerid, COLOR_GREEN, "[REPAIR]:น้ำมันเต็มแล้ว");
	Inventory_Remove(playerid, "ถังน้ำมัน", 1);
	return 1;
}

forward EatPizza(playerid);
public EatPizza(playerid)
{
	ClearAnimations(playerid);
    TogglePlayerControllable(playerid, true );
	playerData[playerid][pRunBar] = 0;

	playerData[playerid][pHungry] += 20.0;
	Inventory_Remove(playerid, "พิซซ่า", 1);
	SendClientMessage(playerid, COLOR_GREEN, "[EAT]: ทานพิซซ่า (อิ่ม +20)");
	return 1;
}

forward EatSteak(playerid);
public EatSteak(playerid)
{
	ClearAnimations(playerid);
    TogglePlayerControllable(playerid, true );
	playerData[playerid][pRunBar] = 0;

	playerData[playerid][pHungry] += 35.0;
	Inventory_Remove(playerid, "สเต็ก", 1);
	SendClientMessage(playerid, COLOR_GREEN, "[EAT]: ทานสเต็ก (อิ่ม +35)");
	return 1;
}

forward EatBakedChicken(playerid);
public EatBakedChicken(playerid)
{
	ClearAnimations(playerid);
    TogglePlayerControllable(playerid, true );
	playerData[playerid][pRunBar] = 0;

	playerData[playerid][pHungry] += 35.0;
	Inventory_Remove(playerid, "ไก่อบ", 1);
	SendClientMessage(playerid, COLOR_GREEN, "[EAT]: ทานไก่อบ (อิ่ม +35)");
	return 1;
}

forward EatFriedBasil(playerid);
public EatFriedBasil(playerid)
{
	ClearAnimations(playerid);
    TogglePlayerControllable(playerid, true );
	playerData[playerid][pRunBar] = 0;

	playerData[playerid][pHungry] += 35.0;
	Inventory_Remove(playerid, "ผัดกระเพรา", 1);
	SendClientMessage(playerid, COLOR_GREEN, "[EAT]: ทานผัดกระเพรา (อิ่ม +35)");
	return 1;
}

forward EatPinto(playerid);
public EatPinto(playerid)
{
	ClearAnimations(playerid);
    TogglePlayerControllable(playerid, true );
	playerData[playerid][pRunBar] = 0;

	playerData[playerid][pHungry] += 60.0;
	playerData[playerid][pThirsty] += 30.0;
	Inventory_Remove(playerid, "ปิ่นโต", 1);
	SendClientMessage(playerid, COLOR_GREEN, "[EAT]: ทานปิ่นโต (อิ่ม +60)");
	SendClientMessage(playerid, COLOR_GREEN, "[DRINK]: ดื่มน้ำเปล่า (น้ำ +30)");
	return 1;
}

forward EatApple(playerid);
public EatApple(playerid)
{
	ClearAnimations(playerid);
    TogglePlayerControllable(playerid, true );
	playerData[playerid][pRunBar] = 0;

	playerData[playerid][pHungry] += 10.0;
	playerData[playerid][pThirsty] += 5.0;
	Inventory_Remove(playerid, "แอปเปิ้ล", 1);
	SendClientMessage(playerid, COLOR_GREEN, "[EAT]: ทานแอปเปิ้ล (อิ่ม +10)");
	SendClientMessage(playerid, COLOR_GREEN, "[DRINK]: ดื่มน้ำ (น้ำ +5)");
	return 1;
}

forward EatLychee(playerid);
public EatLychee(playerid)
{
	ClearAnimations(playerid);
    TogglePlayerControllable(playerid, true );
	playerData[playerid][pRunBar] = 0;

	playerData[playerid][pHungry] += 10.0;
	playerData[playerid][pThirsty] += 5.0;
	Inventory_Remove(playerid, "ลิ้นจี่", 1);
	SendClientMessage(playerid, COLOR_GREEN, "[EAT]: ทานลิ้นจี่ (อิ่ม +10)");
	SendClientMessage(playerid, COLOR_GREEN, "[DRINK]: ดื่มน้ำ (น้ำ +5)");
	return 1;
}

forward EatCoconut(playerid);
public EatCoconut(playerid)
{
	ClearAnimations(playerid);
    TogglePlayerControllable(playerid, true );
	playerData[playerid][pRunBar] = 0;

	playerData[playerid][pHungry] += 20.0;
	playerData[playerid][pThirsty] += 20.0;
	Inventory_Remove(playerid, "มะพร้าว", 1);
	SendClientMessage(playerid, COLOR_GREEN, "[EAT]: ทานเนื้อมะพร้าว (อิ่ม +20)");
	SendClientMessage(playerid, COLOR_GREEN, "[DRINK]: ดื่มน้ำมะพร้าว (น้ำ +20)");
	return 1;
}

forward EatTomato(playerid);
public EatTomato(playerid)
{
	ClearAnimations(playerid);
    TogglePlayerControllable(playerid, true );
	playerData[playerid][pRunBar] = 0;

	playerData[playerid][pHungry] += 7.0;
	playerData[playerid][pThirsty] += 7.0;
	Inventory_Remove(playerid, "มะเขือเทศ", 1);
	SendClientMessage(playerid, COLOR_GREEN, "[EAT]: ทานมะเขือเทศ (อิ่ม +7)");
	SendClientMessage(playerid, COLOR_GREEN, "[DRINK]: ดื่มน้ำมะเขือเทศ (น้ำ +7)");
	return 1;
}

forward EatMango(playerid);
public EatMango(playerid)
{
	ClearAnimations(playerid);
    TogglePlayerControllable(playerid, true );
	playerData[playerid][pRunBar] = 0;

	playerData[playerid][pHungry] += 10.0;
	Inventory_Remove(playerid, "มะม่วง", 1);
	SendClientMessage(playerid, COLOR_GREEN, "[EAT]: ทานมะม่วง (อิ่ม +10)");
	SendClientMessage(playerid, COLOR_GREEN, "[EAT]: ว้าวๆๆๆ เปรี้ยวจี๊ดดด!");
	return 1;
}

forward EatGrilledTilapia(playerid);
public EatGrilledTilapia(playerid)
{
	ClearAnimations(playerid);
    TogglePlayerControllable(playerid, true );
	playerData[playerid][pRunBar] = 0;

	playerData[playerid][pHungry] += 30.0;
	Inventory_Remove(playerid, "ปลานิลเผา", 1);
	SendClientMessage(playerid, COLOR_GREEN, "[EAT]: ทานปลานิลเผา (อิ่ม +30)");
	return 1;
}

forward EatFriedDolly(playerid);
public EatFriedDolly(playerid)
{
	ClearAnimations(playerid);
    TogglePlayerControllable(playerid, true );
	playerData[playerid][pRunBar] = 0;

	playerData[playerid][pHungry] += 20.0;
	Inventory_Remove(playerid, "ดอลลี่ทอด", 1);
	SendClientMessage(playerid, COLOR_GREEN, "[EAT]: ทานดอลลี่ทอด (อิ่ม +20)");
	return 1;
}

forward EatFriedMackerel(playerid);
public EatFriedMackerel(playerid)
{
	ClearAnimations(playerid);
    TogglePlayerControllable(playerid, true );
	playerData[playerid][pRunBar] = 0;

	playerData[playerid][pHungry] += 20.0;
	Inventory_Remove(playerid, "ปลาทูทอด", 1);
	SendClientMessage(playerid, COLOR_GREEN, "[EAT]: ทานปลาทูทอด (อิ่ม +20)");
	return 1;
}

forward DrinkWater(playerid);
public DrinkWater(playerid)
{
	ClearAnimations(playerid);
    TogglePlayerControllable(playerid, true );
	playerData[playerid][pRunBar] = 0;

	playerData[playerid][pThirsty] += 15.0;
    Inventory_Remove(playerid, "น้ำเปล่า", 1);
	SendClientMessage(playerid, COLOR_GREEN, "[DRINK]: ดื่มน้ำเปล่า (น้ำ +15)");
	return 1;
}

forward DrinkFreshMilk(playerid);
public DrinkFreshMilk(playerid)
{
	ClearAnimations(playerid);
    TogglePlayerControllable(playerid, true );
	playerData[playerid][pRunBar] = 0;

	playerData[playerid][pThirsty] += 17.0;
    Inventory_Remove(playerid, "นมสด", 1);
	SendClientMessage(playerid, COLOR_GREEN, "[DRINK]: ดื่มนมสด (น้ำ +17)");
	return 1;
}

forward DrinkGreenTea(playerid);
public DrinkGreenTea(playerid)
{
	ClearAnimations(playerid);
    TogglePlayerControllable(playerid, true );
	playerData[playerid][pRunBar] = 0;

	playerData[playerid][pThirsty] += 20.0;
    Inventory_Remove(playerid, "ชาเขียว", 1);
	SendClientMessage(playerid, COLOR_GREEN, "[DRINK]: ดื่มชาเขียว (น้ำ +20)");
	return 1;
}

forward DrinkIcedTea(playerid);
public DrinkIcedTea(playerid)
{
	ClearAnimations(playerid);
    TogglePlayerControllable(playerid, true );
	playerData[playerid][pRunBar] = 0;

	playerData[playerid][pThirsty] += 20.0;
    Inventory_Remove(playerid, "ชาเย็น", 1);
	SendClientMessage(playerid, COLOR_GREEN, "[DRINK]: ดื่มชาเย็น (น้ำ +20)");
	return 1;
}

forward DrinkHoney(playerid);
public DrinkHoney(playerid)
{
	ClearAnimations(playerid);
    TogglePlayerControllable(playerid, true );
	playerData[playerid][pRunBar] = 0;

	playerData[playerid][pThirsty] += 10.0;
    Inventory_Remove(playerid, "น้ำผึ้ง", 1);
	SendClientMessage(playerid, COLOR_GREEN, "[DRINK]: ดื่มน้ำผึ้ง (น้ำ +10)");
	return 1;
}

forward DrinkColdCaneJuice(playerid);
public DrinkColdCaneJuice(playerid)
{
	ClearAnimations(playerid);
    TogglePlayerControllable(playerid, true );
	playerData[playerid][pRunBar] = 0;

	playerData[playerid][pThirsty] += 20.0;
    Inventory_Remove(playerid, "น้ำอ้อยเย็น", 1);
	SendClientMessage(playerid, COLOR_GREEN, "[DRINK]: ดื่มน้ำอ้อยเย็น (น้ำ +20)");
	return 1;
}

forward DrinkSoda(playerid);
public DrinkSoda(playerid)
{
	ClearAnimations(playerid);
    TogglePlayerControllable(playerid, true );
	playerData[playerid][pRunBar] = 0;

	playerData[playerid][pThirsty] += 20.0;
    Inventory_Remove(playerid, "โซดา", 1);
	SendClientMessage(playerid, COLOR_GREEN, "[DRINK]: ดื่มโซดา (น้ำ +20)");
	return 1;
}

forward DrinkAlcohol(playerid);
public DrinkAlcohol(playerid)
{
	ClearAnimations(playerid);
    TogglePlayerControllable(playerid, true );
	playerData[playerid][pRunBar] = 0;

	playerData[playerid][pThirsty] += 15.0;
    Inventory_Remove(playerid, "เหล้า", 1);
	SendClientMessage(playerid, COLOR_GREEN, "[DRINK]: ดื่มเหล้า (น้ำ +15)");
	SendClientMessage(playerid, COLOR_YELLOW, "[WARNING]: เมาาาาแล้ววว 5555555");

	if(playerData[playerid][pGender] == 2)
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DRINK_WINE);
		//ApplyAnimation(playerid, "BAR","dnk_stndF_loop", 4.1, 1, 0, 0, 0, 0, 1);

	if(playerData[playerid][pGender] == 1)
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DRINK_BEER);
		//ApplyAnimation(playerid, "BAR","dnk_stndM_loop", 4.1, 1, 0, 0, 0, 0, 1);

	SetTimer("ClearAnimetionAll", 30000, false);

	return 1;
}

forward DrinkBeer(playerid);
public DrinkBeer(playerid)
{
	ClearAnimations(playerid);
    TogglePlayerControllable(playerid, true );
	playerData[playerid][pRunBar] = 0;

	playerData[playerid][pThirsty] += 50.0;
    Inventory_Remove(playerid, "เบียร์", 1);
	SendClientMessage(playerid, COLOR_GREEN, "[DRINK]: ดื่มเบียร์ (น้ำ +50)");
	SendClientMessage(playerid, COLOR_YELLOW, "[WARNING]: เมาๆ สะลึมละลือ... ฮ่า ฮ่า \tฮ่า ฮ๊าาา..");

	if(playerData[playerid][pGender] == 2)
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DRINK_WINE);
		//ApplyAnimation(playerid, "BAR","dnk_stndF_loop", 4.1, 1, 0, 0, 0, 0, 1);

	if(playerData[playerid][pGender] == 1)
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DRINK_BEER);
		//ApplyAnimation(playerid, "BAR","dnk_stndM_loop", 4.1, 1, 0, 0, 0, 0, 1);

	SetTimer("ClearAnimetionAll", 30000, false);

	return 1;
}

forward DrinkGrapeWine(playerid);
public DrinkGrapeWine(playerid)
{
	ClearAnimations(playerid);
    TogglePlayerControllable(playerid, true );
	playerData[playerid][pRunBar] = 0;

	playerData[playerid][pThirsty] += 15.0;
    Inventory_Remove(playerid, "ไวน์องุ่น", 1);
	SendClientMessage(playerid, COLOR_GREEN, "[DRINK]: ดื่มไวน์องุ่น (น้ำ +15)");
	SendClientMessage(playerid, COLOR_YELLOW, "[WARNING]: เมาแล้วหละะะ \tฮ่า ฮ่า ฮ่า ฮ๊าาา..");

	if(playerData[playerid][pGender] == 2)
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DRINK_WINE);
		//ApplyAnimation(playerid, "BAR","dnk_stndF_loop", 4.1, 1, 0, 0, 0, 0, 1);

	if(playerData[playerid][pGender] == 1)
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DRINK_BEER);
		//ApplyAnimation(playerid, "BAR","dnk_stndM_loop", 4.1, 1, 0, 0, 0, 0, 1);

	SetTimer("ClearAnimetionAll", 30000, false);

	return 1;
}

forward ClearAnimetionAll(playerid);
public ClearAnimetionAll(playerid)
{
	ClearAnimations(playerid);
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
    TogglePlayerControllable(playerid, true );
	return 1;
}

public OnProgressFinish(playerid, objectid)
{

	/*if(isBinStart[playerid] == 1)
		BinSuccess(playerid);*/

	return Y_HOOKS_CONTINUE_RETURN_0;
}

public OnProgressUpdate(playerid, progress, objectid)
{
	/*if(isWarStart[playerid] == 1)
	{
		ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, 1, 0, 0, 1, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}*/

	return Y_HOOKS_CONTINUE_RETURN_0;
}

FixCarNow(playerid)
{

	return 1;
}

Fixcar[MAX_PLAYERS];
Fixcar2[MAX_PLAYERS];
Fuelcar[MAX_PLAYERS];
EatPizza[MAX_PLAYERS];
EatSteak[MAX_PLAYERS];
EatPinto[MAX_PLAYERS];
EatApple[MAX_PLAYERS];
EatLynchee[MAX_PLAYERS];
EatCoconut[MAX_PLAYERS];
EatTomato[MAX_PLAYERS];
EatMango[MAX_PLAYERS];
EatPlanil[MAX_PLAYERS];
EatDolly[MAX_PLAYERS];
EatToona[NAX_PLAYERS];
DrinkWater[NAX_PLAYERS];
DrinkNomSod[NAX_PLAYERS];
DrinkChakiaw[NAX_PLAYERS];
DrinkHoney[NAX_PLAYERS];
DrinkNuAoi[NAX_PLAYERS];
DrinkSoda[NAX_PLAYERS];
DrinkLGH[NAX_PLAYERS];
DrinkBeer[NAX_PLAYERS];
DrinkWine[NAX_PLAYERS];

Fixcar[playerid] = 0;
Fixcar2[playerid] = 0;
Fuelcar[playerid] = 0;
EatPizza[playerid] = 0;
EatSteak[playerid] = 0;
EatPinto[playerid] = 0;
EatApple[playerid] = 0;
EatLynchee[playerid] = 0;
EatCoconut[playerid] = 0;
EatTomato[playerid] = 0;
EatMango[playerid] = 0;
EatPlanil[playerid] = 0;
EatDolly[playerid] = 0;
EatToona[playerid] = 0;
DrinkWater[playerid] = 0;
DrinkNomSod[playerid] = 0;
DrinkChakiaw[playerid] = 0;
DrinkHoney[playerid] = 0;
DrinkNuAoi[playerid] = 0;
DrinkSoda[playerid] = 0;
DrinkLGH[playerid] = 0;
DrinkBeer[playerid] = 0;
DrinkWine[playerid] = 0;

/*
BathComplete(playerid)
{
	RemovePlayerAttachedObject(playerid, 1);
	isBathStart[playerid] = 0;
	ClearAnimations(playerid);

	TogglePlayerControllable(playerid, true);

	playerData[playerid][pBath] = 100;

	Dialog_Show(playerid, DIALOG_NAM ,DIALOG_STYLE_MSGBOX,"การอาบนํ้า", "คุณได้อาบนํ้าทำความสะอาดร่างกายแล้ว", "ปิด", "");

	return 1;
}*/





