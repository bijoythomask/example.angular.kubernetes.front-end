pipeline {
  agent {
    docker {
      image 'johnpapa/angular-cli'
      args '-p 80:3000'
    }

  }

  environment {
        CI = 'true'
  }

  stages {
    stage('Build') {
      steps {
        sh 'ng build'
      }
    }
  }
}