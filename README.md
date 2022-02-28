# My personal OpenCore EFI

![](screenshots/2021-10-26.png)

## How I use this repo

This repo is for versioning bootloader on my Hackintosh computer including binaries, kexts, config.plist.

- Issues relating to macOS, OpenCore: [Issues](https://github.com/tuanht/hackintosh-10600k-z490-aorus-elite-5700xt/issues)
- Knowledge: [Wiki](https://github.com/tuanht/hackintosh-10600k-z490-aorus-elite-5700xt/wiki)

## Hardware specs

- Intel Core ~~i5 10600k~~ i7 10700k
- Gigabyte Z490 Aorus Elite
- G.SKILL Ripjaws V DDR4 3000MHz 4x8GB
- Gigabyte Aorus Radeon RX 5700XT 8G
- WD_BLACK SN750 NVMe SSD 512GB
- Audio Realtek ALC1200 codec
- LAN Realtek 2.5GbE
- Wifi Broadcom BCM943602CS
- Noctua NH-U14S
- NZXT H510

## What works

- Wifi runs perfectly without injecting any kexts
- CPU virtualization with Docker
- Front & rear USB ports using tool from [corpnewt/USBMap](https://github.com/corpnewt/USBMap) (some ports can't map as 2.0 cause reach 15 ports limit)
- Bluetooth (after USBMap)
- Magic Mouse 2 & BeatsX Wireless Earphones
- TRIM support out-of-box
- GPU temperature sensors (read through iStat Menus)

Limitations:
- After wakeup from sleep, Bluetooth services are frozen for a few minutes, and the system becomes unstable: can crash, unable to shut down...

## Cloning

```shell
git init
git remote add origin git@github.com:tuanht/hackintosh-10600k-z490-aorus-elite-5700xt.git .
git pull --set-upstream origin master
git submodule update --init --recursive
```

## Install

Just type `make install` to download OpenCore and ACPI/drivers/kexts for configured version.

## Cleanup

Type `make clean` to clean up any downloaded files to make your EFI folder structure look clean.

## Bootable USB Installer (WIP)

If you're installing EFI for USB Installer, you'll want to display console messages during boot for troubleshooting. I've made a special target that can run after install to enable verbose mode in `config.plist`, just run: `make install_usb`.

## Disclaimer

This OC build is made specifically for my system. Don't use it unless you understand which configurations need to be changed to suit your need. Checkout [merged PRs](https://github.com/tuanht/hackintosh-10600k-z490-aorus-elite-5700xt/pulls?q=is%3Apr+is%3Amerged) for some important changes.

## Credits

- [acidanthera](https://github.com/acidanthera)
- [Dortania's OpenCore Install Guide](https://dortania-github-io.thrrip.space/OpenCore-Install-Guide/)
- [corpnewt](https://github.com/corpnewt)
- [LucyRTL8125Ethernet](https://www.insanelymac.com/forum/files/file/1004-lucyrtl8125ethernet/) by Mieze
- [aluveitie's RadeonSensor](https://github.com/aluveitie/RadeonSensor)
