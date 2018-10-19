pipeline {
  agent {
    docker {
      image 'node:8-alpine'
      args '-p 80:3000'
    }

  }

  environment {
        CI = 'true'
  }

  stages {
    stage('Build') {
      steps {
        sh 'npm install'
      }
    }
  }
}