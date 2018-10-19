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
        }
    }
}