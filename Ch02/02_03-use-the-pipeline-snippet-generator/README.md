# 02_03 Use the pipeline snippet generator

These are a few of the basic steps

```
echo    Print Message
git     Checkout code from a git repo
sh      Shell script
archive Archive artifacts
```

# Basic Steps Reference
For the complete list of basic steps, please take a look at the “basic steps reference” in the Jenkins documentation. In this list, you'll find dozens of the steps available for use in a pipeline.

[Basic steps reference](https://www.jenkins.io/doc/pipeline/steps/workflow-basic-steps/)

# Additional pipeline steps for tools and plugins
As you install plug-ins or extend the functionality of your Jenkins server, you'll find that many plugins expose their own pipeline steps.

For more information on these additional steps, you'll want to take a look at the Pipeline Steps Reference in the Jenkins documentation.

[More pipeline steps](https://www.jenkins.io/doc/pipeline/steps/)

# Pipeline syntax generator
Jenkins provides a pipeline syntax generator that we can use to crate Snippets of code that we can copy into a pipeline.

You can find the syntax generator by clicking the `Pipeline synax` link at the bottom of the pipeline editor window or by opening `[YOUR_JENKINS_SERVER_URL]/pipeline-syntax`.

Use the snippet generator to create a step for the following pipeline that archives all files ending with `.txt`:

```Jenkinsfile
pipeline {
    agent any
    stages {
        stage('Report') {
            steps {
                sh 'echo "this is a report" > report.txt'
            }
        }
    }
}
```

Find the solution in [archive step example](ARCHIVE_STEP_EXAMPLE.md).

