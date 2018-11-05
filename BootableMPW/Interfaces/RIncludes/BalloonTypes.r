/*
	File:		BalloonTypes.r

	Contains:	Resource declarations for Balloon Help Resource types

	Copyright:	© 1989-1992 by Apple Computer, Inc., all rights reserved.

    This file is used in these builds: BigBang

	Change History (most recent first):

		<5+>	 6/23/92	DCL		Changed #ifndef __BALLOONTYPES.R__ to __BALLOONTYPES_R__
		 <5>	  8/8/91	JL		Updated Copyright. Put conditional wrapper around entire file.
		 <4>	 1/30/91	RLC		<stb> Changed the use of hmpic to hmpict as that is the 'new'
									convention.
		 <3>	 8/31/90	RLC		Update #defines again.
		<1+>	 8/17/90	RLC		Add some well known constants to the file.
		 <1>	 7/24/90	RLC		Moved from {Toolbox}HelpMgr to {RIncludes}.
		<6+>	 6/22/90	RLC		Add 'hfdr' resource for getting application info balloons in
									finder windows.
		<5+>	  4/5/90	RLC		Add 'hovr' type to allow the override of some system help msgs.
		<4+>	  2/8/90	RLC		Update types.
		 <3>	 1/11/90	RLC		Fix HMSkipItem case in hrct type.
		<1+>	  1/4/90	RLC		Change to the new resource format
	   <1.7>	11/30/89	RLC		Add some new options to hmnu & hdlg types.
	   <1.6>	11/16/89	RLC		Update 'hrct' resource type declaration by removing hotRect
									parameter.
	   <1.5>	11/15/89	RLC		Update to handle the correct help message types (soon to
									change).
	   <1.4>	11/13/89	RLC		Updated 'hdlg' resource structure to include tip & altRect
									parameters.
	   <1.3>	 11/9/89	RLC		Add HMUserItemID define.
	   <1.2>	 10/1/89	RLC		Updated HMBalloonRect for HelpMsg types: StyledTE & STR.
	   <1.1>	 9/13/89	RLC		Removed 'HMReuse' item from types.
	   <1.0>	 9/12/89	RLC		Created Today.

	To Do:
*/

#ifndef __BALLOONTYPES_R__
#define __BALLOONTYPES_R__

#define HelpMgrVersion			2			/* version of Help Manager */

#define kHMHelpID				-5696		/* resource ID of Help Manager resources */
#define kHMHelpMenuID			-16490		/* resource ID of Help Manager Menu resource */
#define kBalloonWDEFID			126			/* resource ID of Balloon WDEF procedure */

/* Option bits for help manager resources */

#define hmDefaultOptions		0			/* default options for help manager resources */
#define hmUseSubID				1			/* treat resID's in resources as subID's of driver base ID (for Desk Accessories) */
#define hmAbsoluteCoords		2			/* ignore window port origin and treat rectangles as absolute coords (local to window) */ 
#define hmSaveBitsNoWindow		4			/* don't create a window, just blast bits on screen. No update event is generated */
#define hmSaveBitsWindow		8			/* create a window, but restore bits behind window when window goes away & generate update event */
#define hmMatchInTitle			16			/* for hwin resources, match string anywhere in window title string */

/* Generic defines for the switch items used in 'hrct', 'hmnu', & 'hdlg's	*/
#define	HMStringItemID			1			/* pstring is used in help message */
#define	HMPictItemID			2			/* 'PICT' resource ID is used in help message */
#define	HMStringResItemID		3			/* 'STR#' resource ID and index is used in help message */
#define HMTEResItemID			6			/* Styled Text Edit resources are used in help message */
#define HMSTRResItemID			7			/* 'STR ' resource ID is used in help message */
#define HMSkipItemID			256			/* don't display a balloon */
#define HMCompareItemID			512			/* for hmnu resources, compare menu item to string and use help msg if match */
#define HMNamedResourceID		1024		/* for hmnu resources, use menu item as call to GetNamedResource() to fetch resource */
#define HMTrackCntlID			2048		/* not yet implemented, reserved */

