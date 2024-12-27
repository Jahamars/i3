#!/bin/bash

chose=$(printf "100 \n90 \n80 \n70 \n60 \n50 \n40 \n30 \n20" | dmenu -b -l 10 -i -p "What are we doing?" -fn "BigBlueTermPlus Nerd Font:14" \
-nb "#282828" -nf "#ebdbb2" -sb "#98971a" -sf "#282828")

if [ -z "$chose" ]
then
    exit 0
else 
    case $chose in
        10*) xrandr --output VGA-0 --brightness 1 ;;
        9*) xrandr --output VGA-0 --brightness 0.9 ;;
        8*) xrandr --output VGA-0 --brightness 0.8 ;;
        7*) xrandr --output VGA-0 --brightness 0.7 ;;
        6*) xrandr --output VGA-0 --brightness 0.6 ;;
        5*) xrandr --output VGA-0 --brightness 0.5 ;;
        4*) xrandr --output VGA-0 --brightness 0.4 ;;
        3*) xrandr --output VGA-0 --brightness 0.3 ;;
        2*) xrandr --output VGA-0 --brightness 0.2 ;;
    esac
fi
