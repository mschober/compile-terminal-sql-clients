#!/bin/bash

_USAGE $@

APP=${1:-'unixODBC-2.3.1'}
APP_TAR=${2:-'APP.tar.gz'}
DOWNLOAD_COMMANDS="\
  _CHECK_FOR_DOWNLOADED || wget ftp://ftp.unixodbc.org/pub/unixODBC/$APP_TAR
"

INSTALL_COMMANDS="\
  tar xf $APP_TAR ;\
  cd $APP ;\
  _make --prefix=\$LOCAL
"

source compiler.func
