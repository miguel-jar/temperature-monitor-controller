SHELL = cmd.exe
export AS_PLC := X20CP1583
export AS_CPU_PATH := $(AS_TEMP_PATH)/Objects/$(AS_CONFIGURATION)/$(AS_PLC)
export AS_CPU_PATH_2 := C:/projects/ProjetoPadrao2022/Temp//Objects/$(AS_CONFIGURATION)/$(AS_PLC)
export AS_PROJECT_CONFIG_PATH := $(AS_PROJECT_PATH)/Physical/$(AS_CONFIGURATION)
export AS_PROJECT_CPU_PATH := $(AS_PROJECT_CONFIG_PATH)/$(AS_PLC)
export AS_STATIC_ARCHIVES_PATH := $(AS_TEMP_PATH)/Archives/$(AS_CONFIGURATION)/$(AS_PLC)
export WIN32_AS_CPU_PATH := $(WIN32_AS_TEMP_PATH)\Objects\$(AS_CONFIGURATION)\$(AS_PLC)
export WIN32_AS_ACTIVE_CONFIG_PATH := $(WIN32_AS_PROJECT_PATH)\Physical\$(AS_CONFIGURATION)\$(AS_PLC)


CpuMakeFile: \
$(AS_CPU_PATH)/ashwd.br \
$(AS_CPU_PATH)/asfw.br \
$(AS_CPU_PATH)/sysconf.br \
$(AS_CPU_PATH)/arconfig.br \
$(AS_CPU_PATH)/ProjetoA11.br \
$(AS_CPU_PATH)/iomap.br \
$(AS_CPU_PATH)/OpcUaMap.br \
$(AS_BINARIES_PATH)/$(AS_CONFIGURATION)/$(AS_PLC)/Transfer.lst


$(AS_BINARIES_PATH)/$(AS_CONFIGURATION)/$(AS_PLC)/Transfer.lst: \
	$(AS_CPU_PATH)/ashwd.br \
	$(AS_CPU_PATH)/asfw.br \
	$(AS_CPU_PATH)/sysconf.br \
	$(AS_CPU_PATH)/arconfig.br \
	$(AS_CPU_PATH)/ProjetoA11.br \
	$(AS_CPU_PATH)/iomap.br \
	$(AS_CPU_PATH)/OpcUaMap.br \
	$(AS_PROJECT_CPU_PATH)/Cpu.sw
	@"$(AS_BIN_PATH)/BR.AS.FinalizeBuild.exe" "$(AS_PROJECT_PATH)/ProjetoPadrao2022.apj" -t "$(AS_TEMP_PATH)" -o "$(AS_BINARIES_PATH)" -c "$(AS_CONFIGURATION)" -i "C:/BrAutomation/AS41" -S "X20CP1583"   -A "X20CP1583" -pil   -swFiles "$(AS_PROJECT_PATH)/Physical/Config1/X20CP1583/Cpu.sw" -C "/RT=1000 /AM=* /SDT=5 /DAIP=192.168.0.70 /REPO=11159 /ANSL=1 /PT=11169" -D "/IF=tcpip /LOPO=11159 /SA=1" -M IA32 -T SG4

#nothing to do (just call module make files)

include $(AS_CPU_PATH)/OpcUaMap/OpcUaMap.mak
include $(AS_CPU_PATH)/iomap/iomap.mak
include $(AS_CPU_PATH)/ProjetoA11/ProjetoA11.mak
include $(AS_CPU_PATH)/arconfig/arconfig.mak
include $(AS_CPU_PATH)/sysconf/sysconf.mak
include $(AS_CPU_PATH)/AsFw/AsFw.mak
include $(AS_CPU_PATH)/AsHwd/AsHwd.mak

.DEFAULT:
#nothing to do (need this target for prerequisite files that don't exit)

FORCE:
