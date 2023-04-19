#!/usr/bin/env bash

# performs setup for an asciidoc slides presentation
#
# USAGE:
#     adoc-slide-gen.sh
#

setup() {
  ROOT=$(pwd)
  PRESENTATION_DIR='doc'

  preamble
  generateSlides
}

preamble() {
  echo "=== Asciidoc Presentation Generator ===

  This will generate a presentation for Asciidoc (.adoc) sources.

  The presentation is expected to be named `presentation.adoc` and
  is expected to be found in a directory of the project root
  named `doc`.

  NOTE: This script is expected to launched from the root of the
  project directory."
}

generateSlides() {
  echo ""
  echo "path verification..."

  if [[ -d "$PRESENTATION_DIR" ]]; then
    echo "Presentation folder $PRESENTATION_DIR found."
  else
    echo "ERROR - folder $PRESENTATION_DIR was not found.
    Are you running this from the presentation project root folder?"
    exit
  fi

  if [[ -f "$PRESENTATION_DIR/presentation.adoc" ]]; then
    echo "Presentation $PRESENTATION_DIR/presentation.adoc found. Generating slides."
    npx asciidoctor-revealjs $PRESENTATION_DIR/presentation.adoc
  else
    echo "ERROR - no file named presentation.adoc was found at $PRESENTATION_DIR/presentation.adoc.
    Slides not generated."
    exit
  fi

}

setup

