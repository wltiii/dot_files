############################################################################
#
# If these are enabled they will be used instead of any commands
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.
#
############################################################################
# profile management - commands to help with updating changes to dot_files
############################################################################
alias new-profile='~/workspace/dot_files/install.sh;source-profile'
alias source-profile='source ~/.bash_profile'

############################################################################
# change directory aliases
############################################################################
alias up='cd ..'
alias ..='up'
alias up2='cd ../..'
alias ...='up2'
alias up3='cd ../../..'
alias ....='up3'
alias up4='cd ../../../..'
alias .....='up4'
alias up5='cd ../../../../..'
alias ......='up5'
alias up6='cd ../../../../../..'
alias .......='up6'

############################################################################
# list directory aliases
############################################################################
alias l='\ls -CF'                              # all but . and .. in columns
#alias ls='ls -Alhi --color=auto'              # almost all, long list, human readable sizes, show symbolic link reference, , human readable sizes
alias ls='ls -GAlhi'                           # REPLACES above - Works on MAC, need to test on Linux - SEE https://superuser.com/questions/183876/how-do-i-get-ls-color-auto-to-work-on-mac-os-x
alias ll='\ls -lh'                             # long list, human readable sizes
alias lt='\ls -lht'                            # long list, human readable sizes, sorted by modification time (newest first)
alias la='\ls -lhtA'
alias lr='\ls -lhtr'                           # long list, human readable sizes, sorted by modification time (reversed)
alias lar='\ls -ltAr'
alias dir='\ls --color=auto --format=vertical'
alias vdir='\ls --color=auto --format=long'

############################################################################
# tool aliases
############################################################################
#alias sudo='sudo -E env "PATH=$PATH"'
alias fgrep='fgrep --color=auto'              # show differences in colour
alias grep='egrep --color=auto'               # show differences in colour
# alias grep='grep --color'                   # show differences in colour
alias mob='~/.local/bin/mob'
alias more=less
alias mysudo='sudo -i -E env "PATH=$PATH"'
alias sudo='sudo -i'
alias sudo-edit='sudoedit'
alias sudo-edit-help='printf "USAGE: sudo-edit <file>\nDESCRIPTION: edits files as another user using the default editor (configurable).\nFor example, use this rather than *sudo gedit*.\nSEE: https://ubuntuforums.org/showthread.php?t=2459392\n"'
alias vi=vim
# consider making TextEdit plain text by default and unselecting all the "smart" (or all) options
# for more info, see: https://www.techjunkie.com/textedit-plain-text-mode/
alias mac-edit='open -a TextEdit'                 # open TextEdit from command line (Mac)
alias adb='~/Android/Sdk/platform-tools/adb'

############################################################################
# asciidoc aliases
############################################################################
alias adoc-gen-help='run adoc-gen from root of presentation folder. File presentation.adoc must existing within the folder.'
# alias adoc-gen='npx asciidoctor-revealjs presentation.adoc'
alias adoc-slides='adoc-slide-gen.sh'
alias make-asciidoc='make-asciidoc-presentation.sh'
alias make-adoc='make-asciidoc-presentation.sh'

############################################################################
# homebrew aliases
############################################################################
alias brew-commands='brew commands'
alias brew-docs='https://docs.brew.sh'
alias brew-info-help='brew help info'
alias brew-info='brew info'
alias brew-install-help='brew help install'
alias brew-install='brew install'
alias brew-list-help='brew help list'
alias brew-list='brew list'
alias brew-man-page='man brew'
alias brew-search-help='brew help search'
alias brew-search='brew search'
alias brew-tap-help='brew help tap'
alias brew-tap='brew tap'
alias brew-uninstall-help='brew help uninstall'
alias brew-uninstall='brew uninstall'
alias brew-update-help='brew help update'
alias brew-update='brew update'
alias brew-upgrade-help='brew help upgrade'
alias brew-upgrade='brew upgrade'

