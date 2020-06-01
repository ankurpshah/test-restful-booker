pipeline {
  agent none

  stages {
    stage('Run restful-booker app') {
      agent {
        docker {
          image 'ankurpshah/restful-booker'
          args '-p 3001:3001 --name=restful-booker'
        }
      }
      steps {
        sh "echo 'Server Started'"
      }
    }
    stage('Run newman test') {
      agent {
        docker {
          image 'postman/newman'
          args '-v ${PWD}/collection:/etc/postman -v ${PWD}/env:/etc/env -v ${PWD}/report:/etc/report'
        }
      }

      steps {
        sh "newman run /etc/postman/smoke.postman_collection.json --environment=/etc/env/docker.postman_environment.json --reporters junit --reporter-junit-export=/etc/report/Smoke-report.xml"
      }
      
      post {
        success {
          sh "docker stop restful"
        }
      }
    }
  } 
}
