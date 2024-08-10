UnmarkedObjectFolder := C:/projects/ProjetoPadrao2022/Logical/Revisao
MarkedObjectFolder := C:/projects/ProjetoPadrao2022/Logical/Revisao

$(AS_CPU_PATH)/Revisao.br: \
	$(AS_PROJECT_CPU_PATH)/Cpu.per \
	$(AS_CPU_PATH)/Revisao/Revisao.ox
	@"$(AS_BIN_PATH)/BR.AS.TaskBuilder.exe" "$(AS_CPU_PATH)/Revisao/Revisao.ox" -o "$(AS_CPU_PATH)/Revisao.br" -v V1.00.0 -f "$(AS_CPU_PATH)/NT.ofs" -offsetLT "$(AS_BINARIES_PATH)/$(AS_CONFIGURATION)/$(AS_PLC)/LT.ofs" -T SG4  -M IA32  -B G4.09 -extConstants -d "runtime: V* - V*,asieccon: V* - V*" -r Cyclic4 -p 2 -s "Revisao" -L "AsIecCon: V*, AsTime: V*, Operator: V*, Runtime: V*" -P "$(AS_PROJECT_PATH)" -secret "$(AS_PROJECT_PATH)_br.as.taskbuilder.exe"

$(AS_CPU_PATH)/Revisao/Revisao.ox: \
	$(AS_CPU_PATH)/Revisao/a.out
	@"$(AS_BIN_PATH)/BR.AS.Backend.exe" "$(AS_CPU_PATH)/Revisao/a.out" -o "$(AS_CPU_PATH)/Revisao/Revisao.ox" -T SG4 -r Cyclic4   -G V4.1.2  -secret "$(AS_PROJECT_PATH)_br.as.backend.exe"

$(AS_CPU_PATH)/Revisao/a.out: \
	$(AS_CPU_PATH)/Revisao/RevisaoCyclic.st.o
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" -link "$(AS_CPU_PATH)/Revisao/RevisaoCyclic.st.o"  -o "$(AS_CPU_PATH)/Revisao/a.out"  -G V4.1.2  -T SG4  -M IA32  "-Wl,$(AS_PROJECT_PATH)/AS/System/G0409/SG4/IA32/libAsIecCon.a" "-Wl,$(AS_PROJECT_PATH)/AS/System/G0409/SG4/IA32/libAsTime.a" "-Wl,$(AS_PROJECT_PATH)/AS/System/G0409/SG4/IA32/libRuntime.a" "-Wl,$(AS_PROJECT_PATH)/AS/System/G0409/SG4/IA32/libOperator.a" -specs=I386specs -Wl,-q,-T,bur_elf_i386.x -nostdlib -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

$(AS_CPU_PATH)/Revisao/RevisaoCyclic.st.o: \
	$(AS_PROJECT_PATH)/Logical/Revisao/RevisaoCyclic.st \
	$(AS_PROJECT_PATH)/Logical/Revisao/Revisao.var
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/Revisao/RevisaoCyclic.st" -o "$(AS_CPU_PATH)/Revisao/RevisaoCyclic.st.o"  -T SG4  -M IA32  -G V4.1.2  -s "Revisao" -t "$(AS_TEMP_PATH)" -pointers -extComments -extBitAccess -extConstants -D _SG4 -l "$(AS_PROJECT_PATH)/Logical/Revisao/Revisao.typ" "$(AS_PROJECT_PATH)/Logical/Revisao/Revisao.var" -g "$(AS_PROJECT_PATH)/Logical/Libraries/Operator/operator.typ" "$(AS_PROJECT_PATH)/Logical/Libraries/Runtime/runtime.typ" "$(AS_PROJECT_PATH)/Logical/Libraries/AsTime/astime.typ" "$(AS_PROJECT_PATH)/Logical/Libraries/AsIecCon/AsIecCon.typ" "$(AS_PROJECT_PATH)/Logical/Libraries/Operator/operator.fun" "$(AS_PROJECT_PATH)/Logical/Libraries/Runtime/runtime.fun" "$(AS_PROJECT_PATH)/Logical/Libraries/AsTime/astime.fun" "$(AS_PROJECT_PATH)/Logical/Libraries/AsIecCon/AsIecCon.fun" "$(AS_PROJECT_PATH)/Logical/Libraries/Operator/operator.var" "$(AS_PROJECT_PATH)/Logical/Libraries/Runtime/runtime.var" "$(AS_PROJECT_PATH)/Logical/Libraries/AsTime/astime.var" "$(AS_PROJECT_PATH)/Logical/Libraries/AsIecCon/AsIecCon.var" "$(AS_PROJECT_PATH)/Logical/Global.typ" "$(AS_PROJECT_PATH)/Logical/Global.var"  -P "$(AS_PROJECT_PATH)" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

-include $(AS_CPU_PATH)/Force.mak 

