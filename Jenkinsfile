pipeline {
//    agent { node {
//	}
    options {
	buildDiscarder(logRotator(numToKeepStr:'10'))
	}
//}
}
node {
   GIT_COMMIT = sh(returnStdout: true, script: 'git rev-parse HEAD').trim()
   currentBuild.displayName = "${GIT_COMMIT.substring(0, 8)}"
}
