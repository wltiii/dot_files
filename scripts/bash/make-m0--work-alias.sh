#!/usr/bin/env bash

# creates workman aliases for client projects


# NOTE: this does not work!!!!!!!!!!!!!!! it breaks calling work

# USAGE:
#     edit the list of repos to be created at the bottom of this script.
#     Run command:
#         make-m0-work-alias.sh


make-alias() {
    repo="$1"

    echo $repo

    if [[ $repo =~ $regex ]]
    then
        name="${BASH_REMATCH[1]}"
        echo "${name}"    # concatenate strings
        name="${name}"    # same thing stored in a variable
    else
        echo "$f doesn't match" >&2 # this could get noisy if there are a lot of non-matching files
    fi

    cd $repo
    echo "navigated to $PWD"
      work --save $name
    cd ..
    echo "returned to $PWD"
}

clientHome="/home/worldwidewilly/workspace/medzero"
cd $clientHome

regex="^com.medzero.[a-z]+.([a-z]*)$"

# make-alias com.medzero.deployment.lab ## there is no POM in this directory /home/worldwidewilly/workspace/medzero/com.medzero.deployment.lab
#make-alias com.medzero.gateway.insights
#make-alias com.medzero.gateway.mobile
#make-alias com.medzero.mobile.ionic
#make-alias com.medzero.service.account
#make-alias com.medzero.service.auth
#make-alias com.medzero.service.config
#make-alias com.medzero.service.document
#make-alias com.medzero.service.loan
#make-alias com.medzero.service.member
#make-alias com.medzero.service.notification
#make-alias com.medzero.service.report
#make-alias com.medzero.service.statement
# make-alias com.medzero.web.insights ## do by hand. did not want to monkey with duplicate.

for i in `l`
  do make-alias $i
done
