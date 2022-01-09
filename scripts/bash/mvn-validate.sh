#!/usr/bin/env bash

# validates all repos are properly built

# USAGE:
#     edit the list of repos to be created at the bottom of this script.
#     Run command:
#         mvn-validate.sh

# TODO:
# 1) Navigate to client root directory (i.e. /home/worldwidewilly/workspace/medzero)
#    before making repo
# 2) Make repos a list and loop the call
# 3) Bypass making of repo if it already exists

clientHome="/home/worldwidewilly/workspace/medzero"

validate() {
    repo="$1"

    # change to repo directory
    cd $repo

    echo "#####################################################################"
    echo "Validating $repo located at $PWD"
    echo "#####################################################################"

    # run mvn clean
      mvn clean

    # reset directory to client home
    cd ..
    echo "There is no place like client home"
    echo $PWD
}

echo "client home is $clientHome"
cd $clientHome

validate com.medzero.api.example.client 
validate com.medzero.client.account 
validate com.medzero.client.auth 
validate com.medzero.client.cardaccount 
validate com.medzero.client.clickatell 
validate com.medzero.client.document 
validate com.medzero.client.loan 
validate com.medzero.client.member 
validate com.medzero.client.notification 
validate com.medzero.client.report 
validate com.medzero.client.statement 
validate com.medzero.client.twilio 
validate com.medzero.config.dk 
validate com.medzero.config.prod 
validate com.medzero.config.qa 
validate com.medzero.config.test 
# validate com.medzero.deployment.lab ## there is no POM in this directory
validate com.medzero.deployment.sandbox 
validate com.medzero.devops.utils 
validate com.medzero.gateway.insights 
validate com.medzero.gateway.member 
validate com.medzero.gateway.mobile 
validate com.medzero.gateway.testharness 
validate com.medzero.mobile.ionic 
validate com.medzero.pubsub.google 
validate com.medzero.service.account 
validate com.medzero.service.auth 
validate com.medzero.service.cardaccount 
validate com.medzero.service.cardaccount_old 
validate com.medzero.service.config 
validate com.medzero.service.discovery 
validate com.medzero.service.document 
validate com.medzero.service.loan 
validate com.medzero.service.member 
validate com.medzero.service.notification 
validate com.medzero.service.proxy 
validate com.medzero.service.report 
validate com.medzero.service.statement 
validate com.medzero.service.template 
validate com.medzero.service.zipkin 
validate com.medzero.test.util 
validate com.medzero.web.employer 
validate com.medzero.web.insights 
validate com.medzero.web.member 
validate com.medzero.web.tpa 
validate com.medzero.web.www 
validate com.medzero.worker.card.authorizations 
validate com.medzero.worker.pubsub 
validate maven-release-sandbox 
