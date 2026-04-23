#include	<YSI_Coding\y_hooks>

// --> ระบบกาชาปอง TextDraws
new Lucky_TimeLast[MAX_PLAYERS]; //
new Lucky_ActiveLast[MAX_PLAYERS]; //
new Lucky_StatsLast[MAX_PLAYERS];

enum GachapongEnumX
{
	gachaID,
	ModelID,
	Name[32],
}

new GachapongLast[][GachapongEnumX] ={ //
	{0, 1550, "$2,000"}, //0
	{1, 1550, "$1,000"}, //1
	{2, 1550, "$5,000"}, //2
	{3, 1550, "$10,000"}, //3
	{4, 1550, "$10,000"}, //4
	{5, 1550, "$7,000"}, //5
	{6, 19941, "100 Coin"}, //6
	{7, 1550, "$5,000"}, //7
	{8, 1550, "$10,000"}, //8
	{9, 1550, "$50,000"}, //9
	{10, 1550, "$20,000"}, //10
	{11, 1550, "$1,000"}, //11
	{12, 1550, "$1,000"}, //12
	{13, 1550, "$1,000"}, //13
	{14, 1550, "$1,000"}, //14
	{15, 1550, "$1,000"}, //15
	{16, 1550, "$1,000"}, //16
	{17, 1550, "$1,000"}, //17
	{18, 1550, "$1,000"}, //18
	{19, 1550, "$1,000"}, //19
	{20, 1550, "$1,000"}, //20
	
	{21, 1550, "$2,000"}, //21
	{22, 1550, "$2,000"}, //22
	{23, 1550, "$2,000"}, //23
	{24, 1550, "$2,000"}, //24
	{25, 1550, "$2,000"}, //25
	{26, 1550, "$2,000"}, //26
	{27, 1550, "$2,000"}, //27
	{28, 1550, "$2,000"}, //28
	{29, 1550, "$2,000"}, //29
	{30, 1550, "$2,000"}, //30
	
	{31, 1550, "$2,000"}, //31
	{32, 1550, "$2,000"}, //22
	{33, 1550, "$2,000"}, //23
	{34, 1550, "$2,000"}, //24
	{35, 1550, "$2,000"}, //25
	{36, 1550, "$2,000"}, //26
	{37, 1550, "$2,000"}, //27
	{38, 1550, "$2,000"}, //28
	{39, 1550, "$2,000"}, //29
	{40, 1550, "$2,000"}, //40

	{41, 1550, "$1,000"}, //31
	{42, 1550, "$1,000"}, //22
	{43, 1550, "$1,000"}, //23
	{44, 1550, "$1,000"}, //24
	{45, 1550, "$1,000"}, //25
	{46, 1550, "$1,000"}, //26
	{47, 1550, "$1,000"}, //27
	{48, 1550, "$1,000"}, //28
	{49, 1550, "$1,000"}, //29
	{50, 1550, "$1,000"}, //40

	{51, 1550, "$1,000"}, //31
	{52, 1550, "$1,000"}, //22
	{53, 1550, "$1,000"}, //23
	{54, 1550, "$1,000"}, //24
	{55, 1550, "$1,000"}, //25
	{56, 1550, "$1,000"}, //26
	{57, 1550, "$1,000"}, //27
	{58, 1550, "$1,000"}, //28
	{59, 1550, "$1,000"}, //29
	{60, 1550, "$1,000"} //40

};

// ----------------------->

new PlayerText:GachaTextDraws[MAX_PLAYERS][24];

hook OnGameModeInit()
{
	SetTimer("LuckyTimerLast", 600, 1);
	return 1;
}

