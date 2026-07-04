---
tags:
  - yt-dlp
title: yt-dlp 音樂發行時間不對
date: 2026-07-02T05:55:59.392Z
lastmod: 2026-07-02T05:55:59.392Z
---
當我輸入這串指令時，發現音檔中的年份不是音樂發行年份。

<!--more-->

```bash
yt-dlp \ 
--output "%(artist,unknown_artist)s/%(album,unknown_album)s/%(playlist_index)s. %(title)s.%(ext)s" \ #輸出檔案
--embed-thumbnail \ #內嵌圖片
--add-metadata \ #加入資訊
--extract-audio --audio-format mp3 --audio-quality 320K \ #轉成音檔 
"url"
```

問了ChatGPT ，雖然他給的解法是唬爛的，但得知可能是加入到了**影片上傳日期**。上網搜到了解法[reddit post](https://www.reddit.com/r/youtubedl/comments/t7uolk/downloading_albums_off_youtube_music_but_the/)：

> The way to get the proper release date is to add the following:\
> `--parse-metadata "%(release_year)s0101:%(upload_date)s"`

應該是將 release\_year/01/01 (YYYY/MM/DD) 填入到原本 upload\_date 的位置，至於幾月幾日就不重要了就隨便填。
