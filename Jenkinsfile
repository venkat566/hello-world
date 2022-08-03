@Library("nlb-lib") _

pipeline {
  agent none
  // agent { dockerfile true }
  environment {
    def appName='helloworld'
    def version='2.0'
    def registry='3.82.129.115:8082'
    def dockerfileName='DockerfileApp'
  }
  stages {
    stage('build') {
      agent { dockerfile true }
      steps {
        mvnbuild()
      }
    }
    stage('Docker Build') {
      agent any
      steps {
        dockerBuild(appName, version, registry, dockerfileName)
        dockerpush(appName, version, registry)
      }
    }
  }
}