############################################################################
# dart aliases
############################################################################
alias dart-repl='interactive'
alias dart-repl-help='printf "\nUSAGE: dart-repl\nDESCRIPTION: Runs \`interactive.\`\nTo quit: \`CONTROL+C\` (MAC)\nSEE: https://pub.dev/documentation/interactive/latest/\n\n"'

############################################################################
# docker aliases
############################################################################
alias docker-attach-container='docker attach'
alias docker-attach-help='docker --help attach'
alias docker-build-help='docker --help build'
alias docker-commit-help='docker --help commit'
alias docker-cp-help='docker --help cp'
alias docker-create-help='docker --help create'
alias docker-diff-help='docker --help diff'
alias docker-events-help='docker --help events'
alias docker-exec-help='docker --help exec'
alias docker-export-help='docker --help export'
alias docker-help='docker --help'
alias docker-history-help='docker --help history'
alias docker-images-help='docker --help images'
alias docker-import-help='docker --help import'
alias docker-info-help='docker --help info'
alias docker-inspect-help='docker --help inspect'
alias docker-kill-help='docker --help kill'
alias docker-list-containers='docker ps'
alias docker-list-images='docker images'
alias docker-list-ports='docker port'
alias docker-load-help='docker --help load'
alias docker-login-help='docker --help login'
alias docker-logout-help='docker --help logout'
alias docker-logs-help='docker --help logs'
alias docker-logs='docker logs'
alias docker-pause-help='docker --help pause'
alias docker-pause='docker pause'
alias docker-port-help='docker --help port'
alias docker-ps-help='docker --help ps'
alias docker-pull-help='docker --help pull'
alias docker-pull-image='docker pull'
alias docker-push-help='docker --help push'
alias docker-push-image='docker push'
alias docker-remove-container='docker rm'
alias docker-remove-image='docker rmi'
alias docker-rename-help='docker --help rename'
alias docker-restart-container='docker restart'
alias docker-restart-help='docker --help restart'
alias docker-rm-help='docker --help rm'
alias docker-rmi-help='docker --help rmi'
alias docker-run-detached-image='docker run -d'
alias docker-run-help='docker --help run'
alias docker-run-image='docker run'
alias docker-run-with-name='docker run -name'
alias docker-run-with-port-map='docker run -p'
alias docker-save-help='docker --help save'
alias docker-search-help='docker --help search'
alias docker-start-container='docker start'
alias docker-start-help='docker --help start'
alias docker-stats-help='docker --help stats'
alias docker-stop-container='docker stop'
alias docker-stop-help='docker --help stop'
alias docker-tag-help='docker --help tag'
alias docker-terminal='docker exec -it'
alias docker-top-help='docker --help top'
alias docker-unpause-help='docker --help unpause'
alias docker-update-help='docker --help update'
alias docker-version-help='docker --help version'
alias docker-wait-help='docker --help wait'

############################################################################
# flutter aliases
############################################################################
alias flutter='fvm-flutter'
alias flutter-activate-dart-style='flutter pub global activate dart_style'
alias flutter-activate-fvm='flutter pub global activate fvm'
alias flutter-beta-channel='flutter channel beta'
alias flutter-build='fvm-flutter-build'
alias flutter-build-help='flutter build -h'
alias flutter-channel='flutter channel'

alias flutter-clean='fvm-flutter-clean'
alias flutter-clean-get-help='printf "\nUSAGE: flutter-clean-get\nDESCRIPTION: Cleans and gets all packages.\nNOTE: This assumes the project is managed through Flutter Version Manager.\n\n"'
alias flutter-clean-get='fvm-flutter-clean && flutter-pub-get'
alias flutter-clean-get-test-help='printf "\nUSAGE: flutter-clean-get-test\nDESCRIPTION: Cleans, gets all packages and runs tests.\nNOTE: This assumes the project is managed through Flutter Version Manager.\n\n"'
alias flutter-clean-get-test='flutter-clean-get-test && flutter-run-tests'
alias flutter-clean-get-test-named-help='printf "\nUSAGE: flutter-clean-get-test --name=\nDESCRIPTION: Cleans, gets all packages and runs tests.\nNOTE: This assumes the project is managed through Flutter Version Manager.\n\n"'
alias flutter-clean-get-test-named='flutter-clean-get && flutter-run-test-named'

