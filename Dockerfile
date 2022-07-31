FROM jenkins/ssh-slave

RUN apt-get update && apt-get -y --no-install-recommends install && apt-get clean
RUN apt-get install -y curl && apt-get install -y git && apt-get install maven -y

RUN apt install docker.io -y
RUN docker --version
RUN mvn -version

RUN chown -R jenkins:jenkins /home/jenkins &&  chmod -R 777 /home/jenkins

ENTRYPOINT nohup dockerd >/dev/null 2>&1 & sleep 10
