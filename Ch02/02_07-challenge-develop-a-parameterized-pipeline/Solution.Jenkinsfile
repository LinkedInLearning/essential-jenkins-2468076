pipeline {
    agent any
    parameters {
      choice choices: ['DEVELOPMENT', 'STAGING', 'PRODUCTION'], description: 'Choose the environment for this deployment.', name: 'ENVIRONMENT'
      password defaultValue: '1234567890', description: 'Enter the API key to use for this deployment.', name: 'API_KEY'
      text defaultValue: 'This is the default changelog message.', description: 'Enter the components that were changed in this deployment.', name: 'CHANGELOG'
    }    
    stages {
        stage('Test') {
            steps {
                echo "This step tests the compiled project"
            }
        }
        stage('Deploy') {
            when {
              expression { params.ENVIRONMENT == "PRODUCTION" }
            }            
            steps {
                echo "This step deploys the project"
            }
        }        
        stage('Report') {
            steps {
                echo "This stage generates a report"
                sh "printf \"${params.CHANGELOG}\" > ${params.ENVIRONMENT}.txt"
                archiveArtifacts allowEmptyArchive: true, 
                    artifacts: '*.txt', 
                    fingerprint: true, 
                    followSymlinks: false, 
                    onlyIfSuccessful: true
            }
        }
    }
}