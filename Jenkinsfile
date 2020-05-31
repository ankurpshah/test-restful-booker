def withDockerNetwork(Closure inner) {
  try {
    networkId = UUID.randomUUID().toString()
    sh "docker network create ${networkId}"
    inner.call(networkId)
  } finally {
    sh "docker network rm ${networkId}"
  }
}

pipeline {
  agent none

  stages {
    stage("Test restful-booker") {
      agent any

      steps {
        script {
          withDockerNetwork{ n ->
            docker.image('ankurpshah/restful-booker').withRun("--network ${n} --rm --name restful-booker -p 3001:3001") { c ->
              docker.image('postman/newman').inside("""
                --network ${n}
                -v ${PWD}/collection:/etc/postman
                -v ${PWD}/env:/etc/env
                -v  ${PWD}/report:/etc/report
                --rm 
              """) {
                sh "echo ${PWD}"
                sh "ls -al"
                sh "newman run /etc/postman/smoke.postman_collection.json -e /etc/env/docker.postman_environment.json -r junit --reporter-junit-export=/etc/report/Smoke-report.xml"
              }
            }
            docker.container('api-server').stop()
          }
        }
      }
    }
  }
}