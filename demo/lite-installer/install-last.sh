#!/usr/bin/env bash

##
## * https://magiclen.org/linux-github-latest-release-download/
## $ curl -s https://api.github.com/repos/rxi/lite/releases/latest | grep browser_download_url
##     "browser_download_url": "https://github.com/rxi/lite/releases/download/v1.03/lite.zip"
##


## curl -s https://api.github.com/repos/rxi/lite/releases/latest | jq '.'
## curl -s https://api.github.com/repos/rxi/lite/releases/latest | jq '..|.browser_download_url?'
## curl -s https://api.github.com/repos/rxi/lite/releases/latest | jq '.assets[0].browser_download_url'
## curl -s https://api.github.com/repos/rxi/lite/releases/latest | jq '.assets[0].browser_download_url' | cut -d '"' -f 2


#curl -s https://api.github.com/repos/rxi/lite/releases/latest | grep browser_download_url | awk -F '"' '{print $4}'

#curl -s https://api.github.com/repos/rxi/lite/releases/latest | grep browser_download_url | cut -d '"' -f 4

THE_LITE_DOWNLOAD_URL=$(curl -s https://api.github.com/repos/rxi/lite/releases/latest | grep browser_download_url | cut -d '"' -f 4)


THE_APP_DIR_PATH="$HOME/app"
THE_BIN_DIR_PATH="$HOME/bin"
THE_LITE_DIR_PATH="$THE_APP_DIR_PATH/lite"


mkdir -p "$THE_APP_DIR_PATH"

cd "$THE_APP_DIR_PATH"

#https://github.com/rxi/lite/releases
wget -c "$THE_LITE_DOWNLOAD_URL"

unzip -d lite lite.zip

cd lite

mkdir -p "$THE_BIN_DIR_PATH"

ln -sf "$(pwd)/lite" "$THE_BIN_DIR_PATH/lite"

##tree "$THE_LITE_DIR_PATH"

