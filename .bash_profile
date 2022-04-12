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
  echo "sourcing ${HOME}/.profile"
  source "${HOME}/.profile"
fi

############################################################################
# source the users bashrc if it exists
############################################################################
if [ -f "${HOME}/.bashrc" ] ; then
  echo "sourcing ${HOME}/.bashrc"
  source "${HOME}/.bashrc"
fi

#
# SEE https://stackoverflow.com/questions/394230/how-to-detect-the-os-from-a-bash-script
#
# OS specif configuration
## TODO would this be the path needed for bin/cache .pub-cache/bin commented out in .bash_exports?
case "$OSTYPE" in
  solaris*) echo "SOLARIS" ;;
  darwin*)
      echo "OSX - installing OS specific settings"
      eval "$(/opt/homebrew/bin/brew shellenv)"
#       export PATH="$PATH:~/development/flutter/bin"
      export PATH="$PATH:/Users/worldwidewilly/fvm/default/bin"
#       export PATH="$PATH":"$HOME/development/flutter/.pub-cache/bin"
#       export JAVA_HOME=/usr/bin/java
#       export JAVA_HOME=$(/usr/libexec/java_home)
#       sudo ln -sfn /opt/homebrew/opt/openjdk@11/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-11.jdk
#                  /usr/local/opt/openjdk@11/bin/java
      ;;
  linux*)
      echo "LINUX - installing OS specific settings"
      eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
      export PATH=$PATH:/home/worldwidewilly/fvm/default/bin
      ;;
  bsd*)     echo "BSD" ;;
  msys*)    echo "WINDOWS" ;;
  cygwin*)  echo "ALSO WINDOWS" ;;
  *)        echo "unknown: $OSTYPE" ;;
esac
