#!/usr/bin/env bash

# Copies `bash` profile files to home directory, backing up
# existing dot files to the dot_files_backup dir in users home

DOT_FILES_BACKUP_HOME="$HOME/dot_files_backup"

TIMESTAMP=$(date "+%Y-%m-%dT%H:%M:%S")

createBackupDir() {
  if [ ! -d "$DOT_FILES_BACKUP_HOME" ]; then
    mkdir -v "$DOT_FILES_BACKUP_HOME"
  fi
}

backupFile() {
  source="$HOME/$1"
  target="$DOT_FILES_BACKUP_HOME/$1-$TIMESTAMP"
  echo ".... backing up file $source to $DOT_FILES_BACKUP_HOME"

  if [ -f "$source" ]; then
    \cp -av -- "$source" "$target"
  fi
}

putFile() {
  if [ -f "$1" ]; then
    \cp -v "$1" "$HOME/"
  else
    echo ".... source file $1 not found, skipping"
  fi
}

installFile() {
  filename="$1"
  targetFile="$HOME/$filename"

  if ! cmp -s "$filename" "$targetFile"; then
    echo ".... installing $filename to $targetFile"
    backupFile "$filename"
    putFile "$filename"
  fi
}

createBackupDir

for file in .bashrc .bash_profile .bash_aliases .bash_exports .bash_functions .bash_logout .bash_options; do
  installFile "$file"
done

# Conditionally install .bash_private if it does not exist
if [ ! -f "${HOME}/.bash_private" ]; then
  echo '.... installing .bash_private'
  printf "# .bash_private should NEVER be committed\n# Define private variables below.\n" > "${HOME}/.bash_private"
else
  echo '.... skipping .bash_private installation'
fi

# Conditionally install .bash_custom if it does not exist
if [ ! -f "${HOME}/.bash_custom" ]; then
  echo '.... installing .bash_custom'
  printf "# CUSTOMER SPECIFIC BASH SETTINGS\n# Place any client site custom profile settings here. The\n# install script will only copy this if it does not already exist.\n" > "${HOME}/.bash_custom"
else
  echo '.... skipping .bash_custom installation'
fi

# Conditionally install .gitignore_global if it does not exist
if [ ! -f "${HOME}/.gitignore_global" ]; then
  echo '.... installing .gitignore_global'
  cat > "${HOME}/.gitignore_global" << EOF
  printf "# FILES THAT ARE GLOBALLY IGNORED BY GIT\nbash_private\n" > "${HOME}/.gitignore_global"
EOF
else
  echo '.... skipping .gitignore_global installation'
fi

echo
# cannot source from script - too bad...
echo 'updates will not take effect until sourced. Run the following:'
echo 'source ~/.bash_profile'
echo
echo 'Bash profile installed.'