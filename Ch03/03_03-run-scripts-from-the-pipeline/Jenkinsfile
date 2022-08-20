pipeline {
    agent any
    parameters {
        choice(name: 'NUMBER',
            choices: [10,20,30,40,50,60,70,80,90],
            description: 'Select the value for F(n) for the Fibonnai sequence.')
    }
    options {
        buildDiscarder(logRotator(daysToKeepStr: '10', numToKeepStr: '10'))
        timeout(time: 12, unit: 'HOURS')
        timestamps()
    }
    triggers {
        cron '@midnight'
    }
    stages {
        stage('Make executable') {
            steps {
                sh('chmod +x ./fibonacci.sh')
            }
        }
        stage('Relative path') {
            steps {
                sh("./fibonacci.sh ${env.NUMBER}")
            }
        }
        stage('Full path') {
            steps {
                sh("${env.WORKSPACE}/fibonacci.sh ${env.NUMBER}")
            }
        }
        stage('Change directory') {
            steps {
                dir("${env.WORKSPACE}"){
                    sh("./fibonacci.sh ${env.NUMBER}")
                }
            }
        }
    }
}
