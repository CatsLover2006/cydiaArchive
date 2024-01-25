#!/bin/sh

#  UpdatePackages.sh
#  
#
#  Created by Half-Qilin on 2024-01-23.
#  

dpkg-scanpackages -m . /dev/null > Packages
rm ./Packages.bz2
bzip2 Packages
