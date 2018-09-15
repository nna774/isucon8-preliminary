deploy_key = '/tmp/deploy.key'

remote_file deploy_key

git_ssh = '/usr/local/bin/git-ssh'

file git_ssh do
  owner 'root'
  mode '0755'
  content %Q(#!/bin/sh\nexec ssh -oIdentityFile=#{deploy_key} -oStrictHostKeyChecking=no "$@")
end

execute 'deploy app' do
  command <<"EOC"
  DIR=#{node[:deploy_to]}.back/`date +%d%H%M%S` &&\
  mkdir -p #{node[:deploy_to]} &&\
  mkdir -p $DIR &&\
  mv -f #{node[:deploy_to]} $DIR &&\
  GIT_SSH=#{git_ssh} git clone #{node[:repository]} #{node[:deploy_to]}-clone &&\
  ln -s #{node[:deploy_to]}-clone/app #{node[:deploy_to]}
EOC
end
