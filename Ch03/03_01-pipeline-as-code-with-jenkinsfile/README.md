# 03_01 Pipeline as code with Jenkinsfile

The `Jenkinsfile` format is used to capture pipeline definition as code.

The file is text and can be stored and tracked in a version control system with other project files.

`Jenkinsfile` can also be used to define project configuration including tools, options, and triggers.

Storing the Jenkinsfile in repo also allows development teams to use a GitOps approach to development. 

## Use the Default Jenkinsfile for this Repo
- Create a new pipeline job on a Jenkins server.
- Under `Pipeline`, select `Pipeline script from SCM`.
- Under `SCM`, select `Git`.
- Under `Repository URL`, enter the URL for this repo: `https://github.com/LinkedInLearning/essential-jenkins-2468076`
- You will not need to enter any credentials.
- Under `Branch Specifier (blank for 'any')`, change `master` to `main`.
- Leave the `Script Path` as the default.
- Click `Save` then click `Build Now`.
- Observe the two stages in the pipeline:
  - *Declarative: Checkout SCM*
  - *Hello! Please read the logs.*
- View the output from the *Hello! Please read the logs.* stage.

Follow this link to view the [Jenkinsfile in the root of this repo](../../Jenkinsfile).

## References
- [What is Jenkins Pipeline?](https://www.jenkins.io/doc/book/pipeline/#overview)
- [What is GitOps?](https://www.cloudbees.com/gitops/what-is-gitops)

