pipeline {
    agent { node { label ' ' } }

    environment {
        GIT_COMMIT = sh(returnStdout: true, script: 'git rev-parse HEAD').trim()
    }

    options {
	buildDiscarder(logRotator(numToKeepStr:'10'))
	}

stages {
    stage('Build') {
      steps {
	echo 'Testing the jenkins'
   }
  }
 }	

}

node {
   GIT_COMMIT = sh(returnStdout: true, script: 'git rev-parse HEAD').trim()
   currentBuild.displayName = "${GIT_COMMIT.substring(0, 8)}"
}
