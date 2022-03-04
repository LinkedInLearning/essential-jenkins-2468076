# 02_06 Use conditional expressions and manual approvals
When we’re developing pipelines, we might need to use logic to determine if a stage should be run or not.  We might also need to add some sort of manual interaction to an automated process.  

## Conditionals
To set up a pipeline condition, we use the `when` keyword inside a stage block.  
```
pipeline {
   agent any
   stages {
      stage('XYZ') {
         when {}
      }
   }
}
```

A `when` block can use three built-in conditions to determine if the the steps in a stage should be run.  The conditions are:

|Condition  |Syntax                                                       |
|:----------|:------------------------------------------------------------|
|branch     |`when { branch 'main' }`                                     |
|environment|`when { environment name: 'DEPLOY_TO', value: 'production' }`|
|expression |`when { expression { params.ENVIRONMENT == 'PRODUCTION' }}`  |

Expression conditions provide the most flexibility for conditionals statements.  We can use Groovy expressions along with parameters and other variables to build a statement that returns true or false.

Review the following document for more information on Groovy expressions:
- [The Apache Groovy programming language - Operators](https://groovy-lang.org/operators.html)

## Manual Approvals
The input step pauses a triggered pipeline and waits for manual interaction to determine if the pipeline should proceed or abort.
```
pipeline {
   agent any
   stages {
      stage('XYZ') {
         steps {
            input message: 'Confirm deployment to production...', ok: 'Deploy'
         }
      }
   }
}
```
Review the following document for more information on the `input` step:
- [Pipeline: Input Step](https://www.jenkins.io/doc/pipeline/steps/pipeline-input-step/)

## Example using conditional and manual approval
Use the following pipeline script in a new project to experiment with conditionals and manual approvals.

```
pipeline {
    agent any
    parameters {
        choice(name: 'ENVIRONMENT',
            choices: ['DEVELOPMENT' , 'STAGING', 'PRODUCTION'],
            description: 'Choose the environment for this deployment')
    }

    stages {
        stage ('Build') {
            steps {
                echo "Building..."
            }
        }
        stage ('Deploy to non-production environments') {
            when {
                // Only deploy if the environment is NOT production
                expression { params.ENVIRONMENT != 'PRODUCTION' }
            }
            steps {
                echo "Deploying to ${params.ENVIRONMENT}"
            }
        }
        stage ('Deploy to production environment') {
            when {
                expression { params.ENVIRONMENT == 'PRODUCTION' }
            }
            steps {
                input message: 'Confirm deployment to production...', ok: 'Deploy'
                echo "Deploying to ${params.ENVIRONMENT}"
            }
        }
    }
}
```
