#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# Static settings
PACKAGES_FOLDER='.packages'                                         # Defines the name of the folder where build dependencies should be cached.
DISTRIBUTIONS_FOLDER='.dist'                                        # The name of the folder where release distributions are stored.

# Calculated settings
export DISTRIBUTIONS_PATH="$(readlink -f $DISTRIBUTIONS_FOLDER)"          # Specifies the full local path to the dist folder.
export PACKAGES_PATH="$(readlink -f $PACKAGES_FOLDER)"                    # Specifies the full local path to the packages folder.
export SHELL_SCRIPTS_PATH="$(readlink -f ./build-scripts)"                # Specifies the full local path to the shell scripts folder.
export NODE_TOOLS_PATH="$(readlink -f $SHELL_SCRIPTS_PATH/node.sh)"       # Specifies the full local path to the node shell tools.
export VERSION_TOOLS_PATH="$(readlink -f $SHELL_SCRIPTS_PATH/version.sh)" # Specifies the full local path to the version tools.

mkdir -p $DISTRIBUTIONS_PATH                                              # Ensure the distributions folder exists

# Load the app.build version
source $VERSION_TOOLS_PATH
export BUILD_NUMBER="$(get_build_number)"
echo "BUILD_NUMBER: $BUILD_NUMBER"

RELEASE_OUTPUT_RELATIVE_PATH="$DISTRIBUTIONS_PATH/$BUILD_NUMBER"
export RELEASE_OUTPUT_PATH="$(readlink -f $RELEASE_OUTPUT_RELATIVE_PATH)" # Specifies the full local path to the release output folder.