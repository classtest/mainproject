pipeline {
	agent {	node {
   		currentBuild.displayName = "${BUILD_NUMBER}_${GIT_BRANCH}_${GIT_REVISION}"
            //    currentBuild.description = "The best description."
             }
environment {
	GIT_COMMIT = sh(returnStdout: true, script: 'git rev-parse HEAD').trim()
	}
}
