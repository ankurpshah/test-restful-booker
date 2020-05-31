// pipeline {

//   agent any

//   stages {
//     stage('docker-compose') {
//       steps {
//         sh "docker-compose up -d"
//       }
//     }
//   }
//   post {
//     always {
//       sh "docker-compose down || true"
//     }
//   }   
// }

node {
  stage 'Checkout'
  git url: 'https://github.com/ankurpshah/test-restful-booker.git'

  stage 'deploy'
  sh 'docker-compose up -d'
}