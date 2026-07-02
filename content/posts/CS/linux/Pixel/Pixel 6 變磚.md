---
tags:
  - blog
cover: ob/PXL_20250811_055915754.jpg
title: Pixel 6 變磚
date: 2026-07-02T05:55:59.348Z
lastmod: 2026-07-02T05:55:59.348Z
---
#### 刷成磚了

按什麼都黑屏，無法開機。接上USB只短暫顯示Pixel Recovery，但畫面上根本沒有進入Bootloader，Fastboot也抓不到裝置。

 <!--more-->

我發現到的**事實:**

* bootloader 只能藉由factory image刷
* 防回滾機制：
  * bootloader會阻止你刷舊的factory image
  * 若是刷customROM，若版本太低就不給你開機（硬磚）

所以說ROM一定要和Android 版本一致\
在搞機之前 一定要先了解自己手機型號的bootloader/ROM，然後看有沒有救援工具

#### 救磚

**目前為止仍沒有救磚方法，只能換主機板。**

網路上廣傳的「CPU是三星底子，用獵戶座工具刷」實屬謠言，**從未有人透過此方法成功救磚的案例**。獵戶座工具是使用三星特定老舊機型的漏洞，此漏洞豈可能還出現在幾年後的Pixel 6 ?

華強北能救，猜測可能是：

* 從 Google 洩漏出的救援工具，所以他們不好公開
* 從硬體部份下手
* 直接換主板

所以我直接在淘寶上買拆機主板來換，已經可以成功開機了。\
![PXL\_20250811\_055915754.jpg](/CS/linux/Pixel/img/2026/Pixel%206%20%E8%AE%8A%E7%A3%9A/PXL_20250811_055915754.jpg)
