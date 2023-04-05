#!/bin/bash

VSCODE_PATH="/mnt/c/Users/witheroi1/AppData/Local/Programs/Microsoft VS Code/Code.exe"
PATH=$(wslpath -w $1)
LINE=$2
COL=$3

echo $VSCODE_PATH -r --goto "$PATH:$LINE:$COL"
#/mnt/c/Users/witheroi1/AppData/Local/Programs/Microsoft\ VS\ Code/Code.exe -r --goto "$PATH:$LINE:$COL"
"$VSCODE_PATH" -r --goto "$PATH:$LINE:$COL"


