# My personal OpenCore EFI

## How I use this repo

This repo is for versioning bootloader in my hackintosh machine included: binaries, kexts, config.plist.

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
- Magic Mouse 2 & BeatsX Wireless Earphones. Sometime they become laggy a bit. It may related to antenna positioned at the back of computer case.

Limitations:
- If I turn-off bluetooth, the next restart will not work. Trying re-enable will work on the next restart
- Can't connect Filco Minila-R keyboard via bluetooth. I always have connect issue with this keyboard even on real Mac

