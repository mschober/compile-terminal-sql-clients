#!/bin/bash

#_USAGE $@

APP=freetds-0.91.100
APP_TAR=$APP.tar.gz
DOWNLOAD_COMMANDS="\
  _CHECK_FOR_DOWNLOADED || wget ftp://ftp.freetds.org/pub/freetds/stable/$APP_TAR
"

INSTALL_COMMANDS="\
  tar xzf $APP_TAR ;\
  cd $APP ;\
  _make --prefix=\$LOCAL --with-unixodbc=\$LOCAL
"

source compiler.func
