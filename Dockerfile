FROM openjdk:11
MAINTAINER venkat

WORKDIR /opt/
COPY ./target/*.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]
EXPOSE 8080