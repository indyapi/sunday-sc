#include <YSI_Coding\y_hooks>

ptask AutoMSG[60000*60](playerid)
{
	switch(random(6))
	{
	    case 0: return SCMTAEX(COLOR_SUNDAY, "[SUN-WARNING]:ห้ามใช้ /pv  Toxic ด่าบุพการีกันนะครับ");
	    case 1: return SCMTAEX(COLOR_SUNDAY, "[SUNDAY]:อย่าลืมอ่านกฏหมายประเทศ และกฏ roleplay นะครับ เป็นพื้นฐานการเล่นทั้งหมด");
	    case 2: return SCMTAEX(COLOR_SUNDAY, "[SUN-CAHT]:สามารถสวมหมวกกันน็อก เพื่อปิดบังตัวตน และออกปล้นได้");
	    case 3: return SCMTAEX(COLOR_SUNDAY, "[SUN-CHAT]:ใช้ /จกศพ เมื่อคุณสามารถฆ่าใครสักคนได้");
     	case 4: return SCMTAEX(COLOR_SUNDAY, "[SUN-CHAT]:ใช้ /ล้วง  เพื่อล้วงกระเป๋าของใครสักคน  เช่น ล้วงกระเป๋าเมีย");
		case 5: return SCMTAEX(COLOR_SUNDAY, "[SUN-CHAT]:ประเทศแนว ฟาร์มเก็บเวล ปลดล็อกภารกิจ และอาชีพต่างๆ");
	}
	return 1;
}
