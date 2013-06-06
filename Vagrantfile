# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu-12.04"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--vtxvpid", "off"]
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    vb.customize ["modifyvm", :id, "--cpus", "1"]
  end

  config.vbguest.auto_update = false

  # Configure network interface
  config.vm.network :private_network, ip: "192.168.129.254"
  config.vm.hostname = "sandbox"

  # NFS shared folders
  config.vm.synced_folder "share/", "/share", :nfs => true

  config.vm.provision :ansible do |ansible|
    # point Vagrant at the location of your playbook you want to run
    ansible.playbook = "provision/provision.yml"

    # the Vagrant VM will be put in this host group change this should
    # match the host group in your playbook you want to test
    ansible.hosts = "sandbox"
  end
end
