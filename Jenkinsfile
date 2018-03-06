pipeline{
agent {node {label ''}}

 environment {
   GIT_COMMIT = sh(returnStdout: true, script: 'git rev-parse HEAD').trim()
 }

//    options {
//	buildDiscarder(logRotator(numToKeepStr:'10'))
//    }

 //stages
 //{
 //stage('Build'){
 //steps{
 //script{
 //echo "GIT COMMIT is: ${GIT_COMMIT}"
 //currentBuild.displayName = "Alpha_${GIT_COMMIT.substring(0, 8)}"
 //}
 //}
 //}
 //}

//node {
//   GIT_COMMIT = sh(returnStdout: true, script: 'git rev-parse HEAD').trim()
//   currentBuild.displayName = "${GIT_COMMIT.substring(0, 8)}"
//}
// Suppress automatic SCM triggering

options {
	buildDiscarder(logRotator(daysToKeepStr: '',numToKeepStr:'1'))
        //disableConcurrentBuilds()
        timestamps()
	}

stages
 {
 stage('Build'){
 steps{
 script{
 echo "GIT COMMIT is: ${GIT_COMMIT}"
 currentBuild.displayName = "Alpha_${GIT_COMMIT.substring(0, 8)}"
}
}
}
}
post {
        success {

office365ConnectorSend color: "00ff00", message: "Build Success - ${env.JOB_NAME} - Build #${env.BUILD_NUMBER} (Open: <${env.BUILD_URL}>\n) (Console: <${env.BUILD_URL}console>\n) (Changes: <${env.BUILD_URL}changes>)", status: 'Success', webhookUrl: 'https://outlook.office.com/webhook/0ddd5e7a-369c-4d0c-864c-5c70e740841c@732bb72b-3edd-4f6e-bb42-067f4dcffa63/JenkinsCI/844c8d41c7de4d7aae4bcec1ff6e2262/0c4b9b8a-c2ba-4b97-b3fd-74879df16998'
}
        failure {
office365ConnectorSend color: "ff0000", message: "Build Failure - ${env.JOB_NAME} - Build #${env.BUILD_NUMBER} (<${env.BUILD_URL}|Open> | <${env.BUILD_URL}console|Log> | <${env.BUILD_URL}changes|Changes>)", status: 'Failure', webhookUrl: 'https://outlook.office.com/webhook/0ddd5e7a-369c-4d0c-864c-5c70e740841c@732bb72b-3edd-4f6e-bb42-067f4dcffa63/JenkinsCI/844c8d41c7de4d7aae4bcec1ff6e2262/0c4b9b8a-c2ba-4b97-b3fd-74879df16998'

}
}

}
