#!/bin/sh

#  UpdatePackages.sh
#  
#
#  Created by Half-Qilin on 2024-01-23.
#  

rm ./Packages.bz2
dpkg-scanpackages -m . /dev/null > Packages
bzip2 Packages
