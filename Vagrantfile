# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    config.vm.box = "Windows8"
    config.vm.communicator = "winrm"
    config.vm.provider "virtualbox" do |v|
        v.name = 'vagrant8'
        v.gui = true
        v.customize ["modifyvm", :id, "--memory", "1024"]
    end

  #config.vm.network :forwarded_port, guest: 3389, host: 3389, id: 'rdp'

  config.vm.network :forwarded_port, host_ip: "127.0.0.1", guest: 5985, host: 5985, id: "winrm", auto_correct: true

  # for provisioning we need:
  #   # chocolatey:
  config.vm.provision :shell, path: "Install-Chocolatey.ps1"
  # ...in the path for all users:
#  config.vm.provision :shell, inline: '[Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\Chocolatey\bin", "Machine")'
  # turn off browser choice
  config.vm.provision :shell, path: "disable-browser-choice.ps1"
  config.vm.provision :shell, path: "disable-windows-key.cmd"

  config.vm.provision :shell, path: "choc-utils.ps1"
  config.vm.provision :shell, path: "config.cmd"
  config.vm.provision :shell, path: "choc-ruby.ps1"
  config.vm.provision :shell, path: "choc-dotnetdev.ps1"

  # # to build dex
  # chocs = %w( webpicommandline DotNet3.5 VS2010.ShellIntegratedRedist windows-8-1-sdk SQL2012.DACFramework )
  # chocs.each do |choc|
  #     config.vm.provision :shell, inline: "start-process -wait -verb runas cinst #{choc}" 
  # end


  gems = %w(bundler )
  gems.each do |pkg|
      config.vm.provision :shell, inline: "gem install #{pkg}"
  end

  # pis = %w(IISExpress )
  # pis.each do |pkg|
  #     config.vm.provision :shell, inline: "start-process -wait -verb runas choco -argumentlist 'webpi #{pkg}' "
  # end

#  config.vm.provision :shell, path: "install-sqltools.ps1"

  # this one last as it runs on the background
  #config.vm.provision :shell, path: "SSDTSetup.exe", args: '/silent /log c:\tmp\ssdt.log'

  config.vm.synced_folder("/Users/rob/Documents/Source", '/Source')
  # Puppet:
  # config.vm.provision :shell, path: "Install-Puppet.ps1"

  # config.vm.provision :puppet do |puppet|
  #     puppet.manifests_path = "manifests"
  #     puppet.module_path = "modules"
  #     puppet.manifest_file = "provision.pp"
  #     puppet.options = "--verbose --debug"
  # end

end
