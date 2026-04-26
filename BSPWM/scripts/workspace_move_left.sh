#!/usr/bin/env bash

monitor=$(bspc query -M -m focused)

# -------- Romano → Número --------
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
        *) echo 999 ;;
    esac
}

# -------- Número → Romano --------
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
    esac
}

current=$(bspc query -D -d focused --names)
current_num=$(roman_to_int "$current")

if [ "$current_num" -le 1 ]; then
    exit 0
fi

prev_num=$((current_num - 1))
prev_roman=$(int_to_roman "$prev_num")

# Crear si no existe
bspc query -D -d "$prev_roman" > /dev/null || bspc monitor "$monitor" -a "$prev_roman"

# -------- Reordenar correctamente --------
desktops=$(bspc query -D -m "$monitor" --names)

sorted=$(for d in $desktops; do
    echo "$(roman_to_int "$d"):$d"
done | sort -n | cut -d: -f2)

bspc monitor "$monitor" -o $sorted

# Enfocar
bspc desktop -f "$prev_roman"
