# 05_04 Challenge Create artifacts and reports
You’re on a development team working on a new Java application.

You've been assigned to develop a Jenkins pipeline that tests the application code and creates a report that the team can review.  Specifically, the test stage creates  test report using the JUnit format.

If the tests pass, the pipeline should compile the code into a Java archive and store the JAR file as an artifact.

## Requirements
- Set up a global tool configuration for Maven.

- Make sure the JUnit plugin is installed.

- Update the pipeline to use the Maven tool configuration.

- Update the pipeline to call Maven.

- Collect test results from the following location: `'**/TEST-com.learningjenkins.AppTest.xml'`.

- Archive artifacts from the following location: `'**/hello-1.0-SNAPSHOT.jar'`.

## Additional information
- A pipeline template and all supporting code are available in the exercise files.

- Use the pipeline syntax tool to generate snippets for:
    - Tool configuration
    - Collecting test results
    - Archiving artifacts

- This challenge should take about 15 to 20 minutes to complete.

## The pipeline template
[Follow this link for the Jenkinsfile template](./Jenkinsfile) or view it below:

```Jenkinsfile
pipeline {
    agent any
    // Add a tool configuration here...
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
                    echo "Cleaning the workspace..."
                    // Uncomment the following line after Maven is configured as a global tool
                    // sh 'mvn clean'
                }
            }
        }
        stage('Test') {
            steps {
                dir("${env.WORKSPACE}/Ch05/05_04-challenge-create-artifacts-and-reports"){
                    echo "Running tests..."
                    // Uncomment the following line after Maven is configured as a global tool
                    // sh 'mvn test'
                }
            }
        }
        stage('Package') {
            steps {
                dir("${env.WORKSPACE}/Ch05/05_04-challenge-create-artifacts-and-reports"){
                    echo "Creating the JAR file..."
                    // Uncomment the following line after Maven is configured as a global tool
                    // sh 'mvn package -DskipTests'
                }
            }
        }
    }
    post {
        always {
            echo "Collecting jUnit test results..."
            // Add jUnit report collection here...

            echo "Archiving the JAR file..."
            // Add artifact archiving here...
        }
    }
}
```
