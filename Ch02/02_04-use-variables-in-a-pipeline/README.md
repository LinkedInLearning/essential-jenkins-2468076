# 02_04 Use variables in a pipeline
Jenkins exposes three different types of variables that we can use in our pipeline:

- Environment variables
- currentBuild variables
- Parameters.

Variables let us use dynamic values in pipelines.

This lesson will focus on environment variables and current build variables. We'll use another lesson to discuss parameters.

# Environment variables
Environment variables can be set globally for an entire pipeline. Or they can be set locally in a stage.

# currentBuild variables
"currentBuild" variables (the name is case sensitive) allow pipeline steps to reference the state of a build while its running.

# Global Variables Reference
You can find documentation for global variables by starting on the homepage for a pipeline job and then viewing:

- `Pipeline Syntax` &rarr; `Global Variables Reference`
# Global and local variables
Use the following pipeline to see a demonstration of how global environment variables can be overridden by local environment variables.

```Jenkinsfile
pipeline {
    agent any
    environment {
        MAX_SIZE = 10
        MIN_SIZE = 1
    }
    stages {
        stage('Default Scale') {
            steps {
                echo "MAX_SIZE = ${env.MAX_SIZE}"
                echo "MIN_SIZE = ${env.MIN_SIZE}"
            }
        }
        stage('Scale by 10x') {
            environment {
                MAX_SIZE = 100
                MIN_SIZE = 10
            }
            steps {
                echo "MAX_SIZE = ${env.MAX_SIZE}"
                echo "MIN_SIZE = ${env.MIN_SIZE}"
            }
        }
    }
}
```

# Bonus: Pipeline that prints "most" global variables
View the following file for a bonus pipeline that prints "most" global variables.

[PIPELINE_WITH_MOST_VARIABLES](PIPELINE_WITH_MOST_VARIABLES.md)
