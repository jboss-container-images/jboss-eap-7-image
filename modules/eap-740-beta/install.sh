#!/bin/sh

set -e

SOURCES_DIR=/tmp/artifacts/
DISTRIBUTION_ZIP="jboss-eap-7.4.Beta.zip"

unzip -d $SOURCES_DIR/eap-dist -q $SOURCES_DIR/$DISTRIBUTION_ZIP
DIST_NAME=`ls $SOURCES_DIR/eap-dist`

mv $SOURCES_DIR/eap-dist/$DIST_NAME $JBOSS_HOME

