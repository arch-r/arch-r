#!/bin/bash

set -e

cd /usr/share/texmf-dist/
curl -LO http://mirrors.ctan.org/install/fonts/inconsolata.tds.zip
unzip inconsolata.tds.zip
rm inconsolata.tds.zip
echo "Map zi4.map" >> /etc/texmf/web2c/updmap-local.cfg
cd /
/usr/share/libalpm/scripts/mktexlsr
/usr/share/libalpm/scripts/texlive-fmtutil
/usr/share/libalpm/scripts/texlive-updmap
cd
