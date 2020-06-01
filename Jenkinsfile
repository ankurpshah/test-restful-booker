pipeline {
  agent {
    docker {
      image 'jonpraw/jenkins-dind-slave'
      ttyEnabled True 
      privileged True
      args '${computer.jnlpmac} ${computer.name}'
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
