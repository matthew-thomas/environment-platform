#!/usr/bin/env bash

# Set some bash execution settings...
set -o errexit
set -o nounset
set -o pipefail

# TODO: Fail if any pending changes

BUILD_SCRIPTS_PATH='./build-scripts'
source ./build-scripts/build-settings.sh
echo Build settings loaded!

source $NODE_TOOLS_PATH
echo Script $NODE_TOOLS_PATH loaded!

initialize_node 'v6.3.1' $PACKAGES_PATH

npm version patch
npm run push
