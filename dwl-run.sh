#!/bin/sh

export MOZ_ENABLE_WAYLAND=1
export XDG_CURRENT_DESKTOP=wlroots
export XDG_MENU_PREFIX="arch-"
export QT_QPA_PLATFORMTHEME="qt6ct"
export QT_QPA_PLATFORM="wayland;xcb"

(
    sleep 1.5

    wlr-randr --output HDMI-A-1 --mode 1920x1080@100

    /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
    waypaper --restore &
    dunst &
    waybar &

    # clipboard manager
    wl-paste --type text --watch cliphist store &
    wl-clip-persist --clipboard regular --reconnect-tries 0 &
) &

exec dbus-run-session dwl
