# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"


Vagrant.configure(VAGRANTFILE_API_VERSION) do |cluster|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.

  
# create mgmt node
cluster.vm.define :mgmt do |mgmt_config|
    mgmt_config.vm.box = "ubuntu/trusty64"
    mgmt_config.vm.hostname = "mgmt"
    mgmt_config.vm.network :private_network, ip: "10.42.0.5"
    mgmt_config.vm.provider "virtualbox" do |vb|
      vb.memory = "256"
    end
    mgmt_config.vm.provision :shell, path: "bootstrap-mgmt.sh"
end
  
cluster.vm.define "node-1" do |config|
  config.vm.box = "chef/centos-6.5"
  config.ssh.insert_key = false
  config.vm.provider :virtualbox do |vb, override|
    vb.customize ["modifyvm", :id, "--memory", "128"]
    vb.customize ["modifyvm", :id, "--cpus", "1"]
  end
  config.vm.hostname = "node-1"
  config.vm.network :private_network, ip: "10.42.0.6"
  config.vm.provision :shell, path: "provision-libselinux-python.sh"
end

cluster.vm.define "node-2" do |config|
  config.vm.box = "chef/centos-6.5"
  config.ssh.insert_key = false
  config.vm.provider :virtualbox do |vb, override|
    vb.customize ["modifyvm", :id, "--memory", "128"]
    vb.customize ["modifyvm", :id, "--cpus", "1"]
  end
  config.vm.hostname = "node-2"
  config.vm.network :private_network, ip: "10.42.0.7"
  config.vm.provision :shell, path: "provision-libselinux-python.sh"  
end

cluster.vm.define "node-3" do |config|
  config.vm.box = "chef/ubuntu-12.04"
  config.ssh.insert_key = false
  config.vm.provider :virtualbox do |vb, override|
    vb.customize ["modifyvm", :id, "--memory", "128"]
    vb.customize ["modifyvm", :id, "--cpus", "1"]
  end
  config.vm.hostname = "node-3"
  config.vm.network :private_network, ip: "10.42.0.8"
end

cluster.vm.define "haproxy" do |config|
  config.vm.box = "chef/centos-6.5"
  config.ssh.insert_key = false
  config.vm.provider :virtualbox do |vb, override|
    vb.customize ["modifyvm", :id, "--memory", "128"]
    vb.customize ["modifyvm", :id, "--cpus", "1"]
  end
  config.vm.hostname = "haproxy"
  config.vm.network :private_network, ip: "10.42.0.100"
  config.vm.provision :shell, path: "provision-libselinux-python.sh"  
end


cluster.vm.define "tower" do |config|
  config.vm.box = "chef/centos-6.5"
  config.ssh.insert_key = false
  config.vm.provider :virtualbox do |vb, override|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
    vb.customize ["modifyvm", :id, "--cpus", "1"]
  end
  config.vm.hostname = "tower"
  config.vm.network :private_network, ip: "10.42.0.200"
end
end