/*----------------------------hmnu • Help Mgr Menu Balloon Template----------------------------*/
type 'hmnu' {
		integer;									/* Help Version */
		longint;									/* Options */
		integer;									/* Balloon ProcID */
		integer; 									/* Balloon variant */
		integer = $$CountOf(HMenuArray);			/* Count of menu items (below) */

		switch {			/* Special Message for missing array items */
				case HMStringItem:
hmnuMissStringBeg:		integer = (hmnuMissStringEnd - hmnuMissStringBeg) / 8;
						key int = HMStringItemID;
						pstring;			/* missing HMenuArray items (Enabled)  */
						pstring;			/* missing HMenuArray items (Disabled)  */
						pstring;			/* missing HMenuArray items (checked) */
						pstring;			/* missing HMenuArray items (other)  */
						align word;			/* always word align the code for the pstring */
hmnuMissStringEnd:						
				case HMPictItem:
hmnuMissPictBeg:		integer = (hmnuMissPictEnd - hmnuMissPictBeg) / 8;
						key int = HMPictItemID;
						integer;			/* use for missing HMenuArray items  */
						integer;			/* use for missing HMenuArray items  */
						integer;			/* use for missing HMenuArray items  */
						integer;			/* use for missing HMenuArray items  */
hmnuMissPictEnd:
				case HMStringResItem:
hmnuMissStringResBeg:	integer = (hmnuMissStringResEnd - hmnuMissStringResBeg) / 8;
						key int = HMStringResItemID;
						integer; integer;	/* Miss or 0 HMenuArray STR# res ID, index # */
						integer; integer;	/* Miss or 0 HMenuArray STR# res ID, index # */
						integer; integer;	/* Miss or 0 HMenuArray STR# res ID, index # */
						integer; integer;	/* Miss or 0 HMenuArray STR# res ID, index # */
hmnuMissStringResEnd:
				case HMTEResItem:
hmnuMissTEResBeg:		integer = (hmnuMissTEResEnd - hmnuMissTEResBeg) / 8;
						key int = HMTEResItemID;
						integer;			/* use for missing HMenuArray items */
						integer;			/* use for missing HMenuArray items */
						integer;			/* use for missing HMenuArray items */
						integer;			/* use for missing HMenuArray items */
hmnuMissTEResEnd:
				case HMSTRResItem:
hmnuMissSTRResBeg:		integer = (hmnuMissSTRResEnd - hmnuMissSTRResBeg) / 8;
						key int = HMSTRResItemID;
						integer;			/* use for missing HMenuArray items */
						integer;			/* use for missing HMenuArray items */
						integer;			/* use for missing HMenuArray items */
						integer;			/* use for missing HMenuArray items */
hmnuMissSTRResEnd:
				case HMSkipItem:
hmnuMissSkipBeg:		integer = (hmnuMissSkipEnd - hmnuMissSkipBeg) / 8;
						key int = HMSkipItemID;	/* use when there is no missing msg */
hmnuMissSkipEnd:						
			};
			
		array HMenuArray {
				switch {
					case HMStringItem:
hmnuStringBeg:			integer = (hmnuStringEnd[$$ArrayIndex(HMenuArray)] - hmnuStringBeg[$$ArrayIndex(HMenuArray)]) / 8;
						key int = HMStringItemID;
						pstring;			/* Enabled menu message string  */
						pstring;			/* Disabled menu message string */
						pstring;			/* Checked menu message string */
						pstring;			/* other menu message string */
						align word;
hmnuStringEnd:						
					case HMPictItem:
hmnuPictBeg:			integer = (hmnuPictEnd[$$ArrayIndex(HMenuArray)] - hmnuPictBeg[$$ArrayIndex(HMenuArray)]) / 8;
						key int = HMPictItemID;
						integer;			/* Enabled menu message pict ID  */
						integer;			/* Disabled menu message pict ID */
						integer;			/* Checked menu message pict ID */
						integer;			/* other menu message pict ID */		
hmnuPictEnd:												
					case HMStringResItem:
hmnuStringResBeg:		integer = (hmnuStringResEnd[$$ArrayIndex(HMenuArray)] - hmnuStringResBeg[$$ArrayIndex(HMenuArray)]) / 8;
						key int = HMStringResItemID;
						integer; integer;	/* Enabled STR# res ID, index # */
						integer; integer;	/* Disabled STR# res ID, index # */
						integer; integer;	/* Checked menu message STR# res ID, index # */
						integer; integer;	/* other menu message STR# res ID, index # */
hmnuStringResEnd:						
					case HMTEResItem:
hmnuTEResBeg:			integer = (hmnuTEResEnd[$$ArrayIndex(HMenuArray)] - hmnuTEResBeg[$$ArrayIndex(HMenuArray)]) / 8;
						key int = HMTEResItemID;
						integer;			/* Enabled menu message TERes ID */
						integer;			/* Disabled menu message TERes ID */
						integer;			/* Checked message TERes ID */
						integer;			/* other menu message TERes ID */	
hmnuTEResEnd:						
					case HMSTRResItem:
hmnuSTRResBeg:			integer = (hmnuSTRResEnd[$$ArrayIndex(HMenuArray)] - hmnuSTRResBeg[$$ArrayIndex(HMenuArray)]) / 8;
						key int = HMSTRResItemID;
						integer;			/* Enabled menu message STR ID */
						integer;			/* Disabled menu message STR ID */
						integer;			/* Checked message STR ID */
						integer;			/* other menu message STR ID */	
hmnuSTRResEnd:						
					case HMSkipItem:
hmnuSkipBeg:			integer = (hmnuSkipEnd[$$ArrayIndex(HMenuArray)] - hmnuSkipBeg[$$ArrayIndex(HMenuArray)]) / 8;
						key int = HMSkipItemID;
hmnuSkipEnd:						
					case HMCompareItem:
hmnuCompareBeg:			integer = (hmnuCompareEnd[$$ArrayIndex(HMenuArray)] - hmnuCompareBeg[$$ArrayIndex(HMenuArray)]) / 8;
						key int = HMCompareItemID;
						pstring;			/* if itemstr matches, use this item, else goto next item */
						align word;
						
						switch {					/* case the message type */
					
							case HMStringItem:
								key int = HMStringItemID;
								pstring;			/* Enabled menu message string  */
								pstring;			/* Disabled menu message string */
								pstring;			/* Checked menu message string */
								pstring;			/* other menu message string */
								align word;

							case HMPictItem:
								key int = HMPictItemID;
								integer;			/* Enabled menu message pict ID  */
								integer;			/* Disabled menu message pict ID */
								integer;			/* Checked menu message pict */
								integer;			/* other menu message pict */		

							case HMStringResItem:
								key int = HMStringResItemID;
								integer; integer;	/* Enabled STR# res ID, index # */
								integer; integer;	/* Disabled STR# res ID, index # */
								integer; integer;	/* Checked menu message STR# res ID, index # */
								integer; integer;	/* other menu message STR# res ID, index # */

							case HMTEResItem:
								key int = HMTEResItemID;
								integer;			/* Enabled menu message TERes ID */
								integer;			/* Disabled menu message TERes ID */
								integer;			/* Checked menu message TERes ID */
								integer;			/* other menu message TERes ID */	

							case HMSTRResItem:
								key int = HMSTRResItemID;
								integer;			/* Enabled menu message STR ID */
								integer;			/* Disabled menu message STR ID */
								integer;			/* Checked menu message STR ID */
								integer;			/* other menu message STR ID */	

							case HMSkipItem:
								key int = HMSkipItemID;
						};
hmnuCompareEnd:				
					case HMNamedResourceItem:
hmnuNamedResBeg:		integer = (hmnuNamedResEnd[$$ArrayIndex(HMenuArray)] - hmnuNamedResBeg[$$ArrayIndex(HMenuArray)]) / 8;
						key int = HMNamedResourceID;
						literal longint;	/*	res type of resource to fetch, using item name	*/
hmnuNamedResEnd:						
				};
		};
};

