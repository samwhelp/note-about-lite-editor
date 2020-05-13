#!/usr/bin/env bash

THE_APP_DIR_PATH="$HOME/app"
THE_BIN_DIR_PATH="$HOME/bin"
THE_LITE_DIR_PATH="$THE_APP_DIR_PATH/lite"

mkdir -p "$THE_APP_DIR_PATH"

cd "$THE_APP_DIR_PATH"

#https://github.com/rxi/lite/releases
wget -c 'https://github.com/rxi/lite/releases/download/v1.03/lite.zip'

unzip -d lite lite.zip

cd lite

mkdir -p "$THE_BIN_DIR_PATH"

ln -sf "$(pwd)/lite" "$THE_BIN_DIR_PATH/lite"

##tree "$THE_LITE_DIR_PATH"

