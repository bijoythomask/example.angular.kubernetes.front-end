pipeline {
  agent any
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
        stash(includes: 'dist/**/*', name: 'angular-dist')
      }
    }
    stage('Build image') {
      steps {
        unstash 'angular-dist'
        echo 'Starting to build docker image'
        script {
          def customImage = docker.build("nginx-fe:${env.BUILD_ID}")
        }

      }
    }
    stage('Deploy') {
      steps {
        sh 'kubectl apply -f front-end\\front-end.deployment.yaml'
        sh 'kubectl apply -f front-end\\front-end.service.yaml'
        sh 'kubectl apply -f ingress.yaml'
        git 'https://github.com/bijoythomask/example.kubernates.config.git'
      }
    }
  }
  environment {
    CI = 'true'
  }
}