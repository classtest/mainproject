//pipeline {

   // agent { node { label 'jdk8 && git && npm && yarn' } }
//    options {
//        buildDiscarder(logRotator(numToKeepStr:'20'))
//        disableConcurrentBuilds()
//        timestamps()
//    }

//	stages {
//        stage("Build") {
//            steps {
//                script {
//                    currentBuild.displayName = "TestJob-b${BUILD_NUMBER}"
                    //currentBuild.description = "This job is to test b${BUILD_NUMBER}-${GIT_COMMIT,length=8}."
//                }
//	     }
//	  }
//	}
//}

pipeline {
    stages {
        stage("Build"){
            steps {
                script {
                    currentBuild.displayName = "The name."
                    currentBuild.description = "The best description."
                }
             
            }
        }
    }
}
