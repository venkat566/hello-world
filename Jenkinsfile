@Library("nlb-lib") _

pipeline {
  agent none
  stages {
    stage('Demo') {
      echo 'Hello world'
      hello('Alex')
    }
    // stage('build') {
    //   agent {
    //     docker { image 'maven:3.8.1-adoptopenjdk-11' }
    //   }
    //   steps {
    //     sh '''mvn --version
    //     mvn clean package
    //     '''
    //   }
    // }
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
