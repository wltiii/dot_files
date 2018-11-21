#!/bin/bash

# The grid below shows the execution of the various startup files.
# 
# ----+--- System Wide (all users) --------+------ #
# L S | /etc/.profile   | /etc/bash.bashrc | I a S #
# o h |                 |                  | n c h #
# g e +-----------------+------------------+ t t e #
# i l | ~/.bash_profile | ~/.bashrc        | e i l #
# n l | ~/.profile      |                  | r v l #
# ----+-------- Per user ------------------+ e --- #
#
# Things that should happen only once should be placed in the .profile, which
# will be executed at login. This includes setting environment variables as 
# they will be inherited by later processes.
#
# Things that need to be set up with every instance of a shell should be 
# placed in the .bashrc. This includes aliases, option settings and function
# definitions.
# 
# I have elected to use the .bash_profile as an orchestrator. It sources the
# .profile, which in turn sets up all the login settings. Likewise, .bash_profile
# sources .bashrc, which then sets up all the interactive shell settings.
#
############################################################################

PAGER=most

############################################################################
# Options
############################################################################
if [ -f "${HOME}/.bash_options" ]; then
  source "${HOME}/.bash_options"
fi

############################################################################
# Aliases
# Some people use a different file for aliases
############################################################################
if [ -f "${HOME}/.bash_aliases" ]; then
  source "${HOME}/.bash_aliases"
fi

############################################################################
# Functions
############################################################################
if [ -f "${HOME}/.bash_functions" ]; then
  source "${HOME}/.bash_functions"
fi

############################################################################
#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
############################################################################
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="/home/worldwidewilly/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
