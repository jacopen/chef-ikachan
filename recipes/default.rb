include_recipe 'runit'
include_recipe 'plenv'

username = node[:ikachan][:user]
groupname = node[:ikachan][:group]

plenv_install node[:ikachan][:pl_version] do
  user  username
  action :install
end

plenv_global node[:ikachan][:pl_version] do
  user   username
  action :run
end

plenv_cpanm "Carton" do
    user    username
    version node[:ikachan][:pl_version]
    options "--force"
    action  :install
end

directory "#{node[:ikachan][:install_dir]}" do
  mode  0755
  action :create
  user username
  group groupname
end

template 'cpanfile' do
  path File.join(node[:ikachan][:install_dir], "cpanfile")
  source "cpanfile.erb"
  owner username
  group groupname
end

bash 'setup ikachan' do
  code <<-EOC
    export PATH=$HOME/.plenv/bin:$PATH
    eval "$(plenv init -)"
    carton install
  EOC
  cwd node[:ikachan][:install_dir]
  user username
  group groupname
  notifies :restart, "runit_service[ikachan]"
end

runit_service 'ikachan' do
  default_logger true
  action [:enable, :restart]
end
