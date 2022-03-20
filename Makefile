tmp_dir = tmp
kext_dir = EFI/OC/Kexts

drivers = OpenRuntime.efi|OpenCanopy.efi
tools = OpenShell.efi

version_opencore = 0.7.9
version_virtualsmc = 1.2.9
version_lilu = 1.6.0
version_whatevergreen = 1.5.8
version_applealc = 1.6.5
version_nvmefix = 1.0.9
version_radeonsensor = 0.3.1

download_oc:
	-rm $(tmp_dir)/OpenCore.zip
	-rm -rf $(tmp_dir)/OpenCore/
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
	cd $(tmp_dir) && curl -o RadeonSensor.zip -L "https://github.com/aluveitie/RadeonSensor/releases/download/$(version_radeonsensor)/RadeonSensor-$(version_radeonsensor).zip" && mkdir RadeonSensor && unzip RadeonSensor.zip -d RadeonSensor
	cp -r $(tmp_dir)/VirtualSMC/Kexts/VirtualSMC.kext $(kext_dir)/
	cp -r $(tmp_dir)/VirtualSMC/Kexts/SMCProcessor.kext $(kext_dir)/
	cp -r $(tmp_dir)/VirtualSMC/Kexts/SMCSuperIO.kext $(kext_dir)/
	cp -r $(tmp_dir)/Lilu/Lilu.kext $(kext_dir)/
	cp -r $(tmp_dir)/WhateverGreen/WhateverGreen.kext $(kext_dir)/
	cp -r $(tmp_dir)/AppleALC/AppleALC.kext $(kext_dir)/
	cp -r $(tmp_dir)/NVMeFix/NVMeFix.kext $(kext_dir)/
	cp -r $(tmp_dir)/RadeonSensor/*.kext $(kext_dir)/

install: base gathering_files gui

install_usb:
	cp EFI/OC/config_no-debug.plist EFI/OC/config.plist

gui:
	cp -Rv submodules/OcBinaryData/Resources EFI/OC

utils:
	cp -Rv tmp/OpenCore/Utilities/CreateVault Utilities

clean: clean_log
	ls -rtd $(tmp_dir)/* | grep -vw -E '.gitkeep|OpenCore' | xargs rm -rf

clean_base: clean
	rm -rf EFI/BOOT
	ls -rtd EFI/OC/* | grep -vw -E 'config.plist|Kexts|ACPI' | xargs rm -rf
	ls -rtd EFI/OC/Kexts/* | grep -vw -E 'USBMap.kext|LucyRTL8125Ethernet.kext' | xargs rm -rf

clean_log:
	rm -rf ./opencore-*.txt

package:
	tar -czvf oc$(version_opencore)_mac`sw_vers -productVersion`.tar.gz EFI/
	zip -r oc$(version_opencore)_mac`sw_vers -productVersion`.zip EFI/
