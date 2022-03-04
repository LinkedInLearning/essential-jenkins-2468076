# 02_05 Parameterize a pipeline

```
pipeline {
    agent any
    parameters {
        string(name: 'FATHER',
               defaultValue: 'Vader',
               description: 'Enter Your father’s name')

        text(name: 'PHRASE',
                description: 'Enter your favorite phrase from a Charles Dickens Book',
                defaultValue: 'It was the best of times, it was the worst of times,\nit was the age of wisdom, it was the age of foolishness,\nit was the epoch of belief, it was the epoch of incredulity,\nit was the season of light, it was the season of darkness,\nit was the spring of hope, it was the winter of despair.')

        booleanParam(name: 'RUN_TESTS',
                defaultValue: false,
                description: 'Toggle this value to run tests.')

        choice(name: 'AWS_REGION',
                choices: ['us-east-1', 'us-east-2', 'us-west-1', 'us-west-2'],
                description: 'Select the AWS region for deployment.')

        password(name: 'DATABASE_PASSWORD',
                defaultValue: 'DATABASE_PASSWORD',
                description: 'Enter the database password')
    }
    stages {
        stage('Example') {
            steps {
                echo "I am your father.  My name is ${params.FATHER}"
                echo "My favorite phrase is ${params.PHRASE}"
                echo "Will I rule the universe? ${params.RUN_TESTS}"
                echo "I live in ${params.AWS_REGION}"
                echo "Can I tell you a secret? ${params.DATABASE_PASSWORD}"
            }
        }
    }
}
```
