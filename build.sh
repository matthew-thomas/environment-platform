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
source ./build-scripts/build-settings.sh
echo Build settings loaded!

if [ ! -d $PACKAGES_PATH ]; then
    echo "Build dependencies $PACKAGES_PATH does not exist, running local setup..."

    ./build-scripts/install-build-tools.sh
fi

source $NODE_TOOLS_PATH
echo Script $NODE_TOOLS_PATH loaded!

initialize_node 'v6.3.1' $PACKAGES_PATH

npm run build:src