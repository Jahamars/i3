
#!/bin/bash

CHOICE=$(dialog --clear --title "System Actions" \
                --menu "Select action" 15 50 5 \
                1 "Sleep" \
                2 "Exit" \
                3 "Reboot" \
                4 "Shutdown" \
                5 "Block" \
                3>&1 1>&2 2>&3)

clear

case "$CHOICE" in
    1)
        systemctl suspend
        ;;
    2)
        i3-msg exit
        ;;
    3)
        systemctl reboot
        ;;
    4)
        systemctl poweroff
        ;;
    5) 
        i3lock -c 000000
        ;;
    *)
        echo "Invalid option selected."
        ;;
esac
