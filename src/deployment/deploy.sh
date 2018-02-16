#!/usr/bin/env bash

# Set some bash execution settings...
set -o errexit
set -o nounset
set -o pipefail

SCRIPT_PATH=$(dirname "$0")
PACKAGES_PATH=$SCRIPT_PATH/.packages
DEPLOY_SCRIPTS_PATH=$SCRIPT_PATH

chmod +x $DEPLOY_SCRIPTS_PATH/*.sh

if [ ! -d $PACKAGES_PATH ]; then
    echo "Deployment dependencies $PACKAGES_PATH does not exist, running setup..."
    $DEPLOY_SCRIPTS_PATH/install-deploy-tools.sh
fi

SCRIPT_PATH=$(dirname "$0")
VERSION=`cat $SCRIPT_PATH/version.txt`

echo Deployment of $VERSION Completed!