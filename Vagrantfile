# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.box = 'winky/amazonlinux-2'
  config.ssh.forward_agent = true

  config.vm.define 'server' do |host|
    host.vm.hostname = 'server'
    host.vm.network 'private_network', ip: '192.168.33.50'
    host.vm.provision 'shell', privileged: false, path: 'script/provision.sh'
  end
end
