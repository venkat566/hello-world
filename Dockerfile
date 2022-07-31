FROM jenkins/slave

RUN apt-get update -y && apt-get clean -y
RUN apt-get install -y git && apt-get install maven -y

RUN mvn -version

RUN chown -R jenkins:jenkins /home/jenkins &&  chmod -R 777 /home/jenkins
