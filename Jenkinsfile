pipeline {
  agent {
    label 'SLAVE'
  }
  environment {
    NEXUS=credentials('Nexus')
    MAJOR_VERSION="1.0"
  }
  stages {
    stage('Create Dispatch MicroService Artifacts') {
      steps {
        sh '''
        mkdir -p /go/src/github.com/instana/dispatch
        cp  src/ /go/src/github.com/instana/dispatch
        dep init
        dep ensure
        go build -o bin/gorcv
        '''
      }
    }
  }
}