//pipeline {
//	agent {	node {
	node {
	GIT_COMMIT = sh(returnStdout: true, script: 'git rev-parse HEAD').trim()
   		currentBuild.displayName = "${GIT_COMMIT.substring(0, 8)}"
            //    currentBuild.description = "The best description."
             }
//environment {
//	GIT_COMMIT = sh(returnStdout: true, script: 'git rev-parse HEAD').trim()
//	BUILD_NUMBER = "2"
//	}
//  }
//}

//def commitSha() {
//    sh 'git rev-parse HEAD > commit'
//    def commit = readFile('commit').trim()
//    sh 'rm commit'
//    commit.substring(0, 8)
//	sh 'git log --oneline | head -1 | awk {'print $1'}'

//}
