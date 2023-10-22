# Deploy lamp stack

**Introduction**

This project automates the provisioning of two Ubuntu-based servers, named "Master" and "Slave," using Vagrant. The "Master" node is configured to deploy a LAMP (Linux, Apache, MySQL, PHP) stack, while the "Slave" node is provisioned using Ansible and a bash script.

**Requirements**

Vagrant installed on your local machine and VirtualBox or another compatible virtualization provider.

**Usage**
1. Clone this repository to your local machine.
2. Run 'vagrant up' to start and provision the VMs.

**Bash scripting**

The script.sh on the "Master" node performs the following tasks:

1. Updates the system and installs Apache, MySQL, and PHP.
2. Clones a PHP application from GitHub.
3. Installs necessary packages for the PHP application.
4. Configures the Apache web server and MySQL.

**Ansible provisioning on slave**
Using Ansible, the execute_script.yml playbook executes the script.sh on the "Slave" node. This Ansible playbook also sets up a cron job to check the server's uptime at 12 am.
