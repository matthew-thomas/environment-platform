#!/usr/bin/env bash

# Set some bash execution settings...
set -o errexit
set -o nounset
set -o pipefail

echo Provisioning Node.js modules...
npm install
echo Done!

# Ensure the distributions folder exists
mkdir -p $DISTRIBUTIONS_PATH

# Load the app.build version
source $VERSION_TOOLS_PATH
echo
export BUILD_NUMBER="$(get_build_number)"
export APP_VERSION="$(get_app_version)"
echo "BUILD_NUMBER: $BUILD_NUMBER"

RELEASE_OUTPUT_RELATIVE_PATH="$DISTRIBUTIONS_PATH/$BUILD_NUMBER"
export RELEASE_OUTPUT_PATH="$(readlink -f $RELEASE_OUTPUT_RELATIVE_PATH)" # Specifies the full local path to the release output folder.

echo
mkdir -p $RELEASE_OUTPUT_PATH
echo Release distribution folder \'$RELEASE_OUTPUT_PATH\' created!

echo $APP_VERSION > "$RELEASE_OUTPUT_PATH/version.txt"
cp $SOURCE_PATH/deployment/*.* $RELEASE_OUTPUT_PATH

echo
echo Release $APP_VERSION completed!
echo