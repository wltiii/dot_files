# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.
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
alias vi=vim
alias more=less
alias grep='egrep --color=auto'               # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour
# alias grep='grep --color'                   # show differences in colour
alias sdkman='sdk'
#alias sudo='sudo -E env "PATH=$PATH"'
alias sudo='sudo -i'
alias mysudo='sudo -i -E env "PATH=$PATH"'
alias mob='~/.local/bin/mob'
# consider making TextEdit plain text by default and unselecting all the "smart" (or all) options
# for more info, see: https://www.techjunkie.com/textedit-plain-text-mode/
alias mac-edit='open -a TextEdit'                 # open TextEdit from command line (Mac)

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
# docker aliases
############################################################################
alias docker-help-attach='docker --help attach'
alias docker-help-build='docker --help build'
alias docker-help-commit='docker --help commit'
alias docker-help-cp='docker --help cp'
alias docker-help-create='docker --help create'
alias docker-help-diff='docker --help diff'
alias docker-help-events='docker --help events'
alias docker-help-exec='docker --help exec'
alias docker-help-export='docker --help export'
alias docker-help-history='docker --help history'
alias docker-help-images='docker --help images'
alias docker-help-import='docker --help import'
alias docker-help-info='docker --help info'
alias docker-help-inspect='docker --help inspect'
alias docker-help-kill='docker --help kill'
alias docker-help-load='docker --help load'
alias docker-help-login='docker --help login'
alias docker-help-logout='docker --help logout'
alias docker-help-logs='docker --help logs'
alias docker-help-pause='docker --help pause'
alias docker-help-port='docker --help port'
alias docker-help-ps='docker --help ps'
alias docker-help-pull='docker --help pull'
alias docker-help-push='docker --help push'
alias docker-help-rename='docker --help rename'
alias docker-help-restart='docker --help restart'
alias docker-help-rm='docker --help rm'
alias docker-help-rmi='docker --help rmi'
alias docker-help-run='docker --help run'
alias docker-help-save='docker --help save'
alias docker-help-search='docker --help search'
alias docker-help-start='docker --help start'
alias docker-help-stats='docker --help stats'
alias docker-help-stop='docker --help stop'
alias docker-help-tag='docker --help tag'
alias docker-help-top='docker --help top'
alias docker-help-unpause='docker --help unpause'
alias docker-help-update='docker --help update'
alias docker-help-version='docker --help version'
alias docker-help-wait='docker --help wait'
alias docker-help='docker --help'

alias docker-attach-container='docker attach'
alias docker-list-containers='docker ps'
alias docker-list-images='docker images'
alias docker-list-ports='docker port'
alias docker-logs='docker logs'
alias docker-pause='docker pause'
alias docker-pull-image='docker pull'
alias docker-push-image='docker push'
alias docker-remove-container='docker rm'
alias docker-remove-image='docker rmi'
alias docker-restart-container='docker restart'
alias docker-run-detached-image='docker run -d'
alias docker-run-image='docker run'
alias docker-run-with-name='docker run -name'
alias docker-run-with-port-map='docker run -p'
alias docker-start-container='docker start'
alias docker-stop-container='docker stop'
alias docker-terminal='docker exec -it'

############################################################################
# flutter aliases
############################################################################
alias flutter-activate-dart-style='flutter pub global activate dart_style'
alias flutter-activate-fvm='flutter pub global activate fvm'
alias flutter-beta-channel='flutter channel beta'
alias flutter-build='flutter build'
alias flutter-build-help='flutter build -h'
alias flutter-channel='flutter channel'
alias flutter-clean='flutter clean'
alias flutter-config='flutter config'
alias flutter-config--android-studio='flutter config --android-studio-dir /home/worldwidewilly/android-studio'
alias flutter-config-android-sdk='flutter config --android-sdk /home/worldwidewilly/android-studio'
alias flutter-create='flutter create'
alias flutter-create-help='flutter create --help'
alias flutter-devices='flutter devices'
alias flutter-doctor='flutter doctor -v'
alias flutter-downgrade='flutter downgrade'
alias flutter-emulators='flutter emulators'
alias flutter-enable-web='flutter config --enable-web'
alias flutter-get-packages='flutter packages get'
alias flutter-get-packages-verbose='flutter packages get -v'
alias flutter-help='flutter --help'
alias flutter-packages-help='flutter packages --help -v'
alias flutter-run='flutter pub run'
alias flutter-run-chrome='flutter run -d chrome'
alias flutter-run-chrome-verbose='flutter run -d chrome --verbose'
alias flutter-run-device-help='flutter run -h'
alias flutter-run-help='flutter pub run -h'
alias flutter-run-test-named='flutter pub run test --name='
alias flutter-run-test-skipped='flutter pub run test --run-skipped'
alias flutter-run-test-tagged='flutter pub run test --tags='
alias flutter-run-tests='flutter pub run test'
alias flutter-stable-channel='flutter channel stable'
alias flutter-test-help='flutter test --help'
alias flutter-unit-test='flutter test'
alias flutter-unit-test-help='flutter test --help'
alias flutter-unit-test-named='flutter test --name='
alias flutter-upgrade='flutter upgrade'
alias flutter-upgrade-help='flutter upgrade -h'
alias flutter-upgrade-verify='flutter upgrade --verify-only'
alias flutter-version='flutter --version'

