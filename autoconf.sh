#!/bin/bash

SCRIPT=$(BASENAME $0)
AUTOCONF=autoconf-2.69
ARCHIVES=$HOME/apps/archives
LOCAL=$HOME/apps/usr/local

source compiler.func

[[ $# -ne 1 ]] && echo "usage $SCRIPT -i or $SCRIPT -u" && exit 1

function _download_autoconf {
  test -f $ARCHIVES/$AUTOCONF.tar.gz && echo "$AUTOCONF.tar.gz already downloaded" && return
  wget http://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz
}

function _install {
  cd $ARCHIVES
  _download_autoconf
  tar xf $AUTOCONF.tar.gz
  cd $ARCHIVES/$AUTOCONF
  _make --prefix=$LOCAL
}

function _uninstall {
  [[ ! -d $ARCHIVES/$AUTOCONF ]] && echo "$ARCHIVES/$AUTOCONF does not exist" && return
  cd $ARCHIVES/$AUTOCONF
  _break
  cd ..
  rm -rf $AUTOCONF
}

while getopts iu opt; do
  case $opt in
    i)
      echo "installing $AUTOCONF"
      #trap _uninstall SIGINT
      _install
      ;;
    u)
      echo "uninstalling $AUTOCONF"
      #trap _uninstall SIGINT
      _uninstall
      ;;
  esac
done
