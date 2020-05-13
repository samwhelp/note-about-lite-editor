#!/usr/bin/env bash

THE_APP_DIR_PATH="$HOME/app"
THE_BIN_DIR_PATH="$HOME/bin"
THE_LITE_DIR_PATH="$THE_APP_DIR_PATH/lite"
THE_LITE_APP_FILE_PATH="$HOME/.local/share/applications/lite.desktop"

mkdir -p "$THE_APP_DIR_PATH"

cd "$THE_APP_DIR_PATH"

#https://github.com/rxi/lite/releases
wget -c 'https://github.com/rxi/lite/releases/download/v1.03/lite.zip'

unzip -d lite lite.zip

cd lite

mkdir -p "$THE_BIN_DIR_PATH"

ln -sf "$(pwd)/lite" "$THE_BIN_DIR_PATH/lite"

##tree "$THE_LITE_DIR_PATH"


cat > "$THE_LITE_APP_FILE_PATH" << EOF
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




