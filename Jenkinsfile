pipeline {
   agent none

   environment {
     SERVICE_NAME = "apipock8s"
     //https://github.com/fbmanzatto/apipock8s.git
     REPOSITORY_TAG="${SERVICE_NAME}:${BUILD_ID}"
   }

   stages {
      stage('Preparation') {
         steps {
            cleanWs()
            git credentialsId: 'GITHUB', url: "https://github.com/${ORGANIZATION_NAME}/${SERVICE_NAME}"
         }
      }
      stage('Build') {
         steps {
            sh 'echo TODO: Build...'
         }
      }

      stage('Test') {
            parallel {
                stage('Unit Tests') {
                    steps {
                        sh 'echo TODO: Unit Tests.'
                    }
                }

                stage('Integration Tests') {
                    steps {
                        sh 'echo TODO: Integration Tests.'
                    }
                }
			}
		}

      stage('Build and Push Image') {
         steps {
           sh 'docker image build -t ${REPOSITORY_TAG} .'
         }
      }

      stage('Deploy to Cluster') {
          steps {
             sh 'helm upgrade -i  ${SERVICE_NAME} --set container.tag=${BUILD_ID} --set container.image=${SERVICE_NAME} ./chart/'
            //sh 'envsubst < ${WORKSPACE}/deploy.yaml | kubectl apply -f -'
          }
      }
   }
}