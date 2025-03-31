FROM openjdk:17-jdk-slim

COPY target/app-test.jar  /app/app-test.jar

WORKDIR /app

ENTRYPOINT ["java", "-jar", "/app/app-test.jar"]

EXPOSE 4444