/*----------------------------hdlg • Help Mgr Dialog Balloon Template--------------------------*/
type 'hdlg' {
		integer;									/* Help Version */
		integer;									/* item # (0-based) of first DITL item */
		longint;									/* Options	*/
		integer;									/* Balloon ProcID */
		integer; 									/* Balloon variant */
		
		integer = $$CountOf(HDialogArray);			/* Count of HDialogArray items	*/
		
		switch {			/* Special Messages for missing array items */
				case HMStringItem:
hdlgMissStringBeg:		integer = (hdlgMissStringEnd - hdlgMissStringBeg) / 8;
						key int = HMStringItemID;
						point;							/* tip			*/
						rect;							/* hotRect		*/
						pstring;			/* use for missing HDialogArray items  */
						pstring;			/* use for missing HDialogArray items  */
						pstring;			/* use for missing HDialogArray items  */
						pstring;			/* use for missing HDialogArray items  */
						align word;			/* always word align the code for the pstring */
hdlgMissStringEnd:						
				case HMPictItem:
hdlgMissPictBeg:		integer = (hdlgMissPictEnd - hdlgMissPictBeg) / 8;
						key int = HMPictItemID;
						point;							/* tip			*/
						rect;							/* hotRect		*/
						integer;			/* use for missing HDialogArray items  */
						integer;			/* use for missing HDialogArray items  */
						integer;			/* use for missing HDialogArray items  */
						integer;			/* use for missing HDialogArray items  */
hdlgMissPictEnd:
				case HMStringResItem:
hdlgMissStringResBeg:	integer = (hdlgMissStringResEnd - hdlgMissStringResBeg) / 8;
						key int = HMStringResItemID;
						point;							/* tip			*/
						rect;							/* hotRect		*/
						integer; integer;	/* Miss or 0 HDialogArray STR# res ID, index # */
						integer; integer;	/* Miss or 0 HDialogArray STR# res ID, index # */
						integer; integer;	/* Miss or 0 HDialogArray STR# res ID, index # */
						integer; integer;	/* Miss or 0 HDialogArray STR# res ID, index # */
hdlgMissStringResEnd:
				case HMTEResItem:
hdlgMissTEResBeg:		integer = (hdlgMissTEResEnd - hdlgMissTEResBeg) / 8;
						key int = HMTEResItemID;
						point;							/* tip			*/
						rect;							/* hotRect		*/
						integer;			/* use for missing HDialogArray items */
						integer;			/* use for missing HDialogArray items */
						integer;			/* use for missing HDialogArray items */
						integer;			/* use for missing HDialogArray items */
hdlgMissTEResEnd:
				case HMSTRResItem:
hdlgMissSTRResBeg:		integer = (hdlgMissSTRResEnd - hdlgMissSTRResBeg) / 8;
						key int = HMSTRResItemID;
						point;							/* tip			*/
						rect;							/* hotRect		*/
						integer;			/* use for missing HDialogArray items */
						integer;			/* use for missing HDialogArray items */
						integer;			/* use for missing HDialogArray items */
						integer;			/* use for missing HDialogArray items */
hdlgMissSTRResEnd:
				case HMSkipItem:
hdlgMissSkipBeg:		integer = (hdlgMissSkipEnd - hdlgMissSkipBeg) / 8;
						key int = HMSkipItemID;	/* use when there is no missing msg */
hdlgMissSkipEnd:						
			};

		/* this is an array of records corresponding to dialog items in a dialog */
		array HDialogArray {
				switch {
					case HMStringItem:
hdlgStringBeg:			integer = (hdlgStringEnd[$$ArrayIndex(HDialogArray)] - hdlgStringBeg[$$ArrayIndex(HDialogArray)]) / 8;
						key int = HMStringItemID;		/* helpType		*/
						point;							/* tip			*/
						rect;							/* hotRect		*/
						pstring;		/* Enabled dialog item message string	*/
						pstring;		/* Disabled dialog item message string	*/
						pstring;		/* Checked dialog item message string	*/
						pstring;		/* other dialog item message string		*/
						align word;		/* always word align the code */
hdlgStringEnd:						
					case HMPictItem:
hdlgPictBeg:			integer = (hdlgPictEnd[$$ArrayIndex(HDialogArray)] - hdlgPictBeg[$$ArrayIndex(HDialogArray)]) / 8;
						key int = HMPictItemID;			/* helpType		*/
						point;							/* tip			*/
						rect;							/* hotRect		*/
						integer;		/* Enabled dialog item message pict ID	*/
						integer;		/* Disabled dialog item message pict ID	*/
						integer;		/* Checked dialog item message pict ID	*/
						integer;		/* other dialog item message pict ID 	*/	
hdlgPictEnd:						
					case HMStringResItem:
hdlgStringResBeg:		integer = (hdlgStringResEnd[$$ArrayIndex(HDialogArray)] - hdlgStringResBeg[$$ArrayIndex(HDialogArray)]) / 8;
						key int = HMStringResItemID;	/* helpType		*/
						point;							/* tip			*/
						rect;							/* hotRect		*/
						integer; integer;	/* Enabled STR# res ID, index #		*/
						integer; integer;	/* Disabled STR# res ID, index #	*/
						integer; integer;	/* Checked STR# res ID, index #		*/
						integer; integer;	/* other STR# res ID, index #		*/
hdlgStringResEnd:						
					case HMTEResItem:
hdlgTEResBeg:			integer = (hdlgTEResEnd[$$ArrayIndex(HDialogArray)] - hdlgTEResBeg[$$ArrayIndex(HDialogArray)]) / 8;
						key int = HMTEResItemID;		/* helpType		*/
						point;							/* tip			*/
						rect;							/* hotRect		*/
						integer;		/* Enabled dialog item message TERes ID */
						integer;		/* Disabled item message TERes ID		*/
						integer;		/* Checked item message TERes ID		*/
						integer;		/* other item message TERes ID			*/	
hdlgTEResEnd:						
					case HMSTRResItem:
hdlgSTRResBeg:			integer = (hdlgSTRResEnd[$$ArrayIndex(HDialogArray)] - hdlgSTRResBeg[$$ArrayIndex(HDialogArray)]) / 8;
						key int = HMSTRResItemID;		/* helpType		*/
						point;							/* tip			*/
						rect;							/* hotRect		*/
						integer;		/* Enabled dialog item message STR ID	*/
						integer;		/* Disabled dialog item message STR ID	*/
						integer;		/* Checked dialog item message STR ID	*/
						integer;		/* other dialog item message STR ID		*/	
hdlgSTRResEnd:						
					case HMSkipItem:
hdlgSkipBeg:			integer = (hdlgSkipEnd[$$ArrayIndex(HDialogArray)] - hdlgSkipBeg[$$ArrayIndex(HDialogArray)]) / 8;
						key int = HMSkipItemID;
hdlgSkipEnd:						
				};
		};
};

