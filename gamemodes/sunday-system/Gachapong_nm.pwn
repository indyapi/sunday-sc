

//Gachapong New member

// playerData[playerid][pGachaOpen]
// playerData[playerid][pGachaOpen] = 0;
// cache_get_value_name_int(0, "GachaOpen", playerData[playerid][pGachaOpen]);
// format(query,sizeof(query),"%s GachaOpen ='%d'",query,playerData[playerid][pGachaOpen]);



#include	<YSI_Coding\y_hooks>

// --> ระบบกาชาปอง TextDraws
new GachaNM_TimeLast[MAX_PLAYERS]; //
new GachaNM_ActiveLast[MAX_PLAYERS]; //
new GachaNM_StatsLast[MAX_PLAYERS];

enum GachaNM_EnumX
{
	gachaNM_ID,
	nmModelID,
	nmName[32],
}

new GachapongNMLast[][GachaNM_EnumX] ={ //
	{0, 1212, "$2,000"}, //0
    {1, 1212, "$2,000"},
    {2, 1212, "$2,000"},
    {3, 1212, "$2,000"},
    {4, 1212, "$2,000"},

	{5, 1550, "$300"}, //1 แดง
    {6, 1550, "$300"},
    {7, 1550, "$300"},
    {8, 1550, "$500"},
    {9, 1550, "$700"},

	{10, 1212, "$1,000"}, //2
    {11, 1212, "$1,000"},
    {12, 1212, "$2,000"},
    {13, 1212, "$2,000"},
    {14, 1212, "$2,000"},

	{15, 457, "CADDY(50KG)"}, //3
    {16, 1212, "$500"},
    {17, 1212, "$500"},
    {18, 457, "CADDY(50KG)"},
    {19, 1212, "$500"},

	{20, 1212, "$10,000"}, //4
    {21, 1212, "$10,000"},
    {22, 1212, "$7,000"},
    {23, 1212, "$7,000"},
    {24, 1212, "$7,000"},

	{25, 1550, "$1,000"}, //5 แดง
    {26, 1550, "$1,000"}, 
    {27, 1550, "$1,000"}, 
    {28, 1550, "$100"}, 
    {29, 1550, "$100"}, 

	{30, 19941, "40 Coin"}, //6
    {31, 19941, "10 Coin"},
    {32, 19941, "20 Coin"},
    {33, 19941, "30 Coin"},
    {34, 19941, "50 Coin"},

	{35, 1550, "$5,000"}, //7 แดง
    {36, 1550, "$100"},
    {37, 1550, "$100"},
    {38, 1550, "$100"},
    {39, 1550, "$100"},

	{40, 1212, "$10,000"}, //8 แดง
    {41, 1212, "$2,000"},
    {42, 1212, "$2,000"},
    {43, 1212, "$2,000"},
    {44, 1212, "$2,000"},

	{45, 1212, "$10,000"}, //9
    {46, 1212, "$20,000"},
    {47, 1212, "$30,000"},
    {48, 1212, "$40,000"},
    {49, 1212, "$50,000"}
};

// ----------------------->

new PlayerText:Gachapong_NewMember[MAX_PLAYERS][30];

hook OnGameModeInit()
{
	SetTimer("GachanmTimerLast", 600, 1);
	return 1;
}

