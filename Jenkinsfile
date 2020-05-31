pipeline {

  agent any

  stages {
    stage('docker-compose') {
      dir('scripts')
      steps {
        sh "docker-compose up -d"
      }
    }
  }
  post {
    always {
      sh "docker-compose down || true"
    }
  }   
}