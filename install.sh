#!/bin/bash
#
# copies `bash` profile files to home directory with prompts for overwriting and sources the new settings
#
\cp -vi .bashrc ~/.bashrc
\cp -vi .bash_aliases ~/.bash_profile
\cp -vi .bash_aliases ~/.profile
\cp -vi .bash_aliases ~/.bash_aliases
\cp -vi .bash_aliases ~/.bash_exports
\cp -vi .bash_aliases ~/.bash_functions
\cp -vi .bash_aliases ~/.bash_logout
\cp -vi .bash_aliases ~/.bash_options

## TODO this does not seem to work. Why?
source ~/.bash_profile

echo 'Bash profile installed.'