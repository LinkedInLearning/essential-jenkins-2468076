# 05_05 Solution Create artifacts and reports
You’re on a development team working on a new Java application.

You've been assigned to develop a Jenkins pipeline that tests the application code and creates a report that the team can review.  Specifically, the test stage creates  test report using the JUnit format.

If the tests pass, the pipeline should compile the code into a Java archive and store the JAR file as an artifact.

## Solution
- Set up a global tool configuration for Maven.
    - Select `Manage Jenkins` &rarr; `Global tool configuration` &rarr; `Add Maven`
    - Name Maven `Maven-3.8.4`
    - Install from Apache
    - Version 3.8.4
    - `Save`

- Make sure the JUnit plugin is installed.
    - Select `Dashboard` &rarr; `Manage Jenkins` &rarr; `Manage Plugins` &rarr; `Installed`
    - Filter for "junit"
    - Confirm "JUnit Plugin" is installed

- Update the pipeline to use the Maven tool configuration.
    - Select `Dashboard` &rarr; `New Item`
    - Enter item name
    - Select `Pipeline` project
    - `OK`
    - Copy the pipeline template from the exercise files and paste into the `Pipeline script` section
        - *UPDATE GIT CALL WITH `credentialsId: 'managedkaos',`*
    - `Apply`
    - Select `Pipeline Syntax`; go to newly opened tab
    - Select `Declarative Directive Generator` &rarr; `tools: Tools` &rarr; `Add` &rarr; `maven: Maven` &rarr; `Maven-3.8.4` &rarr; `Generate Declarative Directive`
    - Copy snippet; go to previous tab
    - Paste snippet to replace `// Add a tool configuration here...`
    - `Save` &rarr; `Build Now`

- Update the pipeline to call Maven.
    - Select `Configure`
    - Uncomment calls to Maven
    - `Save` &rarr; `Build Now`

- Collect test results from the following location: `**/TEST-com.learningjenkins.AppTest.xml`.
    - Select `Configure`
    - Go to pipeline syntax tool tab
    - Select `Snippet Generator` &rarr; `junit: Archive...` &rarr;
      - Test report XMLs = `**/TEST-com.learningjenkins.AppTest.xml`
      - Select `Do not fail the build on empty test results`
      - `Generate Pipeline Script`
    - Copy snippet; go to previous tab
    - Paste snippet to replace `// Add jUnit report collection here...`
    - `Apply`

- Archive artifacts from the following location: `**/hello-1.0-SNAPSHOT.jar`.
    - Go to pipeline syntax tool tab
    - Select `Snippet Generator` &rarr; `archiveArtifacts: Archive...` &rarr;
      - Files to archive = `**/hello-1.0-SNAPSHOT.jar`
      - Select `Advanced`
        - Select `Do not fail build if archiving returns nothing`
      - `Generate Pipeline Script`
    - Copy snippet; go to previous tab
    - Paste snippet to replace `// Add artifact archiving here...`
    - `Save` &rarr; `Build Now`
    - Refresh the browser

- Review the test results and the artifacts


## The solution pipeline
[Follow this link for the Jenkinsfile solution](./Jenkinsfile) or copy it from the code below:

```Jenkinsfile
pipeline {
    agent any
    tools {
      maven 'Maven-3.8.4'
    }
    stages {
        stage('Source') {
            steps {
                git branch: 'main',
                    changelog: false,
                    poll: false,
                    url: 'https://github.com/LinkedInLearning/essential-jenkins-2468076.git'
            }
        }
        stage('Clean') {
            steps {
                dir("${env.WORKSPACE}/Ch05/05_04-challenge-create-artifacts-and-reports"){
                    sh 'mvn clean'
                }
            }
        }
        stage('Test') {
            steps {
                dir("${env.WORKSPACE}/Ch05/05_04-challenge-create-artifacts-and-reports"){
                    sh 'mvn test'
                }
            }
        }
        stage('Package') {
            steps {
                dir("${env.WORKSPACE}/Ch05/05_04-challenge-create-artifacts-and-reports"){
                    sh 'mvn package -DskipTests'
                }
            }
        }
    }
    post {
        always {
            junit allowEmptyResults: true,
                testResults: '**/TEST-com.learningjenkins.AppTest.xml'

            archiveArtifacts allowEmptyArchive: true,
                artifacts: '**/hello-1.0-SNAPSHOT.jar'
        }
    }
}
```
