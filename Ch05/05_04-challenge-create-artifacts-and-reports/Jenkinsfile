pipeline {
    agent any
    options {
        buildDiscarder(logRotator(daysToKeepStr: '10', numToKeepStr: '10'))
        timeout(time: 12, unit: 'HOURS')
    }
    stages {
        stage("Hello!\nPlease read the logs.") {
            steps {
                echo "Hello! Thanks for visiting the Jenkins Essential Training repo on GitHub.\n\nIf you are working with the exercise files and see this message, you have successfully connected to the repo.\n\nIf you are using the repo with a specific lesson, you will need to update your project configuration to use the path to the Jenkins file for that lesson.\n\nFor example, if you are working with lesson 05_02, you will need to update the 'Script Path' in the SCM configuration to use:\n\n\tCh05/05_02-publish-reports/Jenkinsfile\n\nThanks again for checking out this repo.\n\nIf you run into any problems or have questions, please use the Q&A section for this course on Linked In Learning."
            }
        }
    }
}

