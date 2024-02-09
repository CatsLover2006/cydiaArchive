#!/bin/sh

#  UpdatePackages.sh
#  
#
#  Created by Half-Qilin on 2024-01-23.
#

rm -rf ./tmp

for i in ./debs/*/*.deb; do
    [ -f "$i" ] || break
    echo "File: $i"
    dpkg-deb -R "$i" tmp
    if [ -e ./tmp/.DS_Store ]
    then
        echo "Removing .DS_Store"
        rm ./tmp/.DS_Store
        dpkg-deb -b tmp "$i"
    else
        echo "No .DS_Store...skipping"
    fi
    rm -rf ./tmp
done

echo "Done!"
