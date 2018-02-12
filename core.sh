#!/usr/bin/env bash

# The main purpose of this script is to quickly execute the build, deploy, test scripts to verify changes.

# Set some bash execution settings...
set -o errexit
set -o nounset
set -o pipefail

./build.sh

# Load scripts and settings...
BUILD_SCRIPTS_PATH='./build-scripts'
source $BUILD_SCRIPTS_PATH/build-settings.sh
echo Build settings loaded!

# Load the app.build version
source $VERSION_TOOLS_PATH
echo
export BUILD_NUMBER="$(get_last_build_number)"

echo "Deploying build $BUILD_NUMBER..."

$DISTRIBUTIONS_PATH/$BUILD_NUMBER/deploy.sh