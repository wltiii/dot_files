#!/usr/bin/env bash
#
# creates source folders per clean architecture principles as defined by resocoder
#

initAll() {
#    echo 'initAll()'

    FEATURE=$1

    init 'core'
    init 'features'

    initFeatures $FEATURE
}

initFeatures() {
#    echo 'initFeatures()'

    FEATURE=$1

    init "features/$FEATURE"

    init "features/$FEATURE/data"
    init "features/$FEATURE/data/datasources"
    init "features/$FEATURE/data/models"
    init "features/$FEATURE/data/repositories"

    init "features/$FEATURE/domain"
    init "features/$FEATURE/domain/entities"
    init "features/$FEATURE/domain/repositories"
    init "features/$FEATURE/domain/usecases"

    init "features/$FEATURE/presentation"
    init "features/$FEATURE/presentation/bloc"
    init "features/$FEATURE/presentation/pages"
    init "features/$FEATURE/presentation/widgets"
}

init() {
#    echo 'init()'
    
    for arg in "$@"
    do
        echo -e "${arg}"
        if [ ! -d "./lib/${arg}" ]; then
            mkdir "./lib/${arg}"
            echo -e "lib/${arg} created."
        else
          echo -e "lib/${arg} exists. Skipping."
        fi
        if [ ! -d "./test/${arg}" ]; then
            mkdir "./test/${arg}"
            echo -e "test/${arg} created."
        else
          echo -e "test/${arg} exists. Skipping."
        fi
    done

}

showHelp() {
  echo -e "Missing feature name."
  echo
  echo "USAGE:"
  echo "flutter-clean-arch.sh my-feature-name"
  echo
}

FEATURE=$1

if [ -z "$FEATURE" ]; then
  showHelp
else
  initAll $FEATURE
fi