hook OnPlayerConnect(playerid)
{
	GachaNM_TimeLast[playerid] = 0;
	GachaNM_StatsLast[playerid] = -1;
	GachaNM_ActiveLast[playerid] = 0;

	// --> ระบบกาชาปอง
	Gachapong_NewMember[playerid][0] = CreatePlayerTextDraw(playerid, 320.000000, 108.000000, "_");
	PlayerTextDrawFont(playerid, Gachapong_NewMember[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, Gachapong_NewMember[playerid][0], 0.600000, 10.500014);
	PlayerTextDrawTextSize(playerid, Gachapong_NewMember[playerid][0], 298.500000, 361.000000);
	PlayerTextDrawSetOutline(playerid, Gachapong_NewMember[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, Gachapong_NewMember[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, Gachapong_NewMember[playerid][0], 2);
	PlayerTextDrawColor(playerid, Gachapong_NewMember[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, Gachapong_NewMember[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, Gachapong_NewMember[playerid][0], 16777215);
	PlayerTextDrawUseBox(playerid, Gachapong_NewMember[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, Gachapong_NewMember[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, Gachapong_NewMember[playerid][0], 0);

	Gachapong_NewMember[playerid][1] = CreatePlayerTextDraw(playerid, 320.000000, 125.000000, "_");
	PlayerTextDrawFont(playerid, Gachapong_NewMember[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid, Gachapong_NewMember[playerid][1], 0.600000, 8.650007);
	PlayerTextDrawTextSize(playerid, Gachapong_NewMember[playerid][1], 298.500000, 356.000000);
	PlayerTextDrawSetOutline(playerid, Gachapong_NewMember[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, Gachapong_NewMember[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, Gachapong_NewMember[playerid][1], 2);
	PlayerTextDrawColor(playerid, Gachapong_NewMember[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, Gachapong_NewMember[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, Gachapong_NewMember[playerid][1], -1);
	PlayerTextDrawUseBox(playerid, Gachapong_NewMember[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, Gachapong_NewMember[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, Gachapong_NewMember[playerid][1], 0);

	Gachapong_NewMember[playerid][2] = CreatePlayerTextDraw(playerid, 320.000000, 108.000000, "_");
	PlayerTextDrawFont(playerid, Gachapong_NewMember[playerid][2], 1);
	PlayerTextDrawLetterSize(playerid, Gachapong_NewMember[playerid][2], 0.600000, 10.050004);
	PlayerTextDrawTextSize(playerid, Gachapong_NewMember[playerid][2], 298.500000, 356.000000);
	PlayerTextDrawSetOutline(playerid, Gachapong_NewMember[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, Gachapong_NewMember[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, Gachapong_NewMember[playerid][2], 2);
	PlayerTextDrawColor(playerid, Gachapong_NewMember[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, Gachapong_NewMember[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, Gachapong_NewMember[playerid][2], -1);
	PlayerTextDrawUseBox(playerid, Gachapong_NewMember[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, Gachapong_NewMember[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, Gachapong_NewMember[playerid][2], 0);

	Gachapong_NewMember[playerid][3] = CreatePlayerTextDraw(playerid, 212.000000, 159.000000, "ld_beat:chit");
	PlayerTextDrawFont(playerid, Gachapong_NewMember[playerid][3], 4);
	PlayerTextDrawLetterSize(playerid, Gachapong_NewMember[playerid][3], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Gachapong_NewMember[playerid][3], 56.000000, 63.500000);
	PlayerTextDrawSetOutline(playerid, Gachapong_NewMember[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, Gachapong_NewMember[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, Gachapong_NewMember[playerid][3], 1);
	PlayerTextDrawColor(playerid, Gachapong_NewMember[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, Gachapong_NewMember[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, Gachapong_NewMember[playerid][3], 50);
	PlayerTextDrawUseBox(playerid, Gachapong_NewMember[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, Gachapong_NewMember[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, Gachapong_NewMember[playerid][3], 0);

	Gachapong_NewMember[playerid][4] = CreatePlayerTextDraw(playerid, 320.000000, 93.000000, "_");
	PlayerTextDrawFont(playerid, Gachapong_NewMember[playerid][4], 1);
	PlayerTextDrawLetterSize(playerid, Gachapong_NewMember[playerid][4], 0.600000, 9.300008);
	PlayerTextDrawTextSize(playerid, Gachapong_NewMember[playerid][4], 298.500000, 164.500000);
	PlayerTextDrawSetOutline(playerid, Gachapong_NewMember[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, Gachapong_NewMember[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, Gachapong_NewMember[playerid][4], 2);
	PlayerTextDrawColor(playerid, Gachapong_NewMember[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, Gachapong_NewMember[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, Gachapong_NewMember[playerid][4], -1);
	PlayerTextDrawUseBox(playerid, Gachapong_NewMember[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, Gachapong_NewMember[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, Gachapong_NewMember[playerid][4], 0);

	Gachapong_NewMember[playerid][5] = CreatePlayerTextDraw(playerid, 320.000000, 126.000000, "_");
	PlayerTextDrawFont(playerid, Gachapong_NewMember[playerid][5], 1);
	PlayerTextDrawLetterSize(playerid, Gachapong_NewMember[playerid][5], 0.600000, 9.300008);
	PlayerTextDrawTextSize(playerid, Gachapong_NewMember[playerid][5], 298.500000, 164.500000);
	PlayerTextDrawSetOutline(playerid, Gachapong_NewMember[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, Gachapong_NewMember[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, Gachapong_NewMember[playerid][5], 2);
	PlayerTextDrawColor(playerid, Gachapong_NewMember[playerid][5], -1);
	PlayerTextDrawBackgroundColor(playerid, Gachapong_NewMember[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, Gachapong_NewMember[playerid][5], -1);
	PlayerTextDrawUseBox(playerid, Gachapong_NewMember[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, Gachapong_NewMember[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, Gachapong_NewMember[playerid][5], 0);

	Gachapong_NewMember[playerid][6] = CreatePlayerTextDraw(playerid, 373.000000, 159.000000, "ld_beat:chit");
	PlayerTextDrawFont(playerid, Gachapong_NewMember[playerid][6], 4);
	PlayerTextDrawLetterSize(playerid, Gachapong_NewMember[playerid][6], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Gachapong_NewMember[playerid][6], 56.000000, 63.500000);
	PlayerTextDrawSetOutline(playerid, Gachapong_NewMember[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, Gachapong_NewMember[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, Gachapong_NewMember[playerid][6], 1);
	PlayerTextDrawColor(playerid, Gachapong_NewMember[playerid][6], -1);
	PlayerTextDrawBackgroundColor(playerid, Gachapong_NewMember[playerid][6], 255);
	PlayerTextDrawBoxColor(playerid, Gachapong_NewMember[playerid][6], 50);
	PlayerTextDrawUseBox(playerid, Gachapong_NewMember[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, Gachapong_NewMember[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, Gachapong_NewMember[playerid][6], 0);

	Gachapong_NewMember[playerid][7] = CreatePlayerTextDraw(playerid, 373.000000, 80.500000, "ld_beat:chit");
	PlayerTextDrawFont(playerid, Gachapong_NewMember[playerid][7], 4);
	PlayerTextDrawLetterSize(playerid, Gachapong_NewMember[playerid][7], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Gachapong_NewMember[playerid][7], 56.000000, 63.500000);
	PlayerTextDrawSetOutline(playerid, Gachapong_NewMember[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, Gachapong_NewMember[playerid][7], 0);
	PlayerTextDrawAlignment(playerid, Gachapong_NewMember[playerid][7], 1);
	PlayerTextDrawColor(playerid, Gachapong_NewMember[playerid][7], -1);
	PlayerTextDrawBackgroundColor(playerid, Gachapong_NewMember[playerid][7], 255);
	PlayerTextDrawBoxColor(playerid, Gachapong_NewMember[playerid][7], 50);
	PlayerTextDrawUseBox(playerid, Gachapong_NewMember[playerid][7], 1);
	PlayerTextDrawSetProportional(playerid, Gachapong_NewMember[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, Gachapong_NewMember[playerid][7], 0);

	Gachapong_NewMember[playerid][8] = CreatePlayerTextDraw(playerid, 212.000000, 80.500000, "ld_beat:chit");
	PlayerTextDrawFont(playerid, Gachapong_NewMember[playerid][8], 4);
	PlayerTextDrawLetterSize(playerid, Gachapong_NewMember[playerid][8], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Gachapong_NewMember[playerid][8], 56.000000, 63.500000);
	PlayerTextDrawSetOutline(playerid, Gachapong_NewMember[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, Gachapong_NewMember[playerid][8], 0);
	PlayerTextDrawAlignment(playerid, Gachapong_NewMember[playerid][8], 1);
	PlayerTextDrawColor(playerid, Gachapong_NewMember[playerid][8], -1);
	PlayerTextDrawBackgroundColor(playerid, Gachapong_NewMember[playerid][8], 255);
	PlayerTextDrawBoxColor(playerid, Gachapong_NewMember[playerid][8], 50);
	PlayerTextDrawUseBox(playerid, Gachapong_NewMember[playerid][8], 1);
	PlayerTextDrawSetProportional(playerid, Gachapong_NewMember[playerid][8], 1);
	PlayerTextDrawSetSelectable(playerid, Gachapong_NewMember[playerid][8], 0);

	Gachapong_NewMember[playerid][9] = CreatePlayerTextDraw(playerid, 320.000000, 111.000000, "_");
	PlayerTextDrawFont(playerid, Gachapong_NewMember[playerid][9], 1);
	PlayerTextDrawLetterSize(playerid, Gachapong_NewMember[playerid][9], 0.600000, 8.650007);
	PlayerTextDrawTextSize(playerid, Gachapong_NewMember[playerid][9], 298.500000, 356.000000);
	PlayerTextDrawSetOutline(playerid, Gachapong_NewMember[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, Gachapong_NewMember[playerid][9], 0);
	PlayerTextDrawAlignment(playerid, Gachapong_NewMember[playerid][9], 2);
	PlayerTextDrawColor(playerid, Gachapong_NewMember[playerid][9], -1);
	PlayerTextDrawBackgroundColor(playerid, Gachapong_NewMember[playerid][9], 255);
	PlayerTextDrawBoxColor(playerid, Gachapong_NewMember[playerid][9], 1296911646);
	PlayerTextDrawUseBox(playerid, Gachapong_NewMember[playerid][9], 1);
	PlayerTextDrawSetProportional(playerid, Gachapong_NewMember[playerid][9], 1);
	PlayerTextDrawSetSelectable(playerid, Gachapong_NewMember[playerid][9], 0);

	Gachapong_NewMember[playerid][10] = CreatePlayerTextDraw(playerid, 257.000000, 197.000000, "OPEN");
	PlayerTextDrawFont(playerid, Gachapong_NewMember[playerid][10], 1);
	PlayerTextDrawLetterSize(playerid, Gachapong_NewMember[playerid][10], 0.237498, 1.100000);
	PlayerTextDrawTextSize(playerid, Gachapong_NewMember[playerid][10], 16.500000, 37.500000);
	PlayerTextDrawSetOutline(playerid, Gachapong_NewMember[playerid][10], 0);
	PlayerTextDrawSetShadow(playerid, Gachapong_NewMember[playerid][10], 0);
	PlayerTextDrawAlignment(playerid, Gachapong_NewMember[playerid][10], 2);
	PlayerTextDrawColor(playerid, Gachapong_NewMember[playerid][10], -1);
	PlayerTextDrawBackgroundColor(playerid, Gachapong_NewMember[playerid][10], 255);
	PlayerTextDrawBoxColor(playerid, Gachapong_NewMember[playerid][10], 2094792904);
	PlayerTextDrawUseBox(playerid, Gachapong_NewMember[playerid][10], 1);
	PlayerTextDrawSetProportional(playerid, Gachapong_NewMember[playerid][10], 1);
	PlayerTextDrawSetSelectable(playerid, Gachapong_NewMember[playerid][10], 1);

	Gachapong_NewMember[playerid][11] = CreatePlayerTextDraw(playerid, 385.000000, 197.000000, "CLOSE");
	PlayerTextDrawFont(playerid, Gachapong_NewMember[playerid][11], 1);
	PlayerTextDrawLetterSize(playerid, Gachapong_NewMember[playerid][11], 0.237498, 1.100000);
	PlayerTextDrawTextSize(playerid, Gachapong_NewMember[playerid][11], 16.500000, 37.500000);
	PlayerTextDrawSetOutline(playerid, Gachapong_NewMember[playerid][11], 0);
	PlayerTextDrawSetShadow(playerid, Gachapong_NewMember[playerid][11], 0);
	PlayerTextDrawAlignment(playerid, Gachapong_NewMember[playerid][11], 2);
	PlayerTextDrawColor(playerid, Gachapong_NewMember[playerid][11], -1);
	PlayerTextDrawBackgroundColor(playerid, Gachapong_NewMember[playerid][11], 255);
	PlayerTextDrawBoxColor(playerid, Gachapong_NewMember[playerid][11], -16777016);
	PlayerTextDrawUseBox(playerid, Gachapong_NewMember[playerid][11], 1);
	PlayerTextDrawSetProportional(playerid, Gachapong_NewMember[playerid][11], 1);
	PlayerTextDrawSetSelectable(playerid, Gachapong_NewMember[playerid][11], 1);

	Gachapong_NewMember[playerid][12] = CreatePlayerTextDraw(playerid, 299.500000, 197.000000, "OPEN 5x");
	PlayerTextDrawFont(playerid, Gachapong_NewMember[playerid][12], 1);
	PlayerTextDrawLetterSize(playerid, Gachapong_NewMember[playerid][12], 0.237498, 1.100000);
	PlayerTextDrawTextSize(playerid, Gachapong_NewMember[playerid][12], 16.500000, 37.500000);
	PlayerTextDrawSetOutline(playerid, Gachapong_NewMember[playerid][12], 0);
	PlayerTextDrawSetShadow(playerid, Gachapong_NewMember[playerid][12], 0);
	PlayerTextDrawAlignment(playerid, Gachapong_NewMember[playerid][12], 2);
	PlayerTextDrawColor(playerid, Gachapong_NewMember[playerid][12], -1);
	PlayerTextDrawBackgroundColor(playerid, Gachapong_NewMember[playerid][12], 255);
	PlayerTextDrawBoxColor(playerid, Gachapong_NewMember[playerid][12], 2094792904);
	PlayerTextDrawUseBox(playerid, Gachapong_NewMember[playerid][12], 1);
	PlayerTextDrawSetProportional(playerid, Gachapong_NewMember[playerid][12], 1);
	PlayerTextDrawSetSelectable(playerid, Gachapong_NewMember[playerid][12], 1);

	Gachapong_NewMember[playerid][13] = CreatePlayerTextDraw(playerid, 342.500000, 197.000000, "OPEN 10x");
	PlayerTextDrawFont(playerid, Gachapong_NewMember[playerid][13], 1);
	PlayerTextDrawLetterSize(playerid, Gachapong_NewMember[playerid][13], 0.195832, 1.100000);
	PlayerTextDrawTextSize(playerid, Gachapong_NewMember[playerid][13], 16.500000, 37.500000);
	PlayerTextDrawSetOutline(playerid, Gachapong_NewMember[playerid][13], 0);
	PlayerTextDrawSetShadow(playerid, Gachapong_NewMember[playerid][13], 0);
	PlayerTextDrawAlignment(playerid, Gachapong_NewMember[playerid][13], 2);
	PlayerTextDrawColor(playerid, Gachapong_NewMember[playerid][13], -1);
	PlayerTextDrawBackgroundColor(playerid, Gachapong_NewMember[playerid][13], 255);
	PlayerTextDrawBoxColor(playerid, Gachapong_NewMember[playerid][13], 2094792904);
	PlayerTextDrawUseBox(playerid, Gachapong_NewMember[playerid][13], 1);
	PlayerTextDrawSetProportional(playerid, Gachapong_NewMember[playerid][13], 1);
	PlayerTextDrawSetSelectable(playerid, Gachapong_NewMember[playerid][13], 1);

	Gachapong_NewMember[playerid][14] = CreatePlayerTextDraw(playerid, 162.000000, 193.000000, "GACHAPONG:");
	PlayerTextDrawFont(playerid, Gachapong_NewMember[playerid][14], 1);
	PlayerTextDrawLetterSize(playerid, Gachapong_NewMember[playerid][14], 0.187499, 1.199998);
	PlayerTextDrawTextSize(playerid, Gachapong_NewMember[playerid][14], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Gachapong_NewMember[playerid][14], 0);
	PlayerTextDrawSetShadow(playerid, Gachapong_NewMember[playerid][14], 0);
	PlayerTextDrawAlignment(playerid, Gachapong_NewMember[playerid][14], 2);
	PlayerTextDrawColor(playerid, Gachapong_NewMember[playerid][14], 16777215);
	PlayerTextDrawBackgroundColor(playerid, Gachapong_NewMember[playerid][14], 255);
	PlayerTextDrawBoxColor(playerid, Gachapong_NewMember[playerid][14], 50);
	PlayerTextDrawUseBox(playerid, Gachapong_NewMember[playerid][14], 0);
	PlayerTextDrawSetProportional(playerid, Gachapong_NewMember[playerid][14], 1);
	PlayerTextDrawSetSelectable(playerid, Gachapong_NewMember[playerid][14], 0);

	Gachapong_NewMember[playerid][15] = CreatePlayerTextDraw(playerid, 193.000000, 193.000000, "100");
	PlayerTextDrawFont(playerid, Gachapong_NewMember[playerid][15], 1);
	PlayerTextDrawLetterSize(playerid, Gachapong_NewMember[playerid][15], 0.187499, 1.199998);
	PlayerTextDrawTextSize(playerid, Gachapong_NewMember[playerid][15], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Gachapong_NewMember[playerid][15], 0);
	PlayerTextDrawSetShadow(playerid, Gachapong_NewMember[playerid][15], 0);
	PlayerTextDrawAlignment(playerid, Gachapong_NewMember[playerid][15], 2);
	PlayerTextDrawColor(playerid, Gachapong_NewMember[playerid][15], 16777215);
	PlayerTextDrawBackgroundColor(playerid, Gachapong_NewMember[playerid][15], 255);
	PlayerTextDrawBoxColor(playerid, Gachapong_NewMember[playerid][15], 50);
	PlayerTextDrawUseBox(playerid, Gachapong_NewMember[playerid][15], 0);
	PlayerTextDrawSetProportional(playerid, Gachapong_NewMember[playerid][15], 1);
	PlayerTextDrawSetSelectable(playerid, Gachapong_NewMember[playerid][15], 0);

	Gachapong_NewMember[playerid][16] = CreatePlayerTextDraw(playerid, 438.000000, 193.000000, "GACHAPONG:");
	PlayerTextDrawFont(playerid, Gachapong_NewMember[playerid][16], 1);
	PlayerTextDrawLetterSize(playerid, Gachapong_NewMember[playerid][16], 0.187499, 1.199998);
	PlayerTextDrawTextSize(playerid, Gachapong_NewMember[playerid][16], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Gachapong_NewMember[playerid][16], 0);
	PlayerTextDrawSetShadow(playerid, Gachapong_NewMember[playerid][16], 0);
	PlayerTextDrawAlignment(playerid, Gachapong_NewMember[playerid][16], 2);
	PlayerTextDrawColor(playerid, Gachapong_NewMember[playerid][16], 16777215);
	PlayerTextDrawBackgroundColor(playerid, Gachapong_NewMember[playerid][16], 255);
	PlayerTextDrawBoxColor(playerid, Gachapong_NewMember[playerid][16], 50);
	PlayerTextDrawUseBox(playerid, Gachapong_NewMember[playerid][16], 0);
	PlayerTextDrawSetProportional(playerid, Gachapong_NewMember[playerid][16], 1);
	PlayerTextDrawSetSelectable(playerid, Gachapong_NewMember[playerid][16], 0);

	Gachapong_NewMember[playerid][17] = CreatePlayerTextDraw(playerid, 474.000000, 193.000000, "1000");
	PlayerTextDrawFont(playerid, Gachapong_NewMember[playerid][17], 1);
	PlayerTextDrawLetterSize(playerid, Gachapong_NewMember[playerid][17], 0.187499, 1.199998);
	PlayerTextDrawTextSize(playerid, Gachapong_NewMember[playerid][17], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Gachapong_NewMember[playerid][17], 0);
	PlayerTextDrawSetShadow(playerid, Gachapong_NewMember[playerid][17], 0);
	PlayerTextDrawAlignment(playerid, Gachapong_NewMember[playerid][17], 2);
	PlayerTextDrawColor(playerid, Gachapong_NewMember[playerid][17], 16777215);
	PlayerTextDrawBackgroundColor(playerid, Gachapong_NewMember[playerid][17], 255);
	PlayerTextDrawBoxColor(playerid, Gachapong_NewMember[playerid][17], 50);
	PlayerTextDrawUseBox(playerid, Gachapong_NewMember[playerid][17], 0);
	PlayerTextDrawSetProportional(playerid, Gachapong_NewMember[playerid][17], 1);
	PlayerTextDrawSetSelectable(playerid, Gachapong_NewMember[playerid][17], 0);

	Gachapong_NewMember[playerid][18] = CreatePlayerTextDraw(playerid, 320.000000, 89.000000, "GACHAPONG NEW MEMBER");
	PlayerTextDrawFont(playerid, Gachapong_NewMember[playerid][18], 1);
	PlayerTextDrawLetterSize(playerid, Gachapong_NewMember[playerid][18], 0.383332, 2.149998);
	PlayerTextDrawTextSize(playerid, Gachapong_NewMember[playerid][18], 400.000000, 208.500000);
	PlayerTextDrawSetOutline(playerid, Gachapong_NewMember[playerid][18], 0);
	PlayerTextDrawSetShadow(playerid, Gachapong_NewMember[playerid][18], 0);
	PlayerTextDrawAlignment(playerid, Gachapong_NewMember[playerid][18], 2);
	PlayerTextDrawColor(playerid, Gachapong_NewMember[playerid][18], 16777215);
	PlayerTextDrawBackgroundColor(playerid, Gachapong_NewMember[playerid][18], 255);
	PlayerTextDrawBoxColor(playerid, Gachapong_NewMember[playerid][18], 50);
	PlayerTextDrawUseBox(playerid, Gachapong_NewMember[playerid][18], 0);
	PlayerTextDrawSetProportional(playerid, Gachapong_NewMember[playerid][18], 1);
	PlayerTextDrawSetSelectable(playerid, Gachapong_NewMember[playerid][18], 0);

	Gachapong_NewMember[playerid][19] = CreatePlayerTextDraw(playerid, 214.500000, 111.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, Gachapong_NewMember[playerid][19], 5);
	PlayerTextDrawLetterSize(playerid, Gachapong_NewMember[playerid][19], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Gachapong_NewMember[playerid][19], 69.500000, 74.500000);
	PlayerTextDrawSetOutline(playerid, Gachapong_NewMember[playerid][19], 0);
	PlayerTextDrawSetShadow(playerid, Gachapong_NewMember[playerid][19], 0);
	PlayerTextDrawAlignment(playerid, Gachapong_NewMember[playerid][19], 1);
	PlayerTextDrawColor(playerid, Gachapong_NewMember[playerid][19], -1);
	PlayerTextDrawBackgroundColor(playerid, Gachapong_NewMember[playerid][19], 16776997);
	PlayerTextDrawBoxColor(playerid, Gachapong_NewMember[playerid][19], 255);
	PlayerTextDrawUseBox(playerid, Gachapong_NewMember[playerid][19], 0);
	PlayerTextDrawSetProportional(playerid, Gachapong_NewMember[playerid][19], 1);
	PlayerTextDrawSetSelectable(playerid, Gachapong_NewMember[playerid][19], 0);
	PlayerTextDrawSetPreviewModel(playerid, Gachapong_NewMember[playerid][19], 1550);
	PlayerTextDrawSetPreviewRot(playerid, Gachapong_NewMember[playerid][19], -10.000000, 0.000000, -20.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, Gachapong_NewMember[playerid][19], 1, 1);

	Gachapong_NewMember[playerid][20] = CreatePlayerTextDraw(playerid, 143.000000, 111.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, Gachapong_NewMember[playerid][20], 5);
	PlayerTextDrawLetterSize(playerid, Gachapong_NewMember[playerid][20], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Gachapong_NewMember[playerid][20], 69.500000, 74.500000);
	PlayerTextDrawSetOutline(playerid, Gachapong_NewMember[playerid][20], 0);
	PlayerTextDrawSetShadow(playerid, Gachapong_NewMember[playerid][20], 0);
	PlayerTextDrawAlignment(playerid, Gachapong_NewMember[playerid][20], 1);
	PlayerTextDrawColor(playerid, Gachapong_NewMember[playerid][20], -1);
	PlayerTextDrawBackgroundColor(playerid, Gachapong_NewMember[playerid][20], 16776997);
	PlayerTextDrawBoxColor(playerid, Gachapong_NewMember[playerid][20], 255);
	PlayerTextDrawUseBox(playerid, Gachapong_NewMember[playerid][20], 0);
	PlayerTextDrawSetProportional(playerid, Gachapong_NewMember[playerid][20], 1);
	PlayerTextDrawSetSelectable(playerid, Gachapong_NewMember[playerid][20], 0);
	PlayerTextDrawSetPreviewModel(playerid, Gachapong_NewMember[playerid][20], 1550);
	PlayerTextDrawSetPreviewRot(playerid, Gachapong_NewMember[playerid][20], -10.000000, 0.000000, -20.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, Gachapong_NewMember[playerid][20], 1, 1);

	Gachapong_NewMember[playerid][21] = CreatePlayerTextDraw(playerid, 286.000000, 111.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, Gachapong_NewMember[playerid][21], 5);
	PlayerTextDrawLetterSize(playerid, Gachapong_NewMember[playerid][21], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Gachapong_NewMember[playerid][21], 69.500000, 74.500000);
	PlayerTextDrawSetOutline(playerid, Gachapong_NewMember[playerid][21], 0);
	PlayerTextDrawSetShadow(playerid, Gachapong_NewMember[playerid][21], 0);
	PlayerTextDrawAlignment(playerid, Gachapong_NewMember[playerid][21], 1);
	PlayerTextDrawColor(playerid, Gachapong_NewMember[playerid][21], -1);
	PlayerTextDrawBackgroundColor(playerid, Gachapong_NewMember[playerid][21], 16776997);
	PlayerTextDrawBoxColor(playerid, Gachapong_NewMember[playerid][21], 255);
	PlayerTextDrawUseBox(playerid, Gachapong_NewMember[playerid][21], 0);
	PlayerTextDrawSetProportional(playerid, Gachapong_NewMember[playerid][21], 1);
	PlayerTextDrawSetSelectable(playerid, Gachapong_NewMember[playerid][21], 0);
	PlayerTextDrawSetPreviewModel(playerid, Gachapong_NewMember[playerid][21], 1550);
	PlayerTextDrawSetPreviewRot(playerid, Gachapong_NewMember[playerid][21], -10.000000, 0.000000, -20.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, Gachapong_NewMember[playerid][21], 1, 1);

	Gachapong_NewMember[playerid][22] = CreatePlayerTextDraw(playerid, 316.000000, 109.000000, "ld_beat:down");
	PlayerTextDrawFont(playerid, Gachapong_NewMember[playerid][22], 4);
	PlayerTextDrawLetterSize(playerid, Gachapong_NewMember[playerid][22], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Gachapong_NewMember[playerid][22], 8.500000, 7.000000);
	PlayerTextDrawSetOutline(playerid, Gachapong_NewMember[playerid][22], 1);
	PlayerTextDrawSetShadow(playerid, Gachapong_NewMember[playerid][22], 0);
	PlayerTextDrawAlignment(playerid, Gachapong_NewMember[playerid][22], 1);
	PlayerTextDrawColor(playerid, Gachapong_NewMember[playerid][22], -70);
	PlayerTextDrawBackgroundColor(playerid, Gachapong_NewMember[playerid][22], 255);
	PlayerTextDrawBoxColor(playerid, Gachapong_NewMember[playerid][22], 255);
	PlayerTextDrawUseBox(playerid, Gachapong_NewMember[playerid][22], 1);
	PlayerTextDrawSetProportional(playerid, Gachapong_NewMember[playerid][22], 1);
	PlayerTextDrawSetSelectable(playerid, Gachapong_NewMember[playerid][22], 0);

	Gachapong_NewMember[playerid][23] = CreatePlayerTextDraw(playerid, 357.000000, 111.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, Gachapong_NewMember[playerid][23], 5);
	PlayerTextDrawLetterSize(playerid, Gachapong_NewMember[playerid][23], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Gachapong_NewMember[playerid][23], 69.500000, 74.500000);
	PlayerTextDrawSetOutline(playerid, Gachapong_NewMember[playerid][23], 0);
	PlayerTextDrawSetShadow(playerid, Gachapong_NewMember[playerid][23], 0);
	PlayerTextDrawAlignment(playerid, Gachapong_NewMember[playerid][23], 1);
	PlayerTextDrawColor(playerid, Gachapong_NewMember[playerid][23], -1);
	PlayerTextDrawBackgroundColor(playerid, Gachapong_NewMember[playerid][23], 16776997);
	PlayerTextDrawBoxColor(playerid, Gachapong_NewMember[playerid][23], 255);
	PlayerTextDrawUseBox(playerid, Gachapong_NewMember[playerid][23], 0);
	PlayerTextDrawSetProportional(playerid, Gachapong_NewMember[playerid][23], 1);
	PlayerTextDrawSetSelectable(playerid, Gachapong_NewMember[playerid][23], 0);
	PlayerTextDrawSetPreviewModel(playerid, Gachapong_NewMember[playerid][23], 1550);
	PlayerTextDrawSetPreviewRot(playerid, Gachapong_NewMember[playerid][23], -10.000000, 0.000000, -20.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, Gachapong_NewMember[playerid][23], 1, 1);

	Gachapong_NewMember[playerid][24] = CreatePlayerTextDraw(playerid, 428.000000, 111.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, Gachapong_NewMember[playerid][24], 5);
	PlayerTextDrawLetterSize(playerid, Gachapong_NewMember[playerid][24], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Gachapong_NewMember[playerid][24], 69.500000, 74.500000);
	PlayerTextDrawSetOutline(playerid, Gachapong_NewMember[playerid][24], 0);
	PlayerTextDrawSetShadow(playerid, Gachapong_NewMember[playerid][24], 0);
	PlayerTextDrawAlignment(playerid, Gachapong_NewMember[playerid][24], 1);
	PlayerTextDrawColor(playerid, Gachapong_NewMember[playerid][24], -1);
	PlayerTextDrawBackgroundColor(playerid, Gachapong_NewMember[playerid][24], 16776997);
	PlayerTextDrawBoxColor(playerid, Gachapong_NewMember[playerid][24], 255);
	PlayerTextDrawUseBox(playerid, Gachapong_NewMember[playerid][24], 0);
	PlayerTextDrawSetProportional(playerid, Gachapong_NewMember[playerid][24], 1);
	PlayerTextDrawSetSelectable(playerid, Gachapong_NewMember[playerid][24], 0);
	PlayerTextDrawSetPreviewModel(playerid, Gachapong_NewMember[playerid][24], 1550);
	PlayerTextDrawSetPreviewRot(playerid, Gachapong_NewMember[playerid][24], -10.000000, 0.000000, -20.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, Gachapong_NewMember[playerid][24], 1, 1);

	Gachapong_NewMember[playerid][25] = CreatePlayerTextDraw(playerid, 177.500000, 174.000000, "$50,000");
	PlayerTextDrawFont(playerid, Gachapong_NewMember[playerid][25], 1);
	PlayerTextDrawLetterSize(playerid, Gachapong_NewMember[playerid][25], 0.187499, 1.199998);
	PlayerTextDrawTextSize(playerid, Gachapong_NewMember[playerid][25], 400.000000, 65.500000);
	PlayerTextDrawSetOutline(playerid, Gachapong_NewMember[playerid][25], 0);
	PlayerTextDrawSetShadow(playerid, Gachapong_NewMember[playerid][25], 0);
	PlayerTextDrawAlignment(playerid, Gachapong_NewMember[playerid][25], 2);
	PlayerTextDrawColor(playerid, Gachapong_NewMember[playerid][25], -1);
	PlayerTextDrawBackgroundColor(playerid, Gachapong_NewMember[playerid][25], 255);
	PlayerTextDrawBoxColor(playerid, Gachapong_NewMember[playerid][25], 16777120);
	PlayerTextDrawUseBox(playerid, Gachapong_NewMember[playerid][25], 1);
	PlayerTextDrawSetProportional(playerid, Gachapong_NewMember[playerid][25], 1);
	PlayerTextDrawSetSelectable(playerid, Gachapong_NewMember[playerid][25], 0);

	Gachapong_NewMember[playerid][26] = CreatePlayerTextDraw(playerid, 249.000000, 174.000000, "$500");
	PlayerTextDrawFont(playerid, Gachapong_NewMember[playerid][26], 1);
	PlayerTextDrawLetterSize(playerid, Gachapong_NewMember[playerid][26], 0.187499, 1.199998);
	PlayerTextDrawTextSize(playerid, Gachapong_NewMember[playerid][26], 400.000000, 65.500000);
	PlayerTextDrawSetOutline(playerid, Gachapong_NewMember[playerid][26], 0);
	PlayerTextDrawSetShadow(playerid, Gachapong_NewMember[playerid][26], 0);
	PlayerTextDrawAlignment(playerid, Gachapong_NewMember[playerid][26], 2);
	PlayerTextDrawColor(playerid, Gachapong_NewMember[playerid][26], -1);
	PlayerTextDrawBackgroundColor(playerid, Gachapong_NewMember[playerid][26], 255);
	PlayerTextDrawBoxColor(playerid, Gachapong_NewMember[playerid][26], 16777080);
	PlayerTextDrawUseBox(playerid, Gachapong_NewMember[playerid][26], 1);
	PlayerTextDrawSetProportional(playerid, Gachapong_NewMember[playerid][26], 1);
	PlayerTextDrawSetSelectable(playerid, Gachapong_NewMember[playerid][26], 0);

	Gachapong_NewMember[playerid][27] = CreatePlayerTextDraw(playerid, 320.500000, 174.000000, "$20,000");
	PlayerTextDrawFont(playerid, Gachapong_NewMember[playerid][27], 1);
	PlayerTextDrawLetterSize(playerid, Gachapong_NewMember[playerid][27], 0.187499, 1.199998);
	PlayerTextDrawTextSize(playerid, Gachapong_NewMember[playerid][27], 400.000000, 65.500000);
	PlayerTextDrawSetOutline(playerid, Gachapong_NewMember[playerid][27], 0);
	PlayerTextDrawSetShadow(playerid, Gachapong_NewMember[playerid][27], 0);
	PlayerTextDrawAlignment(playerid, Gachapong_NewMember[playerid][27], 2);
	PlayerTextDrawColor(playerid, Gachapong_NewMember[playerid][27], -1);
	PlayerTextDrawBackgroundColor(playerid, Gachapong_NewMember[playerid][27], 255);
	PlayerTextDrawBoxColor(playerid, Gachapong_NewMember[playerid][27], 16777080);
	PlayerTextDrawUseBox(playerid, Gachapong_NewMember[playerid][27], 1);
	PlayerTextDrawSetProportional(playerid, Gachapong_NewMember[playerid][27], 1);
	PlayerTextDrawSetSelectable(playerid, Gachapong_NewMember[playerid][27], 0);

	Gachapong_NewMember[playerid][28] = CreatePlayerTextDraw(playerid, 391.500000, 174.000000, "$1,000");
	PlayerTextDrawFont(playerid, Gachapong_NewMember[playerid][28], 1);
	PlayerTextDrawLetterSize(playerid, Gachapong_NewMember[playerid][28], 0.187499, 1.199998);
	PlayerTextDrawTextSize(playerid, Gachapong_NewMember[playerid][28], 400.000000, 65.500000);
	PlayerTextDrawSetOutline(playerid, Gachapong_NewMember[playerid][28], 0);
	PlayerTextDrawSetShadow(playerid, Gachapong_NewMember[playerid][28], 0);
	PlayerTextDrawAlignment(playerid, Gachapong_NewMember[playerid][28], 2);
	PlayerTextDrawColor(playerid, Gachapong_NewMember[playerid][28], -1);
	PlayerTextDrawBackgroundColor(playerid, Gachapong_NewMember[playerid][28], 255);
	PlayerTextDrawBoxColor(playerid, Gachapong_NewMember[playerid][28], 16777080);
	PlayerTextDrawUseBox(playerid, Gachapong_NewMember[playerid][28], 1);
	PlayerTextDrawSetProportional(playerid, Gachapong_NewMember[playerid][28], 1);
	PlayerTextDrawSetSelectable(playerid, Gachapong_NewMember[playerid][28], 0);

	Gachapong_NewMember[playerid][29] = CreatePlayerTextDraw(playerid, 462.500000, 174.000000, "$2,000");
	PlayerTextDrawFont(playerid, Gachapong_NewMember[playerid][29], 1);
	PlayerTextDrawLetterSize(playerid, Gachapong_NewMember[playerid][29], 0.187499, 1.199998);
	PlayerTextDrawTextSize(playerid, Gachapong_NewMember[playerid][29], 400.000000, 65.500000);
	PlayerTextDrawSetOutline(playerid, Gachapong_NewMember[playerid][29], 0);
	PlayerTextDrawSetShadow(playerid, Gachapong_NewMember[playerid][29], 0);
	PlayerTextDrawAlignment(playerid, Gachapong_NewMember[playerid][29], 2);
	PlayerTextDrawColor(playerid, Gachapong_NewMember[playerid][29], -1);
	PlayerTextDrawBackgroundColor(playerid, Gachapong_NewMember[playerid][29], 255);
	PlayerTextDrawBoxColor(playerid, Gachapong_NewMember[playerid][29], 16777080);
	PlayerTextDrawUseBox(playerid, Gachapong_NewMember[playerid][29], 1);
	PlayerTextDrawSetProportional(playerid, Gachapong_NewMember[playerid][29], 1);
	PlayerTextDrawSetSelectable(playerid, Gachapong_NewMember[playerid][29], 0);

	return 1;
}

alias:gacha("กาชา")
CMD:gacha(playerid, params[])
{
	if (!Inventory_HasItem(playerid, "กาชาผู้เล่นใหม่"))
		return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณไม่มี 'กาชาผู้เล่นใหม่'");

	if (GachaNM_ActiveLast[playerid] == 1)
	    return SendClientMessage(playerid, COLOR_GREY, "[GACHAPONG]: กำลังเปิดกาชาปอง...");

	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][0]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][1]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][2]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][3]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][4]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][5]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][6]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][7]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][8]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][9]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][10]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][11]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][12]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][13]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][14]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][15]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][16]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][17]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][18]);
    PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][19]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][20]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][21]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][22]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][23]);
    PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][24]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][25]);
    PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][26]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][27]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][28]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][29]);
	SelectTextDraw(playerid, 0x00FFFFFF);

	new Msg[128];
	format(Msg, sizeof(Msg), "%d", Inventory_Count(playerid, "กาชาผู้เล่นใหม่"));
	PlayerTextDrawSetString(playerid, Gachapong_NewMember[playerid][15], Msg);

    format(Msg, sizeof(Msg), "%d", playerData[playerid][pGachaOpen]);
	PlayerTextDrawSetString(playerid,Gachapong_NewMember[playerid][17], Msg);

	SendClientMessage(playerid, COLOR_LIGHTBLUE, "[GACHAPONG] : กด 'Open' เพื่อเปิด");
	return 1;
}

forward GachanmTimerLast();
public GachanmTimerLast()
{
	//new query[512];
	foreach (new i : Player)
 	{
  		if (GachaNM_ActiveLast[i] == 1) // ผู้เล่นเปิดกล่อง
    	{
     		GachaNM_TimeLast[i] ++;

			new gift1 = random(50), gift2 = random(50), gift3 = random(50), gift4 = random(50),
			gift5 = random(50);

			new Msg[128];
			format(Msg, sizeof(Msg), "%d", Inventory_Count(i, "กาชาผู้เล่นใหม่"));
			PlayerTextDrawSetString(i, Gachapong_NewMember[i][15], Msg);

			format(Msg, sizeof(Msg), "%d", playerData[i][pGachaOpen]);
			PlayerTextDrawSetString(i,Gachapong_NewMember[i][17], Msg);



			PlayerTextDrawShow(i, Gachapong_NewMember[i][19]);
			PlayerTextDrawSetPreviewModel(i, Gachapong_NewMember[i][19], GachapongNMLast[gift1][nmModelID]);
	        PlayerTextDrawSetString(i ,Gachapong_NewMember[i][25], GachapongNMLast[gift1][nmName]);

			PlayerTextDrawShow(i, Gachapong_NewMember[i][20]);
			PlayerTextDrawSetPreviewModel(i, Gachapong_NewMember[i][20], GachapongNMLast[gift2][nmModelID]);
            PlayerTextDrawSetString(i ,Gachapong_NewMember[i][26], GachapongNMLast[gift2][nmName]);

			PlayerTextDrawShow(i, Gachapong_NewMember[i][21]);
			PlayerTextDrawSetPreviewModel(i, Gachapong_NewMember[i][21], GachapongNMLast[gift3][nmModelID]);
            PlayerTextDrawSetString(i ,Gachapong_NewMember[i][27], GachapongNMLast[gift3][nmName]);

			PlayerTextDrawShow(i, Gachapong_NewMember[i][23]);
			PlayerTextDrawSetPreviewModel(i, Gachapong_NewMember[i][23], GachapongNMLast[gift4][nmModelID]);
            PlayerTextDrawSetString(i ,Gachapong_NewMember[i][28], GachapongNMLast[gift4][nmName]);

			PlayerTextDrawShow(i, Gachapong_NewMember[i][24]);
			PlayerTextDrawSetPreviewModel(i, Gachapong_NewMember[i][24], GachapongNMLast[gift5][nmModelID]);
            PlayerTextDrawSetString(i ,Gachapong_NewMember[i][29], GachapongNMLast[gift5][nmName]);

			//new Float:x, Float:y, Float:z, Float:angle;

			if (GachaNM_TimeLast[i] == 20)
			{
				PlayerTextDrawShow(i, Gachapong_NewMember[i][21]);
				PlayerTextDrawSetPreviewModel(i, Gachapong_NewMember[i][21], GachapongNMLast[gift3][nmModelID]);

				PlayerTextDrawShow(i, Gachapong_NewMember[i][21]);
				PlayerTextDrawSetPreviewModel(i, Gachapong_NewMember[i][21], GachapongNMLast[gift3][nmModelID]);

   				switch(GachapongNMLast[gift3][gachaNM_ID])
			    {
					case 0..4:  //0
					{
						GivePlayerMoneyEx(i, 2000);
                        SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: กาชาปอง -1");
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: เงินเขียว + $2,000");
					}
					case 5..7:  //1
					{
						playerData[i][pRedMoney] += 300;
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: กาชาปอง -1");
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: เงินแดง + $300");
					}
                    case 8:  //1
					{
						playerData[i][pRedMoney] += 500;
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: กาชาปอง -1");
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: เงินแดง + $500");
					}
                    case 9: //1
					{
						playerData[i][pRedMoney] += 700;
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: กาชาปอง -1");
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: เงินแดง + $700");
					}
					case 10..11: //2
					{
						GivePlayerMoneyEx(i, 1000);
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: กาชาปอง -1");
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: เงินเขียว + $1,000");
					}
					case 12..14: //2
					{
						GivePlayerMoneyEx(i, 2000);
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: กาชาปอง -1");
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: เงินเขียว + $2,000");
					}
                    case 15: //3
					{
                        new query[256];
                        mysql_format(g_SQL, query, sizeof(query), "INSERT INTO vehicles (carOwnerID, carOwner, carModel, carPrice, carFuel, carPosX, carPosY, carPosZ, carPosA) VALUES(%d, '%s', 457, 100000, 100.0, '0.0000', '0.0000', '0.0000', '0.0000')", playerData[i][pID], GetPlayerNameEx(i));
	                    mysql_tquery(g_SQL, query);

						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: กาชาปอง -1");
						SendClientMessage(i, COLOR_SUN, "[GACHAPONG EPIC]: รถ Caddy +1");
                        SendClientMessageToAllEx(COLOR_SUN, "===============================================================================");
                        SendClientMessageToAllEx(COLOR_SUN, "[GACHAPONG EPIC]: ยินดีด้วย!! มีผู้โชคดีได้รับรถ CADDY (50KG) จากการเปิด 'กาชาผู้เล่นใหม่'");
                        SendClientMessageToAllEx(COLOR_SUN, "[GACHAPONG EPIC]: ประชาชนรายนี้ เปิด 'กาชาผู้เล่นใหม่' เพียง %d ลูก เท่านั้น", playerData[i][pGachaOpen]);
                        SendClientMessageToAllEx(COLOR_SUN, "[GACHAPONG EPIC]: คุณสมบัติของรถ CADDY : เก็บของทำงานได้อย่างละ 50ชิ้นกันเลยทีเดียว");
                        SendClientMessageToAllEx(COLOR_SUN, "===============================================================================");
					}
                    case 16..17: //3
					{
						GivePlayerMoneyEx(i, 500);
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: กาชาปอง -1");
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: เงินเขียว + $500");
					}
                    case 18: //3
					{
                        new query[256];
                        mysql_format(g_SQL, query, sizeof(query), "INSERT INTO vehicles (carOwnerID, carOwner, carModel, carPrice, carFuel, carPosX, carPosY, carPosZ, carPosA) VALUES(%d, '%s', 457, 100000, 100.0, '0.0000', '0.0000', '0.0000', '0.0000')", playerData[i][pID], GetPlayerNameEx(i));
	                    mysql_tquery(g_SQL, query);

						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: กาชาปอง -1");
						SendClientMessage(i, COLOR_SUN, "[GACHAPONG EPIC]: รถ Caddy +1");
                        SendClientMessageToAllEx(COLOR_SUN, "===============================================================================");
                        SendClientMessageToAllEx(COLOR_SUN, "[GACHAPONG EPIC]: ยินดีด้วย!! มีผู้โชคดีได้รับรถ CADDY (50KG) จากการเปิด 'กาชาผู้เล่นใหม่'");
                        SendClientMessageToAllEx(COLOR_SUN, "[GACHAPONG EPIC]: ประชาชนรายนี้ เปิด 'กาชาผู้เล่นใหม่' เพียง %d ลูก เท่านั้น", playerData[i][pGachaOpen]);
                        SendClientMessageToAllEx(COLOR_SUN, "[GACHAPONG EPIC]: คุณสมบัติของรถ CADDY : เก็บของทำงานได้อย่างละ 50ชิ้นกันเลยทีเดียว");
                        SendClientMessageToAllEx(COLOR_SUN, "===============================================================================");
					}
                    case 20..21: //4
					{
						GivePlayerMoneyEx(i, 10000);
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: กาชาปอง -1");
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: เงินเขียว + $10,000");
					}
					case 22..24: //4
					{
						GivePlayerMoneyEx(i, 7000);
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: กาชาปอง -1");
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: เงินเขียว + $7,000");
					}
                    case 25..27: //5
					{
						playerData[i][pRedMoney] += 1000;
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: กาชาปอง -1");
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: เงินแดง + $1,000");
					}
                    case 28..29: //5
					{
						playerData[i][pRedMoney] += 100;
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: กาชาปอง -1");
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: เงินแดง + $100");
                    }
					case 30:  //6
					{
						playerData[i][pCoin] += 40;
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: กาชาปอง -1");
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: Coin + P40");
					}
                    case 31:  //6
					{
						playerData[i][pCoin] += 10;
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: กาชาปอง -1");
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: Coin + P10");
					}
                    case 32:  //6
					{
						playerData[i][pCoin] += 20;
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: กาชาปอง -1");
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: Coin + P20");
					}
                    case 33:  //6
					{
						playerData[i][pCoin] += 30;
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: กาชาปอง -1");
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: Coin + P30");
					}
                    case 34:  //6
					{
						playerData[i][pCoin] += 100;
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: กาชาปอง -1");
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: Coin + 50");
					}
					case 35: //7
					{
						playerData[i][pRedMoney] += 5000;
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: กาชาปอง -1");
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: เงินแดง + $5,000");
					}
                    case 36..39: //7
					{
						playerData[i][pRedMoney] += 100;
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: กาชาปอง -1");
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: เงินแดง + $100");
					}
                    case 40: //8
					{
						GivePlayerMoneyEx(i, 10000);
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: กาชาปอง -1");
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: เงินเขียว + $10,000");
					}
                    case 41..44: //8
					{
						GivePlayerMoneyEx(i, 2000);
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: กาชาปอง -1");
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: เงินเขียว + $2,000");
					}
					case 45:
					{
						GivePlayerMoneyEx(i, 10000);
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: กาชาปอง -1");
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: เงินเขียว + $10,000");
                    }
                    case 46:
					{
						GivePlayerMoneyEx(i, 20000);
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: กาชาปอง -1");
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: เงินเขียว + $20,000");
                    }
                    case 47:
					{
						GivePlayerMoneyEx(i, 30000);
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: กาชาปอง -1");
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG LUCKY]: เงินเขียว + $30,000");
                    }
                    case 48:
					{
						GivePlayerMoneyEx(i, 40000);
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: กาชาปอง -1");
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG LUCKY+]: เงินเขียว + $40,000");
                    }
                    case 49:
					{
						GivePlayerMoneyEx(i, 50000);
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG]: กาชาปอง -1");
						SendClientMessage(i, COLOR_ORANGE, "[GACHAPONG SUPER LUCKY]: เงินเขียว + $50,000");
                    }
				}

				GachaNM_TimeLast[i] = 0;
				GachaNM_StatsLast[i] = -1;
				GachaNM_ActiveLast[i] = 0;

				SetTimerEx("ResetGachanmLast", 1500, 0, "d", i);
	        }
	    }
	}
	return 1;
}

forward ResetGachanmLast(playerid);
public ResetGachanmLast(playerid)
{
	/*PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][0]);
	PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][1]);
	PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][2]);
	PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][3]);
	PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][4]);
	PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][5]);
	PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][6]);
	PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][7]);
	PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][8]);
	PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][9]);
	PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][10]);
	PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][11]);
	PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][12]);
	PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][13]);
	PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][14]);
	PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][15]);
	PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][16]);
	PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][17]);
	PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][18]);
    PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][19]);
	PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][20]);
	PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][21]);
	PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][22]);
	PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][23]);
    PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][24]);
	PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][25]);
    PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][26]);
	PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][27]);
	PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][28]);
	PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][29]);

	CancelSelectTextDraw(playerid);

	GachaNM_TimeLast[playerid] = 0;
	GachaNM_StatsLast[playerid] = -1;
	GachaNM_ActiveLast[playerid] = 0;*/

	if (!Inventory_HasItem(playerid, "กาชาผู้เล่นใหม่"))
		return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณไม่มี 'กาชาผู้เล่นใหม่'");

	if (GachaNM_ActiveLast[playerid] == 1)
		return SendClientMessage(playerid, COLOR_GREY, "[GACHAPONG]: กำลังเปิดกาชาปอง...");

	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][0]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][1]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][2]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][3]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][4]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][5]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][6]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][7]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][8]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][9]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][10]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][11]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][12]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][13]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][14]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][15]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][16]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][17]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][18]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][19]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][20]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][21]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][22]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][23]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][24]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][25]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][26]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][27]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][28]);
	PlayerTextDrawShow(playerid, Gachapong_NewMember[playerid][29]);
	SelectTextDraw(playerid, 0x00FFFFFF);

	new Msg[128];
	format(Msg, sizeof(Msg), "%d", Inventory_Count(playerid, "กาชาผู้เล่นใหม่"));
	PlayerTextDrawSetString(playerid, Gachapong_NewMember[playerid][15], Msg);

	format(Msg, sizeof(Msg), "%d", playerData[playerid][pGachaOpen]);
	PlayerTextDrawSetString(playerid,Gachapong_NewMember[playerid][17], Msg);

	SendClientMessage(playerid, COLOR_LIGHTBLUE, "[GACHAPONG] : กด 'Open' เพื่อเปิด");

	return 1;
}
/*
    if(playertextid == Gachapong_NewMember[playerid][10])
    {
		if (!Inventory_HasItem(playerid, "กาชาผู้เล่นใหม่"))
		    return SendClientMessage(playerid, COLOR_LIGHTRED, "คุณไม่มี 'กาชาผู้เล่นใหม่'");

		if (GachaNM_ActiveLast[playerid] == 1)
		    return SendClientMessage(playerid, COLOR_GREY, "[GACHAPONG]: กำลังเปิดกาชา...");

		new Msg[128];
		format(Msg, sizeof(Msg), "%d", Inventory_Count(playerid, "กาชาผู้เล่นใหม่"));
		PlayerTextDrawSetString(playerid,Gachapong_NewMember[playerid][15], Msg);

        format(Msg, sizeof(Msg), "%d", playerData[playerid][pGachaOpen]);
		PlayerTextDrawSetString(playerid,Gachapong_NewMember[playerid][17], Msg);

        GachaNM_ActiveLast[playerid] = 1;
        SendClientMessage(playerid, COLOR_GREEN, "[GACHAPONG]: เริ่มการเปิดกาชาปอง....");
        // GachaNM_ActiveLast[playerid] == 1
        return 1;
    }
    if(playertextid == Gachapong_NewMember[playerid][11])
    {
        if (GachaNM_ActiveLast[playerid] == 1)
		    return SendClientMessage(playerid, COLOR_GREY, "[GACHAPONG]: กำลังเปิดกาชา...");

        PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][0]);
		PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][1]);
		PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][2]);
		PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][3]);
		PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][4]);
		PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][5]);
		PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][6]);
		PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][7]);
		PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][8]);
		PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][9]);
		PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][10]);
		PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][11]);
		PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][12]);
		PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][13]);
		PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][14]);
		PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][15]);
		PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][16]);
		PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][17]);
		PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][18]);
		PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][19]);
		PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][20]);
		PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][21]);
		PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][22]);
		PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][23]);
		PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][24]);
		PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][25]);
		PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][26]);
		PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][27]);
		PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][28]);
		PlayerTextDrawHide(playerid, Gachapong_NewMember[playerid][29]);
        CancelSelectTextDraw(playerid);

        GachaNM_TimeLast[playerid] = 0;
        GachaNM_StatsLast[playerid] = -1;
        GachaNM_ActiveLast[playerid] = 0;
        return 1;
    }
    if(playertextid == Gachapong_NewMember[playerid][12])
    {
        SendClientMessage(playerid, COLOR_GREEN, "[GACHAPONG]: อยู่ในระหว่างการพัฒนา...");
        return 1;
    }
    if(playertextid == Gachapong_NewMember[playerid][13])
    {
        SendClientMessage(playerid, COLOR_GREEN, "[GACHAPONG]: อยู่ในระหว่างการพัฒนา...");
        return 1;
    }
*/
