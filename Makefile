drivers = OpenRuntime.efi|OpenCanopy.efi
tools = OpenShell.efi

cleanup:
	ls -rtd EFI/OC/Drivers/* | grep -vw -E '$(drivers)' | xargs rm
	ls -rtd EFI/OC/Tools/* | grep -vw -E '$(tools)' | xargs rm
