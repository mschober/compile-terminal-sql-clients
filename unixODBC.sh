#!/bin/bash

SCRIPT=$(BASENAME $0)
ODBC=unixODBC-2.3.1
ARCHIVES=$HOME/apps/archives
LOCAL=$HOME/apps/usr/local

source compiler.func

[[ $# -ne 1 ]] && echo "usage $SCRIPT -i or $SCRIPT -u" && exit 1

function _download_odbc {
  test -f $ARCHIVES/$ODBC.tar.gz && echo "$ODBC.tar.gz already downloaded" && return
  wget ftp://ftp.unixodbc.org/pub/unixODBC/$ODBC.tar.gz
}

function _install {
  cd $ARCHIVES
  _download_odbc
  tar xf $ODBC.tar.gz
  cd $ARCHIVES/$ODBC
  _make --prefix=$LOCAL
}

function _uninstall {
  [[ ! -d $ARCHIVES/$ODBC ]] && echo "$ARCHIVES/$ODBC does not exist" && return
  cd $ARCHIVES/$ODBC
  _break
  cd ..
  rm -rf $ODBC
}

while getopts iu opt; do
  case $opt in
    i)
      echo "installing $ODBC"
      #trap _uninstall SIGINT
      _install
      ;;
    u)
      echo "uninstalling $ODBC"
      #trap _uninstall SIGINT
      _uninstall
      ;;
  esac
done
