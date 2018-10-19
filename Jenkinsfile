pipeline {
  agent any

  environment {
    CI = 'true'
  }

  stages {

    stages {
      stage('Build') {
        agent {
          docker {
            image 'johnpapa/angular-cli'
          }
        }

      steps {
        echo 'Building the angular project.'
        sh 'npm install'
        sh 'ng build'
      }
    }

    stage('Build image') {
      steps {

          echo 'Starting to build docker image'

          script {
              def customImage = docker.build("nginx-fe:${env.BUILD_ID}")
              customImage.push()
          }
      }
    }
  }
}
}