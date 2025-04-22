#! /usr/bin/env bash
if [[ $1 == "--hwut-info" ]]; then
    echo "Directly Followed Arguments: Iteration"
    echo "CHOICES: 1, 2, 3, 4, 5;"
    exit
fi

tmp=`pwd`
cd ..
case $1 in

1)
    echo "../direct_follow -Uss"
    python3 direct_follow.py -Uss
    ;;
2)
    echo "../direct_follow --help"
    python3 direct_follow.py --help
    ;;
3)
    echo "../direct_follow -Ududu -Uim -V12 -URadio"
    python3 direct_follow.py -Ududu -Uim -V12 -URadio
    ;;
4)
    echo "../direct_follow -Ududu -Uim -V12 -URadio -V13"
    python3 direct_follow.py -Ududu -Uim -V12 -URadio -V13
    ;;
5)
    echo "../direct_follow -Ududu -Uim -V12 -URadio -V13 -N12 -BOOLtrue"
    python3 direct_follow.py -Ududu -Uim -V12 -URadio -V13 -N12 -BOOLtrue
    ;;

esac
cd $tmp
