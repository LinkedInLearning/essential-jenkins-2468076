# 01_03 Solution: Deploy a Jenkins server
There are three basic requirements for this challenge:

1. Deploy a server running the latest version of Ubuntu Server.
1. Install NGINX as a proxy to Jenkins.
1. Install and configure Jenkins.

## Use a public cloud service
If at all possible, use a public cloud service for this challenge.

Suggestions:
- Amazon Web Services
- Google Cloud Platform
- Microsoft Azure
- Oracle Cloud
- Linode
- Digital Ocean

In later lessons, we’ll be implementing continuous integration from a code repo and your Jenkins server needs to be publicly accessible to allow a webhook to trigger jobs.

## Use locally available resources
If you aren't able to deploy Jenkins on a public cloud platform, please use the local system that you have available to you.

Jenkins runs on Windows, Mac OS, and Linux so you can install Jenkins just about anywhere.

_*PLEASE NOTE:* local installations will not be able to receive webhooks to trigger jobs._

However, You can still follow along with Jenkins installed on your local system.


## The Solution uses Amazon Web Services
The solution demonstrated in the course uses the Amazon web services public Cloud platform. Prerequisites to the solution include:

- Create a key pair for SSH connections
- Create an EC2 instance using a Ubuntu AMI
- Create an elastic IP for persistent DNS assignment

## Exercise files are available for this challenge.
There's a script that will update the Ubuntu OS, install NGINX, and install Jenkins. So you won’t have to do an installation from scratch.

- [jenkins-server-automated-installation.sh](jenkins-server-automated-installation.sh)

The script also installs the suggested plugins and skips the installation wizard.

The script should work on any cloud platform as long as you use the Ubuntu Server operating system.

If you're following along and installing on a different operating system particularly Windows or Mac OS, review the course “Learning Jenkins” for detailed instructions on installing Jenkins on those platforms.

This challenge should take about 15 minutes to complete.
