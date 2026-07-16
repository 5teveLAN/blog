---
tags: []
title: 了解Android分區
slug: android-partitions-guide
date: 2026-07-02T05:55:59.335Z
lastmod: 2026-07-02T05:55:59.335Z
---
#### Android Partitions

> \[!info]\
> Android 的分區實際上超級多個，但刷機只會動到那幾個而已

就像電腦可以在一顆硬碟上分很多個區，Android 也有幾個刷機會接觸到的分區：

<!--more-->

![partitions.excalidraw](/images/CS/linux/Pixel/img/2026/%E4%BA%86%E8%A7%A3Android%E5%88%86%E5%8D%80/partitions.excalidraw.md)\
**金字塔架構**

* **Cache**, Dalvik/ART Cache

* **Data**

* **Vendor/System**

* **Boot**\
  **雙清(dual wipe):**\
  將Cache, Data刪掉，相當於重設出廠設置

* **Recovery**
  * **官方recovery** - 功能較少。近年手機比較沒有這個分區（合併至boot裡），安裝第三方recovery卡刷變得不方便
  * **第三方recovery** - 可以刷任何東西，刷root (Magisk)，還能備份分區救磚
  * **Sideload** - flash zip via computer (rom, OTA, microG, mods.)

#### Bootloader - bios/uefi in Android

寫死在某個地方的

* **fastboot(刷機模式)** - flash img via computer. (boot, recvoery )

#### 取得root權限

* **卡刷** - 透過twrp修改boot分區
* **線刷**
  1. **提取boot.img** - 去rom包找，丟到手機裡
  2. **修補boot.img** - 先在手機安裝magisk，操作app灌進去
  3. **放回去boot分區** - 進入fastboot刷boot.img

**參考資料**

* [# 玩机必看！带你入坑Android刷机, 極客灣](https://www.youtube.com/watch?v=wz-ErdDf8AM)\
  其實我對刷機也不太熟，看這影片做的筆記
* [Pixel 6 刷LineageOS 22 for microG](Pixel%206%20%E5%88%B7LineageOS%2022%20for%20microG)
* [Pixel 變磚](Pixel%20%E8%AE%8A%E7%A3%9A)\
  刷舊版本ROM導致Bootloader不給你開機(防回滾)