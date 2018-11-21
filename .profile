# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

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

############################################################################
# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
############################################################################
#umask 022

############################################################################
# Exports
# Some people use a different file for exports
############################################################################
if [ -f "${HOME}/.bash_exports" ]; then
  source "${HOME}/.bash_exports"
fi

############################################################################
# Set PATH so it includes user's private bin if it exists
############################################################################
# PATH is set in .bash_exports
#if [ -d "${HOME}/bin" ] ; then
#  PATH="${HOME}/bin:${PATH}"
#fi


############################################################################
# Set MANPATH so it includes users' private man if it exists
############################################################################
# if [ -d "${HOME}/man" ]; then
#   MANPATH="${HOME}/man:${MANPATH}"
# fi

############################################################################
# Set INFOPATH so it includes users' private info if it exists
############################################################################
# if [ -d "${HOME}/info" ]; then
#   INFOPATH="${HOME}/info:${INFOPATH}"
# fi

# Ubuntu make installation of Ubuntu Make binary symlink
PATH=$HOME/.local/share/umake/bin:$PATH

