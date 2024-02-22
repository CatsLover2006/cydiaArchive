#!/bin/sh

#  UpdatePackages.sh
#
#
#  Created by Half-Qilin on 2024-01-23.
#

if [ -z "$1" ]; then
dir='./'
else
dir=$1
fi

rm -rf ./tmp

for i in $dir/*/*.deb; do
    [ -f "$i" ] || break
    echo "File: $i"
    dpkg-deb -R "$i" tmp
    python3 ./UpdateMaintainerFile.py
    dpkg-deb -b -Zgzip -Snone -z9 tmp "$i"
    rm -rf ./tmp
done

echo "Done!"
