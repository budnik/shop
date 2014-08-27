#
# Cookbook Name:: app1
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "chef-solo-search"
include_recipe "apt"
include_recipe "postgresql::contrib"
include_recipe "postgresql::server"
include_recipe "postgresql::libpq"
include_recipe "nginx"
include_recipe "rvm::system"

app = 'shop'
user = 'ubuntu'
dir = '/opt/apps/'+app

directory dir+'/tmp/' do
  recursive true
  owner user
end

template( dir + '/.env') do
  source 'env.erb'
  variables pairs: {
    DATABASE_URL: "postgresql://ubuntu:n0pass@127.1:5432/hello?pool=10&reaping_frequency=10",
    REDIS_URL: "redis://127.1:6379/4",
    SECRET_KEY_BASE: '443c8a22f2bc6aa12574dae475209ff98af62fcefb031c40c533560ef2757613cf2c9bf8356dd1b8c24d79f879b81957a61bed69606816efed206b2cb0b58dc6',
    GMAIL: {hostname: 'gmail.com', user: 'kompas.dp.ua', password: ',s5f@Qw:p@r>?9]'}.to_json
  }
end

git dir do
  repository 'https://github.com/budnik/shop.git'
  revision 'master'
  user user
  notifies :run, "rvm_shell[bundle_install]", :immediately
end

rvm_shell 'bundle_install' do
  user user
  cwd dir
  code %{bundle install --deployment -j4}
  notifies :run, "rvm_shell[rake]", :immediately
end

rvm_shell 'rake' do
  user user
  cwd dir
  code %{bundle exec rake db:migrate assets:precompile RAILS_ENV=production}
end


template '/etc/init/puma.conf' do
  cookbook 'chef-puma'
  source 'upstart.erb'
  variables owner: user,
            working_dir: dir,
            exec_prefix: 'bundle exec',
            config_path: 'config/puma.rb -e production'
end

service 'puma' do
  action [:start, :enable]
  provider Chef::Provider::Service::Upstart
  subscribes :restart, "git[#{dir}]"
  subscribes :restart, "template[#{dir}/.env]"
end

template '/etc/init/sidekiq.conf' do
  source 'sidekiq.conf.erb'
  variables owner: user,
            working_dir: dir
end

service 'sidekiq' do
  action [:start, :enable]
  provider Chef::Provider::Service::Upstart
  subscribes :restart, "git[#{dir}]"
  subscribes :restart, "template[#{dir}/.env]"
end

template "#{node['nginx']['dir']}/sites-available/default" do
  source 'nginx.conf.erb'
  owner  'root'
  group  node['root_group']
  mode   '0644'
  notifies :reload, 'service[nginx]'
  variables working_dir: dir
end

nginx_site 'default' do
  enable node['nginx']['default_site_enabled']
end