/*----------------------------hwin • Help Mgr Window Balloon Template--------------------------*/
type 'hwin' {
		integer;									/* Help Version */
		longint;									/* Options				*/
		integer = $$CountOf(HWinArray);				/* Count				*/
		array HWinArray {
				integer;			/* resource ID for help template 		*/
				literal longint;	/* res type of template (hdlg or hrct)	*/
				integer;			/* len of comparison string 			*/
				pstring;			/* comparison string for window title	*/
				align word;
		};
};

/*----------------------------hrct • Help Mgr Rectangle List Template-------------------------*/
type 'hrct' {
		integer;									/* Help Version 		*/
		longint;									/* Options				*/
		integer;									/* Balloon ProcID		*/
		integer; 									/* Balloon Variant		*/
		integer = $$CountOf(HRectArray);			/* Count of hrct Msgs	*/

		array HRectArray {
				switch {
					case HMStringItem:
hrctStringBeg:			integer = (hrctStringEnd[$$ArrayIndex(HRectArray)] - hrctStringBeg[$$ArrayIndex(HRectArray)]) / 8;
						key int = HMStringItemID;	/* helpType			*/
						point;						/* tip				*/
						rect;						/* hotRect			*/
						pstring;					/* STR255			*/
						align word;					/* keep aligned		*/
hrctStringEnd:
					case HMPictItem:
hrctPictBeg:			integer = (hrctPictEnd[$$ArrayIndex(HRectArray)] - hrctPictBeg[$$ArrayIndex(HRectArray)]) / 8;
						key int = HMPictItemID;		/* helpType			*/
						point;						/* tip				*/
						rect;						/* hotRect			*/
						integer;					/* Picture Res ID	*/
hrctPictEnd:
					case HMStringResItem:
hrctStringResBeg:		integer = (hrctStringResEnd[$$ArrayIndex(HRectArray)] - hrctStringResBeg[$$ArrayIndex(HRectArray)]) / 8;
						key int = HMStringResItemID;/* helpType			*/
						point;						/* tip				*/
						rect;						/* hotRect			*/
						integer; integer;			/* STR# ID, index #	*/
hrctStringResEnd:
					case HMTEResItem:
hrctTEResBeg:			integer = (hrctTEResEnd[$$ArrayIndex(HRectArray)] - hrctTEResBeg[$$ArrayIndex(HRectArray)]) / 8;
						key int = HMTEResItemID;	/* helpType			*/
						point;						/* tip				*/
						rect;						/* hotRect			*/
						integer;					/* TextEdit res ID	*/
hrctTEResEnd:
					case HMSTRResItem:
hrctSTRResBeg:			integer = (hrctSTRResEnd[$$ArrayIndex(HRectArray)] - hrctSTRResBeg[$$ArrayIndex(HRectArray)]) / 8;
						key int = HMSTRResItemID;	/* helpType			*/
						point;						/* tip				*/
						rect;						/* hotRect			*/
						integer;					/* STR res ID		*/
hrctSTRResEnd:
					case HMSkipItem:
hrctSkipBeg:			integer = (hrctSkipEnd[$$ArrayIndex(HRectArray)] - hrctSkipBeg[$$ArrayIndex(HRectArray)]) / 8;
						key int = HMSkipItemID;		/* skip item (leave a hole) */
						point;						/* tip options (keep same structure as other items)	*/
						rect;						/* skip this rect			*/
hrctSkipEnd:
					case HMTrackControlStringItem:
hrctTCStringBeg:		integer = (hrctTCStringEnd[$$ArrayIndex(HRectArray)] - hrctTCStringBeg[$$ArrayIndex(HRectArray)]) / 8;
						key int = HMStringItemID+HMTrackCntlID;
						point;						/* tip				*/
						rect;						/* hotRect			*/
						pstring;					/* Enabled control message string		*/
						pstring;					/* Disabled control message string		*/
						pstring;					/* Checked control message string		*/
						pstring;					/* other control message string			*/
						align word;					/* keep aligned		*/
hrctTCStringEnd:						
					case HMTrackControlPictItem:
hrctTCPictBeg:			integer = (hrctTCPictEnd[$$ArrayIndex(HRectArray)] - hrctTCPictBeg[$$ArrayIndex(HRectArray)]) / 8;
						key int = HMPictItemID+HMTrackCntlID;
						point;						/* tip				*/
						rect;						/* hotRect			*/
						integer;					/* Enabled control message pict ID		*/
						integer;					/* Disabled control message pict ID		*/
						integer;					/* Checked control message pict ID		*/
						integer;					/* other control message pict ID 		*/	
hrctTCPictEnd:						
					case HMTrackControlStringResItem:
hrctTCStringResBeg:		integer = (hrctTCStringResEnd[$$ArrayIndex(HRectArray)] - hrctTCStringResBeg[$$ArrayIndex(HRectArray)]) / 8;
						key int = HMStringResItemID+HMTrackCntlID;
						point;						/* tip				*/
						rect;						/* hotRect			*/
						integer; integer;			/* Enabled STR# res ID, index #		*/
						integer; integer;			/* Disabled STR# res ID, index #	*/
						integer; integer;			/* Checked STR# res ID, index #		*/
						integer; integer;			/* other STR# res ID, index #		*/
hrctTCStringResEnd:						
					case HMTrackControlTEResItem:
hrctTCTEResBeg:			integer = (hrctTCTEResEnd[$$ArrayIndex(HRectArray)] - hrctTCTEResBeg[$$ArrayIndex(HRectArray)]) / 8;
						key int = HMTEResItemID+HMTrackCntlID;
						point;						/* tip				*/
						rect;						/* hotRect			*/
						integer;					/* Enabled TextEdit hdl spec ID		*/
						integer;					/* Disabled TextEdit hdl spec ID	*/
						integer;					/* Checked TextEdit hdl spec ID		*/
						integer;					/* other TextEdit hdl spec ID		*/
hrctTCTEResEnd:						
					case HMTrackControlSTRResItem:
hrctTCSTRResBeg:		integer = (hrctTCSTRResEnd[$$ArrayIndex(HRectArray)] - hrctTCSTRResBeg[$$ArrayIndex(HRectArray)]) / 8;
						key int = HMSTRResItemID+HMTrackCntlID;
						point;						/* tip				*/
						rect;						/* hotRect			*/
						integer;					/* Enabled control message STR ID		*/
						integer;					/* Disabled control message STR ID		*/
						integer;					/* Checked control message STR ID		*/
						integer;					/* other control message STR ID			*/	
hrctTCSTRResEnd:						
				};
		};
};