alias flutter-clean-get-upgrade='fvm-flutter-clean && flutter-pub-upgrade && flutter-pub-get'
alias flutter-clean-get-upgrade-test='flutter-clean-get-upgrade && flutter-run-tests'
alias flutter-clean-get-upgrade-test-named='flutter-clean-get-upgrade && flutter-run-test-named'

alias android-studio='sh /home/worldwidewilly/android-studio/bin/studio.sh'
alias flutter-config='flutter config'
alias flutter-config--android-studio='flutter config --android-studio-dir /home/worldwidewilly/android-studio'
alias flutter-config-android-sdk='flutter config --android-sdk /home/worldwidewilly/Android/Sdk'
alias flutter-create='flutter-create-null-safe'
alias flutter-create-help='flutter create --help'
alias flutter-devices='flutter devices'
alias flutter-doctor='flutter doctor -v'
alias flutter-downgrade='flutter downgrade'
alias flutter-emulators-help='flutter emulators -h'
alias flutter-emulators='flutter emulators'
alias flutter-create-emulator-help='flutter emulators --create [--name xyz]'
alias flutter-create-emulator='flutter emulators --create'
alias flutter-launch-emulator-help='flutter emulators --launch <emulator id>'
alias flutter-launch-emulator='flutter emulators --launch'
alias flutter-emulators-device='flutter emulators -d'
alias flutter-emulators-cold='flutter emulators --cold'
alias adb-help='adb --help'
alias adb-devices='adb devices -l'
alias flutter-enable-web='flutter config --enable-web'
alias flutter-get-packages='flutter packages get'
alias flutter-get-packages-verbose='flutter packages get -v'
alias flutter-help='flutter --help'
alias flutter-packages-help='flutter packages --help -v'
alias flutter-pub-get='fvm-flutter-pub-get'
alias flutter-pub-upgrade='fvm-flutter-pub-upgrade'
alias flutter-build-runner='fvm-flutter-build-runner'
alias flutter-run='flutter pub run'
alias flutter-run-chrome='flutter run -d chrome'
alias flutter-run-linux='flutter run -d linux'
alias flutter-run-macos='flutter run -d macos'
alias flutter-run-windows='flutter run -d windows'
alias flutter-run-chrome-verbose='flutter run -d chrome --verbose'
alias flutter-run-device-help='flutter run -h'
alias flutter-run-help='flutter pub run -h'
alias flutter-run-test-named='flutter pub run test --name='
alias flutter-run-test-skipped='flutter pub run test --run-skipped'
alias flutter-run-test-tagged='flutter pub run test --tags='
alias flutter-run-tests='flutter pub run test'
alias flutter-run-web='fvm-flutter run ./lib/main_development.dart --web-renderer html'
alias flutter-stable-channel='flutter channel stable'
alias flutter-test-help='flutter test --help'
alias flutter-unit-test='flutter test'
alias flutter-unit-test-help='flutter test --help'
alias flutter-unit-test-named='flutter test --name='
alias flutter-update-help='printf "\nUSAGE: flutter-update\nDESCRIPTION: Installs and sets the global Flutter version to the latest stable release.\nNOTE: This assumes the project is managed through Flutter Version Manager.\n\n"'
alias flutter-update='fvm-flutter-update'
alias flutter-upgrade-help='printf "DEPRECATED. USE: `flutter-update` instead of `flutter upgrade -h`"'
alias flutter-upgrade='printf "DEPRECATED. USE: `flutter-update` instead of `flutter upgrade`"'
alias flutter-upgrade-verify='flutter upgrade --verify-only'
alias flutter-version='flutter --version'
alias flutter-remove='fvm flutter pub remove'
alias flutter-remove-help='printf "\nUSAGE: flutter-remove <package>\nDESCRIPTION: Removes package from project.\nNOTE: This assumes the project is managed through Flutter Version Manager.\n\n"'
alias flutter-update-version='fvm-flutter-update'
alias flutter-update-version-help='printf "USAGE: flutter-update-version version-number\nDESCRIPTION: Installs version and sets both active and global to the vesion.\n"'

