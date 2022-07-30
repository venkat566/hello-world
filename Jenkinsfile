@Library("nlb-lib") _

pipeline {
  agent none
  environment {
    def appName='helloworld'
    def version='2.0'
  }
  stages {
    stage('build') {
      agent {
        docker { image 'maven:3.8.1-adoptopenjdk-11' }
      }
      steps {
        mvnbuild()
      }
    }
    stage('Docker Build') {
      agent any
      steps {
        dockerBuild(appName, version)
        dockerpush(appName, version)
      }
    }
    // stage('Docker Build') {
    //   agent any
    //   steps {
    //     sh '''
    //     ls -altr
    //     pwd
    //     docker build -t helloworld:latest .
    //     docker login -u admin -p admin 3.89.93.229:8082
    //     docker tag helloworld:latest 3.89.93.229:8082/helloworld:v2
    //     docker push 3.89.93.229:8082/helloworld:v2
    //     '''
    //   }
    // }
  }
}
