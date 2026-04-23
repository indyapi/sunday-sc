#include	<YSI_Coding\y_hooks>

static const g_arrSelectColors[256] = {
	0x000000FF, 0xF5F5F5FF, 0x2A77A1FF, 0x840410FF, 0x263739FF, 0x86446EFF, 0xD78E10FF, 0x4C75B7FF, 0xBDBEC6FF, 0x5E7072FF,
	0x46597AFF, 0x656A79FF, 0x5D7E8DFF, 0x58595AFF, 0xD6DAD6FF, 0x9CA1A3FF, 0x335F3FFF, 0x730E1AFF, 0x7B0A2AFF, 0x9F9D94FF,
	0x3B4E78FF, 0x732E3EFF, 0x691E3BFF, 0x96918CFF, 0x515459FF, 0x3F3E45FF, 0xA5A9A7FF, 0x635C5AFF, 0x3D4A68FF, 0x979592FF,
	0x421F21FF, 0x5F272BFF, 0x8494ABFF, 0x767B7CFF, 0x646464FF, 0x5A5752FF, 0x252527FF, 0x2D3A35FF, 0x93A396FF, 0x6D7A88FF,
	0x221918FF, 0x6F675FFF, 0x7C1C2AFF, 0x5F0A15FF, 0x193826FF, 0x5D1B20FF, 0x9D9872FF, 0x7A7560FF, 0x989586FF, 0xADB0B0FF,
	0x848988FF, 0x304F45FF, 0x4D6268FF, 0x162248FF, 0x272F4BFF, 0x7D6256FF, 0x9EA4ABFF, 0x9C8D71FF, 0x6D1822FF, 0x4E6881FF,
	0x9C9C98FF, 0x917347FF, 0x661C26FF, 0x949D9FFF, 0xA4A7A5FF, 0x8E8C46FF, 0x341A1EFF, 0x6A7A8CFF, 0xAAAD8EFF, 0xAB988FFF,
	0x851F2EFF, 0x6F8297FF, 0x585853FF, 0x9AA790FF, 0x601A23FF, 0x20202CFF, 0xA4A096FF, 0xAA9D84FF, 0x78222BFF, 0x0E316DFF,
	0x722A3FFF, 0x7B715EFF, 0x741D28FF, 0x1E2E32FF, 0x4D322FFF, 0x7C1B44FF, 0x2E5B20FF, 0x395A83FF, 0x6D2837FF, 0xA7A28FFF,
	0xAFB1B1FF, 0x364155FF, 0x6D6C6EFF, 0x0F6A89FF, 0x204B6BFF, 0x2B3E57FF, 0x9B9F9DFF, 0x6C8495FF, 0x4D8495FF, 0xAE9B7FFF,
	0x406C8FFF, 0x1F253BFF, 0xAB9276FF, 0x134573FF, 0x96816CFF, 0x64686AFF, 0x105082FF, 0xA19983FF, 0x385694FF, 0x525661FF,
	0x7F6956FF, 0x8C929AFF, 0x596E87FF, 0x473532FF, 0x44624FFF, 0x730A27FF, 0x223457FF, 0x640D1BFF, 0xA3ADC6FF, 0x695853FF,
	0x9B8B80FF, 0x620B1CFF, 0x5B5D5EFF, 0x624428FF, 0x731827FF, 0x1B376DFF, 0xEC6AAEFF, 0x000000FF, 0x177517FF, 0x210606FF,
	0x125478FF, 0x452A0DFF, 0x571E1EFF, 0x010701FF, 0x25225AFF, 0x2C89AAFF, 0x8A4DBDFF, 0x35963AFF, 0xB7B7B7FF, 0x464C8DFF,
	0x84888CFF, 0x817867FF, 0x817A26FF, 0x6A506FFF, 0x583E6FFF, 0x8CB972FF, 0x824F78FF, 0x6D276AFF, 0x1E1D13FF, 0x1E1306FF,
	0x1F2518FF, 0x2C4531FF, 0x1E4C99FF, 0x2E5F43FF, 0x1E9948FF, 0x1E9999FF, 0x999976FF, 0x7C8499FF, 0x992E1EFF, 0x2C1E08FF,
	0x142407FF, 0x993E4DFF, 0x1E4C99FF, 0x198181FF, 0x1A292AFF, 0x16616FFF, 0x1B6687FF, 0x6C3F99FF, 0x481A0EFF, 0x7A7399FF,
	0x746D99FF, 0x53387EFF, 0x222407FF, 0x3E190CFF, 0x46210EFF, 0x991E1EFF, 0x8D4C8DFF, 0x805B80FF, 0x7B3E7EFF, 0x3C1737FF,
	0x733517FF, 0x781818FF, 0x83341AFF, 0x8E2F1CFF, 0x7E3E53FF, 0x7C6D7CFF, 0x020C02FF, 0x072407FF, 0x163012FF, 0x16301BFF,
	0x642B4FFF, 0x368452FF, 0x999590FF, 0x818D96FF, 0x99991EFF, 0x7F994CFF, 0x839292FF, 0x788222FF, 0x2B3C99FF, 0x3A3A0BFF,
	0x8A794EFF, 0x0E1F49FF, 0x15371CFF, 0x15273AFF, 0x375775FF, 0x060820FF, 0x071326FF, 0x20394BFF, 0x2C5089FF, 0x15426CFF,
	0x103250FF, 0x241663FF, 0x692015FF, 0x8C8D94FF, 0x516013FF, 0x090F02FF, 0x8C573AFF, 0x52888EFF, 0x995C52FF, 0x99581EFF,
	0x993A63FF, 0x998F4EFF, 0x99311EFF, 0x0D1842FF, 0x521E1EFF, 0x42420DFF, 0x4C991EFF, 0x082A1DFF, 0x96821DFF, 0x197F19FF,
	0x3B141FFF, 0x745217FF, 0x893F8DFF, 0x7E1A6CFF, 0x0B370BFF, 0x27450DFF, 0x071F24FF, 0x784573FF, 0x8A653AFF, 0x732617FF,
	0x319490FF, 0x56941DFF, 0x59163DFF, 0x1B8A2FFF, 0x38160BFF, 0x041804FF, 0x355D8EFF, 0x2E3F5BFF, 0x561A28FF, 0x4E0E27FF,
	0x706C67FF, 0x3B3E42FF, 0x2E2D33FF, 0x7B7E7DFF, 0x4A4442FF, 0x28344EFF
};

//===========================[ ระบบแต่งรถ ]=================================

#define SPD 			ShowPlayerDialog
#define DSL 			DIALOG_STYLE_LIST
#define DSI             DIALOG_STYLE_INPUT
#define D_TOP       	"[แต่งรถ]"
#define D_OK 			"ตกลง"
#define D_CANCEL 		"ยกเลิก"
#define D_TEXT			"Wheels"

//#define MAX_GARAGES 	100

#define dialog_TUNING 	1323
#define dialog_TUNING_2	1324

#define COLOR_PRICE		1000

//#define COLOR_RED		0xfa5555AA
//#define COLOR_ORANGE	0xFF6600FF

#define SendErrorMessage(%0,%1) \
	SendClientMessage(%0, COLOR_RED, "ERROR | {FFFFFF} "%1)

new PlayerText:TuningBuy[MAX_PLAYERS][12];

enum Vehicle {
    vVehID,
    vOwner[ MAX_PLAYER_NAME ],
	bool:vTuned,
	vSpoiler,
	vHood,
	vRoof,
	vSkirt,
	vLamps,
	vNitro,
	vExhaust,
	vWheels,
	vStereo,
	vHydraulics,
	vFrontBumper,
	vRearBumper,
	vRightVent,
	vLeftVent,
	vColor1,
	vColor2,
	vPaintJob
}
new VehicleInfo[ MAX_VEHICLES ][ Vehicle ];

enum PaintjobInfi {
	vehID,
	pNumber,
	pPrice,
	pName[ 12 ]
};
#define NUMBER_TYPE_PAINTJOB 	36
new
	pjInfo[ NUMBER_TYPE_PAINTJOB ][ PaintjobInfi ] = {
	{ 483, 0, 100+5000, "Paintjob 1" },
	{ 534, 0, 100+5000, "Paintjob 1" },
	{ 534, 1, 100+5000, "Paintjob 2" },
	{ 534, 2, 100+5000, "Paintjob 3" },
	{ 535, 0, 100+5000, "Paintjob 1" },
	{ 535, 1, 100+5000, "Paintjob 2" },
	{ 535, 2, 100+5000, "Paintjob 3" },
	{ 536, 0, 100+5000, "Paintjob 1" },
	{ 536, 1, 100+5000, "Paintjob 2" },
	{ 536, 2, 100+5000, "Paintjob 3" },
	{ 558, 0, 100+5000, "Paintjob 1" },
	{ 558, 1, 100+5000, "Paintjob 2" },
	{ 558, 2, 100+5000, "Paintjob 3" },
	{ 559, 0, 100+5000, "Paintjob 1" },
	{ 559, 1, 100+5000, "Paintjob 2" },
	{ 559, 2, 100+5000, "Paintjob 3" },
	{ 560, 0, 100+5000, "Paintjob 1" },
	{ 560, 1, 100+5000, "Paintjob 2" },
	{ 560, 2, 100+5000, "Paintjob 3" },
	{ 561, 0, 100+5000, "Paintjob 1" },
	{ 561, 1, 100+5000, "Paintjob 2" },
	{ 561, 2, 100+5000, "Paintjob 3" },
	{ 562, 0, 100+5000, "Paintjob 1" },
	{ 562, 1, 100+5000, "Paintjob 2" },
	{ 562, 2, 100+5000, "Paintjob 3" },
	{ 565, 0, 100+5000, "Paintjob 1" },
	{ 565, 1, 100+5000, "Paintjob 2" },
	{ 565, 2, 100+5000, "Paintjob 3" },
	{ 567, 0, 100+5000, "Paintjob 1" },
	{ 567, 1, 100+5000, "Paintjob 2" },
	{ 567, 2, 100+5000, "Paintjob 3" },
	{ 575, 0, 100+5000, "Paintjob 1" },
	{ 575, 1, 100+5000, "Paintjob 2" },
	{ 576, 0, 100+5000, "Paintjob 1" },
	{ 576, 1, 100+5000, "Paintjob 2" },
	{ 576, 2, 100+5000, "Paintjob 3" }
};

