FROM jenkins/ssh-slave

RUN apt-get update && apt-get -y --no-install-recommends install && apt-get clean
RUN apt-get install -y curl && apt-get install -y git && apt-get install maven -y

RUN mvn -version

RUN chown -R jenkins:jenkins /home/jenkins &&  chmod -R 777 /home/jenkins
