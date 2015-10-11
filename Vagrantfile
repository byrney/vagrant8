# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

module ProvisionHelpers
    def provision_ps(lib_path, *script_paths)
        inline = lib_path ?  File.read(lib_path) : ""
        leader = "\nWrite-Host 'Powershell %s'\n"
        inline << script_paths.reduce("") {|memo, script| memo << sprintf(leader, File.basename(script)) << File.read(script) }
        self.provision(:shell, inline: inline)
    end

    def provision_gem(*gems)
        command = "\nWrite-Host 'Gem %s'\ngem install %s\n"
        inline  = gems.reduce("") { |memo, pkg| memo << sprintf(command, pkg, pkg) }
        self.provision(:shell, inline: inline)
    end
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    config.vm.extend(ProvisionHelpers)
    config.vm.box = "win81"
#    config.vm.boot_timeout = 6000
    config.vm.communicator = "winrm"
#    config.winrm.max_tries = 500
#    config.winrm.timeout = 60
    config.vm.guest = :windows   # guest detection fails: https://github.com/mitchellh/vagrant/pull/4996
    config.vm.provider "virtualbox" do |v|
        v.name = 'vagrant81'
        v.gui = true
        v.customize ["modifyvm", :id, "--memory", "2048"]
        v.customize ["modifyvm", :id, "--vram", "256"]
        # v.customize ["modifyvm", :id, "--hardwareuuid", "809144e0-3af6-4261-926c-c3abf6abae9c"]
    end

    #config.vm.network :forwarded_port, guest: 3389, host: 3389, id: 'rdp'
    config.vm.network :forwarded_port, host_ip: "127.0.0.1", guest: 5985, host: 5985, id: "winrm", auto_correct: true

    # for provisioning we need:
    config.vm.provision_ps("pslib.ps1", "disable-browser-choice.ps1", "disable-windows-key.ps1")
    config.vm.provision :shell, path: "Install-Chocolatey.ps1"
    config.vm.provision_ps("pslib.ps1", "choc-settings.ps1")
    config.vm.provision_ps( "pslib.ps1", "choc-utils.ps1", "choc-ruby.ps1")
    config.vm.provision :shell, path: "config.cmd", args: %w(Robert byrney)
    config.vm.provision_gem('bundler')
    config.vm.provision_ps("pslib.ps1",  "choc-dotnetdev.ps1")
    config.vm.provision_ps( "pslib.ps1", "choc-dexdev.ps1")

    host_user = ENV['USER'] || ENV['USERNAME']
    config.vm.synced_folder("/Users/#{host_user}", '/Host')

end
