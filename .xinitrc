#!/bin/sh
if [ -z "$DBUS_SESSION_BUS_ADDRESS" ] && [ -n "$XDG_RUNTIME_DIR" ] &&
	[ "$XDG_RUNTIME_DIR" = "/run/user/$(id -u)" ] &&
	[ -S "$XDG_RUNTIME_DIR/bus" ]; then
	DBUS_SESSION_BUS_ADDRESS="unix:path=$XDG_RUNTIME_DIR/bus"
	export DBUS_SESSION_BUS_ADDRESS
fi

if [ -x "/usr/bin/dbus-update-activation-environment" ]; then
	dbus-update-activation-environment --verbose --systemd \
		DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY
fi

export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/gcr/ssh
export QT_QPA_PLATFORMTHEME=qt5ct

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)

xrdb -merge -I$HOME ~/.Xresources

setxkbmap -option caps:escape

exec awesome -c ~/.config/awesome/rc.lua
