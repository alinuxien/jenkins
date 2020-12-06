Vagrant.configure("2") do |config|
  config.vm.define "jenkins" do |jenkins|
    jenkins.vm.box = "bento/ubuntu-20.04"
    jenkins.vm.box_version = "202010.24.0"
    jenkins.vm.hostname = "jenkins"
    jenkins.vm.network "forwarded_port", guest: 22, host: 2222, id: 'ssh'
    jenkins.vm.network "forwarded_port", guest: 8080, host: 8080
    jenkins.vm.network "forwarded_port", guest: 80, host: 8000
    jenkins.vm.network "forwarded_port", guest: 8001, host: 8001
# LA LIGNE CI-DESSOUS DOIT ETRE SUPPRIMEE / PERSONNALISEE
#    jenkins.vm.synced_folder "../PrestaShop", "/home/vagrant/PrestaShop", type: "virtualbox"
#    jenkins.vm.synced_folder "../presta-test", "/home/vagrant/presta-test", type: "virtualbox"
# LA LIGNE CI-DESSUS DOIT ETRE SUPPRIMEE / PERSONNALISEE
    jenkins.vm.provider "virtualbox" do |v|
      v.name = "jenkins"
      v.memory = 8192
      v.cpus = 8
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
      v.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 10000 ]
    end
    jenkins.vm.provision :shell, path: "bootstrap.sh"
#    jenkins.vm.provision :shell, path: "auto_cd.sh"
  end
end

