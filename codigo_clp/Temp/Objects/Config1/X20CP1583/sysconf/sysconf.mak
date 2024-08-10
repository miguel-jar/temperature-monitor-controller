$(AS_CPU_PATH)/sysconf.br: \
	$(AS_PROJECT_CONFIG_PATH)/Hardware.hw 
	@"$(AS_BIN_PATH)/BR.AS.ConfigurationBuilder.exe" "$(AS_PROJECT_CONFIG_PATH)/Hardware.hw"  -c Config1 -sysconf -S "X20CP1583" -o "$(AS_CPU_PATH)/sysconf.br" -T SG4  -B G4.09 -P "$(AS_PROJECT_PATH)" -s "Config1" -secret "$(AS_PROJECT_PATH)_br.as.configurationbuilder.exe"

-include $(AS_CPU_PATH)/Force.mak 
