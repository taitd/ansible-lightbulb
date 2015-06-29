#!/usr/bin/env bash

# install ansible (http://docs.ansible.com/intro_installation.html)
apt-get -y install software-properties-common
apt-add-repository -y ppa:ansible/ansible
apt-get update
apt-get -y install ansible
# install utils on my host machine
apt-get -y install curl tree git
# install apache bench on my host machine
sudo apt-get install apache2-utils
# install ec2 boto 
apt-get -y install python-pip
pip install -U boto

# copy lessons into /home/vagrant (from inside the mgmt node)
cp -a /vagrant/lessons/* /home/vagrant
chown -R vagrant:vagrant /home/vagrant

# configure hosts file for our internal network defined by Vagrantfile
cat >> /etc/hosts <<EOL
# vagrant environment nodes
10.42.0.5   mgmt
10.42.0.6   node-1
10.42.0.7   node-2
10.42.0.8   node-3
10.42.0.100 haproxy
10.42.0.200 tower
EOL