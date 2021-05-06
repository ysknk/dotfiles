#!/bin/sh

# memo for Windows > echo %~dp0
SCRIPT_DIR=$(cd $(dirname $0) && pwd)

# memo for Windows > %APPDATA%\Code\User\settings.json
VSCODE_SETTING_DIR=~/Library/Application\ Support/Code/User/

rm "$VSCODE_SETTING_DIR/settings.json"
ln -s "$SCRIPT_DIR/settings.json" "${VSCODE_SETTING_DIR}/settings.json"

rm "$VSCODE_SETTING_DIR/keybindings.json"
ln -s "$SCRIPT_DIR/keybindings.json" "${VSCODE_SETTING_DIR}/keybindings.json"

# install extention
cat extensions.txt | while read line
do
 code --install-extension $line
done
