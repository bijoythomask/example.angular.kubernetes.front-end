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
        sh 'npm install'
        sh 'ng build'
      }
    }
    stage('Package') {
      agent none
      steps {
        sh 'docker build .'
      }
    }
  }
}