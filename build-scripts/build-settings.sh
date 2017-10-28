#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# Static settings
PACKAGES_FOLDER='packages'                                          # Defines the name of the folder where build dependencies should be cached.

# Calculated settings
export PACKAGES_PATH="$(readlink -f $PACKAGES_FOLDER)"              # Specifies the full local path to the packages folder.
export SHELL_SCRIPTS_PATH="$(readlink -f ./build-scripts)"          # Specifies the full local path to the shell scripts folder.
export NODE_TOOLS_PATH="$(readlink -f $SHELL_SCRIPTS_PATH/node.sh)" # Specifies the full local path to the node shell tools.