enum ComponentsInfo {
	cID,
	cName[ 40 ],
	cPrice,
	cType
};
#define MAX_COMPONENTS	194
new
	cInfo[ MAX_COMPONENTS ][ ComponentsInfo ] = {
	{ 1000, "Pro Spoiler", 100+5000, CARMODTYPE_SPOILER },
	{ 1001, "Win Spoiler", 100+5000, CARMODTYPE_SPOILER },
	{ 1002, "Drag Spoiler", 100+5000, CARMODTYPE_SPOILER },
	{ 1003, "Alpha Spoiler", 100+5000, CARMODTYPE_SPOILER },
	{ 1004, "Champ Scoop Hood", 100+5000, CARMODTYPE_HOOD },
	{ 1005, "Fury Scoop Hood", 100+5000, CARMODTYPE_HOOD },
	{ 1006, "Roof Scoop Roof", 100+5000, CARMODTYPE_ROOF },
	{ 1007, "Right Sideskirt", 100+5000, CARMODTYPE_SIDESKIRT },
	{ 1008, "5x Nitrous", 100+5000, CARMODTYPE_NITRO },
	{ 1009, "2x Nitrous", 100+5000, CARMODTYPE_NITRO },
	{ 1010, "10x Nitrous", 100+5000, CARMODTYPE_NITRO },
	{ 1011, "Race Scoop Hood", 100+5000, CARMODTYPE_HOOD },
	{ 1012, "Worx Scoop Hood", 100+5000, CARMODTYPE_HOOD },
	{ 1013, "Round Fog Lamp", 100+5000, CARMODTYPE_LAMPS },
	{ 1014, "Champ Spoiler", 100+5000, CARMODTYPE_SPOILER },
	{ 1015, "Race Spoiler", 100+5000, CARMODTYPE_SPOILER },
	{ 1016, "Worx Spoiler", 100+5000, CARMODTYPE_SPOILER },
	{ 1017, "Left Sideskirt", 100+5000, CARMODTYPE_SIDESKIRT },
	{ 1018, "Upswept Exhaust", 100+5000, CARMODTYPE_EXHAUST },
	{ 1019, "Twin Exhaust", 100+5000, CARMODTYPE_EXHAUST },
	{ 1020, "Large Exhaust", 100+5000, CARMODTYPE_EXHAUST },
	{ 1021, "Medium Exhaust", 100+5000, CARMODTYPE_EXHAUST },
	{ 1022, "Small Exhaust", 100+5000, CARMODTYPE_EXHAUST },
	{ 1023, "Fury Spoiler", 100+5000, CARMODTYPE_SPOILER },
	{ 1024, "Square Fog Lamp", 100+5000, CARMODTYPE_LAMPS },
	{ 1025, "Offroad Wheels", 4000+5000, CARMODTYPE_WHEELS },
	{ 1026, "Right Alien Sideskirt", 100+5000, CARMODTYPE_SIDESKIRT },
	{ 1027, "Left Alien Sideskirt", 100+5000, CARMODTYPE_SIDESKIRT },
	{ 1028, "Alien Exhaust", 100+5000, CARMODTYPE_EXHAUST },
	{ 1029, "X-Flow Exhaust", 100+5000, CARMODTYPE_EXHAUST },
	{ 1030, "Left X-Flow Sideskirt", 100+5000, CARMODTYPE_SIDESKIRT },
	{ 1031, "Right X-Flow Sideskirt", 100+5000, CARMODTYPE_SIDESKIRT },
	{ 1032, "Alien Roof Vent", 100+5000, CARMODTYPE_ROOF },
	{ 1033, "X-Flow Roof Vent", 100+5000, CARMODTYPE_ROOF },
	{ 1034, "Alien Exhaust", 100+5000, CARMODTYPE_EXHAUST },
	{ 1035, "X-Flow Roof Vent", 100+5000, CARMODTYPE_ROOF },
	{ 1036, "Right Alien Sideskirt", 100+5000, CARMODTYPE_SIDESKIRT },
	{ 1037, "X-Flow Exhaust", 100+5000, CARMODTYPE_EXHAUST },
	{ 1038, "Alien Roof Vent", 100+5000, CARMODTYPE_ROOF },
	{ 1039, "Left X-Flow Sideskirt", 100+5000, CARMODTYPE_SIDESKIRT },
	{ 1040, "Left Alien Sideskirt", 100+5000, CARMODTYPE_SIDESKIRT },
	{ 1041, "Right X-Flow Sideskirt", 100+5000, CARMODTYPE_SIDESKIRT },
	{ 1042, "Right Chrome Sideskirt", 100+5000, CARMODTYPE_SIDESKIRT },
	{ 1043, "Slamin Exhaust", 100+5000, CARMODTYPE_EXHAUST },
	{ 1044, "Chrome Exhaust", 100+5000, CARMODTYPE_EXHAUST },
	{ 1045, "X-Flow Exhaust", 100+5000, CARMODTYPE_EXHAUST },
	{ 1046, "Alien Exhaust", 100+5000, CARMODTYPE_EXHAUST },
	{ 1047, "Right Alien Sideskirt", 100+5000, CARMODTYPE_SIDESKIRT },
	{ 1048, "Right X-Flow Sideskirt", 100+5000, CARMODTYPE_SIDESKIRT },
	{ 1049, "Alien Spoiler", 100+5000, CARMODTYPE_SPOILER },
	{ 1050, "X-Flow Spoiler", 100+5000, CARMODTYPE_SPOILER },
	{ 1051, "Left Alien Sideskirt", 100+5000, CARMODTYPE_SPOILER },
	{ 1052, "Left X-Flow Sideskirt", 100+5000, CARMODTYPE_SPOILER },
	{ 1053, "X-Flow Roof", 100+5000, CARMODTYPE_ROOF },
	{ 1054, "Alien Roof", 100+5000, CARMODTYPE_ROOF },
	{ 1055, "Alien Roof", 100+5000, CARMODTYPE_ROOF },
	{ 1056, "Right Alien Sideskirt", 100+5000, CARMODTYPE_SIDESKIRT },
	{ 1057, "Right X-Flow Sideskirt", 100+5000, CARMODTYPE_SIDESKIRT },
	{ 1058, "Alien Spoiler", 100+5000, CARMODTYPE_SPOILER },
	{ 1059, "X-Flow Exhaust", 100+5000, CARMODTYPE_EXHAUST },
	{ 1060, "X-Flow Spoiler", 100+5000, CARMODTYPE_SPOILER },
	{ 1061, "X-Flow Roof", 100+5000, CARMODTYPE_ROOF },
	{ 1062, "Left Alien Sideskirt", 100+5000, CARMODTYPE_SIDESKIRT },
	{ 1063, "Left X-Flow Sideskirt", 100+5000, CARMODTYPE_SIDESKIRT },
	{ 1064, "Alien Exhaust", 100+5000, CARMODTYPE_EXHAUST },
	{ 1065, "Alien Exhaust", 100+5000, CARMODTYPE_EXHAUST },
	{ 1066, "X-Flow Exhaust", 100+5000, CARMODTYPE_EXHAUST },
	{ 1067, "Alien Roof", 100+5000, CARMODTYPE_ROOF },
	{ 1068, "X-Flow Roof", 100+5000, CARMODTYPE_ROOF },
	{ 1069, "Right Alien Sideskirt", 100+5000, CARMODTYPE_SIDESKIRT },
	{ 1070, "Right X-Flow Sideskirt", 100+5000, CARMODTYPE_SIDESKIRT },
	{ 1071, "Left Alien Sideskirt", 100+5000, CARMODTYPE_SIDESKIRT },
	{ 1072, "Left X-Flow Sideskirt", 100+5000, CARMODTYPE_SIDESKIRT },
	{ 1073, "Shadow Wheels", 4000+5000, CARMODTYPE_WHEELS },
	{ 1074, "Mega Wheels", 4000+5000, CARMODTYPE_WHEELS },
	{ 1075, "Rimshine Wheels", 4000+5000, CARMODTYPE_WHEELS },
	{ 1076, "Wires Wheels", 4000+5000, CARMODTYPE_WHEELS },
	{ 1077, "Classic Wheels", 4000+5000, CARMODTYPE_WHEELS },
	{ 1078, "Twist Wheels", 4000+5000, CARMODTYPE_WHEELS },
	{ 1079, "Cutter Wheels", 4000+5000, CARMODTYPE_WHEELS },
	{ 1080, "Switch Wheels", 4000+5000, CARMODTYPE_WHEELS },
	{ 1081, "Grove Wheels", 4000+5000, CARMODTYPE_WHEELS },
	{ 1082, "Import Wheels", 4000+5000, CARMODTYPE_WHEELS },
	{ 1083, "Dollar Wheels", 4000+5000, CARMODTYPE_WHEELS },
	{ 1084, "Trance Wheels", 4000+5000, CARMODTYPE_WHEELS },
	{ 1085, "Atomic Wheels", 4000+5000, CARMODTYPE_WHEELS },
	{ 1086, "Stereo Wheels", 4000+5000, CARMODTYPE_STEREO },
	{ 1087, "Hydraulics", 100+5000, CARMODTYPE_HYDRAULICS },
	{ 1088, "Alien Roof", 100+5000, CARMODTYPE_ROOF },
	{ 1089, "X-Flow Exhaust", 100+5000, CARMODTYPE_EXHAUST },
	{ 1090, "Right Alien Sideskirt", 100+5000, CARMODTYPE_SIDESKIRT },
	{ 1091, "X-Flow Roof", 100+5000, CARMODTYPE_ROOF },
	{ 1092, "Alien Exhaust", 100+5000, CARMODTYPE_EXHAUST },
	{ 1093, "Right X-Flow Sideskirt", 100+5000, CARMODTYPE_SIDESKIRT },
	{ 1094, "Left Alien Sideskirt", 100+5000, CARMODTYPE_SIDESKIRT },
	{ 1095, "Right X-Flow Sideskirt", 100+5000, CARMODTYPE_SIDESKIRT },
	{ 1096, "Ahab Wheels", 4000+5000, CARMODTYPE_WHEELS },
	{ 1097, "Virtual Wheels", 4000+5000, CARMODTYPE_WHEELS },
	{ 1098, "Access Wheels", 4000+5000, CARMODTYPE_WHEELS },
	{ 1099, "Left Chrome Sideskirt", 100+5000, CARMODTYPE_SIDESKIRT },
	{ 1100+5000, "Chrome Grill", 100+5000, -1 }, // Bullbar
	{ 1101, "Left `Chrome Flames` Sideskirt", 100+5000, CARMODTYPE_SIDESKIRT },
	{ 1102, "Left `Chrome Strip` Sideskirt", 100+5000, CARMODTYPE_SIDESKIRT },
	{ 1103, "Covertible Roof", 100+5000, CARMODTYPE_ROOF },
	{ 1104, "Chrome Exhaust", 100+5000, CARMODTYPE_EXHAUST },
	{ 1105, "Slamin Exhaust", 100+5000, CARMODTYPE_EXHAUST },
	{ 1106, "Right `Chrome Arches`", 100+5000, CARMODTYPE_SIDESKIRT },
	{ 1107, "Left `Chrome Strip` Sideskirt", 100+5000, CARMODTYPE_SIDESKIRT },
	{ 1108, "Right `Chrome Strip` Sideskirt", 100+5000, CARMODTYPE_SIDESKIRT },
	{ 1109, "Chrome", 100+5000, -1 }, // Bullbar
	{ 1110, "Slamin", 100+5000, -1 }, // Bullbar
	{ 1111, "Little Sign?", 100+5000, -1 }, // sig
	{ 1112, "Little Sign?", 100+5000, -1 }, // sig
	{ 1113, "Chrome Exhaust", 100+5000, CARMODTYPE_EXHAUST },
	{ 1114, "Slamin Exhaust", 100+5000, CARMODTYPE_EXHAUST },
	{ 1115, "Chrome", 100+5000, -1 }, // Bullbar
	{ 1116, "Slamin", 100+5000, -1 }, // Bullbar
	{ 1117, "Chrome Front Bumper", 100+5000, CARMODTYPE_FRONT_BUMPER },
	{ 1118, "Right `Chrome Trim` Sideskirt", 100+5000, CARMODTYPE_SIDESKIRT },
	{ 1119, "Right `Wheelcovers` Sideskirt", 100+5000, CARMODTYPE_SIDESKIRT },
	{ 1120, "Left `Chrome Trim` Sideskirt", 100+5000, CARMODTYPE_SIDESKIRT },
	{ 1121, "Left `Wheelcovers` Sideskirt", 100+5000, CARMODTYPE_SIDESKIRT },
	{ 1122, "Right `Chrome Flames` Sideskirt", 100+5000, CARMODTYPE_SIDESKIRT },
	{ 1123, "Bullbar Chrome Bars", 100+5000, -1 }, // Bullbar
	{ 1124, "Left `Chrome Arches` Sideskirt", 100+5000, CARMODTYPE_SIDESKIRT },
	{ 1125, "Bullbar Chrome Lights", 100+5000, -1 }, // Bullbar
	{ 1126, "Chrome Exhaust", 100+5000, CARMODTYPE_EXHAUST },
	{ 1127, "Slamin Exhaust", 100+5000, CARMODTYPE_EXHAUST },
	{ 1128, "Vinyl Hardtop", 100+5000, CARMODTYPE_ROOF },
	{ 1129, "Chrome Exhaust", 100+5000, CARMODTYPE_EXHAUST },
	{ 1130, "Hardtop Roof", 100+5000, CARMODTYPE_ROOF },
	{ 1131, "Softtop Roof", 100+5000, CARMODTYPE_ROOF },
	{ 1132, "Slamin Exhaust", 100+5000, CARMODTYPE_EXHAUST },
	{ 1133, "Right `Chrome Strip` Sideskirt", 100+5000, CARMODTYPE_SIDESKIRT },
	{ 1134, "Right `Chrome Strip` Sideskirt", 100+5000, CARMODTYPE_SIDESKIRT },
	{ 1135, "Slamin Exhaust", 100+5000, CARMODTYPE_EXHAUST },
	{ 1136, "Chrome Exhaust", 100+5000, CARMODTYPE_EXHAUST },
	{ 1137, "Left `Chrome Strip` Sideskirt", 100+5000, CARMODTYPE_SIDESKIRT },
	{ 1138, "Alien Spoiler", 100+5000, CARMODTYPE_SPOILER },
	{ 1139, "X-Flow Spoiler", 100+5000, CARMODTYPE_SPOILER },
	{ 1140, "X-Flow Rear Bumper", 100+5000, CARMODTYPE_REAR_BUMPER },
	{ 1141, "Alien Rear Bumper", 100+5000, CARMODTYPE_REAR_BUMPER },
	{ 1142, "Left Oval Vents", 100+5000, CARMODTYPE_VENT_LEFT },
	{ 1143, "Right Oval Vents", 100+5000, CARMODTYPE_VENT_RIGHT },
	{ 1144, "Left Square Vents", 100+5000, CARMODTYPE_VENT_LEFT },
	{ 1145, "Right Square Vents", 100+5000, CARMODTYPE_VENT_RIGHT },
	{ 1146, "X-Flow Spoiler", 100+5000, CARMODTYPE_SPOILER },
	{ 1147, "Alien Spoiler", 100+5000, CARMODTYPE_SPOILER },
	{ 1148, "X-Flow Rear Bumper", 100+5000, CARMODTYPE_REAR_BUMPER },
	{ 1149, "Alien Rear Bumper", 100+5000, CARMODTYPE_REAR_BUMPER },
	{ 1150, "Alien Rear Bumper", 100+5000, CARMODTYPE_REAR_BUMPER },
	{ 1151, "X-Flow Rear Bumper", 100+5000, CARMODTYPE_REAR_BUMPER },
	{ 1152, "X-Flow Front Bumper", 100+5000, CARMODTYPE_FRONT_BUMPER },
	{ 1153, "Alien Front Bumper", 100+5000, CARMODTYPE_FRONT_BUMPER },
	{ 1154, "Alien Rear Bumper", 100+5000, CARMODTYPE_REAR_BUMPER },
	{ 1155, "Alien Front Bumper", 100+5000, CARMODTYPE_FRONT_BUMPER },
	{ 1156, "X-Flow Rear Bumper", 100+5000, CARMODTYPE_REAR_BUMPER },
	{ 1157, "X-Flow Front Bumper", 100+5000, CARMODTYPE_FRONT_BUMPER },
	{ 1158, "X-Flow Spoiler", 100+5000, CARMODTYPE_SPOILER },
	{ 1159, "Alien Rear Bumper", 100+5000, CARMODTYPE_REAR_BUMPER },
	{ 1160, "Alien Front Bumper", 100+5000, CARMODTYPE_FRONT_BUMPER },
	{ 1161, "X-Flow Rear Bumper", 100+5000, CARMODTYPE_REAR_BUMPER },
	{ 1162, "Alien Spoiler", 100+5000, CARMODTYPE_SPOILER },
	{ 1163, "X-Flow Spoiler", 100+5000, CARMODTYPE_SPOILER },
	{ 1164, "Alien Spoiler", 100+5000, CARMODTYPE_SPOILER },
	{ 1165, "X-Flow Front Bumper", 100+5000, CARMODTYPE_FRONT_BUMPER },
	{ 1166, "Alien Front Bumper", 100+5000, CARMODTYPE_FRONT_BUMPER },
	{ 1167, "X-Flow Rear Bumper", 100+5000, CARMODTYPE_REAR_BUMPER },
	{ 1168, "Alien Rear Bumper", 100+5000, CARMODTYPE_REAR_BUMPER },
	{ 1169, "Alien Front Bumper", 100+5000, CARMODTYPE_FRONT_BUMPER },
	{ 1170, "X-Flow Front Bumper", 100+5000, CARMODTYPE_FRONT_BUMPER },
	{ 1171, "Alien Front Bumper", 100+5000, CARMODTYPE_FRONT_BUMPER },
	{ 1172, "X-Flow Front Bumper", 100+5000, CARMODTYPE_FRONT_BUMPER },
	{ 1173, "X-Flow Front Bumper", 100+5000, CARMODTYPE_FRONT_BUMPER },
	{ 1174, "Chrome Front Bumper", 100+5000, CARMODTYPE_FRONT_BUMPER },
	{ 1175, "Slamin Front Bumper", 100+5000, CARMODTYPE_FRONT_BUMPER },
	{ 1176, "Chrome Rear Bumper", 100+5000, CARMODTYPE_REAR_BUMPER },
	{ 1177, "Slamin Rear Bumper", 100+5000, CARMODTYPE_REAR_BUMPER },
	{ 1178, "Slamin Rear Bumper", 100+5000, CARMODTYPE_REAR_BUMPER },
	{ 1179, "Chrome Front Bumper", 100+5000, CARMODTYPE_FRONT_BUMPER },
	{ 1180, "Chrome Rear Bumper", 100+5000, CARMODTYPE_REAR_BUMPER },
	{ 1181, "Slamin Front Bumper", 100+5000, CARMODTYPE_FRONT_BUMPER },
	{ 1182, "Chrome Front Bumper", 100+5000, CARMODTYPE_FRONT_BUMPER },
	{ 1183, "Slamin Rear Bumper", 100+5000, CARMODTYPE_REAR_BUMPER },
	{ 1184, "Chrome Rear Bumper", 100+5000, CARMODTYPE_REAR_BUMPER },
	{ 1185, "Slamin Front Bumper", 100+5000, CARMODTYPE_FRONT_BUMPER },
	{ 1186, "Slamin Rear Bumper", 100+5000, CARMODTYPE_REAR_BUMPER },
	{ 1187, "Chrome Rear Bumper", 100+5000, CARMODTYPE_REAR_BUMPER },
	{ 1188, "Slamin Front Bumper", 100+5000, CARMODTYPE_FRONT_BUMPER },
	{ 1189, "Chrome Front Bumper", 100+5000, CARMODTYPE_FRONT_BUMPER },
	{ 1190, "Slamin Front Bumper", 100+5000, CARMODTYPE_FRONT_BUMPER },
	{ 1191, "Chrome Front Bumper", 100+5000, CARMODTYPE_FRONT_BUMPER },
	{ 1192, "Chrome Rear Bumper", 100+5000, CARMODTYPE_REAR_BUMPER },
	{ 1193, "Slamin Rear Bumper", 100+5000, CARMODTYPE_REAR_BUMPER }
};


