# 06_05 Solution Configure users and permissions

You manage a Jenkins server that’s being used by two development teams: One Team develops engineering applications and the other team develops finance applications.

The Finance team is developing a new application that will process sensitive information.

They've asked you to demonstrate how they can secure their pipeline jobs by limiting access to one specific user.

## Requirements
- Create users and configure security
    - Create two users: one named `engineering` and another named `finance`
    - Change the security configuration on your Jenkins server to use a project-based authorization strategy
    - Assign the "Overall read" permission to both users
- Demonstrate limited access
    - Create two folders: one named `Engineering-Jobs` and another named `Finance-Jobs`.
    - Assign admin permissions to both users in the folder that corresponds to the user name.
    - And finally, demonstrate how the engineering user can’t access or manage items inside the Finance-Jobs folder.

This challenge should take 10 to 15 minutes to complete.

## Solution
- Create users and configure security
  - Connect to Jenkins as an admin user.
  - Select `Manage Jenkins` &arr; `Manage Users` &arr; `Create User`.
  - Enter the details for the `engineering` user.
  - Select `Create User`.
  - Select `Create User`.
  - Enter the details for the `finance` user.
  - Select `Create User`.
  - Select `Manage Jenkins` &arr; `Configure Global Security`.
  - Select the radio button next to `Project-based Matrix Authorization Strategy`.
  - Select `Add user...`
  - Enter the name of your admin account.
  - On the far right side of the matrix, select the option to check all boxes for the admin account.
  - Select `Add user...`.
  - Enter `engineering`. Select `OK`.
  - Select `Add user...`.
  - Enter `finance`. Select `OK`.
  - Select the `Overall Read` permission for the engineering and finance users.
  - Select `Save`.
  - You may be prompted with the following message:
    - _*Builds in Jenkins run as the virtual Jenkins SYSTEM user with full Jenkins permissions by default. This can be a problem if some users have restricted or no access to some jobs, but can configure others. If that is the case, it is recommended to install a plugin implementing build authentication, and to override this default.*_
    - Review the following document for more information [Access Control for Builds
  ](https://www.jenkins.io/doc/book/security/build-authorization/)
    - Select `Dismiss` to proceed.

- Create a folder with limited access for the Engineering team
  - Select `Dashboard` &arr; `New Item`.
  - Enter the name `Engineering-Jobs` &arr; `Folder` &arr; `OK`.
  - Select the check-box next to `Enable project-based security`.
  - Select `Add user...`.
  - Enter `engineering`. Select `OK`.
  - Select `Save`.
  - Select `New Item`.
  - Enter the name `Engineering-Jobs` &arr; `Folder` &arr; `OK`.
  - Select the check-box next to `Enable project-based security`.
  - Select `Add user...`.
  - Enter `engineering`. Select `OK`.
  - On the far right side of the matrix, select the option to check all boxes for the engineering account.
  - Select `Save`.

- Create a folder with limited access for the Finance team
  - Select `Dashboard` &arr; `New Item`.
  - Enter the name `Finance-Jobs` &arr; `Folder` &arr; `OK`.
  - Select the check-box next to `Enable project-based security`.
  - Select `Add user...`.
  - Enter `finance`. Select `OK`.
  - Select `Save`.
  - Select `New Item`.
  - Enter the name `Finance-Jobs` &arr; `Folder` &arr; `OK`.
  - Select the check-box next to `Enable project-based security`.
  - Select `Add user...`.
  - Enter `finance`. Select `OK`.
  - On the far right side of the matrix, select the option to check all boxes for the finance account.
  - Select `Save`.

- Demonstrate limited access
  - Log out of the admin account.
  - Log in as the `engineering` user.
  - Confirm that the engineering user is not able to access the `Finance-Jobs` folder.
  - Log out of the engineering account.
  - Log in as the `finance` user.
  - Confirm that the finance user is not able to access the `Engineering-Jobs` folder.
