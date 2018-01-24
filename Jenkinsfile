pipeline{
agent {node {label ''}}

 //environment {
 //  GIT_COMMIT = sh(returnStdout: true, script: 'git rev-parse HEAD').trim()
 //}

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




}
