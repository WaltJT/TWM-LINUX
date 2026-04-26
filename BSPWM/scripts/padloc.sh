#!/bin/bash
padloc &

# esperar un segundo a que cree la ventana
sleep 1

# buscar ventana y redimensionar
wid=$(xdotool search --class padloc | head -n 1)
bspc node $wid -t floating
bspc node $wid -z right 400 400
bspc node $wid -v -50 -50   # mover un poco para centrar (ajustar)

