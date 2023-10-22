# Deploy lamp stack

**Introduction**

This project automates the provisioning of two Ubuntu-based servers, named "Master" and "Slave," using Vagrant. The "Master" node is configured to deploy a LAMP (Linux, Apache, MySQL, PHP) stack, while the "Slave" node is provisioned using Ansible and a bash script.

**Requirements**

Vagrant installed on your local machine and VirtualBox or another compatible virtualization provider.

**Usage**
1. Clone this repository to your local machine.
2. Run 'vagrant up' to start and provision the VMs.
3. You can customize the LAMP stack further by modifying the script.sh script to suit your specific application requirements, such as database setup or web server configuration adjustments.

**File structure**

Every code file within the project has a distinct role, working in unison to facilitate automated provisioning, deploy the LAMP stack, and validate the environment.

**Vagrant file**

This is the configuration file for Vagrant, a tool for building and managing virtualized development environments. The Vagrantfile defines the virtual machines (VMs) you want to create and configure, specifying things like the base box (in your case, Ubuntu-based), network settings, and provisioning scripts. It's the blueprint for VMs.

**Bash scripting**

The script.sh on the "Master" node performs the following tasks:

1. System Updates: The script begins by updating the system packages to ensure that packages have the latest software.

2. Installation of LAMP Components: It installs Apache, MySQL, and PHP on the server, setting up the foundational components of the LAMP stack.

3. Cloning a PHP Application: The script clones a PHP application from a GitHub repository, allowing easy deployment and serving of web applications.

4. Package Installation: Any additional packages required for the PHP application are installed. This ensures that the application runs smoothly.

5. Apache and MySQL Configuration: The script configures the Apache web server and MySQL to make them compatible with the PHP application.

**Ansible provisioning on slave**

This is an Ansible playbook designed to be executed on the "Slave" server. It coordinates the execution of the script.sh from the "Master" server and performs other tasks:

1. Copying the Bash Script: The playbook copies the script.sh from the "Master" server to the "Slave" server, making it available for execution.
2. Executing the Bash Script: The playbook runs the bash script on the "Slave" server, allowing you to automate the setup of the LAMP stack on this server.
3. Cron Job Setup: It also sets up a cron job to check the server's uptime every day at 12 am. This is done using Ansible's capabilities to manage 

**Verifying PHP functionality**

Use either the VM's IP address or a domain name as the URL.

To get the VM's IP address run 'ifconfig' or 'ip addr' in your terminal.
