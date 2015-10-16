//This source code is generated by UI Designer Studio.

#include "UIFramework.h"
#include "UIFrameworkExt.h"
#include "UIGraphics.h"
#include "NVTToolCommand.h"
#include "UIMenuWndSetupCarNumberRes.c"
#include "UIMenuWndSetupCarNumber.h"
//#include "UIFlow.h"
#include "../../../D800x480/UIFlow.h"

#define CARNO_LEN		7
#define CARNO_1ST_CNT	31
#define CARNO_1ST_IND	1
#define CARNO_NOR_CNT	36

static CHAR CarNoBuf[CARNO_LEN+1] = {0};
static CHAR CarNoShow[CARNO_LEN][2] = {"A", "8", "8", "8", "8", "8", "8"};
_ALIGNED(4) const char  CarNoNormalStr[]   = {'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S',
                                                  'T','U','V','W','X','Y','Z','0','1','2','3','4','5','6','7','8','9'};
static int CarNoStrIndex[CARNO_LEN] = {0};	//  Button Control string index
static UINT32 CarNo1stStrId[] =
{
	0,
	STRID_4E91,		//��
	STRID_4EAC,		// ��
	STRID_5B81,		// ��
	STRID_5DDD,		// ��
	STRID_6CAA,		// ��
	STRID_6D25,		// ��
	STRID_6D59,		// ��
	STRID_6E1D,		// ��
	STRID_6E58,		// ��
	STRID_7CA4,		// ��
	STRID_8C6B,		// ԥ
	STRID_8D35,		// ��
	STRID_8D63,		// ��
	STRID_8FBD,		// ��
	STRID_9C81,		// ³
	STRID_9ED1,		// ��
	STRID_65B0,		// ��
	STRID_82CF,		// ��	
	STRID_85CF,		// ��
	STRID_95FD,		// ��
	STRID_664B,		// ��
	STRID_743C,		// ��
	STRID_5180,		// ��
	STRID_5409,		// ��
	STRID_6842,		// ��
	STRID_7518,		// ��
	STRID_7696,		// ��
	STRID_8499,		// ��
	STRID_9102,		// ��
	STRID_9655,		// ��
	STRID_9752		// ��
};
VControl *CarNoButton[UIMenuWndSetupCarNumber_Tab_MAX]=
{
	&UIMenuWndSetupCarNumber_Button1Ctrl,
	&UIMenuWndSetupCarNumber_Button2Ctrl,
	&UIMenuWndSetupCarNumber_Button3Ctrl,
	&UIMenuWndSetupCarNumber_Button4Ctrl,
	&UIMenuWndSetupCarNumber_Button5Ctrl,
	&UIMenuWndSetupCarNumber_Button6Ctrl,
	&UIMenuWndSetupCarNumber_Button7Ctrl,
};
//---------------------UIMenuWndSetupCarNumberCtrl Control List---------------------------
CTRL_LIST_BEGIN(UIMenuWndSetupCarNumber)
CTRL_LIST_ITEM(UIMenuWndSetupCarNumber_Tab)
CTRL_LIST_END

//----------------------UIMenuWndSetupCarNumberCtrl Event---------------------------
INT32 UIMenuWndSetupCarNumber_OnOpen(VControl *, UINT32, UINT32 *);
INT32 UIMenuWndSetupCarNumber_OnClose(VControl *, UINT32, UINT32 *);
INT32 UIMenuWndSetupCarNumber_OnKeyShutter2(VControl *, UINT32, UINT32 *);
INT32 UIMenuWndSetupCarNumber_OnKeyEnter(VControl *, UINT32, UINT32 *);
INT32 UIMenuWndSetupCarNumber_OnKeyMode(VControl *, UINT32, UINT32 *);
EVENT_BEGIN(UIMenuWndSetupCarNumber)
EVENT_ITEM(NVTEVT_OPEN_WINDOW,UIMenuWndSetupCarNumber_OnOpen)
EVENT_ITEM(NVTEVT_CLOSE_WINDOW,UIMenuWndSetupCarNumber_OnClose)
#if((_MODEL_DSC_ == _MODEL_CARDV_B50_)||(_MODEL_DSC_== _MODEL_DUAL_NAZHIDA_))
EVENT_ITEM(NVTEVT_KEY_CUSTOM1,UIMenuWndSetupCarNumber_OnKeyShutter2)
#else
EVENT_ITEM(NVTEVT_KEY_MENU,UIMenuWndSetupCarNumber_OnKeyShutter2)
#endif
EVENT_ITEM(NVTEVT_KEY_ENTER,UIMenuWndSetupCarNumber_OnKeyEnter)
EVENT_ITEM(NVTEVT_KEY_MODE,UIMenuWndSetupCarNumber_OnKeyMode)
EVENT_END

static void UIMenuWndSetupCarNumber_UpdateInfo(void)
{
	int i;
	UxButton_SetItemData(CarNoButton[0], 0, BTNITM_STRID, CarNo1stStrId[CarNoStrIndex[0]]);
	for (i=1; i<UIMenuWndSetupCarNumber_Tab_MAX;  i++)
	{
		UxButton_SetItemData(CarNoButton[i], 0, BTNITM_STRID, Txt_Pointer(CarNoShow[i]));
	}
}

