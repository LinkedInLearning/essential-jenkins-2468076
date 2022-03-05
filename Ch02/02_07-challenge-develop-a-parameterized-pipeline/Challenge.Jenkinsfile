pipeline {
    agent any
    stages {
        stage('Compile') {
            steps {
                echo "This step compiles the code for the project"
            }
        }
        stage('Test') {
            steps {
                echo "This step tests the compiled project"
            }
        }
        stage('Deploy') {
            steps {
                echo "This step deploys the project"
            }
        }        
        stage('Report') {
            steps {
                echo "This step generates a report"
                sh "echo 'MESSAGE GOES HERE' > report.txt"
                archiveArtifacts allowEmptyArchive: true, 
                    artifacts: '*.txt', 
                    fingerprint: true, 
                    followSymlinks: false, 
                    onlyIfSuccessful: true
            }
        }
    }
}