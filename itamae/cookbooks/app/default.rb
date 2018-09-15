deploy_key = '/tmp/deploy.key'

remote_file deploy_key do
  owner node[:user]
end

git_ssh = '/usr/local/bin/git-ssh'

file git_ssh do
  owner 'root'
  mode '0755'
  content %Q(#!/bin/sh\nexec ssh -oIdentityFile=#{deploy_key} -oStrictHostKeyChecking=no "$@")
end

execute 'deploy app' do
  user node[:user]
  command <<"EOC"
  DIR=#{node[:deploy_to]}.back/`date +%d%H%M%S` &&\
  mkdir -p $DIR;
  [ -e #{node[:deploy_to]} ] && rsync -au --remove-source-files #{node[:deploy_to]}/ $DIR/;
  ln -sf $DIR #{node[:deploy_to]}.back/current;
  rm -fr "#{node[:deploy_to]}-clone";
  GIT_SSH=#{git_ssh} git clone #{node[:repository]} #{node[:deploy_to]}-clone &&\
  ln -sf #{node[:deploy_to]}-clone/app #{node[:deploy_to]}
EOC
end
