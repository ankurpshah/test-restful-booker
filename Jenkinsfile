pipeline {
  agent {
    docker {
      image 'qmarketing/dind-docker-compose:18.09.5'
      args '-v /var/run/docker.sock:/var/run/docker.sock'
    }
  }
  stages {
    stage('Test') {
      steps {
        sh "docker-compose up -d"
        sh "sleep 20"
        sh "docker-compose down"
      }
    }
  } 
}
