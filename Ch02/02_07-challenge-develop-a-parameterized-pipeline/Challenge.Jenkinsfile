pipeline {
    agent any
    stages {
        stage('Test') {
            steps {
                echo "This step tests the project"
            }
        }
        }
        stage('Deploy') {
            steps {
                echo "This stage deploys the project"
            }
        }        :
        stage('Report') {
            steps {
                echo "This stage generates a report"
                sh 'printf \"This is the change log.\" > report.txt'
                archiveArtifacts allowEmptyArchive: true, 
                    artifacts: '*.txt', 
                    fingerprint: true, 
                    followSymlinks: false, 
                    onlyIfSuccessful: true
            }
        }
    }
}