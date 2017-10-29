#!/usr/bin/env bash
echo Provisioning Node.js modules needed for building...
$npm install
echo Done!
echo
mkdir -p $RELEASE_OUTPUT_PATH
echo Release distribution folder \'$RELEASE_OUTPUT_PATH\' created/exists!