hook OnPlayerConnect(playerid)
{
	Lucky_TimeLast[playerid] = 0;
	Lucky_StatsLast[playerid] = -1;
	Lucky_ActiveLast[playerid] = 0;

	// --> ระบบกาชาปอง
	GachaTextDraws[playerid][0] = CreatePlayerTextDraw(playerid, 327.000000, 172.000000, "_");
	PlayerTextDrawFont(playerid, GachaTextDraws[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, GachaTextDraws[playerid][0], 0.600000, 12.200005);
	PlayerTextDrawTextSize(playerid, GachaTextDraws[playerid][0], 298.500000, 550.000000);
	PlayerTextDrawSetOutline(playerid, GachaTextDraws[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, GachaTextDraws[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, GachaTextDraws[playerid][0], 2);
	PlayerTextDrawColor(playerid, GachaTextDraws[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, GachaTextDraws[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, GachaTextDraws[playerid][0], -1523963137);
	PlayerTextDrawUseBox(playerid, GachaTextDraws[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, GachaTextDraws[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, GachaTextDraws[playerid][0], 0);

	GachaTextDraws[playerid][1] = CreatePlayerTextDraw(playerid, 171.000000, 175.000000, "_");
	PlayerTextDrawFont(playerid, GachaTextDraws[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid, GachaTextDraws[playerid][1], 0.591666, 5.600002);
	PlayerTextDrawTextSize(playerid, GachaTextDraws[playerid][1], 298.500000, 71.500000);
	PlayerTextDrawSetOutline(playerid, GachaTextDraws[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, GachaTextDraws[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, GachaTextDraws[playerid][1], 2);
	PlayerTextDrawColor(playerid, GachaTextDraws[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, GachaTextDraws[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, GachaTextDraws[playerid][1], -421070201);
	PlayerTextDrawUseBox(playerid, GachaTextDraws[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, GachaTextDraws[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, GachaTextDraws[playerid][1], 0);

	GachaTextDraws[playerid][2] = CreatePlayerTextDraw(playerid, 93.000000, 175.000000, "_");
	PlayerTextDrawFont(playerid, GachaTextDraws[playerid][2], 1);
	PlayerTextDrawLetterSize(playerid, GachaTextDraws[playerid][2], 0.591666, 5.600002);
	PlayerTextDrawTextSize(playerid, GachaTextDraws[playerid][2], 298.500000, 71.500000);
	PlayerTextDrawSetOutline(playerid, GachaTextDraws[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, GachaTextDraws[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, GachaTextDraws[playerid][2], 2);
	PlayerTextDrawColor(playerid, GachaTextDraws[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, GachaTextDraws[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, GachaTextDraws[playerid][2], -421070201);
	PlayerTextDrawUseBox(playerid, GachaTextDraws[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, GachaTextDraws[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, GachaTextDraws[playerid][2], 0);

	GachaTextDraws[playerid][3] = CreatePlayerTextDraw(playerid, 249.000000, 175.000000, "_");
	PlayerTextDrawFont(playerid, GachaTextDraws[playerid][3], 1);
	PlayerTextDrawLetterSize(playerid, GachaTextDraws[playerid][3], 0.591666, 5.600002);
	PlayerTextDrawTextSize(playerid, GachaTextDraws[playerid][3], 298.500000, 71.500000);
	PlayerTextDrawSetOutline(playerid, GachaTextDraws[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, GachaTextDraws[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, GachaTextDraws[playerid][3], 2);
	PlayerTextDrawColor(playerid, GachaTextDraws[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, GachaTextDraws[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, GachaTextDraws[playerid][3], -421070201);
	PlayerTextDrawUseBox(playerid, GachaTextDraws[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, GachaTextDraws[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, GachaTextDraws[playerid][3], 0);

	GachaTextDraws[playerid][4] = CreatePlayerTextDraw(playerid, 327.000000, 175.000000, "_");
	PlayerTextDrawFont(playerid, GachaTextDraws[playerid][4], 1);
	PlayerTextDrawLetterSize(playerid, GachaTextDraws[playerid][4], 0.591666, 5.600002);
	PlayerTextDrawTextSize(playerid, GachaTextDraws[playerid][4], 298.500000, 71.500000);
	PlayerTextDrawSetOutline(playerid, GachaTextDraws[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, GachaTextDraws[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, GachaTextDraws[playerid][4], 2);
	PlayerTextDrawColor(playerid, GachaTextDraws[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, GachaTextDraws[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, GachaTextDraws[playerid][4], -421070201);
	PlayerTextDrawUseBox(playerid, GachaTextDraws[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, GachaTextDraws[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, GachaTextDraws[playerid][4], 0);

	GachaTextDraws[playerid][5] = CreatePlayerTextDraw(playerid, 405.000000, 175.000000, "_");
	PlayerTextDrawFont(playerid, GachaTextDraws[playerid][5], 1);
	PlayerTextDrawLetterSize(playerid, GachaTextDraws[playerid][5], 0.591666, 5.600002);
	PlayerTextDrawTextSize(playerid, GachaTextDraws[playerid][5], 298.500000, 71.500000);
	PlayerTextDrawSetOutline(playerid, GachaTextDraws[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, GachaTextDraws[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, GachaTextDraws[playerid][5], 2);
	PlayerTextDrawColor(playerid, GachaTextDraws[playerid][5], -1);
	PlayerTextDrawBackgroundColor(playerid, GachaTextDraws[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, GachaTextDraws[playerid][5], -421070201);
	PlayerTextDrawUseBox(playerid, GachaTextDraws[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, GachaTextDraws[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, GachaTextDraws[playerid][5], 0);

	GachaTextDraws[playerid][6] = CreatePlayerTextDraw(playerid, 483.000000, 175.000000, "_");
	PlayerTextDrawFont(playerid, GachaTextDraws[playerid][6], 1);
	PlayerTextDrawLetterSize(playerid, GachaTextDraws[playerid][6], 0.591666, 5.600002);
	PlayerTextDrawTextSize(playerid, GachaTextDraws[playerid][6], 298.500000, 71.500000);
	PlayerTextDrawSetOutline(playerid, GachaTextDraws[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, GachaTextDraws[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, GachaTextDraws[playerid][6], 2);
	PlayerTextDrawColor(playerid, GachaTextDraws[playerid][6], -1);
	PlayerTextDrawBackgroundColor(playerid, GachaTextDraws[playerid][6], 255);
	PlayerTextDrawBoxColor(playerid, GachaTextDraws[playerid][6], -421070201);
	PlayerTextDrawUseBox(playerid, GachaTextDraws[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, GachaTextDraws[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, GachaTextDraws[playerid][6], 0);

	GachaTextDraws[playerid][7] = CreatePlayerTextDraw(playerid, 561.000000, 175.000000, "_");
	PlayerTextDrawFont(playerid, GachaTextDraws[playerid][7], 1);
	PlayerTextDrawLetterSize(playerid, GachaTextDraws[playerid][7], 0.591666, 5.600002);
	PlayerTextDrawTextSize(playerid, GachaTextDraws[playerid][7], 298.500000, 71.500000);
	PlayerTextDrawSetOutline(playerid, GachaTextDraws[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, GachaTextDraws[playerid][7], 0);
	PlayerTextDrawAlignment(playerid, GachaTextDraws[playerid][7], 2);
	PlayerTextDrawColor(playerid, GachaTextDraws[playerid][7], -1);
	PlayerTextDrawBackgroundColor(playerid, GachaTextDraws[playerid][7], 255);
	PlayerTextDrawBoxColor(playerid, GachaTextDraws[playerid][7], -421070201);
	PlayerTextDrawUseBox(playerid, GachaTextDraws[playerid][7], 1);
	PlayerTextDrawSetProportional(playerid, GachaTextDraws[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, GachaTextDraws[playerid][7], 0);

	GachaTextDraws[playerid][8] = CreatePlayerTextDraw(playerid, 327.000000, 265.000000, "_");
	PlayerTextDrawFont(playerid, GachaTextDraws[playerid][8], 1);
	PlayerTextDrawLetterSize(playerid, GachaTextDraws[playerid][8], 0.591666, 1.200002);
	PlayerTextDrawTextSize(playerid, GachaTextDraws[playerid][8], 298.500000, 71.500000);
	PlayerTextDrawSetOutline(playerid, GachaTextDraws[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, GachaTextDraws[playerid][8], 0);
	PlayerTextDrawAlignment(playerid, GachaTextDraws[playerid][8], 2);
	PlayerTextDrawColor(playerid, GachaTextDraws[playerid][8], -1);
	PlayerTextDrawBackgroundColor(playerid, GachaTextDraws[playerid][8], 255);
	PlayerTextDrawBoxColor(playerid, GachaTextDraws[playerid][8], 9109759);
	PlayerTextDrawUseBox(playerid, GachaTextDraws[playerid][8], 1);
	PlayerTextDrawSetProportional(playerid, GachaTextDraws[playerid][8], 1);
	PlayerTextDrawSetSelectable(playerid, GachaTextDraws[playerid][8], 0);

	GachaTextDraws[playerid][9] = CreatePlayerTextDraw(playerid, 306.000000, 263.000000, "OPEN");
	PlayerTextDrawFont(playerid, GachaTextDraws[playerid][9], 2);
	PlayerTextDrawLetterSize(playerid, GachaTextDraws[playerid][9], 0.329166, 1.249999);
	PlayerTextDrawTextSize(playerid, GachaTextDraws[playerid][9], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, GachaTextDraws[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, GachaTextDraws[playerid][9], 0);
	PlayerTextDrawAlignment(playerid, GachaTextDraws[playerid][9], 1);
	PlayerTextDrawColor(playerid, GachaTextDraws[playerid][9], -1);
	PlayerTextDrawBackgroundColor(playerid, GachaTextDraws[playerid][9], 255);
	PlayerTextDrawBoxColor(playerid, GachaTextDraws[playerid][9], 50);
	PlayerTextDrawUseBox(playerid, GachaTextDraws[playerid][9], 0);
	PlayerTextDrawSetProportional(playerid, GachaTextDraws[playerid][9], 1);
	PlayerTextDrawSetSelectable(playerid, GachaTextDraws[playerid][9], 1);

	GachaTextDraws[playerid][10] = CreatePlayerTextDraw(playerid, 27.000000, 226.000000, "TextDraw");
	PlayerTextDrawFont(playerid, GachaTextDraws[playerid][10], 5);
	PlayerTextDrawLetterSize(playerid, GachaTextDraws[playerid][10], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, GachaTextDraws[playerid][10], 75.000000, 77.000000);
	PlayerTextDrawSetOutline(playerid, GachaTextDraws[playerid][10], 1);
	PlayerTextDrawSetShadow(playerid, GachaTextDraws[playerid][10], 0);
	PlayerTextDrawAlignment(playerid, GachaTextDraws[playerid][10], 1);
	PlayerTextDrawColor(playerid, GachaTextDraws[playerid][10], -1);
	PlayerTextDrawBackgroundColor(playerid, GachaTextDraws[playerid][10], 0);
	PlayerTextDrawBoxColor(playerid, GachaTextDraws[playerid][10], 0);
	PlayerTextDrawUseBox(playerid, GachaTextDraws[playerid][10], 1);
	PlayerTextDrawSetProportional(playerid, GachaTextDraws[playerid][10], 1);
	PlayerTextDrawSetSelectable(playerid, GachaTextDraws[playerid][10], 0);
	PlayerTextDrawSetPreviewModel(playerid, GachaTextDraws[playerid][10], 11746);
	PlayerTextDrawSetPreviewRot(playerid, GachaTextDraws[playerid][10], -10.000000, 94.000000, -20.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, GachaTextDraws[playerid][10], 1, 1);

	GachaTextDraws[playerid][11] = CreatePlayerTextDraw(playerid, 75.000000, 265.000000, "KEY: 1");
	PlayerTextDrawFont(playerid, GachaTextDraws[playerid][11], 2);
	PlayerTextDrawLetterSize(playerid, GachaTextDraws[playerid][11], 0.258333, 1.400000);
	PlayerTextDrawTextSize(playerid, GachaTextDraws[playerid][11], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, GachaTextDraws[playerid][11], 1);
	PlayerTextDrawSetShadow(playerid, GachaTextDraws[playerid][11], 0);
	PlayerTextDrawAlignment(playerid, GachaTextDraws[playerid][11], 1);
	PlayerTextDrawColor(playerid, GachaTextDraws[playerid][11], -1);
	PlayerTextDrawBackgroundColor(playerid, GachaTextDraws[playerid][11], 255);
	PlayerTextDrawBoxColor(playerid, GachaTextDraws[playerid][11], 50);
	PlayerTextDrawUseBox(playerid, GachaTextDraws[playerid][11], 0);
	PlayerTextDrawSetProportional(playerid, GachaTextDraws[playerid][11], 1);
	PlayerTextDrawSetSelectable(playerid, GachaTextDraws[playerid][11], 0);

	GachaTextDraws[playerid][12] = CreatePlayerTextDraw(playerid, 327.000000, 149.000000, "_");
	PlayerTextDrawFont(playerid, GachaTextDraws[playerid][12], 1);
	PlayerTextDrawLetterSize(playerid, GachaTextDraws[playerid][12], 0.600000, 1.800004);
	PlayerTextDrawTextSize(playerid, GachaTextDraws[playerid][12], 298.500000, 195.000000);
	PlayerTextDrawSetOutline(playerid, GachaTextDraws[playerid][12], 1);
	PlayerTextDrawSetShadow(playerid, GachaTextDraws[playerid][12], 0);
	PlayerTextDrawAlignment(playerid, GachaTextDraws[playerid][12], 2);
	PlayerTextDrawColor(playerid, GachaTextDraws[playerid][12], -1);
	PlayerTextDrawBackgroundColor(playerid, GachaTextDraws[playerid][12], 255);
	PlayerTextDrawBoxColor(playerid, GachaTextDraws[playerid][12], 145);
	PlayerTextDrawUseBox(playerid, GachaTextDraws[playerid][12], 1);
	PlayerTextDrawSetProportional(playerid, GachaTextDraws[playerid][12], 1);
	PlayerTextDrawSetSelectable(playerid, GachaTextDraws[playerid][12], 0);

	GachaTextDraws[playerid][13] = CreatePlayerTextDraw(playerid, 273.000000, 146.000000, "Lucky Box");
	PlayerTextDrawFont(playerid, GachaTextDraws[playerid][13], 2);
	PlayerTextDrawLetterSize(playerid, GachaTextDraws[playerid][13], 0.474999, 2.000000);
	PlayerTextDrawTextSize(playerid, GachaTextDraws[playerid][13], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, GachaTextDraws[playerid][13], 1);
	PlayerTextDrawSetShadow(playerid, GachaTextDraws[playerid][13], 0);
	PlayerTextDrawAlignment(playerid, GachaTextDraws[playerid][13], 1);
	PlayerTextDrawColor(playerid, GachaTextDraws[playerid][13], -1);
	PlayerTextDrawBackgroundColor(playerid, GachaTextDraws[playerid][13], 255);
	PlayerTextDrawBoxColor(playerid, GachaTextDraws[playerid][13], 50);
	PlayerTextDrawUseBox(playerid, GachaTextDraws[playerid][13], 0);
	PlayerTextDrawSetProportional(playerid, GachaTextDraws[playerid][13], 1);
	PlayerTextDrawSetSelectable(playerid, GachaTextDraws[playerid][13], 0);

	GachaTextDraws[playerid][14] = CreatePlayerTextDraw(playerid, 56.000000, 172.000000, "TextDraw");
	PlayerTextDrawFont(playerid, GachaTextDraws[playerid][14], 5);
	PlayerTextDrawLetterSize(playerid, GachaTextDraws[playerid][14], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, GachaTextDraws[playerid][14], 75.000000, 57.000000);
	PlayerTextDrawSetOutline(playerid, GachaTextDraws[playerid][14], 1);
	PlayerTextDrawSetShadow(playerid, GachaTextDraws[playerid][14], 0);
	PlayerTextDrawAlignment(playerid, GachaTextDraws[playerid][14], 1);
	PlayerTextDrawColor(playerid, GachaTextDraws[playerid][14], -1);
	PlayerTextDrawBackgroundColor(playerid, GachaTextDraws[playerid][14], 0);
	PlayerTextDrawBoxColor(playerid, GachaTextDraws[playerid][14], 50);
	PlayerTextDrawUseBox(playerid, GachaTextDraws[playerid][14], 1);
	PlayerTextDrawSetProportional(playerid, GachaTextDraws[playerid][14], 1);
	PlayerTextDrawSetSelectable(playerid, GachaTextDraws[playerid][14], 0);
	PlayerTextDrawSetPreviewModel(playerid, GachaTextDraws[playerid][14], 18631);
	PlayerTextDrawSetPreviewRot(playerid, GachaTextDraws[playerid][14], -10.000000, 0.000000, -20.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, GachaTextDraws[playerid][14], 1, 1);

	GachaTextDraws[playerid][15] = CreatePlayerTextDraw(playerid, 134.000000, 172.000000, "TextDraw");
	PlayerTextDrawFont(playerid, GachaTextDraws[playerid][15], 5);
	PlayerTextDrawLetterSize(playerid, GachaTextDraws[playerid][15], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, GachaTextDraws[playerid][15], 75.000000, 57.000000);
	PlayerTextDrawSetOutline(playerid, GachaTextDraws[playerid][15], 1);
	PlayerTextDrawSetShadow(playerid, GachaTextDraws[playerid][15], 0);
	PlayerTextDrawAlignment(playerid, GachaTextDraws[playerid][15], 1);
	PlayerTextDrawColor(playerid, GachaTextDraws[playerid][15], -1);
	PlayerTextDrawBackgroundColor(playerid, GachaTextDraws[playerid][15], 0);
	PlayerTextDrawBoxColor(playerid, GachaTextDraws[playerid][15], 50);
	PlayerTextDrawUseBox(playerid, GachaTextDraws[playerid][15], 1);
	PlayerTextDrawSetProportional(playerid, GachaTextDraws[playerid][15], 1);
	PlayerTextDrawSetSelectable(playerid, GachaTextDraws[playerid][15], 0);
	PlayerTextDrawSetPreviewModel(playerid, GachaTextDraws[playerid][15], 18631);
	PlayerTextDrawSetPreviewRot(playerid, GachaTextDraws[playerid][15], -10.000000, 0.000000, -20.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, GachaTextDraws[playerid][15], 1, 1);

	GachaTextDraws[playerid][16] = CreatePlayerTextDraw(playerid, 209.000000, 172.000000, "TextDraw");
	PlayerTextDrawFont(playerid, GachaTextDraws[playerid][16], 5);
	PlayerTextDrawLetterSize(playerid, GachaTextDraws[playerid][16], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, GachaTextDraws[playerid][16], 75.000000, 57.000000);
	PlayerTextDrawSetOutline(playerid, GachaTextDraws[playerid][16], 1);
	PlayerTextDrawSetShadow(playerid, GachaTextDraws[playerid][16], 0);
	PlayerTextDrawAlignment(playerid, GachaTextDraws[playerid][16], 1);
	PlayerTextDrawColor(playerid, GachaTextDraws[playerid][16], -1);
	PlayerTextDrawBackgroundColor(playerid, GachaTextDraws[playerid][16], 0);
	PlayerTextDrawBoxColor(playerid, GachaTextDraws[playerid][16], 50);
	PlayerTextDrawUseBox(playerid, GachaTextDraws[playerid][16], 1);
	PlayerTextDrawSetProportional(playerid, GachaTextDraws[playerid][16], 1);
	PlayerTextDrawSetSelectable(playerid, GachaTextDraws[playerid][16], 0);
	PlayerTextDrawSetPreviewModel(playerid, GachaTextDraws[playerid][16], 18631);
	PlayerTextDrawSetPreviewRot(playerid, GachaTextDraws[playerid][16], -10.000000, 0.000000, -20.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, GachaTextDraws[playerid][16], 1, 1);

	GachaTextDraws[playerid][17] = CreatePlayerTextDraw(playerid, 287.000000, 172.000000, "TextDraw");
	PlayerTextDrawFont(playerid, GachaTextDraws[playerid][17], 5);
	PlayerTextDrawLetterSize(playerid, GachaTextDraws[playerid][17], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, GachaTextDraws[playerid][17], 75.000000, 57.000000);
	PlayerTextDrawSetOutline(playerid, GachaTextDraws[playerid][17], 1);
	PlayerTextDrawSetShadow(playerid, GachaTextDraws[playerid][17], 0);
	PlayerTextDrawAlignment(playerid, GachaTextDraws[playerid][17], 1);
	PlayerTextDrawColor(playerid, GachaTextDraws[playerid][17], -1);
	PlayerTextDrawBackgroundColor(playerid, GachaTextDraws[playerid][17], 0);
	PlayerTextDrawBoxColor(playerid, GachaTextDraws[playerid][17], 50);
	PlayerTextDrawUseBox(playerid, GachaTextDraws[playerid][17], 1);
	PlayerTextDrawSetProportional(playerid, GachaTextDraws[playerid][17], 1);
	PlayerTextDrawSetSelectable(playerid, GachaTextDraws[playerid][17], 0);
	PlayerTextDrawSetPreviewModel(playerid, GachaTextDraws[playerid][17], 18631);
	PlayerTextDrawSetPreviewRot(playerid, GachaTextDraws[playerid][17], -10.000000, 0.000000, -20.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, GachaTextDraws[playerid][17], 1, 1);

	GachaTextDraws[playerid][18] = CreatePlayerTextDraw(playerid, 366.000000, 172.000000, "TextDraw");
	PlayerTextDrawFont(playerid, GachaTextDraws[playerid][18], 5);
	PlayerTextDrawLetterSize(playerid, GachaTextDraws[playerid][18], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, GachaTextDraws[playerid][18], 75.000000, 57.000000);
	PlayerTextDrawSetOutline(playerid, GachaTextDraws[playerid][18], 1);
	PlayerTextDrawSetShadow(playerid, GachaTextDraws[playerid][18], 0);
	PlayerTextDrawAlignment(playerid, GachaTextDraws[playerid][18], 1);
	PlayerTextDrawColor(playerid, GachaTextDraws[playerid][18], -1);
	PlayerTextDrawBackgroundColor(playerid, GachaTextDraws[playerid][18], 0);
	PlayerTextDrawBoxColor(playerid, GachaTextDraws[playerid][18], 50);
	PlayerTextDrawUseBox(playerid, GachaTextDraws[playerid][18], 1);
	PlayerTextDrawSetProportional(playerid, GachaTextDraws[playerid][18], 1);
	PlayerTextDrawSetSelectable(playerid, GachaTextDraws[playerid][18], 0);
	PlayerTextDrawSetPreviewModel(playerid, GachaTextDraws[playerid][18], 18631);
	PlayerTextDrawSetPreviewRot(playerid, GachaTextDraws[playerid][18], -10.000000, 0.000000, -20.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, GachaTextDraws[playerid][18], 1, 1);

	GachaTextDraws[playerid][19] = CreatePlayerTextDraw(playerid, 443.000000, 172.000000, "TextDraw");
	PlayerTextDrawFont(playerid, GachaTextDraws[playerid][19], 5);
	PlayerTextDrawLetterSize(playerid, GachaTextDraws[playerid][19], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, GachaTextDraws[playerid][19], 75.000000, 57.000000);
	PlayerTextDrawSetOutline(playerid, GachaTextDraws[playerid][19], 1);
	PlayerTextDrawSetShadow(playerid, GachaTextDraws[playerid][19], 0);
	PlayerTextDrawAlignment(playerid, GachaTextDraws[playerid][19], 1);
	PlayerTextDrawColor(playerid, GachaTextDraws[playerid][19], -1);
	PlayerTextDrawBackgroundColor(playerid, GachaTextDraws[playerid][19], 0);
	PlayerTextDrawBoxColor(playerid, GachaTextDraws[playerid][19], 50);
	PlayerTextDrawUseBox(playerid, GachaTextDraws[playerid][19], 1);
	PlayerTextDrawSetProportional(playerid, GachaTextDraws[playerid][19], 1);
	PlayerTextDrawSetSelectable(playerid, GachaTextDraws[playerid][19], 0);
	PlayerTextDrawSetPreviewModel(playerid, GachaTextDraws[playerid][19], 18631);
	PlayerTextDrawSetPreviewRot(playerid, GachaTextDraws[playerid][19], -10.000000, 0.000000, -20.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, GachaTextDraws[playerid][19], 1, 1);

	GachaTextDraws[playerid][20] = CreatePlayerTextDraw(playerid, 522.000000, 172.000000, "TextDraw");
	PlayerTextDrawFont(playerid, GachaTextDraws[playerid][20], 5);
	PlayerTextDrawLetterSize(playerid, GachaTextDraws[playerid][20], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, GachaTextDraws[playerid][20], 75.000000, 57.000000);
	PlayerTextDrawSetOutline(playerid, GachaTextDraws[playerid][20], 1);
	PlayerTextDrawSetShadow(playerid, GachaTextDraws[playerid][20], 0);
	PlayerTextDrawAlignment(playerid, GachaTextDraws[playerid][20], 1);
	PlayerTextDrawColor(playerid, GachaTextDraws[playerid][20], -1);
	PlayerTextDrawBackgroundColor(playerid, GachaTextDraws[playerid][20], 0);
	PlayerTextDrawBoxColor(playerid, GachaTextDraws[playerid][20], 50);
	PlayerTextDrawUseBox(playerid, GachaTextDraws[playerid][20], 1);
	PlayerTextDrawSetProportional(playerid, GachaTextDraws[playerid][20], 1);
	PlayerTextDrawSetSelectable(playerid, GachaTextDraws[playerid][20], 0);
	PlayerTextDrawSetPreviewModel(playerid, GachaTextDraws[playerid][20], 18631);
	PlayerTextDrawSetPreviewRot(playerid, GachaTextDraws[playerid][20], -10.000000, 0.000000, -20.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, GachaTextDraws[playerid][20], 1, 1);

	GachaTextDraws[playerid][21] = CreatePlayerTextDraw(playerid, 327.000000, 175.000000, "_");
	PlayerTextDrawFont(playerid, GachaTextDraws[playerid][21], 1);
	PlayerTextDrawLetterSize(playerid, GachaTextDraws[playerid][21], 0.591666, 5.600002);
	PlayerTextDrawTextSize(playerid, GachaTextDraws[playerid][21], 298.500000, -5.500000);
	PlayerTextDrawSetOutline(playerid, GachaTextDraws[playerid][21], 1);
	PlayerTextDrawSetShadow(playerid, GachaTextDraws[playerid][21], 0);
	PlayerTextDrawAlignment(playerid, GachaTextDraws[playerid][21], 2);
	PlayerTextDrawColor(playerid, GachaTextDraws[playerid][21], -1);
	PlayerTextDrawBackgroundColor(playerid, GachaTextDraws[playerid][21], 255);
	PlayerTextDrawBoxColor(playerid, GachaTextDraws[playerid][21], -421070081);
	PlayerTextDrawUseBox(playerid, GachaTextDraws[playerid][21], 1);
	PlayerTextDrawSetProportional(playerid, GachaTextDraws[playerid][21], 1);
	PlayerTextDrawSetSelectable(playerid, GachaTextDraws[playerid][21], 0);

	GachaTextDraws[playerid][22] = CreatePlayerTextDraw(playerid, 575.000000, 154.000000, "_");
	PlayerTextDrawFont(playerid, GachaTextDraws[playerid][22], 1);
	PlayerTextDrawLetterSize(playerid, GachaTextDraws[playerid][22], 0.591666, 0.950002);
	PlayerTextDrawTextSize(playerid, GachaTextDraws[playerid][22], 298.500000, 41.500000);
	PlayerTextDrawSetOutline(playerid, GachaTextDraws[playerid][22], 1);
	PlayerTextDrawSetShadow(playerid, GachaTextDraws[playerid][22], 0);
	PlayerTextDrawAlignment(playerid, GachaTextDraws[playerid][22], 2);
	PlayerTextDrawColor(playerid, GachaTextDraws[playerid][22], -1);
	PlayerTextDrawBackgroundColor(playerid, GachaTextDraws[playerid][22], 255);
	PlayerTextDrawBoxColor(playerid, GachaTextDraws[playerid][22], -16776961);
	PlayerTextDrawUseBox(playerid, GachaTextDraws[playerid][22], 1);
	PlayerTextDrawSetProportional(playerid, GachaTextDraws[playerid][22], 1);
	PlayerTextDrawSetSelectable(playerid, GachaTextDraws[playerid][22], 0);

	GachaTextDraws[playerid][23] = CreatePlayerTextDraw(playerid, 563.000000, 152.000000, "Close");
	PlayerTextDrawFont(playerid, GachaTextDraws[playerid][23], 2);
	PlayerTextDrawLetterSize(playerid, GachaTextDraws[playerid][23], 0.200000, 1.149999);
	PlayerTextDrawTextSize(playerid, GachaTextDraws[playerid][23], 690.000000, 127.000000);
	PlayerTextDrawSetOutline(playerid, GachaTextDraws[playerid][23], 1);
	PlayerTextDrawSetShadow(playerid, GachaTextDraws[playerid][23], 0);
	PlayerTextDrawAlignment(playerid, GachaTextDraws[playerid][23], 1);
	PlayerTextDrawColor(playerid, GachaTextDraws[playerid][23], -1);
	PlayerTextDrawBackgroundColor(playerid, GachaTextDraws[playerid][23], 255);
	PlayerTextDrawBoxColor(playerid, GachaTextDraws[playerid][23], 50);
	PlayerTextDrawUseBox(playerid, GachaTextDraws[playerid][23], 0);
	PlayerTextDrawSetProportional(playerid, GachaTextDraws[playerid][23], 1);
	PlayerTextDrawSetSelectable(playerid, GachaTextDraws[playerid][23], 1);

	return 1;
}

alias:kachapong("กาชาปอง")
CMD:kachapong(playerid, params[])
{
	if (!Inventory_HasItem(playerid, "กาชาปอง"))
		return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณไม่มี 'กล่องกาชาปอง'");

	if (Lucky_ActiveLast[playerid] == 1)
	    return SendClientMessage(playerid, COLOR_GREY, "คุณอยู่ระหว่างการเปิดกล่องกาชาปอง");

	PlayerTextDrawShow(playerid, GachaTextDraws[playerid][0]);
	PlayerTextDrawShow(playerid, GachaTextDraws[playerid][1]);
	PlayerTextDrawShow(playerid, GachaTextDraws[playerid][2]);
	PlayerTextDrawShow(playerid, GachaTextDraws[playerid][3]);
	PlayerTextDrawShow(playerid, GachaTextDraws[playerid][4]);
	PlayerTextDrawShow(playerid, GachaTextDraws[playerid][5]);
	PlayerTextDrawShow(playerid, GachaTextDraws[playerid][6]);
	PlayerTextDrawShow(playerid, GachaTextDraws[playerid][7]);
	PlayerTextDrawShow(playerid, GachaTextDraws[playerid][8]);
	PlayerTextDrawShow(playerid, GachaTextDraws[playerid][9]);
	PlayerTextDrawShow(playerid, GachaTextDraws[playerid][10]);
	PlayerTextDrawShow(playerid, GachaTextDraws[playerid][11]);
	PlayerTextDrawShow(playerid, GachaTextDraws[playerid][12]);
	PlayerTextDrawShow(playerid, GachaTextDraws[playerid][13]);
	PlayerTextDrawShow(playerid, GachaTextDraws[playerid][14]);
	PlayerTextDrawShow(playerid, GachaTextDraws[playerid][15]);
	PlayerTextDrawShow(playerid, GachaTextDraws[playerid][16]);
	PlayerTextDrawShow(playerid, GachaTextDraws[playerid][17]);
	PlayerTextDrawShow(playerid, GachaTextDraws[playerid][18]);
	PlayerTextDrawShow(playerid, GachaTextDraws[playerid][19]);
	PlayerTextDrawShow(playerid, GachaTextDraws[playerid][20]);
	PlayerTextDrawShow(playerid, GachaTextDraws[playerid][21]);
	PlayerTextDrawShow(playerid, GachaTextDraws[playerid][22]);
	PlayerTextDrawShow(playerid, GachaTextDraws[playerid][23]);
	SelectTextDraw(playerid, COLOR_YELLOW);

	new Msg[128];
	format(Msg, sizeof(Msg), "Key: %d", Inventory_Count(playerid, "กาชาปอง"));
	PlayerTextDrawSetString(playerid, GachaTextDraws[playerid][11], Msg);

	SendClientMessage(playerid, COLOR_LIGHTBLUE, "* [กาชาปอง] : กด 'Open' เพื่อเริ่มต้นการสุ่มกาชาปอง");
	return 1;
}

forward LuckyTimerLast();
public LuckyTimerLast()
{
	//new query[512];
	foreach (new i : Player)
 	{
  		if (Lucky_ActiveLast[i] == 1) // ผู้เล่นเปิดกล่อง
    	{
     		Lucky_TimeLast[i] ++;

			new gift1 = random(40), gift2 = random(40), gift3 = random(40), gift4 = random(40),
			gift5 = random(40), gift6 = random(40), gift7 = random(40);

			PlayerTextDrawShow(i, GachaTextDraws[i][14]);
			PlayerTextDrawSetPreviewModel(i, GachaTextDraws[i][14], GachapongLast[gift1][ModelID]);

			PlayerTextDrawShow(i, GachaTextDraws[i][15]);
			PlayerTextDrawSetPreviewModel(i, GachaTextDraws[i][15], GachapongLast[gift2][ModelID]);

			PlayerTextDrawShow(i, GachaTextDraws[i][16]);
			PlayerTextDrawSetPreviewModel(i, GachaTextDraws[i][16], GachapongLast[gift3][ModelID]);

			PlayerTextDrawShow(i, GachaTextDraws[i][17]);
			PlayerTextDrawSetPreviewModel(i, GachaTextDraws[i][17], GachapongLast[gift4][ModelID]);

			PlayerTextDrawShow(i, GachaTextDraws[i][18]);
			PlayerTextDrawSetPreviewModel(i, GachaTextDraws[i][18], GachapongLast[gift5][ModelID]);

			PlayerTextDrawShow(i, GachaTextDraws[i][19]);
			PlayerTextDrawSetPreviewModel(i, GachaTextDraws[i][19], GachapongLast[gift6][ModelID]);

			PlayerTextDrawShow(i, GachaTextDraws[i][20]);
			PlayerTextDrawSetPreviewModel(i, GachaTextDraws[i][20], GachapongLast[gift7][ModelID]);

			//new Float:x, Float:y, Float:z, Float:angle;

			if (Lucky_TimeLast[i] == 20)
			{
				PlayerTextDrawShow(i, GachaTextDraws[i][17]);
				PlayerTextDrawSetPreviewModel(i, GachaTextDraws[i][17], GachapongLast[gift4][ModelID]);

				PlayerTextDrawShow(i, GachaTextDraws[i][17]);
				PlayerTextDrawSetPreviewModel(i, GachaTextDraws[i][17], GachapongLast[gift4][ModelID]);

   				switch(GachapongLast[gift4][gachaID])
			    {
					case 0:
					{
						GivePlayerMoneyEx(i, 2000);
						SendClientMessage(i, COLOR_ORANGE, "* คุณได้รับเงินเขียวจำนวน $2,000 จากการเปิดกล่องกาชาปอง");
					}
					case 1:
					{
						playerData[i][pRedMoney] += 1000;
						SendClientMessage(i, COLOR_ORANGE, "* คุณได้รับเงินแดงจำนวน $1,000 จากการเปิดกล่องกาชาปอง");
					}
					case 2:
					{
						GivePlayerMoneyEx(i, 5000);
						SendClientMessage(i, COLOR_ORANGE, "* คุณได้รับเงินเขียวจำนวน $5,000 จากการเปิดกล่องกาชาปอง");
					}
					case 3:
					{
						GivePlayerMoneyEx(i, 10000);
						SendClientMessage(i, COLOR_ORANGE, "* คุณได้รับเงินเขียวจำนวน $10,000 จากการเปิดกล่องกาชาปอง");
					}
					case 4:
					{
						GivePlayerMoneyEx(i, 10000);
						SendClientMessage(i, COLOR_ORANGE, "* คุณได้รับเงินเขียวจำนวน $10,000 จากการเปิดกล่องกาชาปอง");
					}
					case 5:
					{
						playerData[i][pRedMoney] += 7000;
						SendClientMessage(i, COLOR_ORANGE, "* คุณได้รับเงินแดงจำนวน $7,000 จากการเปิดกล่องกาชาปอง");
					}
					case 6:
					{
						playerData[i][pCoin] += 100;
						SendClientMessage(i, COLOR_ORANGE, "* คุณได้รับ 100 Coin จากการเปิดกล่องกาชาปอง");
					}
					case 7:
					{
						playerData[i][pRedMoney] += 5000;
						SendClientMessage(i, COLOR_ORANGE, "* คุณได้รับเงินแดงจำนวน $5,000 จากการเปิดกล่องกาชาปอง");
					}
					case 8:
					{
						playerData[i][pRedMoney] += 10000;
						SendClientMessage(i, COLOR_ORANGE, "* คุณได้รับเงินแดงจำนวน $10,000 จากการเปิดกล่องกาชาปอง");
					}
					case 9:
					{
						GivePlayerMoneyEx(i, 15000);
						SendClientMessage(i, COLOR_ORANGE, "* คุณได้รับเงินเขียวจำนวน $15,000 จากการเปิดกล่องกาชาปอง");

						//Inventory_Add(i, "Shotgun", 1);
						//SendClientMessage(i, COLOR_YELLOW, "* คุณได้รับปืน 'Shotgun' จากการเปิดกล่องกาชาปอง");
					}
					case 10:
					{
						playerData[i][pRedMoney] += 50000;
						SendClientMessage(i, COLOR_ORANGE, "* คุณได้รับเงินแดงจำนวน $50,000 จากการเปิดกล่องกาชาปอง");
					}

					case 11..20:
					{
						GivePlayerMoneyEx(i, 1000);
						SendClientMessage(i, COLOR_ORANGE, "* คุณได้รับเงินเขียวจำนวน $1,000 จากการเปิดกล่องกาชาปอง");
					}

					case 21..60:
					{
						GivePlayerMoneyEx(i, 2000);
						SendClientMessage(i, COLOR_ORANGE, "* คุณได้รับเงินเขียวจำนวน $2,000 จากการเปิดกล่องกาชาปอง");
					}

				}

				Lucky_TimeLast[i] = 0;
				Lucky_StatsLast[i] = -1;
				Lucky_ActiveLast[i] = 0;

				SetTimerEx("HideLuckyLast", 1500, 0, "d", i);
	        }
	    }
	}
	return 1;
}

forward HideLuckyLast(playerid);
public HideLuckyLast(playerid)
{
	PlayerTextDrawHide(playerid, GachaTextDraws[playerid][0]);
	PlayerTextDrawHide(playerid, GachaTextDraws[playerid][1]);
	PlayerTextDrawHide(playerid, GachaTextDraws[playerid][2]);
	PlayerTextDrawHide(playerid, GachaTextDraws[playerid][3]);
	PlayerTextDrawHide(playerid, GachaTextDraws[playerid][4]);
	PlayerTextDrawHide(playerid, GachaTextDraws[playerid][5]);
	PlayerTextDrawHide(playerid, GachaTextDraws[playerid][6]);
	PlayerTextDrawHide(playerid, GachaTextDraws[playerid][7]);
	PlayerTextDrawHide(playerid, GachaTextDraws[playerid][8]);
	PlayerTextDrawHide(playerid, GachaTextDraws[playerid][9]);
	PlayerTextDrawHide(playerid, GachaTextDraws[playerid][10]);
	PlayerTextDrawHide(playerid, GachaTextDraws[playerid][11]);
	PlayerTextDrawHide(playerid, GachaTextDraws[playerid][12]);
	PlayerTextDrawHide(playerid, GachaTextDraws[playerid][13]);
	PlayerTextDrawHide(playerid, GachaTextDraws[playerid][14]);
	PlayerTextDrawHide(playerid, GachaTextDraws[playerid][15]);
	PlayerTextDrawHide(playerid, GachaTextDraws[playerid][16]);
	PlayerTextDrawHide(playerid, GachaTextDraws[playerid][17]);
	PlayerTextDrawHide(playerid, GachaTextDraws[playerid][18]);
	PlayerTextDrawHide(playerid, GachaTextDraws[playerid][19]);
	PlayerTextDrawHide(playerid, GachaTextDraws[playerid][20]);
	PlayerTextDrawHide(playerid, GachaTextDraws[playerid][21]);
	PlayerTextDrawHide(playerid, GachaTextDraws[playerid][22]);
	PlayerTextDrawHide(playerid, GachaTextDraws[playerid][23]);

	CancelSelectTextDraw(playerid);

	Lucky_TimeLast[playerid] = 0;
	Lucky_StatsLast[playerid] = -1;
	Lucky_ActiveLast[playerid] = 0;

	return 1;
}
