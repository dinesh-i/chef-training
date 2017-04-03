cookbook_file '/usr/share/nginx/html/index.html' do
  source 'index.html'
  mode 0644
  owner 'root'
end

cookbook_file '/etc/nginx/nginx.conf' do
  source 'nginx.conf'
  mode 0644
  owner 'root'
  notifies :restart, 'service[nginx]'
end
