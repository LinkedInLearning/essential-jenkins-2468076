# 05_02 Publish test results and code coverage reports
## Report formats
### JUnit test report format
JUnit reports are XML documents that describe the results of a test.  The JUnit format was originally developed for Java programs but many other languages have adopted this reporting format.  This makes JUnit the standard for creating test reports.
- [JUnit](https://junit.org/junit5/)

### Code coverage formats
Code coverage measures the effectiveness of a test by tracking the lines of code that are accessed during a test. 

Two popular code coverage formats are JaCoCo and Cobertura.

- [JaCoCo](https://www.jacoco.org/jacoco/)
- [Cobertura](http://cobertura.github.io/cobertura/)

## Plugins for reading and publishing reports
Jenkins uses plugins to read and publish a variety of test and code coverage reports.

- [JUnit](https://plugins.jenkins.io/junit/)
- [Code Coverage API](https://plugins.jenkins.io/code-coverage-api/)

## Test report and code coverage demo with a Python project
The code in this directory includes a Python project for a simple API.  The code includes a [Jenkinsfile](./Jenkinsfile) for a pipeline with the following stages:

```mermaid
flowchart LR
    Requirements-->Lint
    Lint-->Test
    Test-->Build
    Build-->Deploy
```

|Pipeline stage |Function                                               |
|:--------------|:------------------------------------------------------| 
|Requirements   |Sets up a virtual environment and installs dependencies|
|Lint           |Checks the code for syntax errors                      |
|Test           |Runs a test suite including code coverage              |
|Build          |Builds the application                                 |
|Deploy         |Deploys the application                                |


*If you're following along with the exercise files for this lesson, there are a few things that you'll need to know in advance.*

- [ ] The Jenkinsfile is written to be run on a Ubuntu server.
- [ ] A Windows server may be able to run the project with modifications to the Jenkinsfile.  If you are using windows, fork this repository into your own GitHub account and make modifications as needed.
- [ ] Python3 must be installed.
- [ ] Python3 Virtual Environment library must be installed
- [ ] A `git` executable must be installed.
- [ ] The JUnit plugin must be installed.
- [ ] The Code Coverage API plugin must be installed.

## The demo Jenkinsfile
```
pipeline {
    agent any

    options {
        buildDiscarder(logRotator(daysToKeepStr: '10', numToKeepStr: '10'))
        timeout(time: 12, unit: 'HOURS')
        timestamps()
    }

    triggers {
        cron '@midnight'
    }

    stages {
        stage('Requirements') {
            steps {
                dir("${env.WORKSPACE}/Ch05/05_02-publish-reports"){
                    sh 'python3 -m venv venv'
                    sh './venv/bin/pip3 install --upgrade --requirement requirements.txt'
                }
            }
        }
        stage('Lint') {
            steps {
                dir("${env.WORKSPACE}/Ch05/05_02-publish-reports"){
                    sh 'venv/bin/flake8 --ignore=E501,E231 *.py'
                    sh 'venv/bin/pylint --errors-only --disable=C0301 --disable=C0326 *.py'
                }
            }
        }
        stage('Test') {
            steps {
                dir("${env.WORKSPACE}/Ch05/05_02-publish-reports"){
                    sh('''
                        venv/bin/coverage run -m pytest -v test_*.py \
                            --junitxml=pytest_junit.xml
                    ''')
                }
            }
        }
        stage('Build') {
            steps {
                echo "Build the application in this step..."
            }
        }
        stage('Deploy') {
            steps {
                echo "Deploy the application in this step..."
            }
        }
    }

    post {
        always {
            dir("${env.WORKSPACE}/Ch05/05_02-publish-reports"){
                sh 'venv/bin/coverage xml'
            }

            junit allowEmptyResults: true, testResults: '**/pytest_junit.xml'

            junit allowEmptyResults: true, testResults: '**/pylint_junit.xml'

            publishCoverage adapters: [cobertura('**/coverage.xml')],
                sourceFileResolver: sourceFiles('STORE_LAST_BUILD')
        }
    }
}
```
