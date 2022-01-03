# My personal OpenCore EFI

![](screenshots/2021-10-26.png)

## How I use this repo

This repo is for versioning bootloader on my hackintosh computer including: binaries, kexts, config.plist.

- Issues relating to macOS, OpenCore: [Issues](https://github.com/tuanht/hackintosh-10600k-z490-aorus-elite-5700xt/issues)
- Knowledge: [Wiki](https://github.com/tuanht/hackintosh-10600k-z490-aorus-elite-5700xt/wiki)

## Hardware specs

- Intel Core i5 10600k
- Gigabyte Z490 Aorus Elite
- Gigabyte Aorus Radeon RX 5700XT 8G
- WD_BLACK SN750 NVMe SSD 512GB
- Audio Realtek ALC1200 codec
- LAN Realtek 2.5GbE
- Wifi Broadcom BCM943602CS

## What work

- Wifi run perfectly without inject any kexts
- CPU virtualization with Docker
- Front & rear USB ports using tool from [corpnewt/USBMap](https://github.com/corpnewt/USBMap) (some ports can't map as 2.0 cause reach 15 ports limit)
- Bluetooth (after USBMap)
- Magic Mouse 2 & BeatsX Wireless Earphones
- TRIM support out-of-box

Limitations:
- After wakeup from sleep, Bluetooth service are freeze for few minutes, and system become unstable: can crash, unable to shutdown...

## Cloning

```shell
git init
git remote add origin git@github.com:tuanht/hackintosh-10600k-z490-aorus-elite-5700xt.git .
git pull --set-upstream origin master
git submodule update --init --recursive
```

## Install

Just type `make install` to download OpenCore and ACPI/drivers/kexts... need to boot OS.

## Cleanup

Type `make clean` to cleanup any downloaded files to make your EFI folder structure look clean.

## Bootable USB Installer (WIP)

If you're install EFI for USB Installer, you'll want to display console messages during boot for troubleshooting. I've make a special target that can run after install to enable verbose mode in `config.plist`, just run: `make install_usb`.

## Upgrade

## Credits

- [acidanthera/OpenCorePkg](https://github.com/acidanthera/OpenCorePkg)
- [Dortania's OpenCore Install Guide](https://dortania-github-io.thrrip.space/OpenCore-Install-Guide/)
- [LucyRTL8125Ethernet](https://www.insanelymac.com/forum/files/file/1004-lucyrtl8125ethernet/) by Mieze
- [corpnewt/USBMap](https://github.com/corpnewt/USBMap)
