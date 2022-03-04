# 02_06 Use conditional expressions and manual approvals

```
pipeline {
    agent any
    parameters {
        choice(name: 'ENVIRONMENT',
            choices: ['DEVELOPMENT' , 'STAGING', 'PRODUCTION'],
            description: 'Choose the environment for this deployment')
    }

    stages {
        stage ('Build') {
            steps {
                echo "Building..."
            }
        }
        stage ('Deploy to non-production environments') {
            when {
                // Only deploy if the environment is NOT production
                expression { params.ENVIRONMENT != 'PRODUCTION' }
            }
            steps {
                echo "Deploying to ${params.ENVIRONMENT}"
            }
        }
        stage ('Deploy to production environment') {
            when {
                expression { params.ENVIRONMENT == 'PRODUCTION' }
            }
            steps {
                input message: 'Confirm deployment to production...', ok: 'Deploy'
                echo "Deploying to ${params.ENVIRONMENT}"
            }
        }
    }
}
```
