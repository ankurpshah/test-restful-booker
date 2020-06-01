pipeline {
  agent {
    docker {
      image 'ankurpshah/newman-with-htmlextra'
      args "-t -v ${PWD}/collection:/etc/postman -v ${PWD}/env:/etc/env -v ${PWD}/report:/etc/report --entrypoint=''"
    }
  }
  stages {
    stage('Test') {
      steps {
        sh 'newman run /etc/postman/smoke.postman_collection.json -e /etc/env/docker.postman_environment.json -r htmlextra,junit --reporter-htmlextra-export=/etc/report/smoke.html --reporter-htmlextra-title "Smoke Test" --reporter-junit-export=/etc/report/Smoke-report.xml'
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
