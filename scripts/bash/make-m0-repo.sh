#!/usr/bin/env bash

# creates a repo directory, pulls project and creates git config file

# USAGE:
#     edit the list of repos to be created at the bottom of this script.
#     Run command:
#         make-m0-repo.sh <password>

# TODO:
# 1) Navigate to client root directory (i.e. /home/worldwidewilly/workspace/medzero)
#    before making repo
# 2) Make repos a list and loop the call
# 3) Bypass making of repo if it already exists
# 4) add step to create workman alias

makeRepo() {
    repo="$1"
    password="$2"

    if [ ! -d "$repo" ]; then
      echo "##################################"
      echo "Making $repo"
      echo "##################################"

      # clone the project with user/password

      git clone https://World_Wide_Willy:$password@bitbucket.org/mz-2021/$repo.git
      # reset the remote to remove user/password
      cd $repo
      git remote set-url origin https://World_Wide_Willy@bitbucket.org/mz-2021/$repo.git

      # create config file
      echo "[user]
              name = bill turner
              email = bill@medzero.com" > .gitconfig

      # back to root
      cd ..
    else
      echo "##################################"
      echo "Directory $repo exists - bypassing"
      echo "##################################"
    fi


}

password="$1"

makeRepo com.medzero.api.example.client  $password
makeRepo com.medzero.client.account  $password
makeRepo com.medzero.client.auth  $password
makeRepo com.medzero.client.cardaccount  $password
makeRepo com.medzero.client.clickatell  $password
makeRepo com.medzero.client.document  $password
makeRepo com.medzero.client.loan  $password
makeRepo com.medzero.client.member  $password
makeRepo com.medzero.client.notification  $password
makeRepo com.medzero.client.report  $password
makeRepo com.medzero.client.statement  $password
makeRepo com.medzero.client.twilio  $password
makeRepo com.medzero.config.dk  $password
makeRepo com.medzero.config.prod  $password
makeRepo com.medzero.config.qa  $password
makeRepo com.medzero.config.test  $password
makeRepo com.medzero.deployment.lab  $password
makeRepo com.medzero.deployment.sandbox  $password
makeRepo com.medzero.devops.utils  $password
makeRepo com.medzero.gateway.insights  $password
makeRepo com.medzero.gateway.member  $password
makeRepo com.medzero.gateway.mobile  $password
makeRepo com.medzero.gateway.testharness  $password
makeRepo com.medzero.mobile.ionic  $password
makeRepo com.medzero.pubsub.google  $password
makeRepo com.medzero.service.account  $password
makeRepo com.medzero.service.auth  $password
makeRepo com.medzero.service.cardaccount  $password
makeRepo com.medzero.service.cardaccount_old  $password
makeRepo com.medzero.service.config  $password
makeRepo com.medzero.service.discovery  $password
makeRepo com.medzero.service.document  $password
makeRepo com.medzero.service.loan  $password
makeRepo com.medzero.service.member  $password
makeRepo com.medzero.service.notification  $password
makeRepo com.medzero.service.proxy  $password
makeRepo com.medzero.service.report  $password
makeRepo com.medzero.service.statement  $password
makeRepo com.medzero.service.template  $password
makeRepo com.medzero.service.zipkin  $password
makeRepo com.medzero.test.util  $password
makeRepo com.medzero.web.employer  $password
makeRepo com.medzero.web.insights  $password
makeRepo com.medzero.web.member  $password
makeRepo com.medzero.web.tpa  $password
makeRepo com.medzero.web.www  $password
makeRepo com.medzero.worker.card.authorizations  $password
makeRepo com.medzero.worker.pubsub  $password
makeRepo maven-release-sandbox  $password
