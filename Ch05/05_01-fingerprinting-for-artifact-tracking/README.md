# 05_01 Fingerprinting for artifact tracking

[Core function archiveArtifacts](https://www.jenkins.io/doc/pipeline/steps/core/)
[Copy Artifact Plugin](https://plugins.jenkins.io/copyartifact/)


## Create an artifact in a pipeline
The following pipeline uses a `post` block with an `always` stage.  The stages in the `post` block will run when the pipeline completes.  Any steps inside the `always` stage will run even if the build is unsuccessful.

Given this configuration, the `archiveArtifacts` step will always be run at the end of the pipeline.

```Jenkinsfile
pipeline {
    agent any
    options {
        copyArtifactPermission 'read-artifact'
    }
    stages {
        stage('Create-Artifact') {
            steps {
                // the `set` command is a built-in shell command that
                // prints the name and values of all variables visible
                // to the shell's environment.
                // https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html
                //
                // The following uses the `sh` build step to run the
                // `set` command on the local system.  Note that if this
                // pipeline is run on a system that does not have a
                // built-in `set` command, any builds of the pipeline
                // will fail.  This may be the case on systems running
                // Windows OS with Powershell.
                sh "set > report.txt"
            }
        }
    }
    post {
        always {
            archiveArtifacts allowEmptyArchive: true,
                artifacts: 'report.txt',
                fingerprint: true,
                followSymlinks: false,
                onlyIfSuccessful: true
        }
    }
}
```

## Read an artifact from another job
Job name must be `read-artifact` for permissions to work properly.

```Jenkinsfile
pipeline {
    agent any
    stages {
        stage('Read-Artifact') {
            steps {
                copyArtifacts projectName: 'create-artifact',
                    filter: 'report.txt',
                    fingerprintArtifacts: true,
                    selector: lastSuccessful()
            }
        }
    }
}
```
