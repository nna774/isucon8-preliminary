include_cookbook 'netdata'

%w(
git
htop
).each do |p|
  package p
end

directory "#{node[:home]}/.ssh" do
  owner node[:user]
  mode '0700'
end

file "#{node[:home]}/.ssh/authorized_keys" do
  owner node[:user]
  mode '0700'
  content node[:ssh_keys]
end
