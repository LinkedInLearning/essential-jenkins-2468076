# 04_05 Solution: Improve a Docker agent pipeline
You're an open-source developer contributing to the [Hugo project](https://github.com/gohugoio/hugo), a static site generator developed using [Golang](https://go.dev/).

You're using a Jenkins pipeline with a docker agent to validate your changes.  However,  you're finding that your pipeline is taking a long time in the build stage.

You do some research and find that your build is downloading dependencies on each run of the pipeline.

After discussing the issue with a team member, you find that you can speed up your builds by moving the dependency cache into the project workspace.

## Requirements
- [ ] Install Docker on the Jenkins server
- [ ] Install the Docker Pipeline plugin
- [ ] Create a pipeline job using the exercise files: [Jenkinsfile](./Jenkinsfile)
- [ ] Run the pipeline
- [ ] Update the pipeline
- [ ] Compare the runtimes

## Solution
```
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
```