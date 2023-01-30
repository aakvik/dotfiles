#!/bin/sh

dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
export QT_QPA_PLATFORMTHEME=qt5ct
export GDK_DPI_SCALE=1
export DBUS_SESSION_BUS_ADDRESS="autolaunch:"

xrdb -merge -I$HOME ~/.Xresources

exec awesome
