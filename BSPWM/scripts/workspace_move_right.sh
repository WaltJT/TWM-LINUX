#!/usr/bin/env bash

direction="$1"

monitor=$(bspc query -M -m focused)

# --- Función romano → número ---
roman_to_int() {
    case "$1" in
        I) echo 1 ;;
        II) echo 2 ;;
        III) echo 3 ;;
        IV) echo 4 ;;
        V) echo 5 ;;
        VI) echo 6 ;;
        VII) echo 7 ;;
        VIII) echo 8 ;;
        IX) echo 9 ;;
        X) echo 10 ;;
        *) echo 1 ;;
    esac
}

# --- Función número → romano ---
int_to_roman() {
    case "$1" in
        1) echo I ;;
        2) echo II ;;
        3) echo III ;;
        4) echo IV ;;
        5) echo V ;;
        6) echo VI ;;
        7) echo VII ;;
        8) echo VIII ;;
        9) echo IX ;;
        10) echo X ;;
        *) echo I ;;
    esac
}

# Último desktop del monitor
last=$(bspc query -D -m "$monitor" --names | tail -n1)

# Convertir a número
num=$(roman_to_int "$last")

# Sumar 1
new_num=$((num + 1))

# Convertir de nuevo a romano
new_name=$(int_to_roman "$new_num")

# Crear desktop
bspc monitor "$monitor" -a "$new_name"

# Mover según dirección
if [[ "$direction" == "right" ]]; then
    bspc desktop "$new_name" --to-desktop next.local
else
    bspc desktop "$new_name" --to-desktop prev.local
fi

# Focar
bspc desktop -f "$new_name"
