#! /usr/bin/env bash
if [[ $1 == "--hwut-info" ]]; then
    echo "Combining GetPot Objects - Absorbtion"
    echo "CHOICES: 1, 2;"
    exit
fi

case $1 in 
1)
    echo "../absorb --directory ../"
    python3 ../absorb.py --directory ../
    ;;
2)
    echo "../absorb --directory ../ bubu=6711 --I12"
    python3 ../absorb.py --directory ../ bubu=6711 --I12
    ;;
esac
