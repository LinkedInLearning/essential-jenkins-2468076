pipeline {
    agent any
    parameters {
      choice choices: ['DEVELOPMENT', 'STAGING', 'PRODUCTION'], description: 'Choose the environment for this deployment.', name: 'ENVIRONMENT'
      password defaultValue: '1234567890', description: 'Enter the API key to use for this deployment.', name: 'API_KEY'
      text defaultValue: 'This is the default changelog message.', description: 'Enter the components that were changed in this deployment.', name: 'CHANGELOG'
    }    
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
            when {
              environment ignoreCase: true, name: 'ENVIRONMENT', value: 'PRODUCTION'
            }            
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