#!/usr/bin/env bash

# Set some bash execution settings...
set -o errexit
set -o nounset
set -o pipefail

echo Provisioning Node.js modules...
npm install
echo Done!

mkdir -p $DISTRIBUTIONS_PATH                                              # Ensure the distributions folder exists

# Load the app.build version
source $VERSION_TOOLS_PATH
echo
export BUILD_NUMBER="$(get_build_number)"
echo "BUILD_NUMBER: $BUILD_NUMBER"
export APP_VERSION="$(get_app_version)"
echo "APP_VERSION:  $APP_VERSION"

RELEASE_OUTPUT_RELATIVE_PATH="$DISTRIBUTIONS_PATH/$BUILD_NUMBER"
export RELEASE_OUTPUT_PATH="$(readlink -f $RELEASE_OUTPUT_RELATIVE_PATH)" # Specifies the full local path to the release output folder.

echo
mkdir -p $RELEASE_OUTPUT_PATH
echo Release distribution folder \'$RELEASE_OUTPUT_PATH\' created!

echo "Hello, World! $APP_VERSION" > "$RELEASE_OUTPUT_PATH/hello-world.txt"