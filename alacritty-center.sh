#!/usr/bin/env bash
# =========================================================
# Dennis Hilk – Smart Alacritty Center Launch Script (v2)
# Works reliably with latest Alacritty (slow startup fix)
# =========================================================

# Start Alacritty in background
alacritty &

# Warte bis das Fenster wirklich existiert
# (wir prüfen bis zu 20x alle 0.1s)
for i in {1..20}; do
    if wmctrl -l | grep -q "Alacritty"; then
        break
    fi
    sleep 0.1
done

# Bildschirmauflösung automatisch erkennen
screen=$(xrandr | grep '*' | head -n1 | awk '{print $1}')
screen_width=$(echo "$screen" | cut -d'x' -f1)
screen_height=$(echo "$screen" | cut -d'x' -f2)

# Fenstergröße an deine Config anpassen (Gruvbox Setup)
win_width=1700
win_height=950

# Zentrieren mit leicht erhöhter Position
pos_x=$(( (screen_width - win_width) / 2 ))
pos_y=$(( (screen_height - win_height) / 2 - 120 ))

# Fenster verschieben
wmctrl -r "Alacritty" -e 0,$pos_x,$pos_y,-1,-1
