#!/usr/bin/sh
opt1="Suspend"
opt2="Reboot (kexec)"
opt3="Reboot"
opt4="Shutdown"

opt=$(echo -e "$opt1\n$opt2\n$opt3\n$opt4" | dmenu -i -p "What you want to do? " | grep "\<$opt1\>\|\<$opt2\>\|\<$opt3\>\|\<$opt4\>")
[ $? -eq 0 ] || exit 1

confirm=$(echo -e "No\nYes" | dmenu -i -p "Sure you want to $opt your machine?")
[ $? -eq 0 ] || exit 3
[ $confirm == "Yes" ] || exit 4

case $opt in
    $opt1)
        #echo "Locking"
        systemctl suspend &
        exit 0
        ;;
    $opt2)
        #echo "Rebooting"
        kexec -l /boot/vmlinuz-linux --initrd=/boot/initramfs-linux.img --reuse-cmdline

        exit 0
        ;;
    $opt3)
        #echo "Rebooting"
        reboot &
        exit 0
        ;;
    $opt4)
        #echo "Shutting down"
        shutdown now &
        exit 0
        ;;
esac
