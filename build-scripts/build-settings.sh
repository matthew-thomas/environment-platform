#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# Static settings
export PACKAGES_FOLDER='.packages'                                         # Defines the name of the folder where build dependencies should be cached.
export DISTRIBUTIONS_FOLDER='.dist'                                        # The name of the folder where release distributions are stored.
export SOURCE_FOLDER='src'                                                 # The name of the folder containing all the source code.

# Calculated settings
export DISTRIBUTIONS_PATH="$(readlink -f $DISTRIBUTIONS_FOLDER)"          # Specifies the full local path to the dist folder.
export PACKAGES_PATH="$(readlink -f $PACKAGES_FOLDER)"                    # Specifies the full local path to the packages folder.
export SHELL_SCRIPTS_PATH="$(readlink -f ./build-scripts)"                # Specifies the full local path to the shell scripts folder.
export NODE_TOOLS_PATH="$(readlink -f $SHELL_SCRIPTS_PATH/node.sh)"       # Specifies the full local path to the node shell tools.
export VERSION_TOOLS_PATH="$(readlink -f $SHELL_SCRIPTS_PATH/version.sh)" # Specifies the full local path to the version tools.
export SOURCE_PATH="$(readlink -f $SOURCE_FOLDER)"                        # Specifies the full local path to the source code.