/*----------------------------hovr • Help Mgr Override Resource Template-------------------------*/

type 'hovr' {
		integer;									/* Help Version */
		longint;									/* Options */
		integer;									/* Balloon ProcID */
		integer; 									/* Balloon variant */
		integer = $$CountOf(HOverrideArray);		/* Count of array items (below) */

		switch {			/* Special Message for missing array items */
				case HMStringItem:
hovrMissStringBeg:		integer = (hovrMissStringEnd - hovrMissStringBeg) / 8;
						key int = HMStringItemID;
						pstring;				/* missing HOverrideArray item  */
						align word;				/* always word align the code for the pstring */
hovrMissStringEnd:						
				case HMPictItem:
hovrMissPictBeg:		integer = (hovrMissPictEnd - hovrMissPictBeg) / 8;
						key int = HMPictItemID;
						integer;				/* missing HOverrideArray item  */
hovrMissPictEnd:
				case HMStringResItem:
hovrMissStringResBeg:	integer = (hovrMissStringResEnd - hovrMissStringResBeg) / 8;
						key int = HMStringResItemID;
						integer; integer;		/* Miss or 0 HOverrideArray STR# res ID, index # */
hovrMissStringResEnd:
				case HMTEResItem:
hovrMissTEResBeg:		integer = (hovrMissTEResEnd - hovrMissTEResBeg) / 8;
						key int = HMTEResItemID;
						integer;				/* use for missing HOverrideArray items */
hovrMissTEResEnd:
				case HMSTRResItem:
hovrMissSTRResBeg:		integer = (hovrMissSTRResEnd - hovrMissSTRResBeg) / 8;
						key int = HMSTRResItemID;
						integer;				/* use for missing HOverrideArray items */
hovrMissSTRResEnd:
				case HMSkipItem:
hovrMissSkipBeg:		integer = (hovrMissSkipEnd - hovrMissSkipBeg) / 8;
						key int = HMSkipItemID;	/* use when there is no missing msg */
hovrMissSkipEnd:						
			};
			
		array HOverrideArray {
				switch {
					case HMStringItem:
hovrStringBeg:			integer = (hovrStringEnd[$$ArrayIndex(HOverrideArray)] - hovrStringBeg[$$ArrayIndex(HOverrideArray)]) / 8;
						key int = HMStringItemID;
						pstring;			/* message string  */
						align word;
hovrStringEnd:						
					case HMPictItem:
hovrPictBeg:			integer = (hovrPictEnd[$$ArrayIndex(HOverrideArray)] - hovrPictBeg[$$ArrayIndex(HOverrideArray)]) / 8;
						key int = HMPictItemID;
						integer;			/* message pict ID  */
hovrPictEnd:												
					case HMStringResItem:
hovrStringResBeg:		integer = (hovrStringResEnd[$$ArrayIndex(HOverrideArray)] - hovrStringResBeg[$$ArrayIndex(HOverrideArray)]) / 8;
						key int = HMStringResItemID;
						integer; integer;	/* STR# res ID, index # */
hovrStringResEnd:						
					case HMTEResItem:
hovrTEResBeg:			integer = (hovrTEResEnd[$$ArrayIndex(HOverrideArray)] - hovrTEResBeg[$$ArrayIndex(HOverrideArray)]) / 8;
						key int = HMTEResItemID;
						integer;			/* message TERes ID */
hovrTEResEnd:						
					case HMSTRResItem:
hovrSTRResBeg:			integer = (hovrSTRResEnd[$$ArrayIndex(HOverrideArray)] - hovrSTRResBeg[$$ArrayIndex(HOverrideArray)]) / 8;
						key int = HMSTRResItemID;
						integer;			/* message STR ID */
hovrSTRResEnd:						
					case HMSkipItem:
hovrSkipBeg:			integer = (hovrSkipEnd[$$ArrayIndex(HOverrideArray)] - hovrSkipBeg[$$ArrayIndex(HOverrideArray)]) / 8;
						key int = HMSkipItemID;
hovrSkipEnd:						
				};
		};
};


