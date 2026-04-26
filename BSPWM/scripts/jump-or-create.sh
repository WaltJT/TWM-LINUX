#!/bin/sh

desk="$1"

# Si no existe el desktop, lo crea
bspc query -D -d "$desk" > /dev/null || bspc monitor -a "$desk"

# Enfocar
bspc desktop -f "$desk"

