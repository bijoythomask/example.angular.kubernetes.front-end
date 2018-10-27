pipeline {
  
  agent any

  environment {
    CI = 'true'
    IMAGE_BUILD_NUMBER=env.BUILD_ID
  }
  
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
        stash(includes: 'dist/**/*', name: 'stash-dist')
      }
    }
    stage('Build image') {
      steps {
        unstash 'stash-dist'
        echo 'Starting to build docker image'
        script {
           docker.withRegistry('http://localhost:32000') {
            def customImage = docker.build("nginx-fe:${env.BUILD_ID}")
            customImage.push()
           }
          
        }

      }
    }
    stage('Deploy') {
      steps {

        git 'https://github.com/bijoythomask/example.kubernates.config.git'

        echo 'Deploying front-end objects and service'
        // sh 'kubectl apply -f front-end/front-end.deployment.yaml'
        // sh 'kubectl apply -f front-end/front-end.service.yaml'        
        // echo 'Deploying Ingress service'
        // sh 'kubectl apply -f ingress.yaml'
        kubernetesDeploy(
          configs: 'front-end/front-end.deployment.yaml,front-end/front-end.service.yaml,ingress.yaml',        
          enableConfigSubstitution: true,          
          kubeconfigId: 'ubuntu-virtual-machine'          
        )
       
      }
    }
  }
 
}