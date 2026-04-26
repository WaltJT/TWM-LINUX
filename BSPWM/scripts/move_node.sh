#!/usr/bin/env bash

# Número de workspace destino
target="$1"

# Monitor actual
monitor=$(bspc query -M -m focused)

# Crear workspace si no existe
exists=$(bspc query -D -m "$monitor" --names | grep -w "$target")
if [[ -z "$exists" ]]; then
    bspc monitor "$monitor" -a "$target"
fi

# Mover ventana actual
bspc node -d "$target" --follow
