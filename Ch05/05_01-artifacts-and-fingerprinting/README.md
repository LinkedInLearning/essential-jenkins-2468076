# 05_01 Artifacts and Fingerprinting
Creating artifacts is a core function of the Jenkins server. Review the following document for more information on configuring a pipeline to create artifacts.  The document also explains fingerprinting which is a method used by Jenkins to track where an artifact was created or used.
- [Core function archiveArtifacts](https://www.jenkins.io/doc/pipeline/steps/core/)
- [Fingerprinting](https://www.jenkins.io/doc/pipeline/steps/core/#fingerprint-record-fingerprints-of-files-to-track-usage)

The Copy Artifact Plugin allows pipelines to copy artifacts into a job from other projects.
- [Copy Artifact Plugin](https://plugins.jenkins.io/copyartifact/)

*PLEASE INSTALL THE COPY ARTIFACT PLUGIN ON YOUR JENKINS SERVER BEFORE USING THE FOLLOWING PIPELINE SCRIPTS.*

## Create an artifact in a pipeline
The following pipeline uses a `post` block with an `always` stage.  The stages in the `post` block will run when the pipeline completes.  Any steps inside the `always` stage will run even if the build is unsuccessful.

Given this configuration, the `archiveArtifacts` step will always be run at the end of the pipeline.

- Create a pipeline project named `create-artifact` using the following pipeline:
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
- Create a pipeline project named `read-artifact` using the following pipeline:

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

Run the `create-artifact` job and then run the `read-artifact` job.  Review the output of one of the builds from `create-artifact` to see the artifact fingerprints.
