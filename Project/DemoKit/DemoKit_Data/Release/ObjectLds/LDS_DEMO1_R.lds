/* Linker script for malta
 *
 * Version: Sourcery G++ Lite 4.3-221
 * Support: https://support.codesourcery.com/GNUToolchain/
 *
 * Copyright (c) 2007, 2008, 2009 CodeSourcery, Inc.
 *
 * The authors hereby grant permission to use, copy, modify, distribute,
 * and license this software and its documentation for any purpose, provided
 * that existing copyright notices are retained in all copies and that this
 * notice is included verbatim in any distributions.  No written agreement,
 * license, or royalty fee is required for any of the authorized uses.
 * Modifications to this software may be copyrighted by their authors
 * and need not follow the licensing terms described here, provided that
 * the new terms are clearly indicated on the first page of each file where
 * they apply.
 * */

/* Rule:
 * 1. to use .o in project layer just type the .o name with file extension. (UiFlow.o)
 * 2. to use .o in library layer have to add prefix module name. (DemoKit_Data/Release/ObjectLds/DscSystem/SysTask.o)
 * */

OUTPUT_ARCH(mips)
ENTRY(__start)
SEARCH_DIR(.)

SECTIONS
{
    .SPECIAL_RO 0x80000000:
    {
        _section_01_addr = ABSOLUTE(.);
        KEEP(DemoKit_Data/Release/ObjectCode/BinInfo.o(.data*));
    }
    .EXCEPTION_TABLE 0x80000180:
    {
        KEEP(DemoKit_Data/Release/ObjectLds/Startup/exception_MIPS.o(.text*));
    }
    .VECTOR_TABLE 0x80000200:
    {
        __start_vector_table = ABSOLUTE(.);
        KEEP(DemoKit_Data/Release/ObjectLds/Startup/isr_MIPS.o(.text*));
        __end_vector_table = ABSOLUTE(.);
    }
    .CODE_INFO 0x800002F0:
    {
        KEEP(DemoKit_Data/Release/ObjectCode/CodeInfo.o(.data*));
    }
    .START_UP 0x80000400:
    {
        _load_entry_start_base = ABSOLUTE(.);
        DemoKit_Data/Release/ObjectLds/Startup/Loader_MIPS.o(.text*)
        DemoKit_Data/Release/ObjectLds/Startup/Startup_MIPS.o (.text* .data* .data1* .rodata* .rodata1* .reginfo*)
        _load_entry_end_base = ABSOLUTE(.);
    }

    /* kernel common */
    . = ALIGN(4);
    .SECTION_01 :
    {
        /*============================ before os start ===============================  */
        *(.kercfg_data*) /*collect install ID process of all modules*/
        *(.kercfg_text*) /*collect install ID process of all modules*/
        DemoKit_Data/Release/ObjectCode/_main.o (.text* .data* .data1* .rodata* .rodata1* .reginfo*)
        DemoKit_Data/Release/ObjectCode/SysCfg.o (.text* .data* .data1* .rodata* .rodata1* .reginfo*)
        ../../ARC/Common/Release/Kernel.a (.text* .data* .data1* .rodata* .rodata1* .reginfo*)
        ../../ARC/Common/Release/OS.a (.text* .data* .data1* .rodata* .rodata1* .reginfo*)
        ../../ARC/Drv/Release/DxSys.a (.text* .data* .data1* .rodata* .rodata1* .reginfo*)
        ../../ARC/Drv/Release/DSPCFG.a (.text* .data* .data1* .rodata* .rodata1* .reginfo*)
        ../../ARC/Drv/Release/Driver_Sys.a (.text* .data* .data1* .rodata* .rodata1* .reginfo*)
        DemoKit_Data/Release/ObjectLds/Driver_IPP/grph.o (.text* .data* .data1* .rodata* .rodata1* .reginfo*)
        DemoKit_Data/Release/ObjectLds/Driver_Codec/jpeg.o (.text* .data* .data1* .rodata* .rodata1* .reginfo*)
        DemoKit_Data/Release/ObjectLds/Driver_Codec/jpeg_int.o (.text* .data* .data1* .rodata* .rodata1* .reginfo*)
        ../../ARC/Common/Release/Debug.a (.text* .data* .data1* .rodata* .rodata1* .reginfo*)
        ../../ARC/Common/Release/LibC.a (.text* .data* .data1* .rodata* .rodata1* .reginfo*)
        libgcc.a (.text* .data* .data1* .rodata* .rodata1* .reginfo*)
        ../../ARC/Common/Release/Utility.a (.text* .data* .data1* .rodata* .rodata1* .reginfo*)
        DemoKit_Data/Release/ObjectLds/GxGfx/DC.o (.text* .data* .data1* .rodata* .rodata1* .reginfo*)
        ../../ARC/Drv/Release/DbgUt.a (.text* .data* .data1* .rodata* .rodata1* .reginfo*)
        DemoKit_Data/Release/ObjectLds/GxStrg/GxStrg_p1.o (.text* .data* .data1* .rodata* .rodata1* .reginfo*)
        /*============================ after os start ===============================  */
        ../../ARC/Lib/Release/GxSystem.a (.text* .data* .data1* .rodata* .rodata1* .reginfo*)
        DemoKit_Data/Release/ObjectCode/main.o (.text* .data* .data1* .rodata* .rodata1* .reginfo*)
        DemoKit_Data/Release/ObjectCode/SysMain.o (.text* .data* .data1* .rodata* .rodata1* .reginfo*)
        DemoKit_Data/Release/ObjectCode/SysMain_Flow_Init.o (.text* .data* .data1* .rodata* .rodata1* .reginfo*)
        DemoKit_Data/Release/ObjectCode/SysMain_Exe.o (.text* .data* .data1* .rodata* .rodata1* .reginfo*)
        DemoKit_Data/Release/ObjectCode/SysStrg_Exe.o (.text* .data* .data1* .rodata* .rodata1* .reginfo*)
        DemoKit_Data/Release/ObjectCode/SysCmdCB.o (.text* .data* .data1* .rodata* .rodata1* .reginfo*)
        DemoKit_Data/Release/ObjectCode/PipView.o (.text* .data* .data1* .rodata* .rodata1* .reginfo*)
        /*============================ boot flow ===============================  */
        ../../ARC/Lib/Release/FwSrv.a (.text* .data* .data1* .rodata* .rodata1* .reginfo*)
        ../../ARC/Lib/Release/PartLoad.a (.text* .data* .data1* .rodata* .rodata1* .reginfo*)
        ../../ARC/App/Release/DevMan.a (.text* .data* .data1* .rodata* .rodata1* .reginfo*)
        ../../ARC/App/Release/NvtSystem.a (.text* .data* .data1* .rodata* .rodata1* .reginfo*)
        ../../ARC/App/Release/NVTUser.a (.text* .data* .data1* .rodata* .rodata1* .reginfo*)
        /*============================ drv ext ===============================  */
        ../../ARC/Drv/Release/GPS.a (.text* .data* .data1* .rodata* .rodata1* .reginfo*)
        ../../ARC/Drv/Release/GSensor.a (.text* .data* .data1* .rodata* .rodata1* .reginfo*)
        ../../ARC/Drv/Release/Dx.a (.text* .data* .data1* .rodata* .rodata1* .reginfo*)
        ../../ARC/Drv/Release/SpiFlash.a (.text* .data* .data1* .rodata* .rodata1* .reginfo*)
        ../../ARC/Drv/Release/Ramdisk.a (.text* .data* .data1* .rodata* .rodata1* .reginfo*)
        ../../ARC/Drv/Release/MODELEXT_CARDV_DUAL_AONI328.a (.text* .data* .data1* .rodata* .rodata1* .reginfo*)
    }

    /* device common */
    . = ALIGN(4);
    .SECTION_02 :
    {
        _section_01_size = ABSOLUTE(.) - _section_01_addr;
        _section_02_addr = ABSOLUTE(.);
        KEEP (*(.nvtversioninfo.begin*))
        _section_verinfostart = _section_02_addr;
        KEEP(*(.version.info.*))
        _section_verinfoend = ABSOLUTE(.);
        KEEP (*(.nvtversioninfo.end*))
        *(.text*)
        *(.got*)
        *(.rodata*)
        *(.data*)
    }
    _section_02_size = ABSOLUTE(.) - _section_02_addr;

    /* NOTE:
    if using -fcommon compiler option, un-initialized global data will be isolated to .common section.
    if using -fno-common compiler option, un-initialized global data will be merged to .bss section.
    memory between _image_general_zi_zi_base and _image_general_zi_zi_limit will be fill to zero before _main().
    */
    . = ALIGN(4);
    .bss :
    {
        _image_general_zi_zi_base = ABSOLUTE(.);
        /* collect zero initialized global data (mark "B" in sym file) */
        /* collect static local data (mark "b" in sym file) */
        *(.bss*)
    }
    . = ALIGN(4);
    .common :
    {
        __common_base = ABSOLUTE(.);
        /* collect "small" un-initialized global data (mark "C" in sym file) */
        *(.scommon*)
        /* collect "large" un-initialized global data (mark "B" in sym file) */
        *(COMMON)
        __common_limit = ABSOLUTE(.);
    }

    . = ALIGN(4);
        _image_general_zi_zi_limit = ABSOLUTE(.);
    _stack_start = .;

}
EXTERN(AppControl_LIBRARY_VERSION_INFO Capture_LIBRARY_VERSION_INFO DevMan_LIBRARY_VERSION_INFO LviewNvt_LIBRARY_VERSION_INFO MediaPlay_LIBRARY_VERSION_INFO MediaRec_LIBRARY_VERSION_INFO NVTUser_LIBRARY_VERSION_INFO NvtSystem_LIBRARY_VERSION_INFO NvtSystem_LIBRARY_VERSION_INFO Photo_LIBRARY_VERSION_INFO Playback_LIBRARY_VERSION_INFO RtspNvt_LIBRARY_VERSION_INFO UIControl_LIBRARY_VERSION_INFO VControl_LIBRARY_VERSION_INFO CarDV_Media2_0_LIBRARY_VERSION_INFO ExamSrv_LIBRARY_VERSION_INFO Kernel_LIBRARY_VERSION_INFO LibC_LIBRARY_VERSION_INFO Nvtver_LIBRARY_VERSION_INFO OS_LIBRARY_VERSION_INFO Startup_LIBRARY_VERSION_INFO Utility_LIBRARY_VERSION_INFO Audio_Common_LIBRARY_VERSION_INFO Audio_ExtWM8978_LIBRARY_VERSION_INFO DbgUt_LIBRARY_VERSION_INFO Dispobj_LIBRARY_VERSION_INFO Disprot_LIBRARY_VERSION_INFO Driver_Codec_LIBRARY_VERSION_INFO Driver_IPP_LIBRARY_VERSION_INFO Driver_Sys_LIBRARY_VERSION_INFO Dx_LIBRARY_VERSION_INFO DxSys_LIBRARY_VERSION_INFO Ramdisk_LIBRARY_VERSION_INFO Sensor_LIBRARY_VERSION_INFO SpiFlash_LIBRARY_VERSION_INFO hotShoeIO_LIBRARY_VERSION_INFO lensIO_LIBRARY_VERSION_INFO AAC_LIBRARY_VERSION_INFO ADPCM_LIBRARY_VERSION_INFO AEAlg_LIBRARY_VERSION_INFO AETask_LIBRARY_VERSION_INFO AVFile_MakerAvi_LIBRARY_VERSION_INFO AVFile_MakerMov_LIBRARY_VERSION_INFO AVFile_ParserAvi_LIBRARY_VERSION_INFO AVFile_ParserMov_LIBRARY_VERSION_INFO AWBAlg_LIBRARY_VERSION_INFO AWBTask_LIBRARY_VERSION_INFO AudFilt_LIBRARY_VERSION_INFO AudNR_LIBRARY_VERSION_INFO AudProc_LIBRARY_VERSION_INFO AudioCodec_AAC_LIBRARY_VERSION_INFO AudioCodec_PCM_LIBRARY_VERSION_INFO AudioCodec_Zero_LIBRARY_VERSION_INFO CEC_LIBRARY_VERSION_INFO CompareView_LIBRARY_VERSION_INFO CoordTs_LIBRARY_VERSION_INFO DCF_LIBRARY_VERSION_INFO DIS_LIBRARY_VERSION_INFO DPOF_LIBRARY_VERSION_INFO DataStamp_LIBRARY_VERSION_INFO DhcpNvt_LIBRARY_VERSION_INFO DispSrv_LIBRARY_VERSION_INFO EXIF_LIBRARY_VERSION_INFO FD_LIBRARY_VERSION_INFO FileAccess_LIBRARY_VERSION_INFO FileDB_LIBRARY_VERSION_INFO FlashLightAlg_LIBRARY_VERSION_INFO FontToYuv_LIBRARY_VERSION_INFO FwSrv_LIBRARY_VERSION_INFO GxDisplay_LIBRARY_VERSION_INFO GxFlash_LIBRARY_VERSION_INFO GxGfx_LIBRARY_VERSION_INFO GxImage_LIBRARY_VERSION_INFO GxImageFile_LIBRARY_VERSION_INFO GxInput_LIBRARY_VERSION_INFO GxOutput_LIBRARY_VERSION_INFO GxPower_LIBRARY_VERSION_INFO GxSound_LIBRARY_VERSION_INFO GxStrg_LIBRARY_VERSION_INFO GxSystem_LIBRARY_VERSION_INFO GxTimer_LIBRARY_VERSION_INFO GxUSB_LIBRARY_VERSION_INFO GxVideo_LIBRARY_VERSION_INFO GxVideoFile_LIBRARY_VERSION_INFO H264_LIBRARY_VERSION_INFO HWAcc_LIBRARY_VERSION_INFO ImageEffect_LIBRARY_VERSION_INFO ImgStatsLib_LIBRARY_VERSION_INFO JpegBRC_Default_LIBRARY_VERSION_INFO MsdcNvt_LIBRARY_VERSION_INFO MsdcNvtCb_Disp_LIBRARY_VERSION_INFO MsdcNvtCb_File_LIBRARY_VERSION_INFO NameRule_DCFFull_LIBRARY_VERSION_INFO NameRule_FileDB_LIBRARY_VERSION_INFO PBXEdit_LIBRARY_VERSION_INFO PBXFile_LIBRARY_VERSION_INFO PBXFileList_DCF_LIBRARY_VERSION_INFO PBXFileList_FileDB_LIBRARY_VERSION_INFO PBXRedEye_LIBRARY_VERSION_INFO PHOTOFRAME_LIBRARY_VERSION_INFO PStore_LIBRARY_VERSION_INFO PartLoad_LIBRARY_VERSION_INFO RSC_LIBRARY_VERSION_INFO RectZoom_LIBRARY_VERSION_INFO SD_LIBRARY_VERSION_INFO SceneRender_LIBRARY_VERSION_INFO SizeConvert_LIBRARY_VERSION_INFO UMSD_LIBRARY_VERSION_INFO UPCC_LIBRARY_VERSION_INFO USIDC_LIBRARY_VERSION_INFO UVAC_LIBRARY_VERSION_INFO UserJPEG_LIBRARY_VERSION_INFO VideoCodec_BStr_LIBRARY_VERSION_INFO VideoCodec_H264_LIBRARY_VERSION_INFO VideoCodec_MJPG_LIBRARY_VERSION_INFO Wav_LIBRARY_VERSION_INFO WavStudio_LIBRARY_VERSION_INFO ipl_calibration_LIBRARY_VERSION_INFO ipl_common_LIBRARY_VERSION_INFO SlideEffect_ClientLeft2Right_LIBRARY_VERSION_INFO SlideEffect_ClientRight2Left_LIBRARY_VERSION_INFO SlideEffect_Fade_LIBRARY_VERSION_INFO SlideEffect_PushFadeRight2Left_LIBRARY_VERSION_INFO SlideEffect_R2VIn2Out_LIBRARY_VERSION_INFO SlideEffect_R5HDrapeUp2Down_LIBRARY_VERSION_INFO SlideEffect_SlideinRight2Left_LIBRARY_VERSION_INFO SlideEffect_Default_LIBRARY_VERSION_INFO AFALG_LIBRARY_VERSION_INFO AFTASK_LIBRARY_VERSION_INFO IPL_DISPLAY_LIBRARY_VERSION_INFO IPL_DISPLAY2_LIBRARY_VERSION_INFO IPL_CAL_RW_LIBRARY_VERSION_INFO MDAlg_LIBRARY_VERSION_INFO)
