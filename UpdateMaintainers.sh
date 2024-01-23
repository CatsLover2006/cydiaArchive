#!/bin/sh

#  UpdatePackages.sh
#  
#
#  Created by Half-Qilin on 2024-01-23.
#

rm -rf ./tmp

for i in *.deb; do
    [ -f "$i" ] || break
    echo "File: $i"
    dpkg-deb -R "$i" tmp
    python3 UpdateMaintainerFile.py
    dpkg-deb -b tmp "$i"
    rm -rf ./tmp
done

for i in */*.deb; do
    [ -f "$i" ] || break
    echo "File: $i"
    dpkg-deb -R "$i" tmp
    python3 UpdateMaintainerFile.py
    dpkg-deb -b tmp "$i"
    rm -rf ./tmp
done

for i in */*/*.deb; do
    [ -f "$i" ] || break
    echo "File: $i"
    dpkg-deb -R "$i" tmp
    python3 UpdateMaintainerFile.py
    dpkg-deb -b tmp "$i"
    rm -rf ./tmp
done

echo "Done!"
