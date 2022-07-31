@Library("nlb-lib") _

pipeline {
  agent { dockerfile true }
  environment {
    def appName='helloworld'
    def version='2.0'
    def registry='44.202.62.76:8082'
    def dockerfileName='DockerfileApp'
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
        dockerBuild(appName, version, registry, dockerfileName)
        dockerpush(appName, version, registry)
      }
    }
  }
}
