pipeline {
    agent {
        kubernetes {
            label 'my-app'
            yamlFile 'JenkinsKubernetesPod.yaml'
        }
    }
    stages {
        stage('Run unit tests') {
            steps {
              // The needed steps for your testing
            }
        }

        stage('Build application') {
            steps {
              // Build the app
            }
        }
      
        stage('Docker publish') {
            steps {
              // Publish a docker image for your application 
            }
        }

        stage('Deployment') {
            steps {
                script {
                  container('helm') {
                      // Init authentication and config for your kubernetes cluster
                      sh("helm init --client-only --skip-refresh")
                      sh("helm upgrade --install --wait prod-my-app ./helm --namespace prod")
                    }
                }
            }
        }
    }
}