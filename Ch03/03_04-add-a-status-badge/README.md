# 03_04 Add a status badge
Status Badges are dynamically generated images that communicate whether a build is passing or failing.

Following is an example status badge for a passing build:

![Build Status](https://img.shields.io/badge/build-passing-brightgreen)

Typically, status badges are placed in the README file for a GitHub repository.  However, they can also be embedded in web pages or other online documents.

To enable status badges, your Jenkins server must have the [Embeddable Build Status Plugin](https://plugins.jenkins.io/embeddable-build-status/) installed.

## Add a status badge to a GitHub repo's README.md file
- Install the `Embeddable Build Status Plugin`.
  - In your Jenkins server, Select `Manage Jenkins` &rarr; `Manage Plugins`.
  - Select the `Available` tab.
  - Filter for `embed`.
  - Select the checkbox next to `Embeddable Build Status Plugin`.
  - Select `Download now and install after restart`.
  - Select `Restart Jenkins when no jobs are running`.
  - Wait for Jenkins to restart.  Log in.

- Generate a build status badge
  - Select an existing job or create a new one.
  - Select `Embeddable Build Status`.
  - Locate the `Markdown` section and copy the code snippet under `unprotected`.

- Add the build status badge to a GitHub repo's README file.
  - Create a new GitHub repo or use one from a previous lesson. 
  - Edit the `README.md` file in the repo associated with the job that provided the build status snippet.
  - Paste the snippet at the top of the file.
  - Commit the file.
  - Confirm that the status badge appears in the file.

