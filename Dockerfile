# the first stage of our build will use a maven 3.6.3 parent image
FROM eclipse-temurin:21-jdk-jammy AS MAVEN_BUILD

# copy the pom and src code to the container
COPY ./ ./

# package our application code
RUN mvn clean package

# the second stage of our build will use open jdk 11 on alpine 3.9
FROM openjdk:11.0.7-jdk-slim

# copy only the artifacts we need from the first stage and discard the rest
COPY --from=MAVEN_BUILD /target/testProject-0.0.1-SNAPSHOT.jar /demo.jar

# set the startup command to execute the jar
CMD ["java", "-jar", "/testProject.jar"]