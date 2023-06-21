#!/bin/bash

RET=$(echo -e "logout\nsuspend\nshutdown\nreboot\ncancel" | rofi -dmenu)

case $RET in
    shutdown) systemctl poweroff ;;
    reboot) systemctl reboot ;;
    suspend) systemctl suspend ;;
    logout)  echo "awesome.quit()" | awesome-client;;
    *) ;;
esac
