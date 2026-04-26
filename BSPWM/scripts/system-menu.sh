#!/bin/bash

FONT="ComicShannsMono Nerd Font 24"
WIDTH=50
LINES=7
PADDING=20
BORDER_RADIUS=15

OPTIONS=(
    "󰒲   Recargar SXHKD"
    "󰒲   Recargar BSPWM"
    "󰒲   Recargar Picom"
    "󰖯   Reiniciar Polybar"
    "󰍃   Cerrar Sesión"
    "   Reiniciar"
    "   Apagar"
)

SELECCION=$(printf '%s\n' "${OPTIONS[@]}" | rofi -dmenu -i -p "   Sistema" \
    -font "$FONT" \
    -show-icons \
    -theme-str "
        window {
            width: ${WIDTH}%;
            border-radius: ${BORDER_RADIUS}px;
            padding: ${PADDING}px;
        }
        listview {
            lines: ${LINES};
        }
    "
)

case "$SELECCION" in
    "󰒲   Recargar SXHKD")
        pkill -USR1 -x sxhkd
        ;;
    "󰒲   Recargar BSPWM")
        bspc wm -r
        ;;
    "󰒲   Recargar Picom")
        killall -q picom
        sleep 0.5
        picom --config ~/.config/picom/picom.conf --daemon
        ;;
    "󰖯   Reiniciar Polybar")
        killall -q polybar
        ~/.config/polybar/launch.sh &
        ;;
    "󰍃   Cerrar Sesión")
        pkill -x bspwm
        ;;
    "   Reiniciar")
        systemctl reboot
        ;;
    "   Apagar")
        systemctl poweroff
        ;;
    *)
        exit 0
        ;;
esac