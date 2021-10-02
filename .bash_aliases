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
alias idea='intellij-idea-community .'
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

############################################################################
# homebrew aliases
############################################################################
alias brew-commands='brew commands'
alias brew-docs='https://docs.brew.sh'
alias brew-info-help='printf brew help info'
alias brew-info='brew info'
alias brew-install-help='printf brew help install'
alias brew-install='brew install'
alias brew-list-help='printf brew help list'
alias brew-list='brew list'
alias brew-man-page='man brew'
alias brew-search-help='printf brew help search'
alias brew-search='brew search'
alias brew-tap-help='printf brew help tap'
alias brew-tap='brew tap'
alias brew-uninstall-help='printf brew help uninstall'
alias brew-uninstall='brew uninstall'
alias brew-update-help='printf brew help update'
alias brew-update='brew update'
alias brew-upgrade-help='printf brew help upgrade'
alias brew-upgrade='brew upgrade'

############################################################################
# docker aliases
############################################################################
alias docker-attach-container='docker attach'
alias docker-attach-help='printf docker --help attach'
alias docker-build-help='printf docker --help build'
alias docker-commit-help='printf docker --help commit'
alias docker-cp-help='printf docker --help cp'
alias docker-create-help='printf docker --help create'
alias docker-diff-help='printf docker --help diff'
alias docker-events-help='printf docker --help events'
alias docker-exec-help='printf docker --help exec'
alias docker-export-help='printf docker --help export'
alias docker-help='printf docker --help'
alias docker-history-help='printf docker --help history'
alias docker-images-help='printf docker --help images'
alias docker-import-help='printf docker --help import'
alias docker-info-help='printf docker --help info'
alias docker-inspect-help='printf docker --help inspect'
alias docker-kill-help='printf docker --help kill'
alias docker-list-containers='docker ps'
alias docker-list-images='docker images'
alias docker-list-ports='docker port'
alias docker-load-help='printf docker --help load'
alias docker-login-help='printf docker --help login'
alias docker-logout-help='printf docker --help logout'
alias docker-logs-help='printf docker --help logs'
alias docker-logs='docker logs'
alias docker-pause-help='printf docker --help pause'
alias docker-pause='docker pause'
alias docker-port-help='printf docker --help port'
alias docker-ps-help='printf docker --help ps'
alias docker-pull-help='printf docker --help pull'
alias docker-pull-image='docker pull'
alias docker-push-help='printf docker --help push'
alias docker-push-image='docker push'
alias docker-remove-container='docker rm'
alias docker-remove-image='docker rmi'
alias docker-rename-help='printf docker --help rename'
alias docker-restart-container='docker restart'
alias docker-restart-help='printf docker --help restart'
alias docker-rm-help='printf docker --help rm'
alias docker-rmi-help='printf docker --help rmi'
alias docker-run-detached-image='docker run -d'
alias docker-run-help='printf docker --help run'
alias docker-run-image='docker run'
alias docker-run-with-name='docker run -name'
alias docker-run-with-port-map='docker run -p'
alias docker-save-help='printf docker --help save'
alias docker-search-help='printf docker --help search'
alias docker-start-container='docker start'
alias docker-start-help='printf docker --help start'
alias docker-stats-help='printf docker --help stats'
alias docker-stop-container='docker stop'
alias docker-stop-help='printf docker --help stop'
alias docker-tag-help='printf docker --help tag'
alias docker-terminal='docker exec -it'
alias docker-top-help='printf docker --help top'
alias docker-unpause-help='printf docker --help unpause'
alias docker-update-help='printf docker --help update'
alias docker-version-help='printf docker --help version'
alias docker-wait-help='printf docker --help wait'

