#!/bin/zsh

PCTL=$(playerctl status 2>/dev/null)

ICON_NONE=""
ICON_STOPPED=""
ICON_PLAYING=""
ICON_PAUSED=""
ICON_UNKNOWN=""

case "$1" in
    -a)
        if [[ -z "$PCTL" ]]; then
            echo ""
        else
            playerctl metadata xesam:artist 2>/dev/null | cut -c 1-18
        fi
        ;;
    -t)
        if [[ -z "$PCTL" ]]; then
            echo ""
        else
            playerctl metadata xesam:title 2>/dev/null | cut -c 1-24
        fi
        ;;
    -i)
        case "$PCTL" in
            "") echo "$ICON_NONE" ;;
            "Stopped") echo "$ICON_STOPPED" ;;
            "Playing") echo "$ICON_PLAYING" ;;
            "Paused") echo "$ICON_PAUSED" ;;
            *) echo "$ICON_UNKNOWN" ;;
        esac
        ;;
    *)
        echo ""
        ;;
esac
