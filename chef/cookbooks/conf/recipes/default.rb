#
# Cookbook Name:: bash
# Recipe:: default
#
# Copyright 2011, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Configure chef-solo

directory "#{ENV['HOME']}/.chef" do
  action :create
  mode 0755
end

cookbook_file "#{ENV['HOME']}/.chef/solo.rb" do
  source "solo.rb"
  mode 0644
end

execute "chef-solo" do
  command "chef-solo -c #{ENV['HOME']}/.chef/solo.rb -j #{ENV['HOME']}/.chef/node.json"
  action :nothing
end

cookbook_file "#{ENV['HOME']}/.chef/node.json" do
  source "node.json"
  mode 0644
  notifies :run, resources(:execute => "chef-solo")
end

# Various configuration files

["bash_aliases", "screenrc", "vimrc"].each do |file|
  cookbook_file "#{ENV['HOME']}/.#{file}" do
    source "#{file}"
    mode 0644
  end
end

["bashrc", "gitconfig"].each do |file|
  template "#{ENV['HOME']}/.#{file}" do
    source "#{file}.erb"
    mode 0644
  end
end

# SSH configuration

directory "#{ENV['HOME']}/.ssh" do
  action :create
  mode 0700
end

directory "#{ENV['HOME']}/.ssh/control" do
  action :create
  mode 0755
end

extra_config = search(:ssh_config, "*:*")

template "#{ENV['HOME']}/.ssh/config" do
  source "ssh-config.erb"
  mode 0644
  variables(:extra_config => extra_config)
end

keys = search(:authorized_keys, "*:*")

template "#{ENV['HOME']}/.ssh/authorized_keys" do
  source "authorized_keys.erb"
  mode 0644
  variables :keys => keys
end

# Scripts

directory "#{ENV['HOME']}/bin" do
  mode 0755
  action :create
end

["findall", "findch", "findh", "converge"].each do |script|
  cookbook_file "#{ENV['HOME']}/bin/#{script}" do
    source "scripts/#{script}"
    mode 0755
  end
end 
