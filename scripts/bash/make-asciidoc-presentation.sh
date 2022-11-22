#!/usr/bin/env bash

# performs setup for an asciidoc slides presentation
#
# USAGE:
#     edit the list of repos to be created at the bottom of this script.
#     Run command:
#         make-asciidoc-presentation.sh
#

setup() {
#  preamble
#  verifyPath
  verifyRvmIsInstalled
}

preamble() {
  echo "Script asciidoc-slides-setup must be run from the root of your project.

It does the following:
 - verifies this script is running from the project directory
 - checks that ruby version manager is installed
 - installs latest ruby version
 - installs reveal js in project directory ???
"
}

verifyPath() {
  var=$(pwd)
  echo "Is $var your project root directory? (y/n)"
  read response

  if [ "$response" != 'y' ]; then
    echo "Navigate to the root directory of your poject and re-run."
    exit
  fi

#  echo "You responded with $response"
}

verifyRvmIsInstalled() {
  DATE=`date -I`
  echo "DATE is"
  echo $DATE
  RAWTYPE=`type rvm`
  echo "RAWTYPE is $RAWTYPE"
  TYPE=$(type rvm 2>&1)
  echo "TYPE is $TYPE"
#  echo $TYPE

#  OUT=$(type rvm | head -n 1 2>&1)
#  OUT=$(type rvm | head -n 1)
  echo "$(type rvm | head -n 1)"
  OUT=`type rvm | head -n 1`
  # head: option requires an argument -- n usage: head [-n lines | -c bytes] [file ...]
  echo "OUT is"
  echo "$OUT"
  echo $OUT
  echo OUT
  echo "####### piped ##############"
filename='weekday.txt'
while read line; do
day=`echo $line | cut -c 1-3`
if [ $day == "Sun" ]
then
echo "Sunday is the holiday"
else
echo $day
fi
done<$filename  echo "#########################"
  RVM=$(type rvm)
  echo "RVM is $RVM"
#  type rvm >> RESULT
#  RESULT = echo "type rvm"
  echo "###### type rvm ###################"
  echo "type rvm"
  echo "$(type rvm)"
  echo "###### result ###################"
  RESULT = echo "$(type rvm)"
#  RESULT = echo "head -n 1 $RVM"
  echo "RESULT is $RESULT"
  echo "###### head ###################"
  head -n 1 $HOME/.rvm/bin/rvm
#  echo `head -n 1 $HOME/.rvm/bin/rvm`
  HEAD=$(echo `head -n 1 $HOME/.rvm/bin/rvm`)
  echo $HEAD
  echo "#########################"

#  var="$(type rvm | head -n 1)"

#  echo "e is ${e}"
#  echo "RVM is ${RVM}"
#  echo "var is ${var}"

#  if [ "${e}" -ge '1' ]; then
#    echo "Foo returned BAD exit code ${e}"
#  fi

#  echo "RVM verification result is var"

#  if [ "$var != rvm is a function" ]; then
#    echo "RVM is not installed. Click on https://rvm.io/rvm/install for instructions."
#    exit
#  fi

}

# Run the script
setup

