# 06_04 Challenge Configure users and permissions

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
