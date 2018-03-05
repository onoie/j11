#!/bin/bash

sudo chmod 777 $(cd $(dirname $0); pwd) -f
sudo chmod 700 ${0##*/}
sudo chmod +x /j11/dotfiles/install.sh
sudo chmod +x /j11/dotfiles/uninstall.sh

#nanorc
if [ -d ~/.nano ]; then
  echo found ~/.nano
else
  DOWNLOAD=nanorc.zip
  if [ -e $DOWNLOAD ]; then
    echo "found $DOWNLOAD"
  else
    echo "not found $DOWNLOAD"
    wget --no-check-certificate https://github.com/nanorc/nanorc/archive/master.zip -O $DOWNLoAD
    unzip $DONWLOAD
    cd nanorc-master
    make install
    cd ..
    rm -rf nanorc-master
    rm -f $DOWNLOAD
  fi
fi
