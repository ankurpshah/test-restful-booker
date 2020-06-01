pipeline {
  agent {
    docker {
      image 'qmarketing/dind-docker-compose'
    }
  }
  stages {
    stage('Test') {
      steps {
        sh "docker-compose -d up"
      }
    }
  } 
}
