#!/bin/bash

set -e

useradd -m bld

cd /tmp
su bld -c "curl -O https://stat.ethz.ch/R/daily/R-devel.tar.gz"
su bld -c "tar -xvf R-devel.tar.gz"
su bld -c "rm R-devel.tar.gz"

cd /tmp/R-devel
su bld -c "./configure --without-recommended-packages --program-suffix=dev --enable-R-shlib --disable-java"
su bld -c "make"

make install

cd
userdel bld
rm -rf /home/bld
rm -rf /tmp/R-devel

cd /usr/local/bin/
mv R Rdevel
mv Rscript Rscriptdevel
ln -s Rdevel RD
ln -s Rscriptdevel RDscript
cd 

