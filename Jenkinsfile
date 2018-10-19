pipeline {
  agent {
    docker {
      image 'johnpapa/angular-cli'
      args '-p 80:3000 -v /var/run/docker.sock:/var/run/docker.sock'
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
      steps {
        script {
          docker.build("nginx-fe")
        }
      }
    }
  }
}