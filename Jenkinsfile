//pipeline {
//	agent {	node {
	node {
   		currentBuild.displayName = "testing_${commitSha()}"
            //    currentBuild.description = "The best description."
             }
//environment {
//	GIT_COMMIT = sh(returnStdout: true, script: 'git rev-parse HEAD').trim()
//	BUILD_NUMBER = "2"
//	}
//	}
//}

def commitSha() {
    sh 'git rev-parse HEAD > commit'
    def commit = readFile('commit').trim()
    sh 'rm commit'
    commit.substring(0, 8)
}
