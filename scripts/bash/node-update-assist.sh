#!/bin/bash
#
# this script assists with updating node, bower and gulp
#
echo "Have you downloaded and installed Nodejs? (y/n)"

read nodeInstalled

if (( "$nodeInstalled" ne "y" )) && (( "$nodeInstalled" ne "n" )); then
  echo "Expected response to be lowercase y or n, but was $nodeInstalled. Exiting."
  exit
fi

#rd /s /q node_modules
#npm install
#node_modules\.bin\bower update
#start node_modules\.bin\gulp

echo "... finished"
