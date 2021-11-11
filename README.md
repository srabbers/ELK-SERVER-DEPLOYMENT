## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![alt text](https://github.com/srabbers/ELK-Server-Deployment/blob/main/Diagrams/ELK-Stack-Topology.drawio.png "ELK-Stack-Topology")

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.
 
  - [DVWA-playbook](https://github.com/srabbers/ELK-Server-Deployment/blob/main/Ansible/ansible_config.yml)
  - [Install-ELK](https://github.com/srabbers/ELK-Server-Deployment/blob/main/Ansible/install-elk.yml)
  - [Metricbeat-playbook](https://github.com/srabbers/ELK-Server-Deployment/blob/main/Ansible/metricbeat-playbook.yml)
  - [Filebeat-playbook](https://github.com/srabbers/ELK-Server-Deployment/blob/main/Ansible/filebeat-playbook.yml)

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology 

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.

Load Balancing plays an important security role as computing moves evermore to the cloud. The off-loading function of a load balancer defends an organization against distributed denial-of-service (DDoS) attacks.

What is the advantage of a jump box? It can be used to access devices in a separate security zone.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the data and system logs.

-Filebeat monitors the log files or locations that you specify, collects log events, and forwards them either to Elasticsearch or Logstash for indexing.

-Metricbeat helps you monitor your servers by collecting metrics from the system and services running on the server.

The configuration details of each machine may be found below.

|   Name     |  Function  | IP Address | Operating System |
|------------|------------|------------|------------------|
|  Jump-Box  |  Gateway   |  10.0.0.4  |      Linux       |
|   Web-1    | Web Server |  10.0.0.5  |      Linux       |
|   Web-2    | Web Server |  10.0.0.6  |      Linux       |
| ELK-Server | Monitoring |  10.1.0.4  |      Linux       |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump-box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- _Admin's Local IP address via SSH_

Machines within the network can only be accessed by ____.
- _The JumpBox-Provisioner is the only machine that has access to the machines within the network, which is why it is referred to as the 'gateway' in the table above. It's IP address is 10.0.0.4_

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 | Admin local IP       |
|   Web-1  | No,via JumpBox only | 10.0.0.1             |
|   Web-2  | No,via JumpBox only | 10.0.0.1             |
|    ELK   | No,via JumpBox only | 10.0.0.1             |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- _The configuration and/or update of multiple machines simultaneously is a process that is significantly simplified as opposed to doing it manually for each machine. Any changes that need to be implemented can be added or edited within the ansible playbook file. Once ran, the playbook file will deploy those changes to every machine that is configured with that playbook. Not only does process exponentially save time, it also significantly reduces the margin of error as all machines will be running off of the same playbook file, rather than risking human error while configuring each machine individually._

The playbook implements the following tasks:
- Install docker.io
- Install python-pip3
- Install docker python module
- Use more system memory
- Download and launch docker elk container
- Enable docker service on boot

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![alt text](https://github.com/srabbers/ELK-Server-Deployment/blob/main/Diagrams/Successful_elk_config.PNG "Successful-ELK-Deployment")

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1 (10.0.0.5)
- Web-2 (10.0.0.6)

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat collects file system data. It is useful in detecting any changes that could be made on specific important files. These logs are also time-stamped, so the user will know when the change occurred. For example, if a hacker gains access to the /etc/passwd file and attempts to make a change, those actions will be logged and sent to Elasticsearch within the ELK machine.
- Metricbeat is used for gathering operational metrics and statistics about the machine being monitored. Some examples of metricbeat monitoring include CPU usage, memory, status of running services, etc. Metricbeat will collect this data and ship it to the destination specified by the user, for example, Elasticsearch.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the playbook file to /etc/ansible.
- Update the hosts to include Web-1, Web-2, and ELK IP addresses (10.0.0.5 10.0.0.6 10.1.0.4)
- Run the playbook, and navigate to http://10.1.0.4:5601 to check that the installation worked as expected.

### Extras
- Which file is the playbook? Where do you copy it?
  - The playbook files are elk.yml, filebeat.yml, and metricbeat.yml. All of these files should be copied into the /etc/ansible folder.
- Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?
  - The hosts file is updated to include the IP's of Web-1, Web-2, and the elk server. Adding 'elk' or 'webservers' at the end of your playbook command will specify which machine the installation is intended for.
- Which URL do you navigate to in order to check that the ELK server is running?
  - After running the playbook command, navigate to http://10.1.0.4:5601 to confirm that the installation was successful.
