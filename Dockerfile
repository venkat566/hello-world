FROM jenkins/ssh-slave

USER root

RUN apt-get update -y && apt-get clean -y
RUN apt-get install -y git && apt-get install maven -y
RUN apt-get install docker.io -y

VOLUME /var/run/docker.sock

RUN mvn -version

RUN chown -R jenkins:jenkins /home/jenkins &&  chmod -R 777 /home/jenkins
