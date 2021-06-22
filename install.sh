#!/usr/bin/env bash

# copies `bash` profile files to home directory, backing up
# existing dot files to the dot_files_backup dir in users home

DOT_FILES_BACKUP_HOME=~/dot_files_backup

TIMESTAMP=$(date "+%Y-%m-%dT%H:%M:%S")

createBackupDir() {
  if [ ! -d "$DOT_FILES_BACKUP_HOME" ]; then
    mkdir -v "$DOT_FILES_BACKUP_HOME"
  fi
}

backupFile() {
  source=~/"$1"
  target="$source-$TIMESTAMP"
  echo "target is $target"
  if [ -f "$source" ]; then
    \cp -av -- "$source" "$target"
    \mv -v "$target" "$DOT_FILES_BACKUP_HOME"
  fi
}

replaceFile() {
  \cp -v "$1" ~/"$1"
}

installFile() {
  filename="$1"
  userFile=~/"$filename"
  cmp -s $filename $userFile > /dev/null
  comp_value=$?
  if [ $comp_value -eq 1 ]; then
    backupFile "$filename"
    replaceFile "$filename"
  fi
}

createBackupDir

installFile ".bashrc"
installFile ".bash_profile"
installFile ".bash_aliases"
installFile ".bash_exports"
installFile ".bash_functions"
installFile ".bash_logout"
installFile ".bash_options"

if [ ! -f "${HOME}/.bash_custom" ]; then
  echo 'installing .bash_custom'
  cat > ~/.bash_custom << EOF
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