############################################################################
# flutter version manager (fvm) aliases
############################################################################
alias fvm-help='fvm --help'
alias fvm-version='fvm --version'
alias fvm-config='fvm config'
alias fvm-config-help='fvm config --help'
alias fvm-dart='fvm dart'
alias fvm-doctor='fvm doctor'
alias fvm-flavor='fvm flavor'
alias fvm-flutter='fvm flutter'
alias fvm-flutter-build='fvm-flutter build'
alias fvm-flutter-clean='fvm-flutter clean'
alias fvm-flutter-pub-get='fvm-flutter pub get'
alias fvm-flutter-pub-upgrade='fvm-flutter pub upgrade'
alias fvm-flutter-build-runner='fvm-flutter pub run build_runner build'
alias fvm-global='fvm global'
alias fvm-install='fvm install'
alias fvm-install-stable-help='printf "USAGE: fvm-flutter-update\nDESCRIPTION Installs latest stable flutter release
and sets as global."'
alias fvm-install-stable='fvm-flutter-update'
# the following does not work. it states 'Please provide a channel or a version, or run this command in a Flutter project that has FVM configured.'
# alias fvm-install-global='version=$1; fvm install $version && fvm global $version'
# alias fvm-install-global="one=$1; two=$1; echo two is $two; echo one is $one"
alias fvm-list='fvm list'
alias fvm-list-releases='fvm releases'
alias fvm-list-beta-releases='fvm-list-releases | grep beta'
alias fvm-list-stable-releases='fvm-list-releases | grep stable'
alias fvm-remove='fvm remove'
alias fvm-spawn='fvm spawn'
alias fvm-update='pub global activate fvm'
alias fvm-use='fvm use'
############################################################################
# git aliases
############################################################################
alias checkout='git fetch --all; git checkout'
alias git-add='git add -i'
alias git-branch-and-checkout='git checkout -b' # gcb -> create a branch from existing branch and checkout. helpful if working on a branch (e.g. master) and should be on another.
alias git-branch-and-checkout-help='printf "USAGE: git-branch-and-checkout new-branch\nDESCRIPTION: Creates a branch from current branch and checks it out. This is helpful if working on a branch (e.g. master), you have made changes that should be on another (new) branch.\n"'
alias git-branch='git branch'
alias git-checkout='git checkout'
alias git-clone='git clone'
alias git-commit='git commit'
alias git-copy-changes-to-help='printf "USAGE: git-copy-changes-to target-branch\nDESCRIPTION: Stashes current changes, checks out target-branch and applies the changes.\n"'
alias git-copy-changes-to='git-apply-changes-to'
alias git-create-branch='git-branch-and-checkout' # redirects to alias git-branch-and-checkout
alias git-delete-other-branches='git branch | cut -c3- | grep -v "^master$" | xargs git branch -D'
alias git-diff-meld='git diff | meld'
alias git-fetch-merge='git pull'
alias git-fetch='git fetch'
alias git-list-all='git branch -a'
alias git-list-all-detail='git branch -vva'
alias git-list-local='git branch'
alias git-list-remotes='git branch -r'
alias git-list-global-config='git config --list --global'
alias git-merge-dev='git merge origin/develop'
alias git-merge-to-main-and-delete='merge-branch-to-main-and-delete'
alias git-merge-to-main-and-delete-help='printf "USAGE: git-merge-to-main-and-delete\nDESCRIPTION: merges the branch to main and deletes the branch\n"'
alias git-merge-to-master-and-delete='merge-branch-to-master-and-delete'
alias git-safe-merge-main-into='safe-merge-main-into'
alias git-safe-merge-main-into-help='printf "USAGE: git-safe-merge-main-into\nDESCRIPTION: merges latest main into branch safely (i.e. nothing to commit)\n"'
alias git-safe-merge-master-into='safe-merge-master-into'
alias git-merge='git merge'
alias git-migrate-to-main='git-set-upstream main; git push -u origin main'
alias git-pull='git pull'
alias git-push-new-origin='git push --set-upstream origin'
alias git-push-new-origin-help='printf "USAGE: git-push-new-origin\nDESCRIPTION: pushes to a new remote on origin\n"'
alias git-remote='git remote get-url origin'
alias git-reset='git reset'
alias git-set-default-branch='git config --global init.defaultBranch main'
alias git-set-upstream='git branch set-upstream-to'
alias git-status='git status'
alias git-unadd='git reset'
alias git-update='git pull origin develop'
alias git-upstreams='git fetch --all; git branch -vv'
alias gst='git status' # NOTE: gst will conflict with some smalltalk command
alias github-desktop='flatpak run io.github.shiftey.Desktop'
############################################################################
# MyRepo aliases - requires MyRepos to be installed: https://myrepos.branchable.com/
############################################################################
alias mr-checkout='mr "$@" checkout'
alias mr-clean='mr "$@" clean'
alias mr-diff='mr "$@" diff'
alias mr-fetch='mr "$@" fetch'
alias mr-list='mr "$@" list'
alias mr-log='mr "$@" log'
alias mr-record='mr "$@" record'
alias mr-register-all='for D in $(\ls);do mr register $D; done;'
alias mr-register='mr "$@" register'
alias mr-status='mr "$@" status'
alias mr-update-all='mr -j5 update'
alias mr-update='mr "$@" update'

