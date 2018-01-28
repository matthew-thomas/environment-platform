#!/usr/bin/env bash

SCRIPT_PATH=$(dirname "$0")

VERSION=`cat $SCRIPT_PATH/version.txt`
echo Deployment of $VERSION Completed!