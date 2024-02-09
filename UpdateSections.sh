#!/bin/sh

#  UpdatePackages.sh
#  
#
#  Created by Half-Qilin on 2024-01-23.
#

for i in "$@"; do
    if [[ "$1" == "$i" ]]
    then
        continue
    fi
    [ -f "$i" ] || break
    echo "File: $i"
    dpkg-deb -R "$i" tmp
    python3 ./UpdateSection.py "$1"
    dpkg-deb -b tmp "$i"
    rm -rf ./tmp
done

echo "Done!"