############################################################################
# sdkman aliases - requires that SDKMAN be installed:
############################################################################
alias sdkman='sdk help'
alias sdk-broadcast='sdk broadcast'
alias sdk-current='sdk current'
alias sdk-default='sdk default'
alias sdk-env='sdk env'
alias sdk-flush='sdk flush'
alias sdk-help='sdk help'
alias sdk-home='sdk home'
alias sdk-install='sdk install'
alias sdk-list='sdk list'
alias sdk-offline='sdk offline'
alias sdk-selfupdate='sdk selfupdate'
alias sdk-update='sdk update'
alias sdk-update='sdk update'
alias sdk-upgrade='sdk upgrade'
alias sdk-use='sdk use'
alias sdk-version='sdk version'

############################################################################
# misc command aliases
############################################################################
# alias refresh='source ~/.bash_profile' # this does not work. see README.
# alias work='cd ~/workspace'                 # removed. use groovy script 'work' in workman project
# alias less='less -r'                        # raw control characters
alias install-dot='./install.sh && source ~/.bash_profile'
alias clr='clear'
alias clean-snap='cleanup-snap'
alias filtered-aliases='alias | grep "$@"'
alias functions='compgen -A function'
alias formatjson='pbpaste|json|pbcopy'
alias hist='history | grep -i'                # search history for a command
alias jless="json | less"                     # pipes json to less - see bash function json()
# mapitup works on posix machines only. should be generified.
#alias mapitup='pbpaste | json | sed s/\"/\'/g | sed -E s/\'\(.*\)\':/\\1:/g | sed s/\{/\[/g | sed s/\}/\]/g | pbcopy'
alias myip='curl ifconfig.co/'
alias path='echo -e ${PATH//:/\\n}'           # pretty path
alias prettypath='echo -e ${PATH//:/\\n}'     # pretty path
alias q='exit'
alias trail='tail -f'
# this version of underscoreit works on posix machines only. should be generified.
# alias underscoreit='pbpaste | sed s/\ /_/g  | tr -d "\n" | pbcopy'
alias dashit-help='printf "\nUSAGE: dashit `a string with spaces`\nDESCRIPTION: Echos string as lowercase replacing spaces with dashes.\n\n"'
#alias dashit='to-dashed-string'
alias dashit='to-dashed-lowercase-string "$@"'
alias whence='type -a'                        # where, of a sort
alias xless="xml | less"                      # pipes xml to less - see bash function xml()

