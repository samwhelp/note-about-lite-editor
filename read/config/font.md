---
title: 如何設定字型 (顯示中文)
nav_order: 21
parent: 設定
---


## 如何找到字型設定的程式碼

從「[lite/data/core/style.lua](https://github.com/rxi/lite/blob/master/data/core/style.lua#L10)」這個檔案，可以找到如下的程式碼。

``` lua
style.font = renderer.font.load(EXEDIR .. "/data/fonts/font.ttf", 14 * SCALE)
style.big_font = renderer.font.load(EXEDIR .. "/data/fonts/font.ttf", 34 * SCALE)
style.icon_font = renderer.font.load(EXEDIR .. "/data/fonts/icons.ttf", 14 * SCALE)
style.code_font = renderer.font.load(EXEDIR .. "/data/fonts/monospace.ttf", 13.5 * SCALE)
```


## 如何設定顯示中文

編輯「[lite/data/user/init.lua](https://github.com/rxi/lite/blob/master/data/user/init.lua)」這個檔案，[加入如下的程式碼](https://github.com/samwhelp/note-about-lite-editor/blob/master/demo/config/user/init.lua)。

``` lua
style.font = renderer.font.load("/usr/local/share/fonts/Noto/NotoSansCJKtc-Regular.otf", 14 * SCALE)
style.big_font = renderer.font.load("/usr/local/share/fonts/Noto/NotoSansCJKtc-Regular.otf", 34 * SCALE)
style.code_font = renderer.font.load("/usr/local/share/fonts/Noto/NotoSansMonoCJKtc-Regular.otf", 16 * SCALE)
```

> 上面的字型路徑，是因為我自己下載安裝的，請參考我的[安裝腳本](https://github.com/samwhelp/play-ubuntu-20.04-plan/tree/master/prototype-subject/font-wget/noto)


## 如何找到字型檔案路徑

可以使用「[fc-list](http://manpages.ubuntu.com/manpages/focal/en/man1/fc-list.1.html)」搭配「[grep](http://manpages.ubuntu.com/manpages/focal/en/man1/grep.1.html)」來找尋。

> 其他相關的工具，請參考我之前的[紀錄](http://samwhelp.github.io/book-ubuntu-qna/read/howto/configure-font/fontconfig/)

舉例，要找「Noto」相關的

執行

``` sh
fc-list | grep Noto | grep TC | grep Mono | sort
```

顯示

```
/usr/local/share/fonts/Noto/NotoSansMonoCJKtc-Bold.otf: Noto Sans Mono CJK TC,Noto Sans Mono CJK TC Bold:style=Bold,Regular
/usr/local/share/fonts/Noto/NotoSansMonoCJKtc-Regular.otf: Noto Sans Mono CJK TC,Noto Sans Mono CJK TC Regular:style=Regular
/usr/share/fonts/opentype/noto/NotoSansCJK-Bold.ttc: Noto Sans Mono CJK TC:style=Bold
/usr/share/fonts/opentype/noto/NotoSansCJK-Regular.ttc: Noto Sans Mono CJK TC:style=Regular
```

舉例，要找「CNS11643」相關的

執行

``` sh
fc-list | grep TW | sort
```

顯示

```
/usr/local/share/fonts/CNS11643/TW-Kai-98_1.ttf: TW\-Kai,全字庫正楷體:style=Regular
/usr/local/share/fonts/CNS11643/TW-Kai-Ext-B-98_1.ttf: TW\-Kai\-Ext\-B,全字庫正楷體 Ext\-B:style=Regular
/usr/local/share/fonts/CNS11643/TW-Kai-Plus-98_1.ttf: TW\-Kai\-Plus,全字庫正楷體 Plus:style=Regular
/usr/local/share/fonts/CNS11643/TW-Sung-98_1.ttf: TW\-Sung,全字庫正宋體:style=Regular
/usr/local/share/fonts/CNS11643/TW-Sung-Ext-B-98_1.ttf: TW\-Sung\-Ext\-B,全字庫正宋體 Ext\-B:style=Regular
/usr/local/share/fonts/CNS11643/TW-Sung-Plus-98_1.ttf: TW\-Sung\-Plus,全字庫正宋體 Plus:style=Regular
```


