pipeline {
    agent any
    options {
        buildDiscarder(logRotator(daysToKeepStr: '10', numToKeepStr: '10'))
        timeout(time: 12, unit: 'HOURS')
        timestamps()
    }
    stages {
        stage('Requirements') {
            steps {
                // this step is required to make sure the script
                // can be executed directly in a shell
                sh('chmod +x ./algorithm.sh')
            }
        }
        stage('Build') {
            steps {
                // the algorithm script creates a file named report.txt
                sh('./algorithm.sh')

                // this step archives the report
                archiveArtifacts allowEmptyArchive: true,
                    artifacts: '*.txt',
                    fingerprint: true,
                    onlyIfSuccessful: true
            }
        }
    }
}
