#!/bin/bash

# creates a new local and remote branch from the story id & description

# see the following links for further help
# https://stackoverflow.com/questions/37410262/how-to-create-a-gitlab-merge-request-via-command-line
# https://docs.gitlab.com/ce/user/project/merge_requests/#git-push-options
# https://stackoverflow.com/questions/51811227/how-to-create-a-local-repository-and-remote-repository-in-gitlab-using-command-l
# https://stackoverflow.com/questions/33101962/how-to-create-a-new-gitlab-repo-from-my-existing-local-git-repo-using-cli

#TODO get id and name from args
id="ENOP-895"
echo $id
name="Switch Ionic app to use Gexa API proxy"
echo $name
develop_branch="develop"
echo $develop_branch
master_branch="master"
echo $master_branch
# TODO build branch name - right now, use make-branch_name and pass that in
echo $1
branch_name="$1"
echo $branch_name
# TODO attempt to checkout develop first, then master, set working-branch to that which is checked out
# TODO handle the following:
# ? git checkout zzzz
# error: pathspec 'zzzz' did not match any file(s) known to git.
# NOTE: should probably have these roots configurable, maybe not allow fallback
git checkout $develop_branch
git pull
# branch working directory and checkout
git checkout -b $branch_name
# commit the project - NOTE: this depends upon my function
gc "story initialized"
# push to origin
# NOTE: if this does not work, see: https://stackoverflow.com/a/6089415/471133
# git push origin --set-upstream origin $branch_name
git push -u origin $branch_name
