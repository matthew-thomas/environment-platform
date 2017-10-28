#!/usr/bin/env bash

echo Starting build dependency provisioning!

# Set some bash execution settings...
set -o errexit
set -o nounset
set -o pipefail
echo
echo Bash shell configured!
echo
script_name=$0
script_full_path=$(dirname "$0")

echo "script_name: $script_name"
echo "full path: $script_full_path"

# Load scripts and settings...
source "$script_full_path/build-settings.sh"
echo Build settings loaded!

source $NODE_TOOLS_PATH
echo Script $NODE_TOOLS_PATH loaded!

# Ensure the packages directory exists.
mkdir -p $PACKAGES_PATH
echo Folder \'$PACKAGES_PATH\' created/exists!
echo

# Ensure the correct version of node is used.
provision_node 'v6.3.1' $PACKAGES_PATH
echo
echo Build dependency provisioning complete!