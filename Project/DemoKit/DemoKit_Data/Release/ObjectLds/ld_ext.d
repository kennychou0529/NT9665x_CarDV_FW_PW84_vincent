DemoKit_Data/Release/ObjectLds/Startup/Startup.a:../../ARC/Common/Release/Startup.a
	@echo Copying ObjectLds:  $(notdir $@)
	@rm -rf $(dir $@)
	@mkdir -p $(dir $@)
	cp $< $@
	chmod 777 $@
	@echo Extracting: DemoKit_Data/Release/ObjectLds/Startup/exception_MIPS.o
	$(AR) x $@ $(notdir DemoKit_Data/Release/ObjectLds/Startup/exception_MIPS.o)
	$(AR) d $@ $(notdir DemoKit_Data/Release/ObjectLds/Startup/exception_MIPS.o)
	mv $(notdir DemoKit_Data/Release/ObjectLds/Startup/exception_MIPS.o) DemoKit_Data/Release/ObjectLds/Startup/exception_MIPS.o;
	@echo Extracting: DemoKit_Data/Release/ObjectLds/Startup/isr_MIPS.o
	$(AR) x $@ $(notdir DemoKit_Data/Release/ObjectLds/Startup/isr_MIPS.o)
	$(AR) d $@ $(notdir DemoKit_Data/Release/ObjectLds/Startup/isr_MIPS.o)
	mv $(notdir DemoKit_Data/Release/ObjectLds/Startup/isr_MIPS.o) DemoKit_Data/Release/ObjectLds/Startup/isr_MIPS.o;
	@echo Extracting: DemoKit_Data/Release/ObjectLds/Startup/Loader_MIPS.o
	$(AR) x $@ $(notdir DemoKit_Data/Release/ObjectLds/Startup/Loader_MIPS.o)
	$(AR) d $@ $(notdir DemoKit_Data/Release/ObjectLds/Startup/Loader_MIPS.o)
	mv $(notdir DemoKit_Data/Release/ObjectLds/Startup/Loader_MIPS.o) DemoKit_Data/Release/ObjectLds/Startup/Loader_MIPS.o;
	@echo Extracting: DemoKit_Data/Release/ObjectLds/Startup/Startup_MIPS.o
	$(AR) x $@ $(notdir DemoKit_Data/Release/ObjectLds/Startup/Startup_MIPS.o)
	$(AR) d $@ $(notdir DemoKit_Data/Release/ObjectLds/Startup/Startup_MIPS.o)
	mv $(notdir DemoKit_Data/Release/ObjectLds/Startup/Startup_MIPS.o) DemoKit_Data/Release/ObjectLds/Startup/Startup_MIPS.o;

DemoKit_Data/Release/ObjectLds/Driver_IPP/Driver_IPP.a:../../ARC/Drv/Release/Driver_IPP.a
	@echo Copying ObjectLds:  $(notdir $@)
	@rm -rf $(dir $@)
	@mkdir -p $(dir $@)
	cp $< $@
	chmod 777 $@
	@echo Extracting: DemoKit_Data/Release/ObjectLds/Driver_IPP/grph.o
	$(AR) x $@ $(notdir DemoKit_Data/Release/ObjectLds/Driver_IPP/grph.o)
	$(AR) d $@ $(notdir DemoKit_Data/Release/ObjectLds/Driver_IPP/grph.o)
	mv $(notdir DemoKit_Data/Release/ObjectLds/Driver_IPP/grph.o) DemoKit_Data/Release/ObjectLds/Driver_IPP/grph.o;

DemoKit_Data/Release/ObjectLds/Driver_Codec/Driver_Codec.a:../../ARC/Drv/Release/Driver_Codec.a
	@echo Copying ObjectLds:  $(notdir $@)
	@rm -rf $(dir $@)
	@mkdir -p $(dir $@)
	cp $< $@
	chmod 777 $@
	@echo Extracting: DemoKit_Data/Release/ObjectLds/Driver_Codec/jpeg.o
	$(AR) x $@ $(notdir DemoKit_Data/Release/ObjectLds/Driver_Codec/jpeg.o)
	$(AR) d $@ $(notdir DemoKit_Data/Release/ObjectLds/Driver_Codec/jpeg.o)
	mv $(notdir DemoKit_Data/Release/ObjectLds/Driver_Codec/jpeg.o) DemoKit_Data/Release/ObjectLds/Driver_Codec/jpeg.o;
	@echo Extracting: DemoKit_Data/Release/ObjectLds/Driver_Codec/jpeg_int.o
	$(AR) x $@ $(notdir DemoKit_Data/Release/ObjectLds/Driver_Codec/jpeg_int.o)
	$(AR) d $@ $(notdir DemoKit_Data/Release/ObjectLds/Driver_Codec/jpeg_int.o)
	mv $(notdir DemoKit_Data/Release/ObjectLds/Driver_Codec/jpeg_int.o) DemoKit_Data/Release/ObjectLds/Driver_Codec/jpeg_int.o;

DemoKit_Data/Release/ObjectLds/GxGfx/GxGfx.a:../../ARC/Lib/Release/GxGfx.a
	@echo Copying ObjectLds:  $(notdir $@)
	@rm -rf $(dir $@)
	@mkdir -p $(dir $@)
	cp $< $@
	chmod 777 $@
	@echo Extracting: DemoKit_Data/Release/ObjectLds/GxGfx/DC.o
	$(AR) x $@ $(notdir DemoKit_Data/Release/ObjectLds/GxGfx/DC.o)
	$(AR) d $@ $(notdir DemoKit_Data/Release/ObjectLds/GxGfx/DC.o)
	mv $(notdir DemoKit_Data/Release/ObjectLds/GxGfx/DC.o) DemoKit_Data/Release/ObjectLds/GxGfx/DC.o;

DemoKit_Data/Release/ObjectLds/GxStrg/GxStrg.a:../../ARC/Lib/Release/GxStrg.a
	@echo Copying ObjectLds:  $(notdir $@)
	@rm -rf $(dir $@)
	@mkdir -p $(dir $@)
	cp $< $@
	chmod 777 $@
	@echo Extracting: DemoKit_Data/Release/ObjectLds/GxStrg/GxStrg_p1.o
	$(AR) x $@ $(notdir DemoKit_Data/Release/ObjectLds/GxStrg/GxStrg_p1.o)
	$(AR) d $@ $(notdir DemoKit_Data/Release/ObjectLds/GxStrg/GxStrg_p1.o)
	mv $(notdir DemoKit_Data/Release/ObjectLds/GxStrg/GxStrg_p1.o) DemoKit_Data/Release/ObjectLds/GxStrg/GxStrg_p1.o;