############################################################################
# git aliases
############################################################################
alias checkout='git fetch --all; git checkout'
alias gst='git status' # NOTE: gst will conflict with some smalltalk command
alias git-add='git add -i'
alias git-branch-and-checkout='git checkout -b' # gcb -> create a branch from existing branch and checkout. helpful if working on a branch (e.g. master) and should be on another.
alias git-branch='git branch'
alias git-checkout='git checkout'
alias git-clone='git clone'
alias git-commit='git commit'
alias git-create-branch='git-branch-and-checkout' # redirects to alias git-branch-and-checkout
alias git-delete-other-branches='git branch | cut -c3- | grep -v "^master$" | xargs git branch -D'
alias git-diff-meld='git diff | meld'
alias git-fetch-merge='git pull'
alias git-fetch='git fetch'
alias git-list-all='git branch -a'
alias git-list-remotes='git branch -r'
alias git-merge-dev='git merge origin/develop'
alias git-merge='git merge'
alias git-pull='git pull'
alias git-remote='git remote get-url origin'
alias git-reset='git reset'
alias git-set-upstream='git branch --set-upstream'
alias git-status='git status'
alias git-unadd='git reset'
alias git-update='git pull origin develop'
alias git-upstreams='git fetch --all; git branch -vv'
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
# misc command aliases
############################################################################
# alias refresh='source ~/.bash_profile' # this does not work. see README.
# alias work='cd ~/workspace'                 # removed. use groovy script 'work' in workman project
# alias less='less -r'                        # raw control characters
alias .......='up6'
alias ......='up5'
alias .....='up4'
alias ....='up3'
alias ...='up2'
alias ..='up'
alias clr='clear'
alias filtered-aliases='alias | grep "$@"'
alias formatjson='pbpaste|json|pbcopy'
alias hist='history | grep -i'                # search history for a command
alias jless="json | less"                     # pipes json to less - see bash function json()
#alias mapitup='pbpaste | json | sed s/\"/\'/g | sed -E s/\'\(.*\)\':/\\1:/g | sed s/\{/\[/g | sed s/\}/\]/g | pbcopy'
alias path='echo -e ${PATH//:/\\n}'           # pretty path
alias prettypath='echo -e ${PATH//:/\\n}'     # pretty path
alias q='exit'
alias trail='tail -f'
alias underscoreit='pbpaste | sed s/\ /_/g  | tr -d "\n" | pbcopy'
alias up='cd ..'
alias up2='cd ../..'
alias up3='cd ../../..'
alias up4='cd ../../../..'
alias up5='cd ../../../../..'
alias up6='cd ../../../../../..'
alias whence='type -a'                        # where, of a sort
alias xless="xml | less"                      # pipes xml to less - see bash function xml()

############################################################################
# Software analysis
############################################################################
alias xray-commit-freq='git log --format=format: --name-only | egrep -v "^$" | sort | uniq -c | sort -r'
# alias xray-top-5='git log --format=format: --name-only | egrep -v "^$" | sort | uniq -c | sort -r | head -5' # removed in favor of following
alias xray-top-5='$xray-commit-freq | head -5'
alias xray-commit-freq-log='git log --format=format: --name-only | egrep -v "^$" | sort | uniq -c | sort -r > xray-commit-frequency.log'

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