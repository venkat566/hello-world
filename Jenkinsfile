pipeline {
  agent none
  stages {
    stage('build') {
      agent {
        docker { image 'maven:3.8.1-adoptopenjdk-11' }
      }
      steps {
        checkout changelog: false, poll: false, scm: [$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/venkat566/hello-world.git']]]
        sh '''mvn --version
        mvn clean package'''
      }
    }
  }
}