INT32 UIMenuWndSetupCarNumber_OnOpen(VControl *pCtrl, UINT32 paramNum, UINT32 *paramArray)
{
	int i;
	int j;
	memset(CarNoBuf, 0, CARNO_LEN+1);
	strncpy(CarNoBuf, SysGetZHCarNoStamp(), CARNO_LEN+1);
	// Default Car no ��B00000
	for (i=0; i<CARNO_LEN; i++)
	{
		//CarNoShow[i][0] = CarNoBuf[i];
		if (i == 0)
		{
			if (CarNoBuf[i]<CARNO_1ST_IND || CarNoBuf[i]>CARNO_1ST_CNT)
			{
				CarNoStrIndex[i] = 2;
			}
			else
			{
				CarNoStrIndex[i] = CarNoBuf[i];
			}
			CarNoShow[i][0] = CarNoStrIndex[i];
		}
		else
		{
			for (j=0; j<CARNO_NOR_CNT; j++)
			{
				if (CarNoBuf[i] == CarNoNormalStr[j])
				{
					CarNoStrIndex[i] = j;
					break;
				}
			}
			if (j >= CARNO_NOR_CNT)
			{
				CarNoStrIndex[i] = 0;
			}
			CarNoShow[i][0] = CarNoNormalStr[CarNoStrIndex[i]];
		}
	}
	
	UIMenuWndSetupCarNumber_UpdateInfo();
	UxTab_SetData(&UIMenuWndSetupCarNumber_TabCtrl, TAB_FOCUS, 0);
    Ux_DefaultEvent(pCtrl,NVTEVT_OPEN_WINDOW,paramNum,paramArray);
    return NVTEVT_CONSUME;
}
INT32 UIMenuWndSetupCarNumber_OnClose(VControl *pCtrl, UINT32 paramNum, UINT32 *paramArray)
{
    Ux_DefaultEvent(pCtrl,NVTEVT_CLOSE_WINDOW,paramNum,paramArray);
    return NVTEVT_CONSUME;
}
INT32 UIMenuWndSetupCarNumber_OnKeyShutter2(VControl *pCtrl, UINT32 paramNum, UINT32 *paramArray)
{
	int i;
	
	for (i=0; i<CARNO_LEN; i++)
	{   
		CarNoBuf[i] = CarNoShow[i][0];
	}
	CarNoBuf[i] = '\0';
	SysSetZHCarNoStamp(CarNoBuf);
	debug_msg("magic_car = %s",CarNoBuf);
	Ux_CloseWindow(pCtrl, 0);
    return NVTEVT_CONSUME;
}
INT32 UIMenuWndSetupCarNumber_OnKeyEnter(VControl *pCtrl, UINT32 paramNum, UINT32 *paramArray)
{
    return UIMenuWndSetupCarNumber_OnKeyShutter2(pCtrl, paramNum, paramArray);
}
INT32 UIMenuWndSetupCarNumber_OnKeyMode(VControl *pCtrl, UINT32 paramNum, UINT32 *paramArray)
{
	int i;

	for (i=0; i<CARNO_LEN; i++)
	{
		CarNoBuf[i] = CarNoShow[i][0];
	}
	CarNoBuf[i] = '\0';
	SysSetZHCarNoStamp(CarNoBuf);
	
	Ux_SendEvent(&UISetupObjCtrl,NVTEVT_EXE_CHANGEDSCMODE,1,DSCMODE_CHGTO_NEXT);
    return NVTEVT_CONSUME;
}
//----------------------UIMenuWndSetupCarNumber_TabCtrl Event---------------------------
INT32 UIMenuWndSetupCarNumber_Tab_OnKeyUp(VControl *, UINT32, UINT32 *);
INT32 UIMenuWndSetupCarNumber_Tab_OnKeyDown(VControl *, UINT32, UINT32 *);
INT32 UIMenuWndSetupCarNumber_Tab_OnKeyLeft(VControl *, UINT32, UINT32 *);
INT32 UIMenuWndSetupCarNumber_Tab_OnKeyRight(VControl *, UINT32, UINT32 *);
INT32 UIMenuWndSetupCarNumber_Tab_OnKeyMenu(VControl *, UINT32, UINT32 *);
EVENT_BEGIN(UIMenuWndSetupCarNumber_Tab)
EVENT_ITEM(NVTEVT_KEY_UP,UIMenuWndSetupCarNumber_Tab_OnKeyUp)
EVENT_ITEM(NVTEVT_KEY_DOWN,UIMenuWndSetupCarNumber_Tab_OnKeyDown)
EVENT_ITEM(NVTEVT_KEY_LEFT,UIMenuWndSetupCarNumber_Tab_OnKeyLeft)
EVENT_ITEM(NVTEVT_KEY_RIGHT,UIMenuWndSetupCarNumber_Tab_OnKeyRight)
EVENT_ITEM(NVTEVT_KEY_SHUTTER2,UIMenuWndSetupCarNumber_Tab_OnKeyMenu)
EVENT_END

