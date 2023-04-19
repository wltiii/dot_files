#!/usr/bin/env bash

# performs setup for an asciidoc slides presentation
#
# USAGE:
#     make-asciidoc-presentation.sh
#

setup() {
  ROOT=$(pwd)
#  PRESENTATION_DIR='DELETE_ME'
#  IMAGES_DIR='DELETE_ME_TOO'
  PRESENTATION_DIR='doc'
  IMAGES_DIR='images'
  INCLUDES_DIR='includes'

  preamble
  verifyPath
  stubPresentation
  addGitIgnore
  verifyNpmInstallation
  installNpmDependency
  verifyRevealJsInstallation
  convertStubbedPresentation
}

preamble() {
  echo "Script asciidoc-slides-setup must be run from the root of your project.

NOTE: This script assumes you are co-mingling a presentation with application source
code. It further assumes the presentation source will exist in folder 'doc', and
that folder is a direct child of the project root. It also creates a presentation
'images' folder within the doc folder. Thus, you will end up with:

+ {project root}
|
+-+ doc
  |
  +-+ images
  |
  +-+ includes

This script does the following:
 - verifies the script is running from the application project root directory
 - creates a doc/images directories if they do not already exist
 - verifies node and npm have been installed
 - creates a presentation.adoc stub in the doc folder if it does not already exist
 - adds .gitignore to the doc folder
 - installs npm dependency at the root of the presentation directory
 - installs reveal js in project directory
"
}

verifyPath() {
  echo ""
  echo "path verification..."

  echo "Is your application project root $ROOT? (y/n)"
  read response

  if [ "$response" != 'y' ]; then
    echo "Navigate to the root directory of your application project and re-run."
    exit
  fi

  echo "Application project root is $ROOT..."
}

stubPresentation() {
  echo "Stubbing presentation into $ROOT..."

  cd $ROOT

  if [[ -d "$PRESENTATION_DIR" ]]; then
    echo "Presentation folder $PRESENTATION_DIR already exists."
  else
    echo "Presentation folder does not exist. Creating tree..."
    mkdir -p -- "$PRESENTATION_DIR"
    mkdir -p -- "$PRESENTATION_DIR/$IMAGES_DIR"
    stubIncluded
  fi

  if [[ -d "$PRESENTATION_DIR/$IMAGES_DIR" ]]; then
    echo "Presentation $IMAGES_DIR folder already exists."
  else
    echo "Folder $IMAGES_DIR does not exist. Creating..."
    mkdir -p -- "$PRESENTATION_DIR/$IMAGES_DIR"
  fi

  if [[ -d "$PRESENTATION_DIR/$INCLUDES_DIR" ]]; then
    echo "Presentation $INCLUDES_DIR folder already exists."
  else
    echo "Folder $INCLUDES_DIR does not exist. Creating..."
    stubIncluded
  fi

  if [[ -f "$PRESENTATION_DIR/presentation.adoc" ]]; then
    echo "Presentation $PRESENTATION_DIR/presentation.adoc already exists. Not created."
  else
    echo "Presention presentation.adoc does not exist. Creating..."
    # using heredoc to create file
    cat <<END >$PRESENTATION_DIR/presentation.adoc
= Flutter - Adaptive and Responsive
Version 0.1, 11/19/2022

:description: My Presentation
:authors: Bill Turner (c)
:sourcedir: ../lib
:imagesdir: ./images
:source-highlighter: pygments

== A Slide With Text

Blah blah blah

== An Image

=== An Image

.Bill and Manoj in Mallorca, May 2002
image::mallorca010.JPG[]

== Included Section

include::included.adoc[]

== Referencing Source Code

This is what I want to show.

[source, dart]
----
include::{sourcedir}/example_1.dart[]
----

== Quoting

A quote

[quote, Tim Sneath, Googlie I/O Developer Conference: 05/11/2022]
We're announcing Flutter 3, which is the culmination of our journey to delivering multiplatform UI development across
phone and desktop and web

<<<

Does anything more need be said?

== References

html links

== Contact Links

LinkedIn or whatever

== Thank You!

You can find this presentation and all examples at:

github link
END
  fi

  echo "Presentation directories and default doc stubbed..."
}

addGitIgnore() {
  echo "Adding presentation .gitignore..."

  cd $ROOT

  if [[ -f "$PRESENTATION_DIR/.gitignore" ]]; then
    echo "Presentation $PRESENTATION_DIR/.gitignore already exists. Not created."
    echo "Verify that you ignore '/node_modules'"
  else
    echo "File $PRESENTATION_DIR/.gitignore does not exist. Creating..."
    # using heredoc to create file
    cat <<END >$PRESENTATION_DIR/.gitignore
/node_modules
END
  fi
}

# Where is this being installed? Presumable in $USER
verifyNpmInstallation() {
  echo "Verifying node and npm are installed..."

  NODE=`which node`
  NPM=`which npm`

  if [ -z "$NODE" ]; then
    echo "============================================================================="
    echo " NODE is not installed. See https://nodejs.org/en/ for more information."
    echo " It is recommended to install node via nvm. See https://github.com/nvm-sh/nvm"
    echo "============================================================================="
    exit
  fi
  echo "NODE is $NODE"

  if [ -z "$NPM" ]; then
    echo "NPM is not installed. See https://nodejs.org/en/ for more information."
    exit
  fi
  echo "NPM is $NPM"
}

# install the dependencies in a project directory, such as the directory where
# your AsciiDoc presentation is stored
# TODO does project directory mean the location of the adoc presentation? Assuming so...
installNpmDependency() {
  echo ""
  cd $ROOT/$PRESENTATION_DIR

  echo "installing npm dependencies..."


  # TODO if package.json exists, do not run init
  if [[ -f "package.json" ]]
  then
    echo "File package.json exists. Bypassing npm initialization."
  else
    npm init -y
    echo "npm initialized..."
  fi

  echo ""
  echo "installing asciidoctor dependencies..."
  npm i --save asciidoctor @asciidoctor/reveal.js
  echo "asciidoctor dependencies installed..."
}

# verify that the asciidoctor-revealjs command is available
verifyRevealJsInstallation() {
  echo ""
  cd $ROOT/$PRESENTATION_DIR
  echo "Verifying RevealJsInstallation. PWD is $PWD"

  REVEAL=`npx asciidoctor-revealjs --version`

  EXPECTED='''Asciidoctor reveal.js'''

  echo $REVEAL

  if [[ $REVEAL != $EXPECTED* ]]; then
    echo """RevealJs is not installed properly. Expected validation string to
    start with: [Asciidoctor reveal.js]. Instead, it returned:

    $REVEAL
    """
  else
    echo "RevealJs installed..."
  fi
}

convertStubbedPresentation() {
  echo ""
  cd $ROOT/$PRESENTATION_DIR
  echo "Converting presentation $ROOT/$PRESENTATION_DIR/presentation.adoc... "

  npx asciidoctor-revealjs presentation.adoc

  echo "Presentation conversion complete."
  echo "A file named presentation.html was created. You can open this file in a browser."
  echo "Run command `npx asciidoctor-revealjs presentation.adoc` from the presentation root to regenerate your slides."
  echo " - or - use alias adoc-gen"

}


stubIncluded() {
  mkdir -p -- "$PRESENTATION_DIR/$INCLUDES_DIR"
  # using heredoc to create file
  cat <<END >$PRESENTATION_DIR/$INCLUDES_DIR/included.adoc
== Included Doc

This allows breaking  up the doc into "chapters".

END

}


# Run the script
setup