enum tpi {
	tID,
	tType,
	bool:tPaintjob,
	PJColor[ 2 ]
};
new TPInfo[ MAX_PLAYERS ][ tpi ];

new globalstring[ 128 ];

// --------------------------------------------------------->

SetVehiclePaintjob(vehicleid, paintjobid)
{
    new id = carData[vehicleid][carID], query[256];

	if (id != -1)
	{
	    carData[id][carPaintjob] = paintjobid;

		mysql_format(g_SQL, query, sizeof(query), "UPDATE vehicles SET carPaintjob = %d WHERE carID = %d", paintjobid, carData[vehicleid][carID]);
	    mysql_tquery(g_SQL, query);
	}
	return ChangeVehiclePaintjob(vehicleid, paintjobid);
}

//=================================[ Functions ]=================================
stock CreatePlayerTextDraws( playerid ) {

	TuningBuy[playerid][0] = CreatePlayerTextDraw(playerid, 315.000000, 359.000000, "_");
	PlayerTextDrawFont(playerid, TuningBuy[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, TuningBuy[playerid][0], 0.600000, 5.300003);
	PlayerTextDrawTextSize(playerid, TuningBuy[playerid][0], 298.500000, 145.000000);
	PlayerTextDrawSetOutline(playerid, TuningBuy[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, TuningBuy[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, TuningBuy[playerid][0], 2);
	PlayerTextDrawColor(playerid, TuningBuy[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, TuningBuy[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, TuningBuy[playerid][0], 135);
	PlayerTextDrawUseBox(playerid, TuningBuy[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, TuningBuy[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, TuningBuy[playerid][0], 0);

	TuningBuy[playerid][1] = CreatePlayerTextDraw(playerid, 241.000000, 350.000000, "Car Tuning");
	PlayerTextDrawFont(playerid, TuningBuy[playerid][1], 3);
	PlayerTextDrawLetterSize(playerid, TuningBuy[playerid][1], 0.350000, 1.500000);
	PlayerTextDrawTextSize(playerid, TuningBuy[playerid][1], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TuningBuy[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, TuningBuy[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, TuningBuy[playerid][1], 1);
	PlayerTextDrawColor(playerid, TuningBuy[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, TuningBuy[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, TuningBuy[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, TuningBuy[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid, TuningBuy[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, TuningBuy[playerid][1], 0);

	TuningBuy[playerid][2] = CreatePlayerTextDraw(playerid, 385.000000, 353.000000, "X");
	PlayerTextDrawFont(playerid, TuningBuy[playerid][2], 3);
	PlayerTextDrawLetterSize(playerid, TuningBuy[playerid][2], 0.350000, 1.000000);
	PlayerTextDrawTextSize(playerid, TuningBuy[playerid][2], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TuningBuy[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, TuningBuy[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, TuningBuy[playerid][2], 1);
	PlayerTextDrawColor(playerid, TuningBuy[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, TuningBuy[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, TuningBuy[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, TuningBuy[playerid][2], 0);
	PlayerTextDrawSetProportional(playerid, TuningBuy[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, TuningBuy[playerid][2], 1);

	TuningBuy[playerid][3] = CreatePlayerTextDraw(playerid, 253.000000, 370.000000, "Rear Bumper");
	PlayerTextDrawFont(playerid, TuningBuy[playerid][3], 1);
	PlayerTextDrawLetterSize(playerid, TuningBuy[playerid][3], 0.333333, 1.350000);
	PlayerTextDrawTextSize(playerid, TuningBuy[playerid][3], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TuningBuy[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, TuningBuy[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, TuningBuy[playerid][3], 1);
	PlayerTextDrawColor(playerid, TuningBuy[playerid][3], 9109759);
	PlayerTextDrawBackgroundColor(playerid, TuningBuy[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, TuningBuy[playerid][3], 50);
	PlayerTextDrawUseBox(playerid, TuningBuy[playerid][3], 0);
	PlayerTextDrawSetProportional(playerid, TuningBuy[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, TuningBuy[playerid][3], 0);

	TuningBuy[playerid][4] = CreatePlayerTextDraw(playerid, 254.000000, 382.000000, "Price: ~g~$500");
	PlayerTextDrawFont(playerid, TuningBuy[playerid][4], 2);
	PlayerTextDrawLetterSize(playerid, TuningBuy[playerid][4], 0.191666, 1.050000);
	PlayerTextDrawTextSize(playerid, TuningBuy[playerid][4], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TuningBuy[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, TuningBuy[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, TuningBuy[playerid][4], 1);
	PlayerTextDrawColor(playerid, TuningBuy[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, TuningBuy[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, TuningBuy[playerid][4], 50);
	PlayerTextDrawUseBox(playerid, TuningBuy[playerid][4], 0);
	PlayerTextDrawSetProportional(playerid, TuningBuy[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, TuningBuy[playerid][4], 0);

	TuningBuy[playerid][5] = CreatePlayerTextDraw(playerid, 254.000000, 392.000000, "Click 'buy' to add components");
	PlayerTextDrawFont(playerid, TuningBuy[playerid][5], 2);
	PlayerTextDrawLetterSize(playerid, TuningBuy[playerid][5], 0.150000, 0.850000);
	PlayerTextDrawTextSize(playerid, TuningBuy[playerid][5], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TuningBuy[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, TuningBuy[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, TuningBuy[playerid][5], 1);
	PlayerTextDrawColor(playerid, TuningBuy[playerid][5], -1);
	PlayerTextDrawBackgroundColor(playerid, TuningBuy[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, TuningBuy[playerid][5], 50);
	PlayerTextDrawUseBox(playerid, TuningBuy[playerid][5], 0);
	PlayerTextDrawSetProportional(playerid, TuningBuy[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, TuningBuy[playerid][5], 0);

	TuningBuy[playerid][6] = CreatePlayerTextDraw(playerid, 419.000000, 359.000000, "_");
	PlayerTextDrawFont(playerid, TuningBuy[playerid][6], 1);
	PlayerTextDrawLetterSize(playerid, TuningBuy[playerid][6], 0.600000, 1.300003);
	PlayerTextDrawTextSize(playerid, TuningBuy[playerid][6], 298.500000, 35.000000);
	PlayerTextDrawSetOutline(playerid, TuningBuy[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, TuningBuy[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, TuningBuy[playerid][6], 2);
	PlayerTextDrawColor(playerid, TuningBuy[playerid][6], -1);
	PlayerTextDrawBackgroundColor(playerid, TuningBuy[playerid][6], 255);
	PlayerTextDrawBoxColor(playerid, TuningBuy[playerid][6], 9109639);
	PlayerTextDrawUseBox(playerid, TuningBuy[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, TuningBuy[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, TuningBuy[playerid][6], 0);

	TuningBuy[playerid][7] = CreatePlayerTextDraw(playerid, 409.000000, 358.000000, "BUY");
	PlayerTextDrawFont(playerid, TuningBuy[playerid][7], 2);
	PlayerTextDrawLetterSize(playerid, TuningBuy[playerid][7], 0.241666, 1.250000);
	PlayerTextDrawTextSize(playerid, TuningBuy[playerid][7], 450.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TuningBuy[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, TuningBuy[playerid][7], 0);
	PlayerTextDrawAlignment(playerid, TuningBuy[playerid][7], 1);
	PlayerTextDrawColor(playerid, TuningBuy[playerid][7], -1);
	PlayerTextDrawBackgroundColor(playerid, TuningBuy[playerid][7], 255);
	PlayerTextDrawBoxColor(playerid, TuningBuy[playerid][7], 50);
	PlayerTextDrawUseBox(playerid, TuningBuy[playerid][7], 0);
	PlayerTextDrawSetProportional(playerid, TuningBuy[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, TuningBuy[playerid][7], 1);

	TuningBuy[playerid][8] = CreatePlayerTextDraw(playerid, 419.000000, 379.000000, "_");
	PlayerTextDrawFont(playerid, TuningBuy[playerid][8], 1);
	PlayerTextDrawLetterSize(playerid, TuningBuy[playerid][8], 0.600000, 0.800003);
	PlayerTextDrawTextSize(playerid, TuningBuy[playerid][8], 298.500000, 35.000000);
	PlayerTextDrawSetOutline(playerid, TuningBuy[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, TuningBuy[playerid][8], 0);
	PlayerTextDrawAlignment(playerid, TuningBuy[playerid][8], 2);
	PlayerTextDrawColor(playerid, TuningBuy[playerid][8], -1);
	PlayerTextDrawBackgroundColor(playerid, TuningBuy[playerid][8], 255);
	PlayerTextDrawBoxColor(playerid, TuningBuy[playerid][8], -121);
	PlayerTextDrawUseBox(playerid, TuningBuy[playerid][8], 1);
	PlayerTextDrawSetProportional(playerid, TuningBuy[playerid][8], 1);
	PlayerTextDrawSetSelectable(playerid, TuningBuy[playerid][8], 0);

	TuningBuy[playerid][9] = CreatePlayerTextDraw(playerid, 419.000000, 394.000000, "_");
	PlayerTextDrawFont(playerid, TuningBuy[playerid][9], 1);
	PlayerTextDrawLetterSize(playerid, TuningBuy[playerid][9], 0.600000, 0.800003);
	PlayerTextDrawTextSize(playerid, TuningBuy[playerid][9], 298.500000, 35.000000);
	PlayerTextDrawSetOutline(playerid, TuningBuy[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, TuningBuy[playerid][9], 0);
	PlayerTextDrawAlignment(playerid, TuningBuy[playerid][9], 2);
	PlayerTextDrawColor(playerid, TuningBuy[playerid][9], -1);
	PlayerTextDrawBackgroundColor(playerid, TuningBuy[playerid][9], 255);
	PlayerTextDrawBoxColor(playerid, TuningBuy[playerid][9], -121);
	PlayerTextDrawUseBox(playerid, TuningBuy[playerid][9], 1);
	PlayerTextDrawSetProportional(playerid, TuningBuy[playerid][9], 1);
	PlayerTextDrawSetSelectable(playerid, TuningBuy[playerid][9], 0);

	TuningBuy[playerid][10] = CreatePlayerTextDraw(playerid, 415.000000, 377.000000, ">");
	PlayerTextDrawFont(playerid, TuningBuy[playerid][10], 3);
	PlayerTextDrawLetterSize(playerid, TuningBuy[playerid][10], 0.287500, 1.100000);
	PlayerTextDrawTextSize(playerid, TuningBuy[playerid][10], 430.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TuningBuy[playerid][10], 1);
	PlayerTextDrawSetShadow(playerid, TuningBuy[playerid][10], 0);
	PlayerTextDrawAlignment(playerid, TuningBuy[playerid][10], 1);
	PlayerTextDrawColor(playerid, TuningBuy[playerid][10], -1);
	PlayerTextDrawBackgroundColor(playerid, TuningBuy[playerid][10], 255);
	PlayerTextDrawBoxColor(playerid, TuningBuy[playerid][10], 50);
	PlayerTextDrawUseBox(playerid, TuningBuy[playerid][10], 0);
	PlayerTextDrawSetProportional(playerid, TuningBuy[playerid][10], 1);
	PlayerTextDrawSetSelectable(playerid, TuningBuy[playerid][10], 1);

	TuningBuy[playerid][11] = CreatePlayerTextDraw(playerid, 415.000000, 392.000000, "<");
	PlayerTextDrawFont(playerid, TuningBuy[playerid][11], 3);
	PlayerTextDrawLetterSize(playerid, TuningBuy[playerid][11], 0.287500, 1.100000);
	PlayerTextDrawTextSize(playerid, TuningBuy[playerid][11], 430.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TuningBuy[playerid][11], 1);
	PlayerTextDrawSetShadow(playerid, TuningBuy[playerid][11], 0);
	PlayerTextDrawAlignment(playerid, TuningBuy[playerid][11], 1);
	PlayerTextDrawColor(playerid, TuningBuy[playerid][11], -1);
	PlayerTextDrawBackgroundColor(playerid, TuningBuy[playerid][11], 255);
	PlayerTextDrawBoxColor(playerid, TuningBuy[playerid][11], 50);
	PlayerTextDrawUseBox(playerid, TuningBuy[playerid][11], 0);
	PlayerTextDrawSetProportional(playerid, TuningBuy[playerid][11], 1);
	PlayerTextDrawSetSelectable(playerid, TuningBuy[playerid][11], 1);
}

//==============================================================================
stock SetTune( vehicleid ) {
    if( VehicleInfo[ vehicleid ][ vTuned ] ) {
	    if( VehicleInfo[ vehicleid ][ vPaintJob ] != 255 ) ChangeVehiclePaintjob( vehicleid, VehicleInfo[ vehicleid ][ vPaintJob ] );
		if( VehicleInfo[ vehicleid ][ vSpoiler ] != -1 ) AddVehicleComponent( vehicleid, VehicleInfo[ vehicleid ][ vSpoiler ] );
		if( VehicleInfo[ vehicleid ][ vHood ] != -1 ) AddVehicleComponent( vehicleid, VehicleInfo[ vehicleid ][ vHood ] );
		if( VehicleInfo[ vehicleid ][ vRoof ] != -1 ) AddVehicleComponent( vehicleid, VehicleInfo[ vehicleid ][ vRoof ] );
		if( VehicleInfo[ vehicleid ][ vSkirt ] != -1 ) AddVehicleComponent( vehicleid, VehicleInfo[ vehicleid ][ vSkirt ] );
		if( VehicleInfo[ vehicleid ][ vLamps ] != -1 ) AddVehicleComponent( vehicleid, VehicleInfo[ vehicleid ][ vLamps ] );
		if( VehicleInfo[ vehicleid ][ vNitro ] != -1 ) AddVehicleComponent( vehicleid, VehicleInfo[ vehicleid ][ vNitro ] );
		if( VehicleInfo[ vehicleid ][ vExhaust ] != -1 ) AddVehicleComponent( vehicleid, VehicleInfo[ vehicleid ][ vWheels ] );
		if( VehicleInfo[ vehicleid ][ vWheels ] != -1 ) AddVehicleComponent( vehicleid, VehicleInfo[ vehicleid ][ vWheels ] );
		if( VehicleInfo[ vehicleid ][ vStereo ] != -1 ) AddVehicleComponent( vehicleid, VehicleInfo[ vehicleid ][ vStereo ] );
		if( VehicleInfo[ vehicleid ][ vHydraulics ] != -1 ) AddVehicleComponent( vehicleid, VehicleInfo[ vehicleid ][ vHydraulics ] );
		if( VehicleInfo[ vehicleid ][ vFrontBumper ] != -1 ) AddVehicleComponent( vehicleid, VehicleInfo[ vehicleid ][ vFrontBumper ] );
		if( VehicleInfo[ vehicleid ][ vRearBumper ] != -1 ) AddVehicleComponent( vehicleid, VehicleInfo[ vehicleid ][ vRearBumper ] );
		if( VehicleInfo[ vehicleid ][ vRightVent ] != -1 ) AddVehicleComponent( vehicleid, VehicleInfo[ vehicleid ][ vRightVent ] );
		if( VehicleInfo[ vehicleid ][ vLeftVent ] != -1 ) AddVehicleComponent( vehicleid, VehicleInfo[ vehicleid ][ vLeftVent ] );
    }
}
//==============================================================================
stock AddComponentToVehicle( vehicleid, componentid ) {
	if( VehicleInfo[ vehicleid ][ vTuned ] ) {
		if( GetVehicleComponentType( componentid ) == CARMODTYPE_SPOILER ) {
		    VehicleInfo[ vehicleid ][ vSpoiler ] = componentid;
			if( VehicleInfo[ vehicleid ][ vSpoiler ] != -1 ) AddVehicleComponent( vehicleid, componentid );
		}
	    else if( GetVehicleComponentType( componentid ) == CARMODTYPE_HOOD ) {
		    VehicleInfo[ vehicleid ][ vHood ] = componentid;
			if( VehicleInfo[ vehicleid ][ vHood ] != -1 ) AddVehicleComponent( vehicleid, componentid );
		}
	    else if( GetVehicleComponentType( componentid ) == CARMODTYPE_ROOF ) {
		    VehicleInfo[ vehicleid ][ vRoof ] = componentid;
			if( VehicleInfo[ vehicleid ][ vRoof ] != -1 ) AddVehicleComponent( vehicleid, componentid );
		}
	    else if( GetVehicleComponentType( componentid ) == CARMODTYPE_SIDESKIRT ) {
		    VehicleInfo[ vehicleid ][ vSkirt ] = componentid;
			if( VehicleInfo[ vehicleid ][ vSkirt ] != -1 ) AddVehicleComponent( vehicleid, componentid );
		}
	    else if( GetVehicleComponentType( componentid ) == CARMODTYPE_LAMPS ) {
		    VehicleInfo[ vehicleid ][ vLamps ] = componentid;
			if( VehicleInfo[ vehicleid ][ vLamps ] != -1 ) AddVehicleComponent( vehicleid, componentid );
		}
	    else if( GetVehicleComponentType( componentid ) == CARMODTYPE_NITRO ) {
		    VehicleInfo[ vehicleid ][ vNitro ] = componentid;
			if( VehicleInfo[ vehicleid ][ vNitro ] != -1 ) AddVehicleComponent( vehicleid, componentid );
		}
	    else if( GetVehicleComponentType( componentid ) == CARMODTYPE_EXHAUST ) {
		    VehicleInfo[ vehicleid ][ vExhaust ] = componentid;
			if( VehicleInfo[ vehicleid ][ vExhaust ] != -1 ) AddVehicleComponent( vehicleid, componentid );
		}
	    else if( GetVehicleComponentType( componentid ) == CARMODTYPE_WHEELS ) {
		    VehicleInfo[ vehicleid ][ vWheels ] = componentid;
			if( VehicleInfo[ vehicleid ][ vWheels ] != -1 ) AddVehicleComponent( vehicleid, componentid );
		}
	    else if( GetVehicleComponentType( componentid ) == CARMODTYPE_STEREO ) {
		    VehicleInfo[ vehicleid ][ vStereo ] = componentid;
			if( VehicleInfo[ vehicleid ][ vStereo ] != -1 ) AddVehicleComponent( vehicleid, componentid );
		}
	    else if( GetVehicleComponentType( componentid ) == CARMODTYPE_HYDRAULICS ) {
		    VehicleInfo[ vehicleid ][ vHydraulics ] = componentid;
			if( VehicleInfo[ vehicleid ][ vHydraulics ] != -1 ) AddVehicleComponent( vehicleid, componentid );
		}
	    else if( GetVehicleComponentType( componentid ) == CARMODTYPE_FRONT_BUMPER ) {
		    VehicleInfo[ vehicleid ][ vFrontBumper ] = componentid;
			if( VehicleInfo[ vehicleid ][ vFrontBumper ] != -1 ) AddVehicleComponent( vehicleid, componentid );
		}
	    else if( GetVehicleComponentType( componentid ) == CARMODTYPE_REAR_BUMPER ) {
		    VehicleInfo[ vehicleid ][ vRearBumper ] = componentid;
			if( VehicleInfo[ vehicleid ][ vRearBumper ] != -1 ) AddVehicleComponent( vehicleid, componentid );
		}
	    else if( GetVehicleComponentType( componentid ) == CARMODTYPE_VENT_RIGHT ) {
		    VehicleInfo[ vehicleid ][ vRightVent ] = componentid;
			if( VehicleInfo[ vehicleid ][ vRightVent ] != -1 ) AddVehicleComponent( vehicleid, componentid );
		}
	    else if( GetVehicleComponentType( componentid ) == CARMODTYPE_VENT_LEFT ) {
		    VehicleInfo[ vehicleid ][ vLeftVent ] = componentid;
			if( VehicleInfo[ vehicleid ][ vLeftVent ] != -1 ) AddVehicleComponent( vehicleid, componentid );
		}
	}
}
//==============================================================================
stock IsComponentidCompatible( modelid, componentid ) {
    if( componentid == 1025 || componentid == 1073 || componentid == 1074 || componentid == 1075 || componentid == 1076 ||
		componentid == 1077 || componentid == 1078 || componentid == 1079 || componentid == 1080 || componentid == 1081 ||
        componentid == 1082 || componentid == 1083 || componentid == 1084 || componentid == 1085 || componentid == 1096 ||
        componentid == 1097 || componentid == 1098 || componentid == 1087 || componentid == 1086 ) {
        return componentid;
	}

    switch( modelid ) {
        case 400: if( componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1018 || componentid == 1013 || componentid == 1024 || componentid == 1008 || componentid == 1009 || componentid == 1010 ) return componentid;
        case 401: if( componentid == 1005 || componentid == 1004 || componentid == 1142 || componentid == 1143 || componentid == 1144 || componentid == 114 || componentid == 1020 || componentid == 1019 || componentid == 1013 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1001 || componentid == 1003 || componentid == 1017 || componentid == 1007) return componentid;
        case 402: if( componentid == 1009 || componentid == 1009 || componentid == 1010 ) return componentid;
        case 404: if( componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1013 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1002 || componentid == 1016 || componentid == 1000 || componentid == 1017 || componentid == 1007) return componentid;
        case 405: if( componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1001 || componentid == 1014 || componentid == 1023 || componentid == 1000) return componentid;
        case 409: if( componentid == 1009 ) return componentid;
        case 410: if( componentid == 1019 || componentid == 1021 || componentid == 1020 || componentid == 1013 || componentid == 1024 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1001 || componentid == 1023 || componentid == 1003 || componentid == 1017 || componentid == 1007) return componentid;
        case 411: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 412: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 415: if( componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1001 || componentid == 1023 || componentid == 1003 || componentid == 1017 || componentid == 1007) return componentid;
        case 418: if( componentid == 1020 || componentid == 1021 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1002 || componentid == 1016) return componentid;
        case 419: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 420: if( componentid == 1005 || componentid == 1004 || componentid == 1021 || componentid == 1019 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1001 || componentid == 1003) return componentid;
        case 421: if( componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1014 || componentid == 1023 || componentid == 1016 || componentid == 1000) return componentid;
        case 422: if( componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1013 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1017 || componentid == 1007) return componentid;
        case 426: if( componentid == 1005 || componentid == 1004 || componentid == 1021 || componentid == 1019 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1001 || componentid == 1003) return componentid;
        case 429: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 436: if( componentid == 1020 || componentid == 1021 || componentid == 1022 || componentid == 1019 || componentid == 1013 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1001 || componentid == 1003 || componentid == 1017 || componentid == 1007) return componentid;
        case 438: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 439: if( componentid == 1003 || componentid == 1023 || componentid == 1001 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1017 || componentid == 1007 || componentid == 1142 || componentid == 1143 || componentid == 1144 || componentid == 1145 || componentid == 1013) return componentid;
        case 442: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 445: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 451: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 458: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 466: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 467: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 474: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 475: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 477: if( componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1017 || componentid == 1007) return componentid;
        case 478: if( componentid == 1005 || componentid == 1004 || componentid == 1012 || componentid == 1020 || componentid == 1021 || componentid == 1022 || componentid == 1013 || componentid == 1024 || componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 479: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 480: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 489: if( componentid == 1005 || componentid == 1004 || componentid == 1020 || componentid == 1019 || componentid == 1018 || componentid == 1013 || componentid == 1024 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1002 || componentid == 1016 || componentid == 1000) return componentid;
        case 491: if( componentid == 1142 || componentid == 1143 || componentid == 1144 || componentid == 1145 || componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1014 || componentid == 1023 || componentid == 1003 || componentid == 1017 || componentid == 1007) return componentid;
        case 492: if( componentid == 1005 || componentid == 1004 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1016 || componentid == 1000) return componentid;
        case 496: if( componentid == 1006 || componentid == 1017 || componentid == 1007 || componentid == 1011 || componentid == 1019 || componentid == 1023 || componentid == 1001 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1003 || componentid == 1002 || componentid == 1142 || componentid == 1143 || componentid == 1020) return componentid;
        case 500: if( componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1013 || componentid == 1024 || componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 506: if( componentid == 1009) return componentid;
        case 507: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 516: if( componentid == 1004 || componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1002 || componentid == 1015 || componentid == 1016 || componentid == 1000 || componentid == 1017 || componentid == 1007) return componentid;
        case 517: if( componentid == 1142 || componentid == 1143 || componentid == 1144 || componentid == 1145 || componentid == 1020 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1002 || componentid == 1023 || componentid == 1016 || componentid == 1003 || componentid == 1017 || componentid == 1007) return componentid;
        case 518: if( componentid == 1005 || componentid == 1142 || componentid == 1143 || componentid == 1144 || componentid == 1145 || componentid == 1020 || componentid == 1018 || componentid == 1013 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1001 || componentid == 1023 || componentid == 1003 || componentid == 1017 || componentid == 1007) return componentid;
        case 526: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 527: if( componentid == 1021 || componentid == 1020 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1001 || componentid == 1014 || componentid == 1015 || componentid == 1017 || componentid == 1007) return componentid;
        case 529: if( componentid == 1012 || componentid == 1011 || componentid == 1020 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1001 || componentid == 1023 || componentid == 1003 || componentid == 1017 || componentid == 1007) return componentid;
        case 533: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 534: if( componentid == 1126 || componentid == 1127 || componentid == 1179 || componentid == 1185 || componentid == 1100 || componentid == 1123 || componentid == 1125 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1180 || componentid == 1178 || componentid == 1101 || componentid == 1122 || componentid == 1124 || componentid == 1106) return componentid;
        case 535: if( componentid == 1109 || componentid == 1110 || componentid == 1113 || componentid == 1114 || componentid == 1115 || componentid == 1116 || componentid == 1117 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1120 || componentid == 1118 || componentid == 1121 || componentid == 1119) return componentid;
        case 536: if( componentid == 1104 || componentid == 1105 || componentid == 1182 || componentid == 1181 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1184 || componentid == 1183 || componentid == 1128 || componentid == 1103 || componentid == 1107 || componentid == 1108) return componentid;
        case 540: if( componentid == 1004 || componentid == 1142 || componentid == 1143 || componentid == 1144 || componentid == 1145 || componentid == 1020 || componentid == 1019 || componentid == 1018 || componentid == 1024 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1001 || componentid == 1023 || componentid == 1017 || componentid == 1007) return componentid;
        case 541: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 542: if( componentid == 1144 || componentid == 1145 || componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1014 || componentid == 1015) return componentid;
        case 545: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 546: if( componentid == 1004 || componentid == 1142 || componentid == 1143 || componentid == 1144 || componentid == 1145 || componentid == 1019 || componentid == 1018 || componentid == 1024 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1002 || componentid == 1001 || componentid == 1023 || componentid == 1017 || componentid == 1007) return componentid;
        case 547: if( componentid == 1142 || componentid == 1143 || componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1016 || componentid == 1003 || componentid == 1000) return componentid;
        case 549: if( componentid == 1012 || componentid == 1011 || componentid == 1142 || componentid == 1143 || componentid == 1144 || componentid == 1145 || componentid == 1020 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1001 || componentid == 1023 || componentid == 1003 || componentid == 1017 || componentid == 1007) return componentid;
        case 550: if( componentid == 1005 || componentid == 1004 || componentid == 1142 || componentid == 1143 || componentid == 1144 || componentid == 1145 || componentid == 1020 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1001 || componentid == 1023 || componentid == 1003) return componentid;
        case 551: if( componentid == 1005 || componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1002 || componentid == 1023 || componentid == 1016 || componentid == 1003) return componentid;
        case 555: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 558: if( componentid == 1092 || componentid == 1089 || componentid == 1166 || componentid == 1165 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1168 || componentid == 1167 || componentid == 1088 || componentid == 1091 || componentid == 1164 || componentid == 1163 || componentid == 1094 || componentid == 1090 || componentid == 1095 || componentid == 1093) return componentid;
        case 559: if( componentid == 1065 || componentid == 1066 || componentid == 1160 || componentid == 1173 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1159 || componentid == 1161 || componentid == 1162 || componentid == 1158 || componentid == 1067 || componentid == 1068 || componentid == 1071 || componentid == 1069 || componentid == 1072 || componentid == 1070 || componentid == 1009) return componentid;
        case 560: if( componentid == 1028 || componentid == 1029 || componentid == 1169 || componentid == 1170 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1141 || componentid == 1140 || componentid == 1032 || componentid == 1033 || componentid == 1138 || componentid == 1139 || componentid == 1027 || componentid == 1026 || componentid == 1030 || componentid == 1031) return componentid;
        case 561: if( componentid == 1064 || componentid == 1059 || componentid == 1155 || componentid == 1157 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1154 || componentid == 1156 || componentid == 1055 || componentid == 1061 || componentid == 1058 || componentid == 1060 || componentid == 1062 || componentid == 1056 || componentid == 1063 || componentid == 1057) return componentid;
        case 562: if( componentid == 1034 || componentid == 1037 || componentid == 1171 || componentid == 1172 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1149 || componentid == 1148 || componentid == 1038 || componentid == 1035 || componentid == 1147 || componentid == 1146 || componentid == 1040 || componentid == 1036 || componentid == 1041 || componentid == 1039) return componentid;
        case 565: if( componentid == 1046 || componentid == 1045 || componentid == 1153 || componentid == 1152 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1150 || componentid == 1151 || componentid == 1054 || componentid == 1053 || componentid == 1049 || componentid == 1050 || componentid == 1051 || componentid == 1047 || componentid == 1052 || componentid == 1048) return componentid;
        case 566: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 567: if( componentid == 1129 || componentid == 1132 || componentid == 1189 || componentid == 1188 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1187 || componentid == 1186 || componentid == 1130 || componentid == 1131 || componentid == 1102 || componentid == 1133) return componentid;
        case 575: if( componentid == 1044 || componentid == 1043 || componentid == 1174 || componentid == 1175 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1176 || componentid == 1177 || componentid == 1099 || componentid == 1042) return componentid;
        case 576: if( componentid == 1136 || componentid == 1135 || componentid == 1191 || componentid == 1190 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1192 || componentid == 1193 || componentid == 1137 || componentid == 1134) return componentid;
        case 579: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 580: if( componentid == 1020 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1001 || componentid == 1023 || componentid == 1017 || componentid == 1007) return componentid;
        case 585: if( componentid == 1142 || componentid == 1143 || componentid == 1144 || componentid == 1145 || componentid == 1020 || componentid == 1019 || componentid == 1018 || componentid == 1013 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1001 || componentid == 1023 || componentid == 1003 || componentid == 1017 || componentid == 1007) return componentid;
        case 587: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 589: if( componentid == 1005 || componentid == 1004 || componentid == 1144 || componentid == 1145 || componentid == 1020 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1024 || componentid == 1013 || componentid == 1006 || componentid == 1016 || componentid == 1000 || componentid == 1017 || componentid == 1007) return componentid;
        case 600: if( componentid == 1005 || componentid == 1004 || componentid == 1020 || componentid == 1022 || componentid == 1018 || componentid == 1013 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1017 || componentid == 1007) return componentid;
        case 602: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 603: if( componentid == 1144 || componentid == 1145 || componentid == 1142 || componentid == 1143 || componentid == 1020 || componentid == 1019 || componentid == 1018 || componentid == 1024 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1001 || componentid == 1023 || componentid == 1017 || componentid == 1007) return componentid;
    }
    return false;
}
//==============================================================================
stock GetVehicleCameraPos( vehicleid, &Float:x, &Float:y, &Float:z, Float:xoff=0.0, Float:yoff=0.0, Float:zoff=0.0 ) { // credits Pasha
    new Float:rot;
    GetVehicleZAngle( vehicleid, rot );
    rot = 360 - rot;
    GetVehiclePos( vehicleid, x, y, z );
    x = floatsin( rot, degrees ) * yoff + floatcos( rot, degrees ) * xoff + x;
    y = floatcos( rot, degrees ) * yoff - floatsin( rot, degrees ) * xoff + y;
    z = zoff + z;
}
//==============================================================================
stock TuningTDControl( playerid, bool:show ) {
	if( show == true ) {
        for( new i = 0; i < 12; i ++ ) {
			PlayerTextDrawShow( playerid, TuningBuy[ playerid ][ i ] );
		}

	}
	else if( show == false ) {
		for( new i = 0; i < 12; i ++ ) {
			PlayerTextDrawHide( playerid, TuningBuy[ playerid ][ i ]);
		}
	}
}
//==============================================================================
/*ResetTuningInfo( playerid ) {
	TPInfo[ playerid ][ tID ] = -1;
	TPInfo[ playerid ][ tType ] = -1;
	TPInfo[ playerid ][ tPaintjob ] = false;
	TPInfo[ playerid ][ PJColor ] = -1;
	TPInfo[ playerid ][ PJColor ] = -1;
}*/
//==============================================================================
stock ResetTuning( vehid ) {
	if( VehicleInfo[ vehid ][ vTuned ] ) {
	    VehicleInfo[ vehid ][ vTuned ] = false;
		VehicleInfo[ vehid ][ vSpoiler ] = -1;
		VehicleInfo[ vehid ][ vHood ] = -1;
		VehicleInfo[ vehid ][ vRoof ] = -1;
		VehicleInfo[ vehid ][ vSkirt ] = -1;
		VehicleInfo[ vehid ][ vLamps ] = -1;
		VehicleInfo[ vehid ][ vNitro ] = -1;
		VehicleInfo[ vehid ][ vExhaust ] = -1;
		VehicleInfo[ vehid ][ vWheels ] = -1;
		VehicleInfo[ vehid ][ vStereo ] = -1;
		VehicleInfo[ vehid ][ vHydraulics ] = -1;
		VehicleInfo[ vehid ][ vFrontBumper ] = -1;
		VehicleInfo[ vehid ][ vRearBumper ] = -1;
		VehicleInfo[ vehid ][ vRightVent ] = -1;
		VehicleInfo[ vehid ][ vLeftVent ] = -1;
		VehicleInfo[ vehid ][ vPaintJob ] = 255;
	}
}
//==============================================================================
stock GetName( id ) {
	new ime[MAX_PLAYER_NAME];
 	GetPlayerName(id, ime, sizeof ime);
	return ime;
}
//==============================================================================
//==============================================================================
hook OnDialogResponse( playerid, dialogid, response, listitem, inputtext[] ) {

    if (dialogid == 0) { //
        if (response)
		{ //
		    if (playerData[playerid][pCoin] < 150)
		        return SendClientMessage(playerid, COLOR_GREY, "คุณต้องมีมากกว่า 150 Coin");

		    playerData[playerid][pSkin] = listitem;
			UpdateplayerData(playerid);
            SetPlayerSkin(playerid, listitem);
            playerData[playerid][pCoin] -= 150;
            GameTextForPlayer(playerid, "~g~Skin Success!", 3000, 3);
        }
    }

	switch( dialogid ) {
	    case dialog_TUNING: {
	        if( response ) {
	            if( !IsPlayerInAnyVehicle( playerid ) ) return SendClientMessage(playerid, -1, "คุณต้องอยู่บนรถ" );
	            if( GetPlayerState( playerid ) != PLAYER_STATE_DRIVER ) return SendClientMessage(playerid, -1, "คุณต้องเป็นคนขับรถ" );
				new vehicleid = GetPlayerVehicleID( playerid ), Float:Pos[ 6 ];

	            TPInfo[ playerid ][ tID ] = -1;

				switch( listitem ) {
	                /*case 0: {

						for( new i = 0; i < NUMBER_TYPE_PAINTJOB; i++ ) {
			                if( pjInfo[ i ][ vehID ] == GetVehicleModel( vehicleid ) ) {
				            	TPInfo[ playerid ][ tID ] = i;
								break;
							}
			           	}
						if( TPInfo[ playerid ][ tID ] == -1 ) return SendClientMessage(playerid, -1, "[ รถของคุณไม่สามารถติดตั้งอุปกรณ์แต่งอื่นได้แล้ว ]" );

						new pid = TPInfo[ playerid ][ tID ];
						TPInfo[ playerid ][ tPaintjob ] = true;

						GetVehicleColor( vehicleid, TPInfo[ playerid ][ PJColor ][ 0 ], TPInfo[ playerid ][ PJColor ][ 1 ] );

						TogglePlayerControllable( playerid, false );
	                    TuningTDControl( playerid, true );

                        ChangeVehicleColor( vehicleid, 2, 2 );
                        ChangeVehiclePaintjob( vehicleid, pjInfo[ pid ][ pNumber ] );

	                    format( globalstring, sizeof( globalstring ), "%s", pjInfo[ pid ][ pName ] );
						PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 3 ], globalstring );
						format( globalstring, sizeof( globalstring ), "Price: ~w~%d$", pjInfo[ pid ][ pPrice ] );
						PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 4 ], globalstring );

						GetVehicleCameraPos( vehicleid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ], 4, 0, 5 );
						SetPlayerCameraPos( playerid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ] );

						GetVehiclePos( vehicleid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );
						SetPlayerCameraLookAt( playerid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );

						SelectTextDraw( playerid, COLOR_ORANGE );
					}
	                case 1: {

	                    for( new i = 0; i < MAX_COMPONENTS; i++ ) {
			                if( cInfo[ i ][ cType ] == CARMODTYPE_EXHAUST ) {
			                    if( cInfo[ i ][ cID ] == IsComponentidCompatible( GetVehicleModel( vehicleid ), cInfo[ i ][ cID ] ) ) {
				                    TPInfo[ playerid ][ tID ] = i;
									break;
								}
			                }
						}
	                    if( TPInfo[ playerid ][ tID ] == -1 ) return SendClientMessage(playerid, -1, "[ รถของคุณไม่สามารถติดตั้งอุปกรณ์แต่งอื่นได้แล้ว ]" );

						new cid = TPInfo[ playerid ][ tID ];
						TPInfo[ playerid ][ tType ] = CARMODTYPE_EXHAUST;
						TPInfo[ playerid ][ tPaintjob ] = false;

	                    TogglePlayerControllable( playerid, false );
	                    TuningTDControl( playerid, true );

	                    format( globalstring, sizeof( globalstring ), "%s", cInfo[ cid ][ cName ] );
						PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 3 ], globalstring );
						format( globalstring, sizeof( globalstring ), "Price: ~w~%d$", cInfo[ cid ][ cPrice ] );
						PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 4 ], globalstring );

                        AddVehicleComponent( vehicleid, cInfo[ cid ][ cID ] );

						GetVehicleCameraPos( vehicleid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ], -2, -5, 0 );
						SetPlayerCameraPos( playerid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ] );

						GetVehiclePos( vehicleid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );
						SetPlayerCameraLookAt( playerid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );

						SelectTextDraw( playerid, COLOR_ORANGE );
	                }
	                case 2: {

	                    for( new i = 0; i < MAX_COMPONENTS; i++ ) {
			                if( cInfo[ i ][ cType ] == CARMODTYPE_FRONT_BUMPER ) {
			                    if( cInfo[ i ][ cID ] == IsComponentidCompatible( GetVehicleModel( vehicleid ), cInfo[ i ][ cID ] ) ) {
				                    TPInfo[ playerid ][ tID ] = i;
									break;
								}
			                }
						}
	                    if( TPInfo[ playerid ][ tID ] == -1 ) return SendClientMessage(playerid, -1, "[ รถของคุณไม่สามารถติดตั้งอุปกรณ์แต่งอื่นได้แล้ว ]" );

						new cid = TPInfo[ playerid ][ tID ];
						TPInfo[ playerid ][ tType ] = CARMODTYPE_FRONT_BUMPER;
						TPInfo[ playerid ][ tPaintjob ] = false;

	                    TogglePlayerControllable( playerid, false );
	                    TuningTDControl( playerid, true );

	                    format( globalstring, sizeof( globalstring ), "%s", cInfo[ cid ][ cName ] );
						PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 3 ], globalstring );
						format( globalstring, sizeof( globalstring ), "Price: ~w~%d$", cInfo[ cid ][ cPrice ] );
						PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 4 ], globalstring );

                        AddVehicleComponent( vehicleid, cInfo[ cid ][ cID ] );

						GetVehicleCameraPos( vehicleid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ], 0, 6, 0.5 ); // done
						SetPlayerCameraPos( playerid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ] );

						GetVehiclePos( vehicleid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );
						SetPlayerCameraLookAt( playerid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );

						SelectTextDraw( playerid, COLOR_ORANGE );
	                }
	                case 3: {

	                    for( new i = 0; i < MAX_COMPONENTS; i++ ) {
			                if( cInfo[ i ][ cType ] == CARMODTYPE_REAR_BUMPER ) {
			                    if( cInfo[ i ][ cID ] == IsComponentidCompatible( GetVehicleModel( vehicleid ), cInfo[ i ][ cID ] ) ) {
				                    TPInfo[ playerid ][ tID ] = i;
									break;
								}
			                }
						}
	                    if( TPInfo[ playerid ][ tID ] == -1 ) return SendClientMessage(playerid, -1, "[ รถของคุณไม่สามารถติดตั้งอุปกรณ์แต่งอื่นได้แล้ว ]" );

						new cid = TPInfo[ playerid ][ tID ];
						TPInfo[ playerid ][ tType ] = CARMODTYPE_REAR_BUMPER;
						TPInfo[ playerid ][ tPaintjob ] = false;

	                    TogglePlayerControllable( playerid, false );
	                    TuningTDControl( playerid, true );

	                    format( globalstring, sizeof( globalstring ), "%s", cInfo[ cid ][ cName ] );
						PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 3 ], globalstring );
						format( globalstring, sizeof( globalstring ), "Price: ~w~%d$", cInfo[ cid ][ cPrice ] );
						PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 4 ], globalstring );

                        AddVehicleComponent( vehicleid, cInfo[ cid ][ cID ] );

						GetVehicleCameraPos( vehicleid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ], 0, -6, 0.5 ); // done
						SetPlayerCameraPos( playerid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ] );

						GetVehiclePos( vehicleid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );
						SetPlayerCameraLookAt( playerid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );

						SelectTextDraw( playerid, COLOR_ORANGE );
	                }
	                case 4: {

	                    for( new i = 0; i < MAX_COMPONENTS; i++ ) {
			                if( cInfo[ i ][ cType ] == CARMODTYPE_ROOF ) {
			                    if( cInfo[ i ][ cID ] == IsComponentidCompatible( GetVehicleModel( vehicleid ), cInfo[ i ][ cID ] ) ) {
				                    TPInfo[ playerid ][ tID ] = i;
									break;
								}
			                }
						}
	                    if( TPInfo[ playerid ][ tID ] == -1 ) return SendClientMessage(playerid, -1, "[ รถของคุณไม่สามารถติดตั้งอุปกรณ์แต่งอื่นได้แล้ว ]" );

						new cid = TPInfo[ playerid ][ tID ];
						TPInfo[ playerid ][ tType ] = CARMODTYPE_ROOF;
						TPInfo[ playerid ][ tPaintjob ] = false;

	                    TogglePlayerControllable( playerid, false );
	                    TuningTDControl( playerid, true );

	                    format( globalstring, sizeof( globalstring ), "%s", cInfo[ cid ][ cName ] );
						PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 3 ], globalstring );
						format( globalstring, sizeof( globalstring ), "Price: ~w~%d$", cInfo[ cid ][ cPrice ] );
						PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 4 ], globalstring );

                        AddVehicleComponent( vehicleid, cInfo[ cid ][ cID ] );

						GetVehicleCameraPos( vehicleid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ], 0, 6, 2 ); // done
						SetPlayerCameraPos( playerid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ] );

						GetVehiclePos( vehicleid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );
						SetPlayerCameraLookAt( playerid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );

						SelectTextDraw( playerid, COLOR_ORANGE );
	                }
	                case 5: {

	                    for( new i = 0; i < MAX_COMPONENTS; i++ ) {
			                if( cInfo[ i ][ cType ] == CARMODTYPE_SPOILER ) {
			                    if( cInfo[ i ][ cID ] == IsComponentidCompatible( GetVehicleModel( vehicleid ), cInfo[ i ][ cID ] ) ) {
				                    TPInfo[ playerid ][ tID ] = i;
									break;
								}
			                }
						}
	                    if( TPInfo[ playerid ][ tID ] == -1 ) return SendClientMessage(playerid, -1, "[ รถของคุณไม่สามารถติดตั้งอุปกรณ์แต่งอื่นได้แล้ว ]" );

						new cid = TPInfo[ playerid ][ tID ];
						TPInfo[ playerid ][ tType ] = CARMODTYPE_SPOILER;
						TPInfo[ playerid ][ tPaintjob ] = false;

	                    TogglePlayerControllable( playerid, false );
	                    TuningTDControl( playerid, true );

	                    format( globalstring, sizeof( globalstring ), "%s", cInfo[ cid ][ cName ] );
						PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 3 ], globalstring );
						format( globalstring, sizeof( globalstring ), "Price: ~w~%d$", cInfo[ cid ][ cPrice ] );
						PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 4 ], globalstring );

                        AddVehicleComponent( vehicleid, cInfo[ cid ][ cID ] );

						GetVehicleCameraPos( vehicleid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ], 0, -6, 2 ); // done
						SetPlayerCameraPos( playerid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ] );

						GetVehiclePos( vehicleid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );
						SetPlayerCameraLookAt( playerid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );

						SelectTextDraw( playerid, COLOR_ORANGE );
	                }
	                case 6: {

	                    for( new i = 0; i < MAX_COMPONENTS; i++ ) {
			                if( cInfo[ i ][ cType ] == CARMODTYPE_SIDESKIRT ) {
			                    if( cInfo[ i ][ cID ] == IsComponentidCompatible( GetVehicleModel( vehicleid ), cInfo[ i ][ cID ] ) ) {
				                    TPInfo[ playerid ][ tID ] = i;
									break;
								}
			                }
						}
	                    if( TPInfo[ playerid ][ tID ] == -1 ) return SendClientMessage(playerid, -1, "[ รถของคุณไม่สามารถติดตั้งอุปกรณ์แต่งอื่นได้แล้ว ]" );

						new cid = TPInfo[ playerid ][ tID ];
						TPInfo[ playerid ][ tType ] = CARMODTYPE_SIDESKIRT;
						TPInfo[ playerid ][ tPaintjob ] = false;

	                    TogglePlayerControllable( playerid, false );
	                    TuningTDControl( playerid, true );

	                    format( globalstring, sizeof( globalstring ), "%s", cInfo[ cid ][ cName ] );
						PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 3 ], globalstring );
						format( globalstring, sizeof( globalstring ), "Price: ~w~%d$", cInfo[ cid ][ cPrice ] );
						PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 4 ], globalstring );

                        AddVehicleComponent( vehicleid, cInfo[ cid ][ cID ] );

						GetVehicleCameraPos( vehicleid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ], 4, 0, 0.5 );
						SetPlayerCameraPos( playerid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ] );

						GetVehiclePos( vehicleid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );
						SetPlayerCameraLookAt( playerid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );

						SelectTextDraw( playerid, COLOR_ORANGE );
	                }*/
	                case 0: {

	                    for( new i = 0; i < MAX_COMPONENTS; i++ ) {
			                if( cInfo[ i ][ cType ] == CARMODTYPE_WHEELS ) {
			                    if( cInfo[ i ][ cID ] == IsComponentidCompatible( GetVehicleModel( vehicleid ), cInfo[ i ][ cID ] ) ) {
				                    TPInfo[ playerid ][ tID ] = i;
									break;
								}
			                }
						}
	                    if( TPInfo[ playerid ][ tID ] == -1 ) return SendClientMessage(playerid, -1, "[ รถของคุณไม่สามารถติดตั้งอุปกรณ์แต่งอื่นได้แล้ว ]" );

						new cid = TPInfo[ playerid ][ tID ];
						TPInfo[ playerid ][ tType ] = CARMODTYPE_WHEELS;
						TPInfo[ playerid ][ tPaintjob ] = false;

	                    TogglePlayerControllable( playerid, false );
	                    TuningTDControl( playerid, true );

	                    format( globalstring, sizeof( globalstring ), "%s", cInfo[ cid ][ cName ] );
						PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 3 ], globalstring );
						format( globalstring, sizeof( globalstring ), "Price: ~w~%d$", cInfo[ cid ][ cPrice ] );
						PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 4 ], globalstring );

                        AddVehicleComponent( vehicleid, cInfo[ cid ][ cID ] );

						GetVehicleCameraPos( vehicleid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ], 4, 0, 0.5 ); // done
						SetPlayerCameraPos( playerid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ] );

						GetVehiclePos( vehicleid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );
						SetPlayerCameraLookAt( playerid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );

						SelectTextDraw( playerid, COLOR_ORANGE );
	                }
	                /*case 8: {
	                
	                    for( new i = 0; i < MAX_COMPONENTS; i++ ) {
			                if( cInfo[ i ][ cType ] == CARMODTYPE_STEREO ) {
			                    if( cInfo[ i ][ cID ] == IsComponentidCompatible( GetVehicleModel( vehicleid ), cInfo[ i ][ cID ] ) ) {
				                    TPInfo[ playerid ][ tID ] = i;
									break;
								}
			                }
						}
	                    if( TPInfo[ playerid ][ tID ] == -1 ) return SendClientMessage(playerid, -1, "[ รถของคุณไม่สามารถติดตั้งอุปกรณ์แต่งอื่นได้แล้ว ]" );

						new cid = TPInfo[ playerid ][ tID ];
						TPInfo[ playerid ][ tType ] = CARMODTYPE_STEREO;
						TPInfo[ playerid ][ tPaintjob ] = false;

	                    TogglePlayerControllable( playerid, false );
	                    TuningTDControl( playerid, true );

	                    format( globalstring, sizeof( globalstring ), "%s", cInfo[ cid ][ cName ] );
						PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 3 ], globalstring );
						format( globalstring, sizeof( globalstring ), "Price: ~w~%d$", cInfo[ cid ][ cPrice ] );
						PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 4 ], globalstring );

                        AddVehicleComponent( vehicleid, cInfo[ cid ][ cID ] );

						GetVehicleCameraPos( vehicleid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ], 0, -6, 2 );
						SetPlayerCameraPos( playerid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ] );

						GetVehiclePos( vehicleid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );
						SetPlayerCameraLookAt( playerid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );

						SelectTextDraw( playerid, COLOR_ORANGE );
	                }
	                case 9: {

	                    for( new i = 0; i < MAX_COMPONENTS; i++ ) {
			                if( cInfo[ i ][ cType ] == CARMODTYPE_HYDRAULICS ) {
			                    if( cInfo[ i ][ cID ] == IsComponentidCompatible( GetVehicleModel( vehicleid ), cInfo[ i ][ cID ] ) ) {
				                    TPInfo[ playerid ][ tID ] = i;
									break;
								}
			                }
						}
	                    if( TPInfo[ playerid ][ tID ] == -1 ) return SendClientMessage(playerid, -1, "[ รถของคุณไม่สามารถติดตั้งอุปกรณ์แต่งอื่นได้แล้ว ]" );

						new cid = TPInfo[ playerid ][ tID ];
						TPInfo[ playerid ][ tType ] = CARMODTYPE_HYDRAULICS;
						TPInfo[ playerid ][ tPaintjob ] = false;

	                    TogglePlayerControllable( playerid, false );
	                    TuningTDControl( playerid, true );

	                    format( globalstring, sizeof( globalstring ), "%s", cInfo[ cid ][ cName ] );
						PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 3 ], globalstring );
						format( globalstring, sizeof( globalstring ), "Price: ~w~%d$", cInfo[ cid ][ cPrice ] );
						PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 4 ], globalstring );

                        AddVehicleComponent( vehicleid, cInfo[ cid ][ cID ] );

						GetVehicleCameraPos( vehicleid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ], 2, 2, 2 );
						SetPlayerCameraPos( playerid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ] );

						GetVehiclePos( vehicleid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );
						SetPlayerCameraLookAt( playerid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );

						SelectTextDraw( playerid, COLOR_ORANGE );
	                }
	                case 10: {

	                    for( new i = 0; i < MAX_COMPONENTS; i++ ) {
			                if( cInfo[ i ][ cType ] == CARMODTYPE_NITRO ) {
			                    if( cInfo[ i ][ cID ] == IsComponentidCompatible( GetVehicleModel( vehicleid ), cInfo[ i ][ cID ] ) ) {
				                    TPInfo[ playerid ][ tID ] = i;
									break;
								}
			                }
						}
	                    if( TPInfo[ playerid ][ tID ] == -1 ) return SendClientMessage(playerid, -1, "[ รถของคุณไม่สามารถติดตั้งอุปกรณ์แต่งอื่นได้แล้ว ]" );

						new cid = TPInfo[ playerid ][ tID ];
						TPInfo[ playerid ][ tType ] = CARMODTYPE_NITRO;
						TPInfo[ playerid ][ tPaintjob ] = false;

	                    TogglePlayerControllable( playerid, false );
	                    TuningTDControl( playerid, true );

	                    format( globalstring, sizeof( globalstring ), "%s", cInfo[ cid ][ cName ] );
						PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 3 ], globalstring );
						format( globalstring, sizeof( globalstring ), "Price: ~w~%d$", cInfo[ cid ][ cPrice ] );
						PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 4 ], globalstring );

                        AddVehicleComponent( vehicleid, cInfo[ cid ][ cID ] );

						GetVehicleCameraPos( vehicleid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ], 0, -6, 2 ); // done
						SetPlayerCameraPos( playerid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ] );

						GetVehiclePos( vehicleid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );
						SetPlayerCameraLookAt( playerid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );

						SelectTextDraw( playerid, COLOR_ORANGE );
	                }*/
	            }
	        }
	        else if( !response ) {
	            SetCameraBehindPlayer( playerid );
	        }
	    }
	    /*case dialog_TUNING_2: {
	        if( !response ) return 1;
			if( response ) {
			    if( !IsPlayerInAnyVehicle( playerid ) ) return SendClientMessage(playerid, -1, "คุณต้องอยู่ในรถ" );
	            if( GetPlayerState( playerid ) != PLAYER_STATE_DRIVER ) return SendClientMessage(playerid, -1, "คุณต้องเป็นคนขับรถ" );
				new vehicleid = GetPlayerVehicleID( playerid );
			    if( GetPlayerMoneyEx( playerid ) < COLOR_PRICE ) return SendClientMessage(playerid, -1, "คุณมีเงินไม่เพียงพอ" );
			    new b1, b2;
			    if( sscanf( inputtext, "ii", b1, b2 ) ) return SPD( playerid, dialog_TUNING_2, DSI, D_TOP, "ใส่เลขสีรถที่คุณต้องการจะเปลี่ยน\nเช่น:0 1", D_OK, D_CANCEL );
				if( b1 < 0 || b2 < 0 || b1 > 255 || b2 > 255 ) return SendClientMessage(playerid, -1, "ไอดีต้องอยู่ระหว่าง 0 - 255");

				SetVehicleColor( vehicleid, b1, b2 );
				GivePlayerMoneyEx( playerid, COLOR_PRICE );

				SPD( playerid, dialog_TUNING, DSL, D_TOP, D_TEXT, D_OK, D_CANCEL );
			}
		}*/
	}
	return true;
}

AddComponent(vehicleid, componentid)
{
	if (!IsValidVehicle(vehicleid) || (componentid < 1000 || componentid > 1193))
	    return 0;

	new
		id = carData[vehicleid][carID];

	if (id != -1)
	{
	    carData[id][carMods][GetVehicleComponentType(componentid)] = componentid;
	    SaveVehicleModifications(vehicleid);
	}
	return AddVehicleComponent(vehicleid, componentid);
}

SetVehicleColor(vehicleid, color1, color2)
{
    new id = carData[vehicleid][carID], query[128];

	if (id != -1)
	{
	    carData[id][carColor1] = color1;
	    carData[id][carColor2] = color2;
	    mysql_format(g_SQL, query, sizeof(query), "UPDATE vehicles SET carColor1 = %d, carColor2 = %d WHERE carID = %d", color1, color2, carData[vehicleid][carID]);
	    mysql_tquery(g_SQL, query);
	    ChangeVehicleColor(vehicleid, color1, color2);
	}
	return ChangeVehicleColor(vehicleid, color1, color2);
}

alias:tune("แต่งรถ")
CMD:tune(playerid, params[])
{
	if (!IsPlayerInRangeOfPoint(playerid, 3.0, 2632.8367,1721.4631,11.0234))
	    return SendClientMessage(playerid, COLOR_GREY, "คุณต้องอยู่ที่อู่ซ่อมรถ");

	if (IsPlayerInAnyVehicle(playerid))
	{
    	SPD( playerid, dialog_TUNING, DSL, D_TOP, D_TEXT, D_OK, D_CANCEL );
    }
    return 1;
}

alias:colorlist("ดูสี")
CMD:colorlist(playerid, params[])
{
    new
		string[3344];

    string = "";

	for(new i = 0; i < 256; i++)
	{
	    if(i > 0 && (i % 16) == 0)
	    {
	        format(string, sizeof(string), "%s\n{%06x}#%03d ", string, g_arrSelectColors[i] >>> 8, i);
		}
	    else
		{
			format(string, sizeof(string), "%s{%06x}#%03d ", string, g_arrSelectColors[i] >>> 8, i);
		}
	}
	Dialog_Show(playerid, ShowOnly, DIALOG_STYLE_MSGBOX, "[สีทั้งหมดภายใน SA-MP]", string, "ปิด", "");


	return 1;
}
