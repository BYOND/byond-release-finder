pipeline {
  agent {
    kubernetes {
      yamlFile 'agent-pod.yaml'
    }
  }

  triggers {
    cron('@hourly')
  }

  stages {
    stage('Discover releases') {
      when {
        branch 'master'
      }
      steps {
        container('bash') {
          script {
            status = sh(script: './discover-releases.sh', returnStatus: true)
            if (status == 1) {
              currentBuild.result = 'SUCCESS'
            } else if (status == 0) {
              currentBuild.result = 'NOT_BUILT'
            } else {
              currentBuild.result = 'FAILURE'
            }
          }
        }
      }
    }
  }
}
