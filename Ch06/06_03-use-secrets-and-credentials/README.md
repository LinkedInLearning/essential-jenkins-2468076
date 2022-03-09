# 06_03 Use secrets and credentials
Jenkins can store and manage sensitive values natively.

Sensitive values are referred to as secrets or credentials.  Both terms are used with the same meaning in this course.

## Types of credentials
Jenkins supports several types of credentials including
- Usernames and passwords
- SSH Keys
- Files
- Text strings

Installing plugins may expose other types of credentials.

## Accessing credentials in a pipeline
Credentials can be accessed several ways in a pipeline but the two most common ways are using the `credentials()` function or the `withCredentials(){}` step.

## Accessing credentials with credentials()
The credentials function is used to assign sensitive values to one or more environment variables.  It takes the ID of a secret stored in Jenkins as its argument.

With most credential types, `credentials()` will return one value.
```
environment {
    SECRET_VALUE = credentials(‘secret-value’)
}

env.SECRET_VALUE 
```

However, when the credentials function is used with a username and password credential, three variables are returned.

```
environment {
    LOGIN = credentials(‘login’)
}

env.LOGIN
env.LOGIN_USR
env.LOGIN_PSW
```


## Accessing credentials with withCredentials(){}
`withCredentials` is a build step that retrieves a secret value and assigns it to a variable.  Any steps that are placed inside the withCredentials step will have access to the secret.

```
steps {
    withCredentials([string(credentialsId: 'apikey', variable: 'API_KEY')]) {
        echo “${env.API_KEY}”
    }
}
```

## Example pipeline using credentials
Use the following pipeline to experiment with accessing credentials.  

Before running the pipeline, create two credentials:

- `user1` using the "Username and password" type
- `apikey` using the "Secret text" type
  
Review the output after running the pipeline to note any references to the values the credentials contain.

```Jenkinsfile
pipeline {
    agent any
    environment {
      USER1 = credentials('user1')
    }
    stages {
        stage('Test') {
            steps {
                withCredentials([string(credentialsId: 'apikey', variable: 'APIKEY')]) {
                    echo env.APIKEY
                    echo env.USER1
                    echo env.USER1_USR
                    echo env.USER1_PSW

                    // This should cause a warning
                    echo "${env.APIKEY}"
                }
            }
        }
    }
}
```