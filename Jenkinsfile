pipeline {
  agent {
    docker {
      image 'qmarketing/dind-docker-compose'
      args '-v /var/run/docker.sock:/var/run/docker.sock'
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
