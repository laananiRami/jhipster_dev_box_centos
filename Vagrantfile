# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  
  config.vm.box = "centos/7"
  config.vm.box_url = "../CentOS-7-x86_64-Vagrant-1611_01.VirtualBox.box"
  config.vm.synced_folder ".", "/vagrant", type: "virtualbox"
  config.vm.provision :shell, path: "scripts/setup.sh"
  config.vm.provision :shell, path: "scripts/jdk-install.sh"
  config.vm.provision :shell, path: "scripts/maven-install.sh"
  config.vm.provision :shell, path: "scripts/heroku.sh"
  config.vm.network :forwarded_port, host: 8181, guest: 8080
  config.vm.network :forwarded_port, host: 9001, guest: 9000
  
  config.vm.provider :virtualbox do |vb|
		#vb.gui = true
        # Use VBoxManage to customize the VM. For example to change memory:
        vb.customize ["modifyvm", :id, "--name", "jhipster_dev_box"]
		vb.customize ["modifyvm", :id, "--memory", "4096"]
        vb.customize ["modifyvm", :id, "--vram", 64]
        vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
        vb.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
        vb.customize ['modifyvm', :id, '--draganddrop', 'bidirectional']
    end
end
