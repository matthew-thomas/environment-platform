#!/usr/bin/env bash

echo Starting Build!

# Set some bash execution settings...
set -o errexit
set -o nounset
set -o pipefail
echo
echo Bash shell configured!
echo

# Load scripts and settings...
source build-settings.sh
echo Build settings loaded!

if [ ! -d $PACKAGES_PATH ]; then
    echo "Build dependencies $PACKAGES_PATH does not exist, running local setup..."

    ./build-scripts/install-build-tools.sh
fi

source $NODE_TOOLS_PATH
echo Script $NODE_TOOLS_PATH loaded!

initialize_node 'v6.3.1' $PACKAGES_PATH