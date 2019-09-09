#!/bin/bash

set -e

SOURCES_DIR=/tmp/artifacts/

$JBOSS_HOME/bin/jboss-cli.sh --command="patch apply $SOURCES_DIR/jboss-eap-7.2.4-patch.zip"
