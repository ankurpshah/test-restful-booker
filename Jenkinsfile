pipeline {
  agent {
    docker {
      image 'ankurpshah/newman-with-htmlextra'
      args '-t'
    }
  }
  stages {
    stage('Test') {
      steps {
        sh 'newman run collection/smoke.postman_collection.json --environment env/docker.postman_environment.json --reporters htmlextra,junit --reporter-htmlextra-export report/smoke.html --reporter-htmlextra-title "Smoke Test" --reporter-junit-export report/Smoke-report.xml'
      }
    }
  }
  post {
    always {
      archiveArtifacts artifacts: 'report/smoke.html', fingerprint: true
      junit 'report/*.xml'
    }
  }
}
