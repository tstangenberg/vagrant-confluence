# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "1"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "official-precise32"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-i386-vagrant-disk1.box"
  config.vm.customize ["modifyvm", :id, "--ioapic", "on", "--memory", "2048", "--cpus", "2"]
  config.vm.forward_port 8090, 8090
  config.vm.host_name = "confluence"
  # config.vm.provision :puppet, :module_path => "modules" do |puppet|
  config.vm.provision :puppet, :options => "--verbose --debug", :module_path => "modules" do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file  = "default.pp"
  end
end
