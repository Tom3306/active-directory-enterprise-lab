# This Vagrantfile documents the intended local topology. Windows boxes are
# intentionally placeholders because licensing and base images vary by host.
Vagrant.configure("2") do |config|
  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.define "dc01" do |dc|
    dc.vm.box = "gusztavvargadr/windows-server-2022-standard"
    dc.vm.hostname = "DC01"
    dc.vm.network "private_network", ip: "10.10.20.10"
    dc.vm.provider "virtualbox" do |vb|
      vb.memory = 4096
      vb.cpus = 2
    end
  end

  config.vm.define "fs01" do |fs|
    fs.vm.box = "gusztavvargadr/windows-server-2022-standard"
    fs.vm.hostname = "FS01"
    fs.vm.network "private_network", ip: "10.10.20.20"
    fs.vm.provider "virtualbox" do |vb|
      vb.memory = 4096
      vb.cpus = 2
    end
  end

  config.vm.define "ws01" do |ws|
    ws.vm.box = "gusztavvargadr/windows-11"
    ws.vm.hostname = "WS01"
    ws.vm.network "private_network", ip: "10.10.20.101"
    ws.vm.provider "virtualbox" do |vb|
      vb.memory = 4096
      vb.cpus = 2
    end
  end
end

