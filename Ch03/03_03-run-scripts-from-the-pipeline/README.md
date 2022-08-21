# 03_03 Run scripts from the pipeline

Pipelines can be used to call scripts that are stored in a repo along with a Jenkinsfile.

## Pipeline steps for calling scripts

The `sh()` build step is used to run shell commands on Linux, Unix, and macOS systems.

The `bat()` build step is used to run shell commands on Windows systems.

## Paths to scripts
Relative paths can be used to reference files from the root of the repo.
```
sh(‘./scripts/build.sh’)
bat(‘..\scripts\build.bat’)
```

Absolute paths can be used to reference files in the workspace or in other locations on the systems where the job is being run.
```
sh(‘/usr/local/bin/build.sh’)
bat(‘C:\bin\build.bat’)
```
The `dir()` build step can be used to change directories for other build steps.
```
dir("${env.WORKSPACE}/environments/test"){
sh(‘’’
    terraform init
    terraform plan
‘’’)
}
```

## The exercise files
The exercise files for this lesson include a [Jenkinsfile](./Jenkinsfile) and a [script that calculates a Fibonacci sequence](./fibonacci.sh).

- Create a new GitHub repo and add the exercise files.
  - Add the `Jenkinsfile` to the root of the repo.
  - Add the `fibonacci.sh` file to a directory named `scripts`.
  
- *NOTE: The `fibonacci.sh` file must be placed in a subdirectory named `scripts` for the pipeline to run successfully.*

- Create a new pipeline project in your Jenkins server.
    - Select `New Item`
    - Enter item name (use the same name as your repo if possible)
    - Select `Pipeline` project
    - `OK`
    - Select `GitHub Project` and paste in the repo URL.
      - *NOTE: This step is optional.  It only creates a link to the repo on the project home page.*
    - Under `Build Triggers`, select the checkbox next to `GitHub hook trigger for GITScm polling`.
    - Under `Pipeline`, select `Pipeline script from SCM`.
    - Under SCM, select `Git`.
    - Under `Repository URL`, paste in the repo URL.
    - Under `Branch Specifier (blank for 'any')`, change `master` to `main`.
    - `Save` &rarr; `Build Now`.
    - *NOTE: The project must run at least one successful build before connecting to GitHub.  This allows Jenkins to read the configuration from the repo.*
    - Copy the URL of your Jenkins server.

- Go back to the GitHub repo and configure the settings to create a webhook for the project you just created.
  - Select `Settings` &rarr; `Webhooks` &rarr; `Add webhook`.
  - Under `Payload URL`, paste in the URL for your Jenkins server.
  - Immediately after the Jenkins server URL, add `/github-webhook/`.
  - *NOTE: Please be sure to include the trailing slash on `github-webhook/`.  The field should be in a format similar to `http://jenkins_url/github-webhook/`.*
  - Under `Content type`, select `application/json`.
  - `Add webhook`
  - *NOTE: GitHub will ping the Jenkins server and indicate a successful connection with a green checkmark next to the webhook name.  If your webhook does not indicate that it connected successfully, select `Edit` and confirm your settings again.  If needed, delete the webhook and start over.*
  - Select the `<>Code` tab.
  - Make a change to the README.md file.
    - Click the pencil icon.
    - Make a change to the file.
    - Click `Commit changes`.
  - Go to the Jenkins server and observe the job being triggered by the change you just made in GitHub.
  - *NOTE: If your job is not triggered, review the configuration for the Jenkins job and the GitHub repo, making any adjustments as needed.  If needed, start again with a new job in Jenkins or with a new webhook in GitHub.*
