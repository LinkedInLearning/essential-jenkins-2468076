# Archive Step Example

```Jenkinsfile
pipeline {
    agent any

    stages {
        stage('Report') {
            steps {
                sh 'echo "this is a report" > report.txt'
                archiveArtifacts allowEmptyArchive: true,
                    artifacts: '*.txt',
                    fingerprint: true,
                    followSymlinks: false,
                    onlyIfSuccessful: true
            }
        }
    }
}
```
