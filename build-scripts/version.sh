#!/usr/bin/env bash
# This script provides functions for working with version numbers.

set -e
set -o errexit
set -o nounset
set -o pipefail

get_app_version() {
    # TODO: Get version from package.json
    APP_VERSION="0.1"
    
    # Get build number
    BUILD_NUMBER="$(get_build_number)"

    echo "$APP_VERSION.$BUILD_NUMBER"
}

get_build_number() {
    # If the current build number isn't specified by an external agent (CI server),
    # then calculate it based on the previous build number.
    if [[ ! -v BUILD_NUMBER ]]; then
        if [[ ! -v TRAVIS_BUILD_NUMBER ]]; then
            BUILD_NUMBER=
        else
            BUILD_NUMBER=$TRAVIS_BUILD_NUMBER # TODO: Refactor to be a parameter.
        fi
    fi

    if [[ -z "$BUILD_NUMBER" ]]; then
        LAST_BUILD_NUMBER="$(ls -ld $DISTRIBUTIONS_FOLDER/*/ --sort=time | head -1 | grep -Po '\d+/' | grep -Po '\d+')"

        if [[ -z "$LAST_BUILD_NUMBER" ]]; then
            # This is the first build.
            LAST_BUILD_NUMBER=0
        fi

        BUILD_NUMBER=$((LAST_BUILD_NUMBER+1))
    fi

    echo $BUILD_NUMBER
}