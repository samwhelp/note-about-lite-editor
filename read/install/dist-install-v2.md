---
title: 如何安裝 lite (版本2)
nav_order: 12
parent: 安裝
---

# 如何安裝 lite (版本2)

## 安裝腳本

* lite-installer-v2 / [install.sh](https://github.com/samwhelp/note-about-lite-editor/tree/master/demo/lite-installer-v2/install.sh)
* lite-installer-v2 / [install-last.sh](https://github.com/samwhelp/note-about-lite-editor/tree/master/demo/lite-installer-v2/install-last.sh)


## 說明

延續「[版本1](https://samwhelp.github.io/note-about-lite-editor/read/install/dist-install.html)」的安裝方式
為了調整一些路徑的問題，做了一些小調整。

這個狀況會發生在使用「File Manager」，在「資料夾」或是「檔案」按下右鍵，選擇「lite」開啟。

然後「開新檔要存檔」，或是「另純新檔」會發生，「所在專案路徑」不是預想的。

目前解決的方式，表格說明如下

| 路徑 | 說明 |
| --- | --- |
| [~/.local/share/applications/lite.desktop](https://github.com/samwhelp/note-about-lite-editor/blob/master/demo/applications/lite.desktop) | 不變，一樣是執行「~/bin/lite」 |
| [~/bin/lite](https://github.com/samwhelp/note-about-lite-editor/blob/master/demo/lite-installer-v2/lite) | 這個檔案是「Bash Script」，裡面會先切換到「Project」路徑，然後再執行「~/bin/lite.real」 |
| ~/bin/lite.real | 這個檔案會鍊結到「~/app/lite/lite」 |

