echo "installing  - installing functions"
########################################################################
# aliases shows all aliases with an optional filter pattern
########################################################################
aliases() {
	if [ -n "$1" ]; then
		alias | grep "$@"
	else
		alias
	fi
}
########################################################################
# parses input using groovy JsonSlurper
########################################################################
json() {
  if [ "$#" -eq 1 ]; then
    groovyclient -e "println new groovy.json.JsonSlurper().parse(System.in).$@"
  else
    groovyclient -e "println groovy.json.JsonOutput.prettyPrint(System.in.text)"
  fi
}
########################################################################
# parses input using groovy XmlSlurper
########################################################################
xml() {
  if [ "$#" -eq 1 ]; then
    xmllint -format - >/tmp/xml.xml
    groovyclient -e "println new groovy.util.XmlSlurper().parse(new File('/tmp/xml.xml')).$@"
  else
    xmllint -format -
  fi
}
########################################################################
# find partition name for a given filename
# see: https://www.cyberciti.biz/faq/linux-unix-command-findout-on-which-partition-file-directory-exits/
########################################################################
findpart() { [ -e "$1" ] && df -P "$1"  | awk '/^\/dev/ {print $1}' || echo "$1 not found"; }

########################################################################
# flutter-create-null-safe(project-name)
########################################################################
flutter-create-null-safe() {
    flutter create $1
    cd $1
    dart migrate --apply-changes
    work --save $1
    idea .
}
########################################################################
# git-apply-changes-to (target-branch)
#
# applies changes made to a branch erroneously (i.e. not the desired
# branch) to the desired branch (target-branch) and reverts the
# erroneous branch back to HEAD
########################################################################
git-apply-changes-to() {
  # Fetch all remotes
  git fetch --all
  # show sha1 and commit subject line for each head,
  # along with relationship to upstream branch,
  # the path of the linked worktree (if any)
  # and the name of the upstream branch
  git branch -vv
  # save current state and revert to HEAD commit
  git stash
  # switch to target-branch
  git checkout $1
  # apply the stashed changes to target-branch
  git stash pop
}

########################################################################
# git-ticket
# parses the ticket name from the branch
# Ken Williams at Windlogics shared this code
########################################################################
git-ticket() {
  # TODO handle non existent branches
#  git rev-parse --abbrev-ref HEAD | perl -ne 'print m{(?:^|/)([A-Z]+-\d+)} ? qq{$1 } : q{}'
  git rev-parse --abbrev-ref HEAD | perl -ne 'print m{(?:^)([\w]+-\d+)} ? uc(qq{\[$1\] }) : q{}'
}

########################################################################
# git-commit
# uses git-ticket to prepend the commit message with
# the ticket name
# Ken Williams at Windlogics shared this code
########################################################################
git-commit-ticket() {
  x=$(git-ticket); git commit -a -v -m "$x$1"
}

########################################################################
# merge-branch-to-master-and-delete
# merges the branch to master and deletes the branch
########################################################################
merge-branch-to-master-and-delete ()
{
    FEATURE_BRANCH=`git rev-parse --abbrev-ref HEAD`;
    # checkout master
    git checkout master;
    # update master with latest from remote
    git pull;
    # merge branch
    git merge $FEATURE_BRANCH;
    git push;
    git push origin --delete $FEATURE_BRANCH;
    git remote prune origin;
    git branch | cut -c3- | egrep --color=auto -v "^master$" | xargs git branch -D
}
########################################################################
# merge-branch-to-main-and-delete
# merges the branch to main and deletes the branch
########################################################################
merge-branch-to-main-and-delete ()
{
    FEATURE_BRANCH=`git rev-parse --abbrev-ref HEAD`;
    # checkout main
    git checkout main;
    # update main with latest from remote
    git pull;
    # merge branch
    git merge $FEATURE_BRANCH;
    git push;
    git push origin --delete $FEATURE_BRANCH;
    git remote prune origin;
    git branch | cut -c3- | egrep --color=auto -v "^main$" | xargs git branch -D
}
########################################################################
# safe-merge-master-into
# merges latest master into branch safely (i.e. nothing to commit)
########################################################################
safe-merge-master-into ()
{
    # make sure all changes are committed
    if ! test -n "`git status | grep "nothing to commit"`"; then
        echo "Please commit your changes first.";
        return 1;
    fi;
    # get name of branch
    FEATURE_BRANCH=`git rev-parse --abbrev-ref HEAD`;
    # checkout master
    git checkout master;
    # update master with latest from remote
    git pull;
    # checkout branch
    git checkout $FEATURE_BRANCH;
    # merge master into branch
    git merge -m "merge with master" master
}
########################################################################
# merge-with-main
# merges latest main into branch safely (i.e. nothing to commit)
########################################################################
safe-merge-main-into ()
{
    # make sure all changes are committed
    if ! test -n "`git status | grep "nothing to commit"`"; then
        echo "Please commit your changes first.";
        return 1;
    fi;
    # get name of branch
    FEATURE_BRANCH=`git rev-parse --abbrev-ref HEAD`;
    # checkout main
    git checkout main;
    # update main with latest from remote
    git pull;
    # checkout branch
    git checkout $FEATURE_BRANCH;
    # merge main into branch
    git merge -m "merge with main" main
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