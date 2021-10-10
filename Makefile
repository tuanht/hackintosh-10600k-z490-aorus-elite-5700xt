tmp_dir = .tmp
drivers = OpenRuntime.efi|OpenCanopy.efi
tools = OpenShell.efi
version_opencore 		= 0.7.4
version_virtualsmc		= 1.2.7
version_lilu 			= 1.5.6
version_whatevergreen 	= 1.5.4
version_applealc 		= 1.6.5
version_nvmefix 		= 1.0.9

base: clean
	curl -o $(tmp_dir)/OpenCore.zip -L "https://github.com/acidanthera/OpenCorePkg/releases/download/$(version_opencore)/OpenCore-$(version_opencore)-RELEASE.zip"
	cd $(tmp_dir) && mkdir OpenCore && unzip OpenCore.zip -d OpenCore
	cp -r $(tmp_dir)/OpenCore/X64/EFI/BOOT EFI/
	cp -r $(tmp_dir)/OpenCore/X64/EFI/OC/* EFI/OC/
	ls -rtd EFI/OC/Drivers/* | grep -vw -E '$(drivers)' | xargs rm
	ls -rtd EFI/OC/Tools/* | grep -vw -E '$(tools)' | xargs rm

gathering_files:
	curl -o EFI/OC/Drivers/HfsPlus.efi "https://github.com/acidanthera/OcBinaryData/raw/master/Drivers/HfsPlus.efi"
	cd $(tmp_dir) && curl -o VirtualSMC.zip -L "https://github.com/acidanthera/VirtualSMC/releases/download/$(version_virtualsmc)/VirtualSMC-$(version_virtualsmc)-RELEASE.zip" && mkdir VirtualSMC && unzip VirtualSMC.zip -d VirtualSMC
	cd $(tmp_dir) && curl -o Lilu.zip -L "https://github.com/acidanthera/Lilu/releases/download/$(version_lilu)/Lilu-$(version_lilu)-RELEASE.zip" && mkdir Lilu && unzip Lilu.zip -d Lilu
	cd $(tmp_dir) && curl -o WhateverGreen.zip -L "https://github.com/acidanthera/WhateverGreen/releases/download/$(version_whatevergreen)/WhateverGreen-$(version_whatevergreen)-RELEASE.zip" && mkdir WhateverGreen && unzip WhateverGreen.zip -d WhateverGreen
	cd $(tmp_dir) && curl -o AppleALC.zip -L "https://github.com/acidanthera/AppleALC/releases/download/$(version_applealc)/AppleALC-$(version_applealc)-RELEASE.zip" && mkdir AppleALC && unzip AppleALC.zip -d AppleALC
	cd $(tmp_dir) && curl -o NVMeFix.zip -L "https://github.com/acidanthera/NVMeFix/releases/download/$(version_nvmefix)/NVMeFix-$(version_nvmefix)-RELEASE.zip" && mkdir NVMeFix && unzip NVMeFix.zip -d NVMeFix
	cd $(tmp_dir) && curl -o CtlnaAHCIPort.kext.zip -L "https://github.com/dortania/OpenCore-Install-Guide/raw/master/extra-files/CtlnaAHCIPort.kext.zip" && unzip CtlnaAHCIPort.kext.zip
	cp -r $(tmp_dir)/VirtualSMC/Kexts/VirtualSMC.kext EFI/OC/Kexts/
	cp -r $(tmp_dir)/Lilu/Lilu.kext EFI/OC/Kexts/
	cp -r $(tmp_dir)/WhateverGreen/WhateverGreen.kext EFI/OC/Kexts/
	cp -r $(tmp_dir)/AppleALC/AppleALC.kext EFI/OC/Kexts/
	cp -r $(tmp_dir)/NVMeFix/NVMeFix.kext EFI/OC/Kexts/
	cp -r $(tmp_dir)/CtlnaAHCIPort.kext EFI/OC/Kexts/

clean:
	ls -rtd $(tmp_dir)/* | grep -vw -E '.gitkeep' | xargs rm -rf
	rm -rf EFI/BOOT
	ls -rtd EFI/OC/* | grep -vw -E 'config.plist' | xargs rm -rf
