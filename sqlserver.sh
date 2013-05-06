#!/bin/bash

SCRIPT=$(basename $0)
SQLSERVER=SQLSERVER
ARCHIVES=$HOME/apps/archives
LOCAL=$HOME/apps/usr/local

FREETDS_DIR=freetds-0.91
FREETDS_TAR=freetds-stable.tgz
ARCHIVES=$HOME/apps/archives
LOCAL=$HOME/apps/usr/local

[[ $# -ne 1 ]] && echo "usage $SCRIPT -i or $SCRIPT -u" && exit 1

#function _install {
#  mkdir -p $ARCHIVES
#  mkdir -p $LOCAL
#
#  cd $HOME/apps/archives
#
#  unixODBC -i
#  freetds -i
#}
#
#function _uninstall {
#    freetds -u
#    unixODBC -u
#}
#
#while getopts iu opt; do
      echo 'installing $ODBC'
      trap _install SIGINT SIGTERM SIGKILL
      ;;
    u)
      echo 'uninstalling $ODBC'
      trap _uninstall SIGINT SIGTERM SIGKILL
#  case $opt in
#    i)
#      echo 'installing $SQLSERVER'
#      _install
#      ;;
#    u)
#      echo 'uninstalling $SQLSERVER'
#      _uninstall
#      ;;
#  esac
#done
