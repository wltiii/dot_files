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

############################################################################
# git aliases
############################################################################
alias checkout='git fetch --all; git checkout'
alias gst='git status' # NOTE: gst will conflict with some smalltalk command

alias git-add='git add -i'
alias git-branch-and-checkout='git checkout -b' # gcb -> create a branch from existing branch and checkout. helpful if working on a branch (e.g. master) and should be on another.
alias git-branch='git branch'
alias git-checkout='git checkout'
alias git-commit='git commit'
alias git-create-branch='git-branch-and-checkout' # redirects to alias git-branch-and-checkout
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

# MyRepo aliases - requires MyRepos to be installed: https://myrepos.branchable.com/
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
alias xray-top-5='git log --format=format: --name-only | egrep -v "^$" | sort | uniq -c | sort -r | head -5'
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
