# 03_06 Solution Connect Jenkins to GitHub

You're on a team developing an algorithm that calculates the value of pi.

The code for the project is being stored in a GitHub repository. The team wants to test the latest changes to the algorithm with every push to the repo.

They also want to display the status of that most recent test directly in the repo’s README file.

## Tasks
- [ ] Create a new GitHub repo and add the exercise files for this lesson.
  - [ ] [Jenkinsfile](./Jenkinsfile)
  - [ ] [algorithm.sh](./algorithm.sh)
- [ ] Create a new pipeline project that pulls the code from the repo and uses the Jenkinsfile for the project definition.
- [ ] Install the Embeddable status plug-in and update the GitHub repo to show the status of the project.

_*This challenge should take about 15 to 20 minutes to complete.*_

## Tips
- Successfully building the project will create a artifact named `report.txt`.
- Review the contents of the report for more information.

## Solution
- Create a new repo on GitHub.com and include a README.md file during the creation process.
  - Add the `Jenkinsfile` and the `algorithm.sh` script to the repo.
  - Select the `Code` button.
  - Select `HTTPS`.
  - Select the stacked squares icon to copy the repo URL to the clipboard.

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
    - Review the contents of the `report.txt` archive file.
    - Copy the URL of your Jenkins server.

- Go back to the GitHub repo and configure the settings to create a webhook for the project you just created.
  - Select `Settings` &rarr; `Webhooks` &rarr; `Add webhook`.
  - Under `Payload URL`, paste in the URL for your Jenkins server.
  - Immediately after the Jenkins server URL, add `/github-webhook/`.
  - *NOTE: Please be sure to include the trailing slash on `github-webhook/`.  The field should be in a format similar to `http://your-jenkins-server.com/github-webhook/`.*
  - Under `Content type`, select `application/json`.
  - `Add webhook`
  - *NOTE: GitHub will ping the Jenkins server and indicate a successful connection with a green check-mark next to the webhook name.  If your webhook does not indicate that it connected successfully, select `Edit` and confirm your settings again.  If needed, delete the webhook and start over.*
  - Select the `<>Code` tab.
  - Edit the `algorithm.sh` file.
    - Click the pencil icon.
    - Add and remove commented lines as instructed by the directions in the script.
    - Click `Commit changes`.
  - Go to the Jenkins server and observe the job being triggered by the change you just made in GitHub.
  - *NOTE: If your job is not triggered, review the configuration for the Jenkins job and the GitHub repo, making any adjustments as needed.  If needed, start again with a new job in Jenkins or with a new webhook in GitHub.*
  - Review the contents of the `report.txt` artifact.

- Add the build status badge to a GitHub repo's README file.
  - Select `Embeddable Build Status`.
  - Locate the `Markdown` section and copy the code snippet under `unprotected`.

  - Create a new GitHub repo or use one from a previous lesson.
  - Edit the `README.md` file in the repo associated with the job that provided the build status snippet.
  - Paste the snippet at the top of the file.
  - Commit the file.
  - Confirm that the status badge appears in the file.

## Solution summary
To successfully complete this challenge you will have:
- Created a GitHub repo and connected it to a pipeline job on your Jenkins server
- Configured the repo to trigger a pipeline build when changes are pushed to the repo
- Added a build status badge to the README file in the repo.
