#!/bin/env bash

export pkgname=lightdm-theme-sakura
export _pkgname=sakura
export srcdir=$(pwd)

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

mkdir -p /usr/share/web-greeter/themes
cd /usr/share/web-greeter/themes
if [ -d $_pkgname ] 
then
  echo "Removing old theme"
  rm -rf ${_pkgname}
fi
echo "Copying theme files"
cp -dpr --no-preserve=ownership ${srcdir} ${_pkgname}
echo "Removing .git files"
cd ${_pkgname}
rm -rf .gitignore
echo "Removing dev files"
rm -rf .git
rm -f PKGBUILD