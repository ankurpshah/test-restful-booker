pipeline {
  agent {
    docker {
      image 'qmarketing/dind-docker-compose:18.09.5'
      args '-v /var/run/docker.sock:/var/run/docker.sock -v report:/etc/report'
    }
  }
  stages {
    stage('Test') {
      steps {
        sh '''
          docker-compose up -d
          sleep 200
          docker-compose down
          pwd
          ls -al
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
