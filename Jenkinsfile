pipeline {
    agent any
    stages {
        stage('Build') {
            agent {
                docker {image 'eclipse-temurin:21-jdk-jammy'}
            }
            steps {
                echo 'Hello, Maven'
                sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Run') {
            agent {
                docker {image 'openjdk:21.0.1-jdk-slim'}
            }
            steps {
                echo 'Hello, JDK'
                sh 'java -jar target/demodocker-0.0.1-SNAPSHOT.jar'
            }
        }
    }
}