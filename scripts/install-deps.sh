#!/bin/sh

export JAVA_HOME=/usr/lib/jvm/java-8-oracle
apt install --no-install-recommends -y gettext git cmake
# needed for docs only
# sudo apt install --no-install-recommends -y texlive-latex-base texlive-latex-extra tex4ht

CURRDIR=`pwd`
DEPS=${1:-$CURRDIR/deps}

if [ -e "$DEPS" ]; then
  rm $DEPS -rf
fi

cd $CURRDIR

sh ./scripts/install-dbus-java.sh $DEPS
sh ./scripts/install-agile-interfaces.sh $DEPS
sh ./scripts/install-tinyb.sh $DEPS

# Enter into the project and compile 
cd iot.agile.protocol.BLE

mvn clean install -U

cd ..
