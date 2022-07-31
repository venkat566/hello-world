# FROM ubuntu
#
# USER root
#
# RUN apt-get update -y && apt-get clean -y
# RUN apt-get install -y git && apt-get install maven -y
# RUN apt-get install docker.io -y
#
# VOLUME /var/run/docker.sock
#
# RUN mvn -version
#
# RUN chown -R jenkins:jenkins /home/jenkins &&  chmod -R 777 /home/jenkins


FROM ubuntu:18.04
MAINTAINER venkat <venkat@gmail.com>

RUN apt-get update && apt-get dist-upgrade -y && rm -rf /var/lib/apt/lists/* && apt-get clean -y
RUN apt-get install docker.io -y
RUN apt-get update && apt-get install -y \
    git \
    maven \
    apt-transport-https \
    curl \
    init \
    openssh-server openssh-client \
 && rm -rf /var/lib/apt/lists/*

# Install Java
RUN apt-get update && apt-get install -y openjdk-8-jdk && rm -rf /var/lib/apt/lists/*

# Add Jenkins user and group
RUN groupadd -g 10000 jenkins \
    && useradd -d $HOME -u 10000 -g jenkins jenkins

# Install jenkins jnlp
RUN curl --create-dirs -sSLo /usr/share/jenkins/slave.jar https://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/${VERSION}/remoting-${VERSION}.jar \
    && chmod 755 /usr/share/jenkins \
    && chmod 644 /usr/share/jenkins/slave.jar

COPY jenkins-slave /usr/local/bin/jenkins-slave
RUN chmod 755 /usr/local/bin/jenkins-slave && chown jenkins:jenkins /usr/local/bin/jenkins-slave

RUN mkdir -p /home/jenkins/.jenkins \
    && mkdir -p /home/jenkins/agent \
    && chown -R jenkins:jenkins /home/jenkins

VOLUME /home/jenkins/.jenkins
VOLUME /home/jenkins/agent
VOLUME /var/run/docker.sock

WORKDIR /home/jenkins

ENTRYPOINT ["/usr/local/bin/jenkins-slave"]
