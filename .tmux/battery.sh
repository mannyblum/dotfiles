#!/bin/sh

battery="$(pmset -g batt | awk 'NR==2 { gsub(/;/,""); gsub(/%/,""); print $2 }')"

if [[ $battery -lt 10 ]]; then
    echo "♥♡ ♡ ♡ ♡ ♡ ♡ ♡ ♡ ♡"
elif [[ $battery -lt 20 ]]; then
    echo "♥♥♡ ♡ ♡ ♡ ♡ ♡ ♡ ♡"
elif [[ $battery -lt 30 ]]; then
    echo "♥♥♥♡ ♡ ♡ ♡ ♡ ♡ ♡"
elif [[ $battery -lt 40 ]]; then
    echo "♥♥♥♥♡ ♡ ♡ ♡ ♡ ♡"
elif [[ $battery -lt 50 ]]; then
    echo "♥♥♥♥♥♡ ♡ ♡ ♡ ♡"
elif [[ $battery -lt 60 ]]; then
    echo "♥♥♥♥♥♥♡ ♡ ♡ ♡"
elif [[ $battery -lt 70 ]]; then
    echo "♥♥♥♥♥♥♥♡ ♡ ♡"
elif [[ $battery -lt 80 ]]; then
    echo "♥♥♥♥♥♥♥♥♡ ♡"
elif [[ $battery -lt 90 ]]; then
    echo "♥♥♥♥♥♥♥♥♥♡"
else
    echo "♥♥♥♥♥♥♥♥♥♥"
fi
