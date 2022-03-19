# 06_01 Secure Jenkins with user accounts
Jenkins provides some security features by default.  For example, new installations are locked and require an initial admin password.

Jenkins also allows you to create user accounts with usernames and passwords.  This is a common approach for setting up boundaries for who can log in.

## Security Realms
Briefly, a security realm controls how a person is authenticated to access a resource.

Jenkins provides a built-in security realm and can be configured to work with external security realms.

## Authorization
The default authorization allows all authenticated users to perform any operations.

A best practice is to limit admin permission to a few, select users and give limited permissions to other users as needed.

## Matrix-based Security
To configure user permissions, most Jenkins installations will use the [Matrix authorization strategy plugin](https://plugins.jenkins.io/matrix-auth/).  This is one of the suggested plugins that gets installed in most Jenkins installations.

Using a matrix strategy, permissions are assigned to each user individually.  

In addition, each user is given specific permission to perform certain actions.

## ATTENTION: Switching to Matrix-based Security
When setting up Matrix-based security, please be sure to give your user administrative permissions. Also, if you created an admin user, assign admin permissions to the admin user as well.

_*If you do not assign admin permissions to your account or an admin account, you run the risk of locking yourself out of your Jenkins server.*_

See the resources for more information.

## Resources
View the following documents for more information on security configurations in Jenkins.

- [Managing Security](https://www.jenkins.io/doc/book/security/managing-security/)

- [Permissions](https://www.jenkins.io/doc/book/security/permissions/)

- [Disable Access Control](https://www.jenkins.io/doc/book/security/access-control/disable/)
