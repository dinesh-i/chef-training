# Create user abc
user 'abc' do
  home '/home/abc'
  action :create
end

# Install packages tree and git
package ['tree', 'git' ]

# Remove user pqr
user 'pqr' do
  action :remove
end

# Add file /etc/motd with content "''"
file '/etc/motd' do
  content 'Property of XYZ'
  mode 0644
  owner 'root'
  group 'root'
end
