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
        '''
      }
    }
    stage('Docker Build') {
      agent any
      steps {
        sh '''
        ls -altr
        pwd
        docker build -t helloworld:latest .
        docker login -u admin -p admin http://100.26.22.53:8082
        '''
      }
    }
  }
}
