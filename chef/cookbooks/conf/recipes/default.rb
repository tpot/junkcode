#
# Cookbook Name:: bash
# Recipe:: default
#
# Copyright 2011, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

require "etc"

home = Etc.getpwnam(ENV["USER"]).dir

# Various configuration files

["bash_aliases", "screenrc", "gitconfig"].each do |file|
  cookbook_file "#{home}/.#{file}" do
    source "#{file}"
    mode 0644
  end
end

# Per-node recipes

puts "#{node.keys.join(', ')}"

include_recipe "node::#{node[:hostname]}"