############################################################################
# Software analysis
############################################################################
alias xray=". ~/workspace/dot_files/scripts/bash/code-xray"
alias xray-log=". ~/workspace/dot_files/scripts/bash/code-xray log"
alias xray-top=". ~/workspace/dot_files/scripts/bash/code-xray top"
alias cloc-no-log=". ~/workspace/dot_files/scripts/bash/code-xray cloc"
alias cloc-top=". ~/workspace/dot_files/scripts/bash/code-xray cloc-top"

############################################################################
# Interactive operation...
############################################################################
alias cp='cp -vi' #to prompt when copying if you want to overwrite and will tell you where
alias rd='rm --interactive=once --recursive --dir --force --verbose' #Prompts you if you really want to remove it.
alias mv='mv -i' #Prompts you if you are going to overwrite something

############################################################################
# Default to human readable figures
############################################################################
# alias df='df -h'
# alias du='du -h'

############################################################################
# OS specific aliases
############################################################################
case "$OSTYPE" in
  darwin*)
      echo "OSX - specific aliases"
      alias idea='/usr/local/bin/idea'
#
#       NOTE: does it make sense to link python3 on OSX as I am planning for
#       Linux as shown below?
#       Probably not, unless I do it through /usr/local/bin (?). What is
#       contained in /usr/bin is protected from modification on MAC
#
#     it seems unlikely that I will ever use Python2.
      alias python='/Library/Frameworks/Python.framework/Versions/3.12/bin/python3'
      alias py='/Library/Frameworks/Python.framework/Versions/3.12/bin/python3'
      ;;
  linux*)
    #   NOTE: python3 needs to be linked to the correct version. For example, the command
    #       $ sudo ln -sf /usr/bin/python3.12 to /usr/bin/python3
    #         links the TARGET /usr/bin/python3.12 to LINK_NAME /usr/bin/python3.
    #
    #         IT might be nice to always run the link command on startup.
    #
    #   To run the `ln` command on startup from the `.bash_profile` without
    #   prompting for a password, you can use the `sudo` command with the `-n`
    #   flag and specify the specific command you want to run without a password
    #   prompt in the sudoers file. Here's how you can do it:
    #
    #   1. Open a terminal window.
    #   2. Use a text editor to edit the sudoers file. You can use the `visudo`
    #   command to safely edit the sudoers file. Run the following command:
    #      ```
    #      sudo visudo
    #      ```
    #   3. In the sudoers file, add the following line at the end, replacing
    #   `<username>` with your actual username and `<command>` with the `ln`
    #   command you want to run:
    #      ```
    #      <username> ALL=(ALL) NOPASSWD: /bin/ln <command>
    #      ```
    #   For example, if you want to create a symbolic link to a file without a
    #   password prompt, you might have a line like this:
    #      ```
    #      johndoe ALL=(ALL) NOPASSWD: /bin/ln -s /path/to/sourcefile /path/to/targetfile
    #      ```
    #   Make sure to specify the full path to the `ln` command
    #   (usually `/bin/ln`) and the full paths to the source and target files.
    #
    #   4. Save and exit the text editor.
    #   Now, when you run the `ln` command in your `.bash_profile` or any other
    #   startup script, it should not prompt you for a password.
    #
    #   Be cautious when editing the sudoers file, as incorrect changes can lead
    #   to system issues. Double-check your entries for accuracy before saving the file.
      echo "LINUX - specific aliases"
      alias idea='intellij-idea-community'
      alias py='/usr/bin/python3'
      alias python='/usr/bin/python3'

      ;;
  bsd*)     echo "BSD - specific aliases" ;;
  solaris*) echo "SOLARIS - specific aliases" ;;
  msys*)    echo "WINDOWS - specific aliases" ;;
  cygwin*)  echo "CYGWIN (ALSO WINDOWS) - specific aliases" ;;
  *)        echo "unknown: $OSTYPE" ;;
esac
