#!/bin/bash

languages=`echo "cpp c rust lua golang python nodejs js clojure typescript" | tr ' ' '\n'`
utils=`echo "curl tr find grep tar uzip tmux" | tr ' ' '\n'`

selected=`printf "$languages\n$utils" | fzf`
read -p "Query: " query

if printf "$languages" | grep -qs $selected; then
	echo "cht.sh/$selected/`echo $query | tr ' ' '+'`"
	tmux neww bash -c "curl cht.sh/$selected/`echo $query | tr ' ' '+'` & while [ : ]; do sleep 1; done"
else
	echo "cht.sh/$selected~`echo $query | tr ' ' '+'`"
	tmux neww bash -c "curl cht.sh/$selected~`echo $query | tr ' ' '+'` & while [ : ]; do sleep 1; done"
fi
