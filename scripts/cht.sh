#!/bin/bash

languages=`echo "cpp c rust lua golang python nodejs js clojure typescript" | tr ' ' '\n'`
utils=`echo "curl tr find grep tar uzip tmux" | tr ' ' '\n'`

selected=`printf "$languages\n$utils" | rofi -sep '\n' -dmenu`
query=`rofi -dmenu -p "Query"`

if printf "$languages" | grep -qs $selected; then
	echo "cht.sh/$selected/`echo $query | tr ' ' '+'`"
	curl cht.sh/$selected/`echo $query | tr ' ' '+'`
else
	echo "cht.sh/$selected~`echo $query | tr ' ' '+'`"
	curl cht.sh/$selected~`echo $query | tr ' ' '+'`
fi