/*----------------------------hfdr • Help Mgr Finder Application Balloon Template-------------------------*/
type 'hfdr' {
		integer;									/* Help Version 		*/
		longint;									/* Options				*/
		integer;									/* Balloon ProcID		*/
		integer; 									/* Balloon Variant		*/
		integer = $$CountOf(HFdrArray);				/* Count of hfdr Msgs	*/

		array HFdrArray {
				switch {
					case HMStringItem:
hfdrStringBeg:			integer = (hfdrStringEnd[$$ArrayIndex(HFdrArray)] - hfdrStringBeg[$$ArrayIndex(HFdrArray)]) / 8;
						key int = HMStringItemID;	/* helpType			*/
						pstring;					/* STR255			*/
						align word;					/* keep aligned		*/
hfdrStringEnd:
					case HMPictItem:
hfdrPictBeg:			integer = (hfdrPictEnd[$$ArrayIndex(HFdrArray)] - hfdrPictBeg[$$ArrayIndex(HFdrArray)]) / 8;
						key int = HMPictItemID;		/* helpType			*/
						integer;					/* Picture Res ID	*/
hfdrPictEnd:
					case HMStringResItem:
hfdrStringResBeg:		integer = (hfdrStringResEnd[$$ArrayIndex(HFdrArray)] - hfdrStringResBeg[$$ArrayIndex(HFdrArray)]) / 8;
						key int = HMStringResItemID;/* helpType			*/
						integer; integer;			/* STR# ID, index #	*/
hfdrStringResEnd:
					case HMTEResItem:
hfdrTEResBeg:			integer = (hfdrTEResEnd[$$ArrayIndex(HFdrArray)] - hfdrTEResBeg[$$ArrayIndex(HFdrArray)]) / 8;
						key int = HMTEResItemID;	/* helpType			*/
						integer;					/* TextEdit res ID	*/
hfdrTEResEnd:
					case HMSTRResItem:
hfdrSTRResBeg:			integer = (hfdrSTRResEnd[$$ArrayIndex(HFdrArray)] - hfdrSTRResBeg[$$ArrayIndex(HFdrArray)]) / 8;
						key int = HMSTRResItemID;	/* helpType			*/
						integer;					/* STR res ID		*/
hfdrSTRResEnd:
					case HMSkipItem:
hfdrSkipBeg:			integer = (hfdrSkipEnd[$$ArrayIndex(HFdrArray)] - hfdrSkipBeg[$$ArrayIndex(HFdrArray)]) / 8;
						key int = HMSkipItemID;		/* skip item (leave a hole) */
hfdrSkipEnd:
				};
		};
};

#endif __BALLOONTYPES_R__