static void _update_Tab_Button_index(VControl *pCtrl, int derc)
{
	UINT32 CurTabIndex = 0;
	CurTabIndex = UxTab_GetData(pCtrl, TAB_FOCUS);
	if (derc == -1)//up
	{
		if (CarNoStrIndex[CurTabIndex] <= 1 && CurTabIndex == 0)
		{
			CarNoStrIndex[CurTabIndex] = CARNO_1ST_CNT;
		}
		else if (CarNoStrIndex[CurTabIndex] == 0 && CurTabIndex != 0)
		{
			CarNoStrIndex[CurTabIndex] = CARNO_NOR_CNT-1;
		}
		else
		{
			CarNoStrIndex[CurTabIndex]--;
		}
	}
	else // down
	{
		if (CarNoStrIndex[CurTabIndex] == CARNO_1ST_CNT && CurTabIndex == 0)
		{
			CarNoStrIndex[CurTabIndex] = 1;
		}
		else if (CarNoStrIndex[CurTabIndex] == CARNO_NOR_CNT-1 && CurTabIndex != 0)
		{
			CarNoStrIndex[CurTabIndex] = 0;
		}
		else
		{
			CarNoStrIndex[CurTabIndex]++;
		}
	}
	
	if (CurTabIndex == 0)
	{
		CarNoShow[CurTabIndex][0] = CarNoStrIndex[CurTabIndex];
		UxButton_SetItemData(CarNoButton[CurTabIndex], 0, BTNITM_STRID, CarNo1stStrId[CarNoStrIndex[CurTabIndex]]);	
	}
	else
	{
		CarNoShow[CurTabIndex][0] = CarNoNormalStr[CarNoStrIndex[CurTabIndex]];
		UxButton_SetItemData(CarNoButton[CurTabIndex], 0, BTNITM_STRID, Txt_Pointer(CarNoShow[CurTabIndex]));
		
	}
}
INT32 UIMenuWndSetupCarNumber_Tab_OnKeyUp(VControl *pCtrl, UINT32 paramNum, UINT32 *paramArray)
{
	UINT32 uiKeyAct = paramArray[0];
	switch (uiKeyAct)
	{
		case NVTEVT_KEY_PRESS:
		{
			_update_Tab_Button_index(pCtrl, -1);
			break;
		}
	}
	return NVTEVT_CONSUME;
}
INT32 UIMenuWndSetupCarNumber_Tab_OnKeyDown(VControl *pCtrl, UINT32 paramNum, UINT32 *paramArray)
{
	UINT32 uiKeyAct = paramArray[0];
	switch (uiKeyAct)
	{
		case NVTEVT_KEY_PRESS:
		{
			_update_Tab_Button_index(pCtrl, 1);
			break;
		}
	}
	return NVTEVT_CONSUME;
}
INT32 UIMenuWndSetupCarNumber_Tab_OnKeyLeft(VControl *pCtrl, UINT32 paramNum, UINT32 *paramArray)
{
	Ux_SendEvent(pCtrl,NVTEVT_PREVIOUS_ITEM,0);
    return NVTEVT_CONSUME;
}
INT32 UIMenuWndSetupCarNumber_Tab_OnKeyRight(VControl *pCtrl, UINT32 paramNum, UINT32 *paramArray)
{
	Ux_SendEvent(pCtrl,NVTEVT_NEXT_ITEM,0);
    return NVTEVT_CONSUME;
}
INT32 UIMenuWndSetupCarNumber_Tab_OnKeyMenu(VControl *pCtrl, UINT32 paramNum, UINT32 *paramArray)
{
	UIMenuWndSetupCarNumber_Tab_OnKeyRight(pCtrl, paramNum, paramArray);
    return NVTEVT_CONSUME;
}
//----------------------UIMenuWndSetupCarNumber_Button1Ctrl Event---------------------------
EVENT_BEGIN(UIMenuWndSetupCarNumber_Button1)
EVENT_END

//----------------------UIMenuWndSetupCarNumber_Button2Ctrl Event---------------------------
EVENT_BEGIN(UIMenuWndSetupCarNumber_Button2)
EVENT_END

//----------------------UIMenuWndSetupCarNumber_Button3Ctrl Event---------------------------
EVENT_BEGIN(UIMenuWndSetupCarNumber_Button3)
EVENT_END

//----------------------UIMenuWndSetupCarNumber_Button4Ctrl Event---------------------------
EVENT_BEGIN(UIMenuWndSetupCarNumber_Button4)
EVENT_END

//----------------------UIMenuWndSetupCarNumber_Button5Ctrl Event---------------------------
EVENT_BEGIN(UIMenuWndSetupCarNumber_Button5)
EVENT_END

//----------------------UIMenuWndSetupCarNumber_Button6Ctrl Event---------------------------
EVENT_BEGIN(UIMenuWndSetupCarNumber_Button6)
EVENT_END

//----------------------UIMenuWndSetupCarNumber_Button7Ctrl Event---------------------------
EVENT_BEGIN(UIMenuWndSetupCarNumber_Button7)
EVENT_END

