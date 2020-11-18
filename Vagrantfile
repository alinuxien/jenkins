Vagrant.configure("2") do |config|
  config.vm.define "jenkins" do |jenkins|
    jenkins.vm.box = "hashicorp/bionic64"
    jenkins.vm.box_version = "1.0.282"
    jenkins.vm.hostname = "jenkins"
    jenkins.vm.network "forwarded_port", guest: 22, host: 2222
    jenkins.vm.network "forwarded_port", guest: 8080, host: 8080
# LA LIGNE CI-DESSOUS DOIT ETRE SUPPRIMEE / PERSONNALISEE
    jenkins.vm.synced_folder "../prestashop", "/home/vagrant/prestashop", type: "virtualbox"
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
    jenkins.vm.provision :shell, path: "auto_cd.sh"
  end
end

