#!/usr/bin/env bash

# creates a new local and remote branch from the story id & description

# see the following links for further help
# https://stackoverflow.com/questions/37410262/how-to-create-a-gitlab-merge-request-via-command-line
# https://docs.gitlab.com/ce/user/project/merge_requests/#git-push-options
# https://stackoverflow.com/questions/51811227/how-to-create-a-local-repository-and-remote-repository-in-gitlab-using-command-l
# https://stackoverflow.com/questions/33101962/how-to-create-a-new-gitlab-repo-from-my-existing-local-git-repo-using-cli

# TODO need a better way to handle origin branches. i.e. if one does not exist, use the other
# and be able to pass in a 'develop' branch name
develop_branch="develop"
echo $develop_branch
master_branch="master"
echo $master_branch

# TODO build branch name - right now, use make-branch_name and pass that in
if [ "$#" -lt 1 -o "$#" -gt 2 ]; then
    echo "Illegal number of parameters"
    exit
fi

# i tend to forget how to do command substitution using vars that contain space. see:
# https://stackoverflow.com/a/54438246/471133
if [ "$#" -eq 2 ]; then
    command=(make-branch-name "$1" "$2")
elif [ "$#" -eq 1 ]; then
    command=(make-branch-name "$1")
fi

# make the branch name
branch_name=$("${command[@]}")

# checkout the develop branch
# TODO attempt to checkout develop first, then master, set working-branch to that which is
# checked out. Handling the pathspec issue below should do it
# TODO handle the following:
# ? git checkout zzzz
# error: pathspec 'zzzz' did not match any file(s) known to git.
git checkout $develop_branch

# update the the branch
git pull

# branch working directory using the new branch name and checkout
echo "branch_name is [${branch_name}]"
git branch $branch_name
git checkout $branch_name

# # commit the project - NOTE: this depends upon my gc function
gc "story initialized"

# # push to origin
# # NOTE: if this does not work, see: https://stackoverflow.com/a/6089415/471133
# # git push origin --set-upstream origin $branch_name
git push -u origin $branch_name
