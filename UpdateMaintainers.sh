#!/bin/sh

#  UpdatePackages.sh
#  
#
#  Created by Half-Qilin on 2024-01-23.
#

rm -rf ./tmp

for i in ./deb/*/*.deb; do
    [ -f "$i" ] || break
    echo "File: $i"
    dpkg-deb -R "$i" tmp
    if [ -e x.txt ]
    then
        echo "ok"
    else
        echo "No .DS_Store...skipping"
    fi
    dpkg-deb -b tmp "$i"
    rm -rf ./tmp
done

echo "Done!"
