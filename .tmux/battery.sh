#!/bin/sh

battery="$(pmset -g batt | awk 'NR==2 { gsub(/;/,""); gsub(/%/,""); print $2 }')"

if [[ $battery -lt 25 ]]; then
    echo "♥♡♡♡"
elif [[ $battery -lt 50 ]]; then
    echo "♥♥♡♡"
elif [[ $battery -lt 75 ]]; then
    echo "♥♥♥♡"
else
    echo "♥♥♥♥"
fi
