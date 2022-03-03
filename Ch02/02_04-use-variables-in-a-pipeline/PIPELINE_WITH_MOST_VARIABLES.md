# A Pipeline With Global Variables
This pipeline uses echo steps to print most of the global variables avaiable to a pipeline job.

Create a job with the following pipeline and view the results in the "Pipeline Steps" view.

```Jenkinsfile
pipeline {
    agent any
    stages {
        stage('Environment Variables') {
            steps {
                echo  "BUILD_DISPLAY_NAME         =  ${BUILD_DISPLAY_NAME}"
                echo  "BUILD_ID                   =  ${BUILD_ID}"
                echo  "BUILD_NUMBER               =  ${BUILD_NUMBER}"
                echo  "BUILD_TAG                  =  ${BUILD_TAG}"
                echo  "BUILD_URL                  =  ${BUILD_URL}"
                echo  "CI                         =  ${CI}"
                echo  "EXECUTOR_NUMBER            =  ${EXECUTOR_NUMBER}"
                echo  "JENKINS_HOME               =  ${JENKINS_HOME}"
                echo  "JENKINS_URL                =  ${JENKINS_URL}"
                echo  "JOB_BASE_NAME              =  ${JOB_BASE_NAME}"
                echo  "JOB_DISPLAY_URL            =  ${JOB_DISPLAY_URL}"
                echo  "JOB_NAME                   =  ${JOB_NAME}"
                echo  "JOB_URL                    =  ${JOB_URL}"
                echo  "NODE_LABELS                =  ${NODE_LABELS}"
                echo  "NODE_NAME                  =  ${NODE_NAME}"
                echo  "RUN_ARTIFACTS_DISPLAY_URL  =  ${RUN_ARTIFACTS_DISPLAY_URL}"
                echo  "RUN_CHANGES_DISPLAY_URL    =  ${RUN_CHANGES_DISPLAY_URL}"
                echo  "RUN_DISPLAY_URL            =  ${RUN_DISPLAY_URL}"
                echo  "RUN_TESTS_DISPLAY_URL      =  ${RUN_TESTS_DISPLAY_URL}"
                echo  "WORKSPACE                  =  ${WORKSPACE}"
                echo  "WORKSPACE_TMP              =  ${WORKSPACE_TMP}"
            }
        }
        stage('currentBuild Variables') {
            steps {
                echo  "currentBuild.absoluteUrl              =  ${currentBuild.absoluteUrl}"
                echo  "currentBuild.buildVariables           =  ${currentBuild.buildVariables}"
                echo  "currentBuild.currentResult            =  ${currentBuild.currentResult}"
                echo  "currentBuild.description              =  ${currentBuild.description}"
                echo  "currentBuild.displayName              =  ${currentBuild.displayName}"
                echo  "currentBuild.duration                 =  ${currentBuild.duration}"
                echo  "currentBuild.durationString           =  ${currentBuild.durationString}"
                echo  "currentBuild.fullDisplayName          =  ${currentBuild.fullDisplayName}"
                echo  "currentBuild.fullProjectName          =  ${currentBuild.fullProjectName}"
                echo  "currentBuild.id                       =  ${currentBuild.id}"
                echo  "currentBuild.keepLog                  =  ${currentBuild.keepLog}"
                echo  "currentBuild.nextBuild                =  ${currentBuild.nextBuild}"
                echo  "currentBuild.number                   =  ${currentBuild.number}"
                echo  "currentBuild.previousBuild            =  ${currentBuild.previousBuild}"
                echo  "currentBuild.previousBuildInProgress  =  ${currentBuild.previousBuildInProgress}"
                echo  "currentBuild.previousBuiltBuild       =  ${currentBuild.previousBuiltBuild}"
                echo  "currentBuild.previousCompletedBuild   =  ${currentBuild.previousCompletedBuild}"
                echo  "currentBuild.previousFailedBuild      =  ${currentBuild.previousFailedBuild}"
                echo  "currentBuild.previousNotFailedBuild   =  ${currentBuild.previousNotFailedBuild}"
                echo  "currentBuild.previousSuccessfulBuild  =  ${currentBuild.previousSuccessfulBuild}"
                echo  "currentBuild.projectName              =  ${currentBuild.projectName}"
                echo  "currentBuild.result                   =  ${currentBuild.result}"
                echo  "currentBuild.startTimeInMillis        =  ${currentBuild.startTimeInMillis}"
                echo  "currentBuild.timeInMillis             =  ${currentBuild.timeInMillis}"
                echo  "currentBuild.upstreamBuilds           =  ${currentBuild.upstreamBuilds}"
            }
        }
    }
}
```

"Most" is the case because not all global variables are always available.

For example, the following variables are only available to jobs that interact with a revision control system:
```
BRANCH_NAME
BRANCH_IS_PRIMARY
CHANGE_ID
CHANGE_URL
CHANGE_TITLE
CHANGE_AUTHOR
CHANGE_AUTHOR_DISPLAY_NAME
CHANGE_AUTHOR_EMAIL
CHANGE_TARGET
CHANGE_BRANCH
CHANGE_FORK
TAG_NAME
TAG_TIMESTAMP
TAG_UNIXTIME
TAG_DATE
```

Additionally, some of the `currentBuild` variables are only available to specific job types like Multi-Branch Pipelines.
