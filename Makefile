tmp_dir = tmp
kext_dir = EFI/OC/Kexts
acpi_dir = EFI/OC/ACPI

drivers = OpenRuntime.efi|OpenCanopy.efi
tools = OpenShell.efi

version_opencore = 0.7.4
version_virtualsmc = 1.2.7
version_lilu = 1.5.6
version_whatevergreen = 1.5.4
version_applealc = 1.6.5
version_nvmefix = 1.0.9
version_usbinjectall = 0.7.6

download_oc:
	curl -o $(tmp_dir)/OpenCore.zip -L "https://github.com/acidanthera/OpenCorePkg/releases/download/$(version_opencore)/OpenCore-$(version_opencore)-RELEASE.zip"
	cd $(tmp_dir) && mkdir OpenCore && unzip OpenCore.zip -d OpenCore

base: clean_base download_oc
	cp -r $(tmp_dir)/OpenCore/X64/EFI/BOOT EFI/
	cp -r $(tmp_dir)/OpenCore/X64/EFI/OC/* EFI/OC/
	ls -rtd EFI/OC/Drivers/* | grep -vw -E '$(drivers)' | xargs rm
	ls -rtd EFI/OC/Tools/* | grep -vw -E '$(tools)' | xargs rm

gathering_files: clean
	curl -o EFI/OC/Drivers/HfsPlus.efi -L "https://github.com/acidanthera/OcBinaryData/raw/master/Drivers/HfsPlus.efi"
	cd $(tmp_dir) && curl -o VirtualSMC.zip -L "https://github.com/acidanthera/VirtualSMC/releases/download/$(version_virtualsmc)/VirtualSMC-$(version_virtualsmc)-RELEASE.zip" && mkdir VirtualSMC && unzip VirtualSMC.zip -d VirtualSMC
	cd $(tmp_dir) && curl -o Lilu.zip -L "https://github.com/acidanthera/Lilu/releases/download/$(version_lilu)/Lilu-$(version_lilu)-RELEASE.zip" && mkdir Lilu && unzip Lilu.zip -d Lilu
	cd $(tmp_dir) && curl -o WhateverGreen.zip -L "https://github.com/acidanthera/WhateverGreen/releases/download/$(version_whatevergreen)/WhateverGreen-$(version_whatevergreen)-RELEASE.zip" && mkdir WhateverGreen && unzip WhateverGreen.zip -d WhateverGreen
	cd $(tmp_dir) && curl -o AppleALC.zip -L "https://github.com/acidanthera/AppleALC/releases/download/$(version_applealc)/AppleALC-$(version_applealc)-RELEASE.zip" && mkdir AppleALC && unzip AppleALC.zip -d AppleALC
	cd $(tmp_dir) && curl -o NVMeFix.zip -L "https://github.com/acidanthera/NVMeFix/releases/download/$(version_nvmefix)/NVMeFix-$(version_nvmefix)-RELEASE.zip" && mkdir NVMeFix && unzip NVMeFix.zip -d NVMeFix
	cd $(tmp_dir) && curl -o CtlnaAHCIPort.kext.zip -L "https://github.com/dortania/OpenCore-Install-Guide/raw/master/extra-files/CtlnaAHCIPort.kext.zip" && unzip CtlnaAHCIPort.kext.zip
	unzip downloaded/LucyRTL8125Ethernet-V1.1.0.zip -d $(tmp_dir)
	cd $(tmp_dir) && curl -o SSDT-PLUG-DRTNIA.aml -L "https://github.com/dortania/Getting-Started-With-ACPI/raw/master/extra-files/compiled/SSDT-PLUG-DRTNIA.aml"
	cd $(tmp_dir) && curl -o SSDT-EC-USBX-DESKTOP.aml -L "https://github.com/dortania/Getting-Started-With-ACPI/raw/master/extra-files/compiled/SSDT-EC-USBX-DESKTOP.aml"
	cd $(tmp_dir) && curl -o SSDT-AWAC.aml -L "https://github.com/dortania/Getting-Started-With-ACPI/raw/master/extra-files/compiled/SSDT-AWAC.aml"
	cp -r $(tmp_dir)/VirtualSMC/Kexts/VirtualSMC.kext $(kext_dir)/
	cp -r $(tmp_dir)/VirtualSMC/Kexts/SMCProcessor.kext $(kext_dir)/
	cp -r $(tmp_dir)/VirtualSMC/Kexts/SMCSuperIO.kext $(kext_dir)/
	cp -r $(tmp_dir)/Lilu/Lilu.kext $(kext_dir)/
	cp -r $(tmp_dir)/WhateverGreen/WhateverGreen.kext $(kext_dir)/
	cp -r $(tmp_dir)/AppleALC/AppleALC.kext $(kext_dir)/
	cp -r $(tmp_dir)/NVMeFix/NVMeFix.kext $(kext_dir)/
	cp -r $(tmp_dir)/CtlnaAHCIPort.kext $(kext_dir)/
	cp -r $(tmp_dir)/LucyRTL8125Ethernet-V1.1.0/Release/LucyRTL8125Ethernet.kext $(kext_dir)/
	cp $(tmp_dir)/*.aml $(acpi_dir)/

gui:
	cp -Rv submodules/OcBinaryData/Resources EFI/OC

clean:
	ls -rtd $(tmp_dir)/* | grep -vw -E '.gitkeep|OpenCore' | xargs rm -rf

clean_base: clean
	rm -rf $(tmp_dir)/OpenCore
	rm -f $(tmp_dir)/OpenCore.zip
	rm -rf EFI/BOOT
	ls -rtd EFI/OC/* | grep -vw -E 'config.plist|Kexts' | xargs rm -rf
	ls -rtd EFI/OC/Kexts/* | grep -vw -E 'USBMap.kext' | xargs rm -rf

clean_log:
	rm -rf ./opencore-*.txt
