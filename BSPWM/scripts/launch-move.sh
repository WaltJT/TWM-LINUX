#!/usr/bin/env bash

# Workspace destino
ws="$1"

# Comando de la aplicación (puede ser firefox, kitty, etc.)
shift
cmd="$@"

# Abrir la aplicación en background
$cmd &

# Esperar a que aparezca la ventana
win=""
while [ -z "$win" ]; do
    sleep 0.1
    # Buscar ventana del comando
    win=$(bspc query -N -n "focused.window")
    # Alternativamente, buscar por clase de ventana:
    # win=$(bspc query -N -n ".window_class=='Firefox'")
done

# Crear workspace si no existe
monitor=$(bspc query -M -m focused)
exists=$(bspc query -D -m "$monitor" --names | grep -w "$ws")
if [[ -z "$exists" ]]; then
    bspc monitor "$monitor" -a "$ws"
fi

# Mover la ventana al workspace
bspc node "$win" -d "$ws" --follow
