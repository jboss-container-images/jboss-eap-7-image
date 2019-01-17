#!/bin/sh

set -e

SOURCES_DIR=/tmp/artifacts/
DISTRIBUTION_ZIP="jboss-eap-cd.zip"

unzip -d $SOURCES_DIR/eap-cd-dist -q $SOURCES_DIR/$DISTRIBUTION_ZIP
DIST_NAME=`ls $SOURCES_DIR/eap-cd-dist`

mv $SOURCES_DIR/eap-cd-dist/$DIST_NAME $JBOSS_HOME

