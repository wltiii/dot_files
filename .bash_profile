# ~/.bash_profile: executed by bash(1) for login shells.

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
# bash commands belong in profile
# source the profile if it exists
############################################################################
if [ -f "${HOME}/.profile" ]; then
  source "${HOME}/.profile"
fi

############################################################################
# source the users bashrc if it exists
############################################################################
if [ -f "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi

# TODO this, of course, causes an error on MAC
# SEE https://stackoverflow.com/questions/394230/how-to-detect-the-os-from-a-bash-script
#
# FOR EXAMPLE
# if [[ "$OSTYPE" =~ ^darwin ]]; then ...
#
# OR
#
case "$OSTYPE" in
  solaris*) echo "SOLARIS" ;;
  darwin*)  echo "OSX" ;;
  linux*)
      echo "LINUX"
      eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
      ;;
  bsd*)     echo "BSD" ;;
  msys*)    echo "WINDOWS" ;;
  cygwin*)  echo "ALSO WINDOWS" ;;
  *)        echo "unknown: $OSTYPE" ;;
esac

# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"