# 02_02 Create a declarative pipeline

```Jenkinsfile
pipeline {
    agent any
    stages {
        stage('Requirements') {
            steps {
                echo 'Getting Requirements....'
            }
        }
        stage('Build') {
            steps {
                echo 'Building....'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..1'
                echo 'Testing..2'
                echo 'Testing..3'
            }
        }
        stage('Report') {
            steps {
                echo 'Reporting....'
            }
        }
    }
}
```

