#!/bin/sh

chosen=$(printf "Restart \nQuit \nLock Session\nSuspend\nReboot\nShutdown" | dmenu -b -l 10 -i -p "What are we doing?" -fn "BigBlueTermPlus Nerd Font:14" \
-nb "#282828" -nf "#ebdbb2" -sb "#98971a" -sf "#282828")

if [ -z "$chosen" ]; then
	exit 0
else
	case $chosen in
        Restart*) systemctl reboot ;;
        Quit*) i3-msg exit ;;
        Lock*) i3lock -c 000000 ;;
        Suspend) systemctl suspend ;;
        Reboot) systemctl reboot ;;
        Shutdown) systemctl poweroff ;;
	esac
fi
