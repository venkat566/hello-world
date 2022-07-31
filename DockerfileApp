FROM openjdk:11
MAINTAINER venkat

WORKDIR /
COPY ./target/jb-hello-world-maven-0.2.0.jar ./
ENTRYPOINT ["java","-jar","app.jar"]
EXPOSE 8080
