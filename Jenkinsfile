pipeline {
  agent {
    docker {
      image 'jonpraw/jenkins-dind-slave'
      args '-t '
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
