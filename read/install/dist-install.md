---
title: 如何安裝 lite
nav_order: 11
parent: 安裝
---

# 如何安裝 lite


## 環境

* Xubuntu 20.04

## 下載頁面

* [https://github.com/rxi/lite/releases](https://github.com/rxi/lite/releases)
* [https://github.com/rxi/lite/releases/tag/v1.03](https://github.com/rxi/lite/releases/tag/v1.03)


## 安裝腳本

* [install.sh](https://github.com/samwhelp/note-about-lite-editor/tree/master/demo/lite-installer/install.sh)
* [install-last.sh](https://github.com/samwhelp/note-about-lite-editor/tree/master/demo/lite-installer/install-last.sh)


以下步驟已經整理寫在上面的腳本，以下是說明。

## 安裝步驟

### 產生放置資料夾

預計要安裝在「~/app/lite」這個路徑。

所以先執行下面指令，產生「~/app」這個資料夾。

``` sh
mkdir -p ~/app
```

執行下面指令，切換到「~/app」這個資料夾。

``` sh
cd ~/app
```

### 下載

瀏覽這個頁面「[https://github.com/rxi/lite/releases](https://github.com/rxi/lite/releases)」，

可以找到最新的「釋出版本(Release)」，舉例「lite 1.03」，

接著可以找到「[https://github.com/rxi/lite/releases/download/v1.03/lite.zip](https://github.com/rxi/lite/releases/download/v1.03/lite.zip)」這個網址。

於是執行下面指令下載

``` sh
wget -c 'https://github.com/rxi/lite/releases/download/v1.03/lite.zip'
```

下載完畢後，就會存在一個檔案「~/app/lite.zip」。

### 解開

執行下面指令，安裝「Package: [unzip](https://packages.ubuntu.com/focal/unzip)」。

``` sh
sudo apt-get install unzip
```

執行下面指令，解開「lite.zip」。

``` sh
unzip -d lite lite.zip
```

會解開到資料夾「lite」，也就是會存在「~/app/lite」這個資料夾。

> 可以執行「[tree lite](https://samwhelp.github.io/note-about-lite-editor/read/install/tree-lite.html)」或是「[find lite](https://samwhelp.github.io/note-about-lite-editor/read/install/find-lite.html)」瀏覽整個資料夾結構。

### 鍊結

執行下面指令，產生「~/bin」這個資料夾。

``` sh
mkdir -p ~/bin
```

執行下面指令，就會產生一個檔案「~/bin/lite」，鍊結到「~/app/lite/lite」這個檔案。

``` sh
ln -sf "$(pwd)/lite" "$HOME/bin/lite"
```

因為「~/bin」這個路徑，有被加入「PATH」，所以以後在任何路徑，都可以執行「lite」這個指令。

> 關於「~/bin」的概念，可以參考之前寫的另一篇討論「[關於「~/bin」](https://www.ubuntu-tw.org/modules/newbb/viewtopic.php?post_id=362192#forumpost362192)」

### 產生 Application Desktop Entry

執行下面指令，產生一個檔案「[~/.local/share/applications/lite.desktop](https://github.com/samwhelp/note-about-lite-editor/blob/master/demo/applications/lite.desktop)」。

``` sh
cat > ~/.local/share/applications/lite.desktop << EOF
[Desktop Entry]
Type=Application
Exec=lite
TryExec=lite
Icon=text-editor
Categories=Utility;TextEditor;Development;
Keywords=editor;
StartupNotify=true
MimeType=text/plain;inode/directory;

Name=Lite Editor
GenericName=Text Editor
Comment=A lightweight text editor written in Lua

Name[zh_TW]=Lite 文字編輯器
GenericName[zh_TW]=Text Editor
Comment[zh_TW]=Lite 文字編輯器
EOF
```

> 若有安裝「[exo-open](http://manpages.ubuntu.com/manpages/focal/en/man1/exo-open.1.html)」，可以執行「`exo-open ~/.local/share/applications/lite.desktop`」確認是否正常運作。




### 額外討論

參考「[如何在Linux作業系統上以一行指令下載GitHub倉庫(Repository)上最新發佈的檔案？ - MagicLen](https://magiclen.org/linux-github-latest-release-download/)」

這篇文章提到的概念，

執行下面指令

``` sh
curl -s https://api.github.com/repos/rxi/lite/releases/latest | grep browser_download_url | cut -d '"' -f 4
```

顯示

```
https://github.com/rxi/lite/releases/download/v1.03/lite.zip
```

所以搭配「wget」和「[bash command substitution](https://www.gnu.org/software/bash/manual/html_node/Command-Substitution.html)」，

可以執行下面指令下載

``` sh
wget -c $(curl -s https://api.github.com/repos/rxi/lite/releases/latest | grep browser_download_url | cut -d '"' -f 4)
```

或是也可以使用[該篇文章](https://magiclen.org/linux-github-latest-release-download/)提到的方式

``` sh
curl -s https://api.github.com/repos/rxi/lite/releases/latest | grep browser_download_url | cut -d '"' -f 4 | wget -q -i -
```

另外也可以改搭配「[jq](http://manpages.ubuntu.com/manpages/focal/en/man1/jq.1.html)」來解析json。

執行下面指令，先安裝「Package: [jq](https://packages.ubuntu.com/focal/jq)」。

``` sh
sudo apt-get install jq
```

舉例

執行下面指令

``` sh
curl -s https://api.github.com/repos/rxi/lite/releases/latest | jq '..|.browser_download_url?' | grep releases | cut -d '"' -f 2
```

顯示

```
https://github.com/rxi/lite/releases/download/v1.03/lite.zip
```

以上的概念，只要將「[install.sh](https://github.com/samwhelp/note-about-lite-editor/tree/master/demo/lite-installer/install.sh)」稍微做點修改，
就可以應用在「[install-last.sh](https://github.com/samwhelp/note-about-lite-editor/tree/master/demo/lite-installer/install-last.sh)」上了。


