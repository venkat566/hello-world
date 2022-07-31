# FROM jenkins/ssh-slave
#
# RUN apt-get update -y && apt-get clean -y
# RUN apt-get install -y git && apt-get install maven -y
#
# RUN mvn -version
#
# RUN chown -R jenkins:jenkins /home/jenkins &&  chmod -R 777 /home/jenkins


FROM ubuntu:14.04
MAINTAINER jerome.petazzoni@docker.com

# Let's start with some basic stuff.
RUN apt-get update -qq && apt-get install -qqy \
    apt-transport-https \
    ca-certificates \
    curl \
    maven \
    git \
    lxc \
    iptables

# Install Docker from Docker Inc. repositories.
RUN curl -sSL https://get.docker.com/ | sh

# Install the magic wrapper.
ADD ./wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker

# Define additional metadata for our image.
VOLUME /var/lib/docker
CMD ["wrapdocker"]
