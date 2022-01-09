#!/usr/bin/env bash

#
# this script moves a grails project source folders to the designated
# dropbox and creates links to the new locations
#
# it is expected to be run from the root of the grails project
# it takes one argument - the path from the dropbox folder to the destination
#

DEST_HOME=/home/worldwidewilly/Dropbox/projects
DEST_PROJECT=Changent

// parse input
OPTIND=1 

while getopts "h?vf:" opt; do
    case "$opt" in
    h|\?)
        show_help
        exit 0
        ;;
    v)  verbose=1
        ;;
    f)  output_file=$OPTARG
        ;;
    esac
done


// show help
echo Usage: grails-dropbox-link [OPTIONS] [TARGET SOURCE DIRECTORY]
echo
echo SYNOPSIS
echo DESCRIPTION
echo     grails-dropbox-link moves eclipse grails project source folders to the designated
echo     directory and creates symbolic links to the moved directories in the project tree.
echo     By default the [TARGET SOURCE DIRECTORY] is presumed to be relative to the default 
echo     parent directory $DEST_HOME.
echo     The -p option 
echo OPTIONS
echo     -p
echo         Indicates that the [TARGET SOURCE DIRECTORY] contains the complete path
echo         for the relocated files. The default parent directory is ignored.
echo     -h
echo         Prints this help
echo     -i
echo         prompts before every removal of source files (files in the project)
echo     -v
echo         explain what is being done
echo EXIT STATUS
echo     The exit status is 0 if all files were moved and links were created.
echo
echo EXAMPLES 
echo     grails-dropbox-link -h -i -v 

// set values

// create project links

mv -n -v ./grails-app $DEST_HOME/$DEST_PROJECT
rm -i -r -d -v ./grails-app
ln -s -f -v $DEST_HOME/$DEST_PROJECT/grails-app

mv -n -v ./src $DEST_HOME/$DEST_PROJECT
rm -i -r -d -v ./src
ln -s -f -v $DEST_HOME/$DEST_PROJECT/src

mv -n -v ./test $DEST_HOME/$DEST_PROJECT
rm -i -r -d -v ./test
ln -s -f -v $DEST_HOME/$DEST_PROJECT/test





