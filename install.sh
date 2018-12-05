#!/bin/bash
#
# copies `bash` profile files to home directory with prompts for overwriting and sources the new settings
#
\cp -vi .bashrc ~/.bashrc
\cp -vi .bash_profile ~/.bash_profile
\cp -vi .profile ~/.profile
\cp -vi .bash_aliases ~/.bash_aliases
\cp -vi .bash_exports ~/.bash_exports
\cp -vi .bash_functions ~/.bash_functions
\cp -vi .bash_logout ~/.bash_logout
\cp -vi .bash_options ~/.bash_options

if [ ! -f "${HOME}/.bash_client" ]; then
  echo 'installing .bash_client'
  cat > ~/.bash_client << EOF
#
# Place any client site custom profile settings here. The
# install script will only copy this if it does not already exist.
#

EOF
fi

echo
# cannot source from script - too bad...
echo 'updates will not take effect until sourced. Run the following:'
echo 'source ~/.bash_profile'
echo
echo 'Bash profile installed.'
