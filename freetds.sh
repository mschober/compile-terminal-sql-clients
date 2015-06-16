#!/bin/bash

_USAGE $@

APP=${1:-freetds-0.91}
APP_TAR=${2:-freetds-stable.tgz}
DOWNLOAD_COMMANDS="\
  _CHECK_FOR_DOWNLOADED || wget ftp://ftp.freetds.org/pub/freetds/stable/$APP_TAR
"

INSTALL_COMMANDS="\
  tar xzf $APP_TAR ;\
  cd $APP ;\
  _make --prefix=\$LOCAL --with-unixodbc=\$LOCAL
"

source compiler.func
