#!/usr/bin/env bash

##
## * https://magiclen.org/linux-github-latest-release-download/
## $ curl -s https://api.github.com/repos/rxi/lite/releases/latest | grep browser_download_url
##     "browser_download_url": "https://github.com/rxi/lite/releases/download/v1.03/lite.zip"
##

##
## * https://stedolan.github.io/jq/tutorial/
## * https://stedolan.github.io/jq/manual/
## curl -s https://api.github.com/repos/rxi/lite/releases/latest | jq '.'
## curl -s https://api.github.com/repos/rxi/lite/releases/latest | jq '..|.browser_download_url?'
## curl -s https://api.github.com/repos/rxi/lite/releases/latest | jq '..|.browser_download_url?' | grep releases | cut -d '"' -f 2
## curl -s https://api.github.com/repos/rxi/lite/releases/latest | jq '.assets[0].browser_download_url'
## curl -s https://api.github.com/repos/rxi/lite/releases/latest | jq '.assets[0].browser_download_url' | cut -d '"' -f 2
##


#curl -s https://api.github.com/repos/rxi/lite/releases/latest | grep browser_download_url | awk -F '"' '{print $4}'

#curl -s https://api.github.com/repos/rxi/lite/releases/latest | grep browser_download_url | cut -d '"' -f 4

THE_LITE_DOWNLOAD_URL=$(curl -s https://api.github.com/repos/rxi/lite/releases/latest | grep browser_download_url | cut -d '"' -f 4)


THE_APP_DIR_PATH="$HOME/app"
THE_BIN_DIR_PATH="$HOME/bin"
THE_LITE_DIR_PATH="$THE_APP_DIR_PATH/lite"
THE_LITE_APP_FILE_PATH="$HOME/.local/share/applications/lite.desktop"


mkdir -p "$THE_APP_DIR_PATH"
mkdir -p "$THE_BIN_DIR_PATH"

install -m 755 ./lite "$THE_BIN_DIR_PATH/lite"


## ~/app
cd "$THE_APP_DIR_PATH"

#https://github.com/rxi/lite/releases
wget -c "$THE_LITE_DOWNLOAD_URL"

unzip -d lite lite.zip


## ~/app/lite
cd lite

ln -sf "$(pwd)/lite" "$THE_BIN_DIR_PATH/lite.real"

##tree "$THE_LITE_DIR_PATH"

cat > "$THE_LITE_APP_FILE_PATH" << EOF
[Desktop Entry]
Type=Application
Exec=lite %F
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

