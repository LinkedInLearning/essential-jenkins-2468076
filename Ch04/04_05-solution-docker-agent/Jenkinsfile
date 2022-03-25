pipeline {
    agent { docker 'public.ecr.aws/docker/library/golang:latest' }
    environment {
      GOCACHE = "${env.WORKSPACE}/.build_cache"
    }
    options {
        buildDiscarder(logRotator(daysToKeepStr: '10', numToKeepStr: '10'))
        timeout(time: 1, unit: 'HOURS')
        timestamps()
    }

    stages {
        stage('Source') {
            steps {
                sh 'which go'
                sh 'go version'
                git branch: 'stable',
                    url: 'https://github.com/gohugoio/hugo.git'
            }
        }
        stage('Build') {
            steps {
                sh "go build --tags extended"
            }
        }
        stage('Test') {
            steps {
                sh './hugo env'
            }
        }
    }
}
