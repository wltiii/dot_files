#!/usr/bin/env python3
#
# UNTESTED
#
# This script replicates the functionality of the Bash install.sh script in
# Python, including creating backup directories, copying files, and creating
# conditional files with specific contents. Make sure you have the necessary
# permissions to execute these operations.
#
# Remember that Python handles paths and file operations differently than Bash,
# so testing in a controlled environment before using it on important files is
# advisable.
#
import os
import shutil
from datetime import datetime

# Define the backup directory and timestamp
DOT_FILES_BACKUP_HOME = os.path.join(os.environ["HOME"], "dot_files_backup")
TIMESTAMP = datetime.now().strftime("%Y-%m-%dT%H:%M:%S")

def create_backup_dir():
    """Create the backup directory if it doesn't exist."""
    if not os.path.exists(DOT_FILES_BACKUP_HOME):
        os.makedirs(DOT_FILES_BACKUP_HOME)
        print(f"Created directory: {DOT_FILES_BACKUP_HOME}")

def backup_file(filename):
    """Backup the given file."""
    source = os.path.join(os.environ["HOME"], filename)
    target = os.path.join(DOT_FILES_BACKUP_HOME, f"{filename}-{TIMESTAMP}")

    if os.path.isfile(source):
        shutil.copy2(source, target)
        print(f".... backing up file {source} to {DOT_FILES_BACKUP_HOME}")

def put_file(filename):
    """Copy the given file to the home directory."""
    if os.path.isfile(filename):
        shutil.copy2(filename, os.environ["HOME"])
    else:
        print(f".... source file {filename} not found, skipping")

def install_file(filename):
    """Install the given file to the home directory."""
    target_file = os.path.join(os.environ["HOME"], filename)
    print(f".... installing {filename} to {target_file}")

    if os.path.isfile(filename) and os.path.isfile(target_file) and filecmp.cmp(filename, target_file):
        print(f".... {filename} is identical, skipping backup")
    else:
        backup_file(filename)
        put_file(filename)

def create_conditional_file(filename, content):
    """Create the file with the given content if it does not exist."""
    file_path = os.path.join(os.environ["HOME"], filename)
    if not os.path.isfile(file_path):
        print(f'.... installing {filename}')
        with open(file_path, 'w') as file:
            file.write(content)
    else:
        print(f'.... skipping {filename} installation')

# Main script execution
create_backup_dir()

for file in ['.bashrc', '.bash_profile', '.bash_aliases', '.bash_exports', '.bash_functions', '.bash_logout', '.bash_options']:
    install_file(file)

create_conditional_file('.bash_private',
                        "# .bash_private should NEVER be committed\n# Define private variables below.\n")

create_conditional_file('.bash_custom',
                        "# CUSTOMER SPECIFIC BASH SETTINGS\n# Place any client site custom profile settings here. The\n# install script will only copy this if it does not already exist.\n")

create_conditional_file('.gitignore_global',
                        "# FILES THAT ARE GLOBALLY IGNORED BY GIT\nbash_private\n")

print("\nupdates will not take effect until sourced. Run the following:")
print('source ~/.bash_profile')
print("\nBash profile installed.")
