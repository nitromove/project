# Deploy lamp stack

**Introduction**

This project automates the provisioning of two Ubuntu-based servers, named "Master" and "Slave," using Vagrant. The "Master" node is configured to deploy a LAMP (Linux, Apache, MySQL, PHP) stack, while the "Slave" node is provisioned using Ansible and a bash script.

**Requirements**

Vagrant installed on your local machine and VirtualBox or another compatible virtualization provider.

**Usage**
1. Clone this repository to your local machine.
2. Run 'vagrant up' to start and provision the VMs.
3. You can customize the LAMP stack further by modifying the script.sh script to suit your specific application requirements, such as database setup or web server configuration adjustments.

**Bash scripting**

The script.sh on the "Master" node performs the following tasks:

1. Updates the system and installs Apache, MySQL, and PHP.
2. Clones a PHP application from GitHub.
3. Installs necessary packages for the PHP application.
4. Configures the Apache web server and MySQL.

**Ansible provisioning on slave**

This is an Ansible playbook designed to be executed on the "Slave" server. It coordinates the execution of the script.sh from the "Master" server and performs other tasks:

1. Copying the Bash Script: The playbook copies the script.sh from the "Master" server to the "Slave" server, making it available for execution.
2. Executing the Bash Script: The playbook runs the bash script on the "Slave" server, allowing you to automate the setup of the LAMP stack on this server.
3. Cron Job Setup: It also sets up a cron job to check the server's uptime every day at 12 am. This is done using Ansible's capabilities to manage 
