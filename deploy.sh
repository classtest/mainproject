#!/bin/bash

source zap.properties

buildNumber=$(curl -s https://jenkins.corp.ventivtech.com/jenkins/job/Alpha_develop/lastSuccessfulBuild/artifact/build/build-info.json | grep "buildInfo.env.BUILD_NUMBER" | sed 's/[^0-9]*//g')

echo "Deploying build $buildNumber to $ENV"

case $ENV in
Nightly | NIGHTLY | nightly)
    deployUrl="https://dockermanager-dev.corp.ventivtech.com/api/environment/development/rca-dev/app/alpha-nightly/develop/$buildNumber"
    buildInfo="http://atld-alphaweb01.int.vticloud.com:8082/Alpha/common/util/admin/buildInfo"
    ;;
QA_PRODUCT | qa_product | QA_Product | productqa)
    deployUrl="https://dockermanager-dev.corp.ventivtech.com/api/environment/development/rca-qa/app/alpha-qaproduct/develop/$buildNumber"
    buildInfo="http://atld-alphaqaweb01.int.vticloud.com:8082/Alpha/common/util/admin/buildInfo"
    ;;
QAA_FUTURE | QAA_Future | qaa_future | Future | future)
    deployUrl="https://dockermanager-dev.corp.ventivtech.com/api/environment/development/rca-qa/app/alpha-future/develop/$buildNumber"
    buildInfo="http://atld-alphaqaweb01.int.vticloud.com:8081/Alpha/common/util/admin/buildInfo"
    ;;
QAA | qaa | QA | qa)
    deployUrl="https://dockermanager-dev.corp.ventivtech.com/api/environment/development/rca-qa/app/alpha/develop/$buildNumber"
    buildInfo="http://atld-alphaqaweb01.int.vticloud.com:8080/Alpha/common/util/admin/buildInfo"
    ;;
QA_DBTEST)
    deployUrl="https://dockermanager-dev.corp.ventivtech.com/api/environment/development/rca-qa/app/alpha-qa-dbtesting/develop/$buildNumber"
    buildInfo="http://atld-alphaqaweb01.int.vticloud.com:8083/Alpha/common/util/admin/buildInfo"
    ;;
Pentest | pentest)
    deployUrl="https://dockermanager-uat.corp.ventivtech.com/api/environment/uat/alpha-demo/app/alpha-pentest/develop/$buildNumber"
    buildInfo="http://atls-rcadweb01.int.vticloud.com:8082/Alpha/common/util/admin/buildInfo"
    ;;
esac

curl -H "Content-Type: application/json"  -X POST -d '{}' -u dm_deployonly:n4bAkPbP $deployUrl

tries=0
maxtries=60

echo ''
until curl -s --connect-timeout 2 $buildInfo | grep -s "\"$buildNumber\""
do
        tries=$[tries+1]
        echo "Waiting for startup (try #$tries)"

        if [ "$tries" -eq "$maxtries" ] ; then
                echo "Server not started in time, bailing"
                #exit 1
                curl --request POST -u svnadmin:C0d3S4f3 "${JENKINS_URL}/job/${JOB_NAME}/lastBuild/stop"
        fi

        sleep 10
done

echo "Deployment Finished"
exit 0
