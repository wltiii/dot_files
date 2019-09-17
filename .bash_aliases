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

############################################################################
# git aliases
############################################################################
alias ga='git add -i'
alias gb='git branch'
alias gba='git branch -a'
alias gc='git-commit'
alias gcko='git checkout'
alias gd='git diff | meld'
alias gf='git fetch'
alias gfm='git pull'
alias gm='git merge'
alias gpl='git pull'
alias unadd='git reset'
alias gst='git status' # NOTE: gst will conflict with some smalltalk command
alias branch='git checkout -b'
alias git-upstreams='git fetch --all; git branch -vv'
alias git-remote='git remote get-url origin'
alias checkout='git fetch --all; git checkout'
alias merge-dev='git merge origin/develop'
alias git-update='git pull origin develop'
############################################################################
# misc command aliases
############################################################################
# alias refresh='source ~/.bash_profile' # this does not work. see README.
alias clr='clear'
alias trail='tail -f'
alias q='exit'
alias up='cd ..'
alias up2='cd ../..'
alias up3='cd ../../..'
alias up4='cd ../../../..'
alias up5='cd ../../../../..'
alias up6='cd ../../../../../..'
alias ..='up'
alias ...='up2'
alias ....='up3'
alias .....='up4'
alias ......='up5'
alias .......='up6'
# removed. use groovy script 'work' in workman project
# alias work='cd ~/workspace'
alias whence='type -a'                        # where, of a sort
# alias less='less -r'                        # raw control characters
alias hist='history | grep -i'                # search history for a command
alias path='echo -e ${PATH//:/\\n}'           # pretty path
alias prettypath='echo -e ${PATH//:/\\n}'     # pretty path

############################################################################
# Software analysis
############################################################################
alias commit-freq='git log --format=format: --name-only | egrep -v "^$" | sort | uniq -c | sort -r | head -5'
alias commit-freq-log='git log --format=format: --name-only | egrep -v "^$" | sort | uniq -c | sort -r > commit_frequency.log'

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
