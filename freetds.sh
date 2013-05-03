#!/bin/bash
FREETDS_DIR=freetds-0.91
FREETDS_TAR=freetds-stable.tgz
ARCHIVES=$HOME/apps/archives
LOCAL=$HOME/apps/usr/local

source compiler.func

[[ $# -ne 1 ]] && echo 'usage freetds.sh -i or freetds.sh -u' && exit 1

cd $HOME/apps/archives

function download_freetds {
  test -f $ARCHIVES/$FREETDS_TAR && echo "$FREETDS_TAR already downloaded" && return
  wget ftp://ftp.freetds.org/pub/FREETDS_DIR/stable/freetds-stable.tgz
}

function _install {
  download_freetds
  tar xzf $FREETDS_TAR
  cd $ARCHIVES/$FREETDS_DIR
  ./autogen.sh
  _make --prefix=$LOCAL --with-unixodbc=$LOCAL
}

function _uninstall {
  cd $ARCHIVES/$FREETDS_DIR
  _break
  cd ..
  rm -rf $FREETDS_DIR
}

while getopts iu opt; do
  case $opt in
    i)
      echo 'installing $freetds_dir'
      #trap _install SIGINT SIGTERM SIGKILL
      _install
      ;;
    u)
      echo 'uninstalling $freetds_dir'
      #trap _uninstall SIGINT SIGTERM SIGKILL
      _uninstall
      ;;
  esac
done
