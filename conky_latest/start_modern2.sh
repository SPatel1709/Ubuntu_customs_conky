#!/bin/bash
# start_modern2.sh - Start the modern2 Conky theme

killall conky 2>/dev/null
sleep 1
conky -c ~/.conky/conky_latest/shrey_modern2.conf &

echo "Modern2 Conky theme started!"
