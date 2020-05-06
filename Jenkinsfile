pipeline {

  agent {
    label 'SLAVE'
  }

  environment {
    NEXUS=credentials('Nexus')
    MAJOR_VERSION="1.0"
  }
  stages {

    stage('Install Go Dependencies') {
      steps {
        sh '''
         mkdir -p go/src/github.com/instana/dispatch
         export GOPATH="${PWD}/go/src/github.com/instana/dispatch"
         cp -r src ${PWD}/go/src/github.com/instana/dispatch
         dep init 
        '''
      }
    }

    stage('Create Archive to Upload') {
      steps {
        sh '''
          tar -czf user-service-${MAJOR_VERSION}-${BUILD_NUMBER}.tgz node_modules package.json  server.js
        '''
      }
    }

    stage('Upload To Nexus') {
      steps {
        sh '''
          curl -f -v -u $NEXUS --upload-file user-service-${MAJOR_VERSION}-${BUILD_NUMBER}.tgz https://nexus.devopsb46.online/repository/user-service/user-service-${MAJOR_VERSION}-${BUILD_NUMBER}.tgz
        '''
      }
    }

  }
}