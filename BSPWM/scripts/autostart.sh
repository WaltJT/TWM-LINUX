#!/bin/sh

# Lanzar solo si no están ya corriendo
pgrep -x Wasistlos     >/dev/null || Wasistlos &
pgrep -x thunderbird     >/dev/null || thunderbird &
pgrep -x kitty     >/dev/null || kitty &
pgrep -x firefox   >/dev/null || firefox &
pgrep -x Thunar    >/dev/null || Thunar &
pgrep -x code-oss  >/dev/null || code-oss &
