Here is the benchmark result using `XcodeBenchmark` to measures the compilation time compares to the other Mac systems.

The other systems are cherry pick from [devMEremenko/XcodeBenchmark](https://github.com/devMEremenko/XcodeBenchmark).

## Xcode 13

|        Device        |              CPU               | RAM | SSD | HDD | Xcode |  macOS  | Time(sec) |
|:--------------------:|:------------------------------:|:---:|:---:|:---:|:-----:|:-------:|:---------:|
| MacBook Pro 14" 2021 |            M1 Max 10-core      |  32 | 2TB |     |  13.1 | 12.0.1  |     90    |
| MacBook Pro 16" 2021 |            M1 Pro 10-core      |  16 | 1TB |     |  13.1 | 12.0.1  |    102    |
| MacBook Pro 14" 2021 |            M1 Pro 8-core       |  16 | 512 |     |  13.1 | 12.0.1  |    109    |
| MacBook Pro 13" 2020 |            M1 8-core           |  16 | 1TB |     |  13.1 | 12.0.1  |    130    |
| _**My Hackintosh**_  | _**i5-10600k 4.1 Ghz 6-core**_ |  32 | 512 |     |  13.1 | 12.1    |    174    |
| MacBook Pro 16" 2019 |           i9 2.4 GHz 8-core    |  64 | 1TB |     |  13.1 | 12.0.1  |    212    |

## Xcode 12

|        Device        |              CPU               | RAM | SSD | HDD | Xcode |  macOS  | Time(sec) |
|:--------------------:|:------------------------------:|:---:|:---:|:---:|:-----:|:-------:|:---------:|
|     Mac mini 2020    |            M1 8-core           |  16 | 1TB |     |  12.2 | 11.0    |    116    |
|       Hackintosh     |    i9-10900k 3.7 Ghz 10-core   |  64 | 512 | 6TB |  12.2 | 11.0.1  |    122    |
| MacBook Air 13" 2020 |            M1 8-core (8c GPU)  |  16 | 512 |     |  12.2 | 11.0.1  |    128    |
|     iMac 27" 2020    |    i9 3.6 GHz 10-core          | 128 | 1TB |     |  12.2 | 11.0.1  |    146    |

## Xcode 12 - older macOS releases

|        Device        |              CPU               | RAM | SSD | HDD | Xcode |  macOS  | Time(sec) |
|:--------------------:|:------------------------------:|:---:|:---:|:---:|:-----:|:-------:|:---------:|
|       Hackintosh     |    i9-10850K 3.6 Ghz 10-core   |  64 | 1TB |     |  12.2 | 10.15.7 |    113    |
|       Hackintosh     |    i7-10700K 3.8 Ghz 8-core    |  32 | 1TB |     |  12.2 | 10.15.7 |    130    |
|       Ryzentosh      |      R5 3600 3.6 Ghz 6-core    |  16 | 512 |     |  12.3 | 10.15.7 |    175    |