############################################################################
# flutter aliases
############################################################################
alias flutter-activate-dart-style='flutter pub global activate dart_style'
alias flutter-activate-fvm='flutter pub global activate fvm'
alias flutter-beta-channel='flutter channel beta'
alias flutter-build='flutter build'
alias flutter-build-help='printf flutter build -h'
alias flutter-channel='flutter channel'
alias flutter-clean='flutter clean'
alias flutter-config='flutter config'
alias flutter-config--android-studio='flutter config --android-studio-dir /home/worldwidewilly/android-studio'
alias flutter-config-android-sdk='flutter config --android-sdk /home/worldwidewilly/android-studio'
alias flutter-create='flutter-create-null-safe'
alias flutter-create-help='printf flutter create --help'
alias flutter-devices='flutter devices'
alias flutter-doctor='flutter doctor -v'
alias flutter-downgrade='flutter downgrade'
alias flutter-emulators='flutter emulators'
alias flutter-enable-web='flutter config --enable-web'
alias flutter-get-packages='flutter packages get'
alias flutter-get-packages-verbose='flutter packages get -v'
alias flutter-help='printf flutter --help'
alias flutter-packages-help='printf flutter packages --help -v'
alias flutter-run='flutter pub run'
alias flutter-run-chrome='flutter run -d chrome'
alias flutter-run-chrome-verbose='flutter run -d chrome --verbose'
alias flutter-run-device-help='printf flutter run -h'
alias flutter-run-help='printf flutter pub run -h'
alias flutter-run-test-named='flutter pub run test --name='
alias flutter-run-test-skipped='flutter pub run test --run-skipped'
alias flutter-run-test-tagged='flutter pub run test --tags='
alias flutter-run-tests='flutter pub run test'
alias flutter-stable-channel='flutter channel stable'
alias flutter-test-help='printf flutter test --help'
alias flutter-unit-test='flutter test'
alias flutter-unit-test-help='printf flutter test --help'
alias flutter-unit-test-named='flutter test --name='
alias flutter-upgrade='flutter upgrade'
alias flutter-upgrade-help='printf flutter upgrade -h'
alias flutter-upgrade-verify='flutter upgrade --verify-only'
alias flutter-version='flutter --version'

############################################################################
# flutter version manager (fvm) aliases
############################################################################
alias fvm-help='printf fvm --help'
alias fvm-version='fvm --version'
alias fvm-config='fvm config'
alias fvm-config-help='printf fvm config --help'
alias fvm-dart='fvm dart'
alias fvm-doctor='fvm doctor'
alias fvm-flavor='fvm flavor'
alias fvm-flutter='fvm flutter'
alias fvm-global='fvm global'
alias fvm-install='fvm install'
alias fvm-list='fvm list'
alias fvm-releases='fvm releases'
alias fvm-remove='fvm remove'
alias fvm-spawn='fvm spawn'
alias fvm-use='fvm use'
############################################################################
# git aliases
############################################################################
alias checkout='git fetch --all; git checkout'
alias git-add='git add -i'
alias git-branch-and-checkout='git checkout -b' # gcb -> create a branch from existing branch and checkout. helpful if working on a branch (e.g. master) and should be on another.
alias git-branch-and-checkout-help='printf USAGE: `git-branch-and-checkout new-branch`.\nDESCRIPTION: Creates a branch from current branch and checks it out. This is helpful if working on a branch (e.g. master), you have made changes that should be on another (new) branch.'
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
alias git-list-remotes='git branch -r'
alias git-merge-dev='git merge origin/develop'
alias git-merge-to-main-and-delete='merge-branch-to-main-and-delete'
alias git-merge-to-main-and-delete-help='printf merges the branch to main and deletes the branch'
alias git-merge-to-master-and-delete='merge-branch-to-master-and-delete'
alias git-safe-merge-main-into='safe-merge-main-into'
alias git-safe-merge-main-into-help='printf merges latest main into branch safely (i.e. nothing to commit)'
alias git-safe-merge-master-into='safe-merge-master-into'
alias git-merge='git merge'
alias git-migrate-to-main='git-set-upstream main; git push -u origin main'
alias git-pull='git pull'
alias git-push-new-origin='git push --set-upstream origin'
alias git-push-new-origin-help='printf pushes to a new remote on origin'
alias git-remote='git remote get-url origin'
alias git-reset='git reset'
alias git-set-upstream='git branch set-upstream-to'
alias git-status='git status'
alias git-unadd='git reset'
alias git-update='git pull origin develop'
alias git-upstreams='git fetch --all; git branch -vv'
alias gst='git status' # NOTE: gst will conflict with some smalltalk command
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
alias sdk-help='printf sdk help'
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
alias clr='clear'
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
alias underscoreit='pbpaste | sed s/\ /_/g  | tr -d "\n" | pbcopy'
alias whence='type -a'                        # where, of a sort
alias xless="xml | less"                      # pipes xml to less - see bash function xml()

############################################################################
# Software analysis
############################################################################
alias xray=". ~/workspace/dot_files/code-xray.sh"
alias xray-log=". ~/workspace/dot_files/code-xray.sh log"
alias xray-top=". ~/workspace/dot_files/code-xray.sh top"
alias cloc-no-log=". ~/workspace/dot_files/code-xray.sh cloc"
alias cloc-top=". ~/workspace/dot_files/code-xray.sh cloc-top"

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