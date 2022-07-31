# FROM jenkins/ssh-slave
#
# RUN apt-get update -y && apt-get clean -y
# RUN apt-get install -y git && apt-get install maven -y
#
# RUN mvn -version
#
# RUN chown -R jenkins:jenkins /home/jenkins &&  chmod -R 777 /home/jenkins

FROM bdruemen/jenkins-uid-from-volume
RUN apt-get -yqq update && apt-get -yqq install docker.io 161 && usermod -g docker jenkins
RUN apt-get install -y git && apt-get install maven -y && apt-get clean -y
VOLUME /var/run/docker.sock
ENTRYPOINT groupmod -g $(stat -c “%g” /var/run/docker.sock) docker && usermod -u $(stat -c “%u” /var/jenkins_home) jenkins && gosu jenkins /bin/tini – /usr/local/bin/jenkins.sh
