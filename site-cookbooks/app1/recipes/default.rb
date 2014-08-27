#
# Cookbook Name:: app1
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "chef-solo-search"
include_recipe "users::sysadmins"
include_recipe "apt"
include_recipe "postgresql::contrib"
include_recipe "postgresql::server"
include_recipe "postgresql::libpq"
include_recipe "nginx::default"
include_recipe "rvm::system"

app = 'shop'

directory '/opt/apps/'+app do
  recursive true
end

git '/opt/apps/'+app do
  repository 'git@github.com:budnik/shop.git'
  revision 'master'
end

template '/etc/local/puma.conf' do
  cookbook 'chef-puma'
  source 'upstart.erb'
end

service 'puma' do
  action :enable
end


