#!/usr/bin/env bash

# The main purpose of this script is to decouple the
# cli user from whatever build tool is currently being used.

echo Starting Build!

# Set some bash execution settings...
set -o errexit
set -o nounset
set -o pipefail

echo
echo Bash shell configured!
echo

# Load scripts and settings...
BUILD_SCRIPTS_PATH='./build-scripts'
source $BUILD_SCRIPTS_PATH/build-settings.sh
echo Build settings loaded!

chmod +x $BUILD_SCRIPTS_PATH/*.sh
echo Set execute permissions on $BUILD_SCRIPTS_PATH

if [ ! -d $PACKAGES_PATH ]; then
    echo "Build dependencies $PACKAGES_PATH does not exist, running local setup..."

    $BUILD_SCRIPTS_PATH/install-build-tools.sh
fi

source $NODE_TOOLS_PATH
echo Script $NODE_TOOLS_PATH loaded!

initialize_node 'v6.3.1' $PACKAGES_PATH

npm run build:src

echo Build Complete