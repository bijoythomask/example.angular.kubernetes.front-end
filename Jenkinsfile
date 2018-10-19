// pipeline {
//   agent {
//     docker {
//       image 'johnpapa/angular-cli'
//       args '-v /var/run/docker.sock:/var/run/docker.sock'
//     }

//   }

//   environment {
//         CI = 'true'
//   }

//   stages {
    // stage('Build') {
    //   steps {
    //     sh 'npm install'
    //     sh 'ng build'
    //   }
    // }
<<<<<<< HEAD
//     stage('Package') {
//       steps {
//         script {
//           docker.build("nginx-fe")
//         }
//       }
//     }
//   }
// }

pipeline {
    agent any
    stages {
        stage('Build image') {
            steps {
                echo 'Starting to build docker image'

                script {
                    def customImage = docker.build("my-image:${env.BUILD_ID}")
                    customImage.push()
                }
            }
=======
    stage('Package') {
      agent {
        docker { 
          image 'jenkinsci/blueocean'
          args '-u root -v /var/run/docker.sock:/var/run/docker.sock' 
          }
      }
      steps {
        script {
          docker.build("nginx-fe")
>>>>>>> 404951da4ad0c0bbc6593c988d256ca6744243c0
        }
    }
}