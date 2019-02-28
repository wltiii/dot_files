########################################################################
# find partition name for a given filename
########################################################################
findpart() { [ -e "$1" ] && df -P "$1"  | awk '/^\/dev/ {print $1}' || echo "$1 not found"; }

########################################################################
# copy-to-branch stashes current changes, checks out branch and applies
# the changes
########################################################################
copy-to-branch() {
  git stash
  git checkout $1
  git stash pop
}
########################################################################
# Matthew's Git Bash Prompt
########################################################################

# TODO - this does not seem to work right. Put it into a script and work on it.
# Ideally, if it is not git controlled at all, the prompt should be an altogether different
# color. It seems, too, that different colors would be nice depending on git state. That
# does not seem to happen.

function parse_git_branch {
  git rev-parse --git-dir &> /dev/null
  git_status="$(git status 2> /dev/null)"
  branch_pattern="^# On branch ([^${IFS}]*)"
  remote_pattern="# Your branch is (.*) '"
  diverge_pattern="# Your branch and (.*) have diverged"

## TODO the original had the second } after git_status, but this seems really wrong
##  if [[ ! ${git_status}} =~ "working directory clean" ]]; then

  if [[ ! ${git_status} =~ "working directory clean" ]]; then
    state="${RED}⚡"
  fi
  # add an else if or two here if you want to get more specific
  if [[ ${git_status} =~ ${remote_pattern} ]]; then
    if [[ ${BASH_REMATCH[1]} == "ahead of" ]]; then
      remote="${YELLOW}↑"
    else
      remote="${YELLOW}↓"
    fi
  fi
  if [[ ${git_status} =~ ${diverge_pattern} ]]; then
    remote="${YELLOW}↕"
  fi
  if [[ ${git_status} =~ ${branch_pattern} ]]; then
    branch=${BASH_REMATCH[1]}
    echo " (${branch})${remote}${state}"
  fi
}

function git_dirty_flag {
  git status 2> /dev/null | grep -c : | awk '{if ($1 > 0) print "⚡"}'
}

function prompt_func() {
    previous_return_value=$?;
    #prompt="${TITLEBAR}$LIGHT_GRAY[$RED\w$GREEN$(__git_ps1)$YELLOW$(git_dirty_flag)$LIGHT_GRAY]$COLOR_NONE "
    #The lowercase w is the full current working directory
    #prompt="${TITLEBAR}${BLUE}[${RED}\w${GREEN}$(parse_git_branch)${BLUE}]${COLOR_NONE}"
    # my version of the above line
    # prompt="${TITLEBAR}${LIGHT_GRAY}[${RED}\w${GREEN}$(parse_git_branch)${LIGHT_GRAY}]${COLOR_NONE}"


    #Capital W is just the trailing part of the current working directory
    prompt="${TITLEBAR}${BLUE}[${RED}\W${GREEN}$(parse_git_branch)${BLUE}]${COLOR_NONE}"
          #${LIGHT_GRAY}${RED}\w\${GREEN}${LIGHT_GRAY}${COLOR_NONE}${RED}?${COLOR_NONE}

    if [[ $previous_return_value -eq 0 ]]; then
          PS1="${prompt}➔ "
    else
        PS1="${prompt}${RED}?${COLOR_NONE} "
    fi
}

PROMPT_COMMAND=prompt_func
########################################################################
# END - Matthew's Git Bash Prompt
########################################################################
