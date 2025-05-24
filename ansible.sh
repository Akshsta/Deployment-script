sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible
sudo nano /etc/ansible/hosts
====================================
#[servers]
#server1 ansible_host=203.0.113.111
#server2 ansible_host=203.0.113.112
#server3 ansible_host=203.0.113.113

#[all:vars]
#ansible_python_interpreter=/usr/bin/python3
===============================================
ansible-inventory --list -y
ansible all -m ping -u root
ansible all -a "df -h" -u root
ansible all -m apt -a "name=vim state=latest" -u root
#You can also target individual hosts, as well as groups and subgroups, when running Ansible commands. 
#For instance, this is how you would check the uptime of every host in the servers group:
ansible servers -a "uptime" -u root

#We can specify multiple hosts by separating them with colons:
ansible server1:server2 -m ping -u root
