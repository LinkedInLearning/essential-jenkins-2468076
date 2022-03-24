pipeline {
    agent any
    tools {
      maven 'Maven-3.8.4'
    }
    stages {
        stage('Source') {
            steps {
                git branch: 'main',
                    changelog: false,
                    poll: false,
                    url: 'https://github.com/LinkedInLearning/essential-jenkins-2468076.git'
            }
        }
        stage('Clean') {
            steps {
                dir("${env.WORKSPACE}/Ch05/05_04-challenge-create-artifacts-and-reports"){
                    sh 'mvn clean'
                }
            }
        }
        stage('Test') {
            steps {
                dir("${env.WORKSPACE}/Ch05/05_04-challenge-create-artifacts-and-reports"){
                    sh 'mvn test'
                }
            }
        }
        stage('Package') {
            steps {
                dir("${env.WORKSPACE}/Ch05/05_04-challenge-create-artifacts-and-reports"){
                    sh 'mvn package -DskipTests'
                }
            }
        }
    }
    post {
        always {
            junit allowEmptyResults: true,
                testResults: '**/TEST-com.learningjenkins.AppTest.xml'

            archiveArtifacts allowEmptyArchive: true,
                artifacts: '**/hello-1.0-SNAPSHOT.jar'
        }
    }
}
