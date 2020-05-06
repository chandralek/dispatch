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
         export GOPATH="${PWD}/go"
         cp -r src ${PWD}/go/src/github.com/instana/dispatch
         cd ${PWD}/go/src/github.com/instana/dispatch
         dep init 
         dep ensure
         cd src
         go build -o bin/dispatch
        '''
      }
    }


    stage('Upload To Nexus') {
      steps {
        sh '''
          cp ${PWD}/go/src/github.com/instana/dispatch/src/bin/dispatch dispatch-service-${MAJOR_VERSION}-${BUILD_NUMBER}
          curl -f -v -u $NEXUS --upload-file dispatch-service-${MAJOR_VERSION}-${BUILD_NUMBER} https://nexus.devopsb46.online/repository/dispatch-service/dispatch-service-${MAJOR_VERSION}-${BUILD_NUMBER}
        '''
      }
    }

  }

  post {
    always {
      cleanWs()
    }
  }

}