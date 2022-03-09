# 06_03 Use secrets and credentials

```Jenkinsfile
pipeline {
    agent any
    environment {
      USER1 = credentials('user1')
    }
    stages {
        stage('Test') {
            steps {
                withCredentials([string(credentialsId: 'apikey', variable: 'APIKEY')]) {
                    echo env.APIKEY
                    echo env.USER1
                    echo env.USER1_USR
                    echo env.USER1_PSW
                    echo "${env.APIKEY}"
                }
            }
        }
    }
}
```