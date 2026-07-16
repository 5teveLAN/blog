---
tags: []
title: Pixel 6 刷 LineageOS 22 for microG
slug: pixel6-lineageos-microg
date: 2026-07-02T05:55:59.360Z
lastmod: 2026-07-02T05:55:59.360Z
---
### 前言

> \[!info]\
> Lineage叫拎age不叫賴age

我原本使用原廠 Android 14~16，因為看不慣 Google 的預載軟體（Gapps）。系統內建兩個 Google 瀏覽器：一個叫 Google ，一個是 Chrome ，但我只用 Brave 瀏覽器；首頁上的搜尋欄位也關不掉，加上一堆用不到的捆綁軟體（像 Google News , Google TV等）刪不掉。加上這台手機背景運行程式就會發燙，以及不想被 Google 偷聽監控、偷耗電，所以決定來 Degoogle（只裝用得到的 App）。

<!--more-->

而多數 App 依賴 Google Play Service 才能正常開啟或推播通知，這時可以使用一個開源的替代方案——**microG**，可以維持這些 App 的正常運作。

### 目錄

1. 下載 ROM 包
   * 確認 Android 版本
2. 安裝 ROM 包
   * 下載 adb 與 fastboot 工具
   * 解鎖 Bootloader
   * 刷系統
3. 安裝之後
   * 設定 microG 推播功能
   * 安裝 Gcam

### 1. 下載 ROM 包

我選擇的是 LineageOS 22 for microG，它是由 microG 社群提供的 ROM，裡面完全沒有預裝 GApps，還內建好 microG，省去我手動設定的麻煩。

#### 確認 Android 版本

請先確認你的手機目前 Android 版本與欲刷入的 LineageOS 是否相符，例如 LineageOS 22 對應的是 Android 15。若版本不符，建議先從 [ Google 官方網站](https://developers.google.com/android/images)下載 factory image，使用線上工具或 `fastboot` 重刷回對應版本。

### 2. 安裝ROM包

#### 下載 adb 與 fastboot 工具

* macOS\
  `brew install android-platform-tools`
* Linux (Debian/Ubuntu)\
  `sudo apt install android-tools-adb android-tools-fastboot`

#### 解鎖 Bootloader

Bootloader 就像電腦的 BIOS/UEFI，預設是鎖定的。 Pixel 系列手機的解鎖方式相當簡單：

1. 用 USB 連接手機後，進入 bootloader 模式：\
   `adb reboot bootloader`
2. 解鎖 bootloader (注意會清除資料)：\
   `fastboot flash unlock`
3. 使用音量鍵選擇「Yes」確認，按電源鍵執行。

#### 刷系統

1. 刷入 boot.img\
   `fastboot flash boot boot.img`
2. 刷入 dtbo.img\
   `fastboot flash dtbo dtbo.img`
3. 刷入 vendor\_boot.img ( 包含 LineageOS 的客製化 Recovery)\
   `fastboot flash vendor_boot vendor_boot.img`\
   接著用音量鍵在Bootloader中選擇Recovery，按下電源鍵進入。
4. 進入 Recovery 後，選擇「Factory Reset」來清除所有資料，以避免刷機衝突。
5. 選擇Apply Update，使用 adb 刷入 ROM 包\
   `adb -d sideload rom.zip`\
   執行過程中約在 47% 時，手機畫面會顯示「需要重啟 Recovery 以安裝附加套件」，點選「Yes」，系統會自動重開進 Recovery，再繼續點選「Reboot system now」。
6. 完成安裝。

### 3. 安裝之後

#### 開啟microG推播功能

打開microG app，開啟Google device registraino, Cloud Messaging功能，之後再安裝LINE即可有通知。

#### 開啟microG GPS定位功能

打開microG app，開啟Location->勾選Request from online service（允許從網路服務抓GPS定位）,之後地圖App即可成功定位 。\
\#blog
