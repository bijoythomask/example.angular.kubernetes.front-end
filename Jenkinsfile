pipeline {
  agent {
    docker {
      image 'johnpapa/angular-cli'
      args '-v /var/run/docker.sock:/var/run/docker.sock'
    }

  }

  environment {
        CI = 'true'
  }

  stages {
    // stage('Build') {
    //   steps {
    //     sh 'npm install'
    //     sh 'ng build'
    //   }
    // }
    stage('Package') {
      agent none
      steps {
        script {
          docker.build("nginx-fe")
        }
      }
    }
  }
}