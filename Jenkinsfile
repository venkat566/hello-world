@Library("nlb-lib") _

pipeline {
  agent { dockerfile true }
  environment {
    def appName='helloworld'
    def version='2.0'
  }
  stages {
    stage('build') {
      // agent {
      //   docker { image 'maven:3.8.1-adoptopenjdk-11' }
      // }
      steps {
        mvnbuild()
      }
    }
    stage('Docker Build') {
      // agent any
      steps {
        dockerBuild(appName, version)
        dockerpush(appName, version)
      }
    }
  }
}
