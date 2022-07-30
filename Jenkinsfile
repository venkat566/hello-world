pipeline {
  agent none
  stages {
    stage('build') {
      agent {
        docker { image 'maven:3.8.1-adoptopenjdk-11' }
      }
      steps {
        sh '''mvn --version
        mvn clean package
        docker build -t helloworld:latest .
        '''
      }
    }
  }
}
