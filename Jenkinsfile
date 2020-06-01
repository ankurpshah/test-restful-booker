pipeline {
  agent {
    docker {
      image 'qmarketing/dind-docker-compose:18.09.5'
      args '-v /var/run/docker.sock:/var/run/docker.sock -v ${PWD}/report:/etc/report'
    }
  }
  stages {
    stage('Test') {
      steps {
        sh '''
          docker-compose up -d
          sleep 20
          docker-compose down
        '''
      }
    }
  }
  post {
    success {
      archiveArtifacts artifacts: 'report/smoke.html', fingerprint: true
      junit 'report/*.xml'
    }
  }
}
