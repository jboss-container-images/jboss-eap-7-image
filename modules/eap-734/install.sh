#!/bin/sh

set -e

SOURCES_DIR=/tmp/artifacts/
DISTRIBUTION_ZIP="jboss-eap-7.3.zip"

unzip -d $SOURCES_DIR/eap-dist -q $SOURCES_DIR/$DISTRIBUTION_ZIP
DIST_NAME=`ls $SOURCES_DIR/eap-dist`

mv $SOURCES_DIR/eap-dist/$DIST_NAME $JBOSS_HOME

export JAVA_OPTS="${JAVA_OPTS} -Dorg.wildfly.patching.jar.invalidation=true"
$JBOSS_HOME/bin/jboss-cli.sh --command="patch apply $SOURCES_DIR/jboss-eap-7.3.4-patch.zip"
