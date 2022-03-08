#!/usr/bin/env bash
#
# creates source folders per clean architecture principles
#

# TODO add stubbing of files - below is an example of a DELETE_ME.txt file
# DELETE THIS FILE
#
# This is a stub that was generated when the feature was created to allow sharing through version control.

initCore() {
  echo "initCore()"
  init "core"
  init "core/entity"
  init "core/error"
  init "features"
}

initFeature() {
  echo "initFeature()"

  FEATURE=$1

  FEATURE_PATH="features/$FEATURE"

  init "$FEATURE_PATH"

  init "$FEATURE_PATH/domain/entity"
  init "$FEATURE_PATH/domain/ports/incoming"
  init "$FEATURE_PATH/domain/ports/outgoing"
  init "$FEATURE_PATH/domain/usecase"

  init "$FEATURE_PATH/external/models"
  init "$FEATURE_PATH/external/page/controllers"
  init "$FEATURE_PATH/external/page/widgets"
  init "$FEATURE_PATH/external/persistence"

  init "$FEATURE_PATH/gateway"

}

init() {
  echo "init()"

  for arg in "$@"
  do
      echo -e "${arg}"
      if [ ! -d "./lib/${arg}" ]; then
          mkdir -p "./lib/${arg}"
          echo -e "./lib/${arg} created."
          touch "./lib/${arg}"/DELETE_ME.txt
      else
        echo -e "./lib/${arg} exists. Skipping."
      fi
      if [ ! -d "./test/${arg}" ]; then
          mkdir -p "./test/${arg}"
          echo -e "./test/${arg} created."
          touch "./test/${arg}"/DELETE_ME.txt
      else
        echo -e "./test/${arg} exists. Skipping."
      fi
  done
}

showHelp() {
  echo
  echo "USAGE:"
  echo "flutter-clean-arch.sh <my-feature-name> <project-name>"
  echo
  echo "Execute from the root of the project directory to create lib and test folders"
  echo "conforming to the clean architecture model."
  echo
  echo "The core folder and subfolders are initialized if they do not exist."
}

FEATURE=$1

if [ -z "$FEATURE"]; then
  echo -e "Missing feature name."
  showHelp
else
  initCore
  initFeature $FEATURE
fi