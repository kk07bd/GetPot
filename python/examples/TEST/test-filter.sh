#! /usr/bin/env bash
if [[ $1 == "--hwut-info" ]]; then
    echo "Filter Prefixes"
    exit
fi

cd ..
python3 filter.py --nice
cd -

