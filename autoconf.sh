#!/bin/bash

_USAGE $@

APP=autoconf-2.69
APP_TAR=$APP.tar.gz
DOWNLOAD_COMMANDS="\
  _CHECK_FOR_DOWNLOADED || wget http://ftp.gnu.org/gnu/autoconf/$APP_TAR
"

INSTALL_COMMANDS="\
  tar xf $APP_TAR ;\
  cd $APP ;\
  _make --prefix=\$LOCAL
"

source compiler.func

