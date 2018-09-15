execute 'install netdata' do
  command 'curl -Ss https://my-netdata.io/kickstart.sh | bash'
  not_if 'test -e /etc/netdata'
end
