#!/usr/bin/env bash

# Set some bash execution settings...
set -o errexit
set -o nounset
set -o pipefail

SCRIPT_PATH=$(dirname "$0")
PACKAGES_PATH=$SCRIPT_PATH/.packages
DEPLOY_SCRIPTS_PATH=$SCRIPT_PATH

if [ ! -d $PACKAGES_PATH ]; then
    echo "Deployment dependencies $PACKAGES_PATH does not exist, running setup..."

    $DEPLOY_SCRIPTS_PATH/install-deploy-tools.sh
fi

SCRIPT_PATH=$(dirname "$0")
VERSION=`cat $SCRIPT_PATH/version.txt`
ENVIRONMENT_PLATFORM=azure

echo Environment Platform: $ENVIRONMENT_PLATFORM

$DEPLOY_SCRIPTS_PATH/$ENVIRONMENT_PLATFORM.sh

echo Deployment of $VERSION Completed!