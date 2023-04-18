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
# Removes old revisions of snaps
########################################################################
cleanup-snap() {
# This script comes from:
#   https://itsfoss.com/clean-snap-packages/
#
#     set -eu
#     snap list --all | awk '/disabled/{print $1, $3}' |
#         while read snapname revision; do
#             snap remove "$snapname" --revision="$revision"
#         done
#
# Removes old revisions of snaps
# CLOSE ALL SNAPS BEFORE RUNNING THIS
#
# I have yet to get this to run, therefore  I run `snap list --all | grep disabled`, then remove manually.
#
# Perhaps the script could be modified to capture the list from the following grep:
#   disabled='snap list --all | grep disabled'
#
# then:
#   for i in "${disabled}"; do
#       awk '${print $1, $3}'
#       snapname=$(echo $i | awk 'print $1')
#       revision=$(echo $i | awk 'print $3')
#       echo "snapname is $snapname"
#       echo "revision is revision"
#       sudo snap remove "$snapname" --revision="$revision"
#   done
#
# For example
#
# ? snap list --all | grep disabled
# chromium                              101.0.4951.54               1985   latest/stable    canonical*         disabled
# core                                  16-2.54.4                   12834  latest/stable    canonical*         core,disabled
# core20                                20220329                    1434   latest/stable    canonical*         base,disabled
# google-cloud-sdk                      386.0.0                     241    latest/stable    google-cloud-sdk*  disabled,classic
# gtk-common-themes                     0.1-59-g7bca6ae             1519   latest/stable/…  canonical*         disabled
# slack                                 4.25.1                      61     latest/stable    slack*             disabled
#
# ? sudo snap remove chromium --revision=1985
#
# Note: that the name is the first column in the grep and the revision is the third.

    echo 'Use the following commands to remove old snaps.'
    echo '  Note: the snap-name is the first column and the '
    echo '  snap-revision is the third column of the grep results.'
    echo ''
    echo 'To list the disabled snaps, use'
    echo '`snap list --all | grep disabled`'
    echo ''
    echo 'To remove a revision, use'
    echo '`sudo snap remove [snap-name] --revision=[snap-revision]`'
    echo ''
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
# Generates Flutter coverage statistics and opens results in browser
#
# USAGE: run from project root
########################################################################
flutter-coverage() {

    # TODO consider using https://pub.dev/packages/pcov
    case "$OSTYPE" in
      solaris*) echo "SOLARIS" ;;
      darwin*)
            echo "MAC - flutter-coverage"
            # run flutter coverage (lcov)
            flutter test --coverage
            # remove generated files '.g.' and .freezed.'
            lcov --remove coverage/lcov.info '**/*.freezed.dart' '**/*.g.dart'  -o coverage/lcov.info
            # generate html
            genhtml coverage/lcov.info -o coverage/html
            # launch firefox browser
            open -a /Applications/Firefox.app coverage/html/index.html
            ;;
      linux*)
            echo "LINUX - flutter-coverage"
            # run flutter coverage (lcov)
            flutter test --coverage
            # remove generated files '.g.' and .freezed.'
            lcov --remove coverage/lcov.info '**/*.freezed.dart' '**/*.g.dart'  -o coverage/lcov.info
            # generate html
            genhtml coverage/lcov.info -o coverage/html
            # launch firefox browser
            firefox coverage/html/index.html
            ;;
      bsd*)     echo "BSD" ;;
      msys*)    echo "WINDOWS" ;;
      cygwin*)  echo "ALSO WINDOWS" ;;
      *)        echo "unknown: $OSTYPE" ;;
    esac

    # run flutter coverage (lcov)
    # flutter test --coverage
    # generate html
    # genhtml coverage/lcov.info -o coverage/html
    # launch firefox browser
    # firefox coverage/html/index.html
}
########################################################################
# fvm-flutter-update()
# installs latest stable flutter release and sets as global
########################################################################
fvm-flutter-update() {
    stable_version=`fvm-list-stable-releases`

    # stable_version='Nov 23 22  │ 3.3.9             stable'
    latest_version=`grep -o "[0-9]{1,2}\.[0-9]{1,2}\.[0-9]{1,2}" <<<$stable_version`

    echo
    echo '****************************************'
    echo "Installing and setting global version to $latest_version"
    echo '****************************************'
    echo
    fvm install $latest_version
    fvm global $latest_version

    echo
    echo '****************************************'
    echo 'installed Flutter versions are:'
    fvm-list
    echo '****************************************'

    echo
    echo '****************************************'
    echo 'current Dart version:'
    dart --version
    fvm-list
    echo '****************************************'

    echo
    echo 'use `fvm-remove [old-version-number]` to remove unnecessary versions'
    echo 'use `fvm-use [version-number]` to use a specific version within a project'
}
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
# to-dashed-string 'a string'
########################################################################
to-dashed-string() {
    echo $1 | sed 's/ /-/g'
}
########################################################################
# to-dashed-lowercase-string 'a string'
#   returns A String
########################################################################
to-dashed-lowercase-string() {
    echo $1 | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g'
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
# git-commit-ticket
# uses git-ticket to prepend the commit message with
# the ticket name
# Ken Williams at Windlogics shared this code
########################################################################
git-commit-ticket() {
  x=$(git-ticket); git commit -a -v -m "$x$1"
}

########################################################################
# commit-with-tag tag="my tag" message="my message"
########################################################################
commit-with-tag() {

ARGUMENT_LIST=(
  "message"
  "tag"
)


# read arguments
opts=$(getopt \
  --longoptions "$(printf "%s:," "${ARGUMENT_LIST[@]}")" \
  --name "$(basename "$0")" \
  --options "" \
  -- "$@"
)

eval set --$opts

while [[ $# -gt 0 ]]; do
  case "$1" in
    --message)
      argOne=$2
      shift 2
      ;;

    --tag)
      argTwo=$2
      shift 2
      ;;

    --arg-three)
      argThree=$2
      shift 2
      ;;

    *)
      break
      ;;
  esac
done




    while getopts ":t:m:" opt; do
      case $opt in

        t) arg_1="$OPTARG"
        ;;
        m) p_out="$OPTARG"
        ;;
        \?) echo "Invalid option -$OPTARG" >&2
        exit 1
        ;;
      esac

      case $OPTARG in
        -*) echo "Option $opt needs a valid argument"
        exit 1
        ;;
      esac
    done

#    git commit "$2" && git tag "$1"
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
