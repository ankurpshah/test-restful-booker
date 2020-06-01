pipeline {
  agent {
    docker {
      image 'ankurpshah/newman-with-htmlextra'
      args "-t -v /etc/newman/collection:/etc/postman -v /etc/newman/env:/etc/env -v /etc/newman/report:/etc/report"
    }
  }
  stages {
    stage('Test') {
      steps {
        sh '/usr/local/bin/newman run /etc/postman/smoke.postman_collection.json -e /etc/env/docker.postman_environment.json -r htmlextra,junit --reporter-htmlextra-export /etc/report/smoke.html --reporter-htmlextra-title Smoke --reporter-junit-export /etc/report/Smoke-report.xml'
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
