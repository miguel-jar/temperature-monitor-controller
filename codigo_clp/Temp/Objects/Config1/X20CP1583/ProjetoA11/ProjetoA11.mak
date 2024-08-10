UnmarkedObjectFolder := C:/projects/ProjetoPadrao2022/Logical/ProjetoA110
MarkedObjectFolder := C:/projects/ProjetoPadrao2022/Logical/ProjetoA110

$(AS_CPU_PATH)/ProjetoA11.br: \
	$(AS_PROJECT_CPU_PATH)/Cpu.per \
	$(AS_CPU_PATH)/ProjetoA11/ProjetoA11.ox
	@"$(AS_BIN_PATH)/BR.AS.TaskBuilder.exe" "$(AS_CPU_PATH)/ProjetoA11/ProjetoA11.ox" -o "$(AS_CPU_PATH)/ProjetoA11.br" -v V1.00.0 -f "$(AS_CPU_PATH)/NT.ofs" -offsetLT "$(AS_BINARIES_PATH)/$(AS_CONFIGURATION)/$(AS_PLC)/LT.ofs" -T SG4  -M IA32  -B G4.09 -extConstants -d "runtime: V* - V*,asieccon: V* - V*" -r Cyclic4 -p 2 -s "ProjetoA110" -L "AsIecCon: V*, AsTime: V*, brsystem: V*, LoopConR: V4.10.0, MTBasics: V2.30.2, MTSystem: V1.00.1, MTTypes: V1.03.4, Operator: V*, Runtime: V*, standard: V*, sys_lib: V*" -P "$(AS_PROJECT_PATH)" -secret "$(AS_PROJECT_PATH)_br.as.taskbuilder.exe"

$(AS_CPU_PATH)/ProjetoA11/ProjetoA11.ox: \
	$(AS_CPU_PATH)/ProjetoA11/a.out
	@"$(AS_BIN_PATH)/BR.AS.Backend.exe" "$(AS_CPU_PATH)/ProjetoA11/a.out" -o "$(AS_CPU_PATH)/ProjetoA11/ProjetoA11.ox" -T SG4 -r Cyclic4   -G V4.1.2  -secret "$(AS_PROJECT_PATH)_br.as.backend.exe"

$(AS_CPU_PATH)/ProjetoA11/a.out: \
	$(AS_CPU_PATH)/ProjetoA11/ProjetoA110Init.st.o \
	$(AS_CPU_PATH)/ProjetoA11/ProjetoA110Cyclic.st.o
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" -link "$(AS_CPU_PATH)/ProjetoA11/ProjetoA110Init.st.o" "$(AS_CPU_PATH)/ProjetoA11/ProjetoA110Cyclic.st.o"  -o "$(AS_CPU_PATH)/ProjetoA11/a.out"  -G V4.1.2  -T SG4  -M IA32  "-Wl,$(AS_PROJECT_PATH)/Logical/Libraries/MTSystem/SG4/IA32/libMTSystem.a" "-Wl,$(AS_PROJECT_PATH)/Logical/Libraries/LoopConR/SG4/libLoopConR.a" "-Wl,$(AS_PROJECT_PATH)/Logical/Libraries/MTBasics/SG4/IA32/libMTBasics.a" "-Wl,$(AS_PROJECT_PATH)/Logical/Libraries/MTTypes/SG4/IA32/libMTTypes.a" "-Wl,$(AS_PROJECT_PATH)/AS/System/G0409/SG4/IA32/libstandard.a" "-Wl,$(AS_PROJECT_PATH)/AS/System/G0409/SG4/IA32/libbrsystem.a" "-Wl,$(AS_PROJECT_PATH)/AS/System/G0409/SG4/IA32/libsys_lib.a" "-Wl,$(AS_PROJECT_PATH)/AS/System/G0409/SG4/IA32/libAsIecCon.a" "-Wl,$(AS_PROJECT_PATH)/AS/System/G0409/SG4/IA32/libAsTime.a" "-Wl,$(AS_PROJECT_PATH)/AS/System/G0409/SG4/IA32/libRuntime.a" "-Wl,$(AS_PROJECT_PATH)/AS/System/G0409/SG4/IA32/libOperator.a" -specs=I386specs -Wl,-q,-T,bur_elf_i386.x -nostdlib -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

$(AS_CPU_PATH)/ProjetoA11/ProjetoA110Init.st.o: \
	$(AS_PROJECT_PATH)/Logical/ProjetoA110/ProjetoA110Init.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/LoopConR/LoopConR.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/brsystem/brsystem.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/LoopConR/LoopConR.typ \
	$(AS_PROJECT_PATH)/Logical/ProjetoA110/ProjetoA110.var \
	$(AS_PROJECT_PATH)/Logical/Global.var
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/ProjetoA110/ProjetoA110Init.st" -o "$(AS_CPU_PATH)/ProjetoA11/ProjetoA110Init.st.o"  -O "$(AS_CPU_PATH)//ProjetoA11/ProjetoA110Init.st.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/ProjetoA11/ProjetoA110Cyclic.st.o: \
	$(AS_PROJECT_PATH)/Logical/ProjetoA110/ProjetoA110Cyclic.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/LoopConR/LoopConR.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/brsystem/brsystem.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/LoopConR/LoopConR.typ \
	$(AS_PROJECT_PATH)/Logical/ProjetoA110/ProjetoA110.var \
	$(AS_PROJECT_PATH)/Logical/Global.var
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/ProjetoA110/ProjetoA110Cyclic.st" -o "$(AS_CPU_PATH)/ProjetoA11/ProjetoA110Cyclic.st.o"  -O "$(AS_CPU_PATH)//ProjetoA11/ProjetoA110Cyclic.st.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

-include $(AS_CPU_PATH)/Force.mak 

