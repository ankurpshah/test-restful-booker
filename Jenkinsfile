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
        sh 'newman run collection/smoke.postman_collection.json --environment env/docker.postman_environment.json --reporters htmlextra,junit --reporter-htmlextra-export report/html/smoke.html --reporter-htmlextra-title "Smoke Test" --reporter-junit-export report/junit/smoke-report.xml'
      }
    }
  }
  post {
    success {
      junit 'report/junit/*.xml'
      publishHTML([allowMissing: true, alwaysLinkToLastBuild: false, keepAll: true, reportDir: 'report/html', reportFiles: 'smoke.html', reportName: 'API Test Report', reportTitles: ''])
    }
  }
}
