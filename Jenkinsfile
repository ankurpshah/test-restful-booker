pipeline {
  agent {
    docker {
      image 'jensbodal/dind-docker-compose-aws-terraform'
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
