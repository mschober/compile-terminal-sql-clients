#!/bin/bash

APP=freetds-0.91
APP_TAR=freetds-stable.tgz
DOWNLOAD_COMMANDS="\
  _CHECK_FOR_DOWNLOADED || wget ftp://ftp.freetds.org/pub/freetds/stable/$APP_TAR
"

INSTALL_COMMANDS="\
  tar xzf $APP_TAR ;\
  cd $APP ;\
  _make --prefix=\$LOCAL --with-unixodbc=\$LOCAL
"

source compiler.func

_USAGE $@

