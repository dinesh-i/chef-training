#
# Cookbook Name:: myhaproxy
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.



# node.default['haproxy']['members'] = [{
#      "hostname" => "web1",
     # "ipaddress" => "192.168.8.12",
  #    "port" => 80,
     # "ssl_port" => 80
   # },
   # {
    # "hostname" => "web2",
    # "ipaddress" => "192.168.8.13",
    # "port" => 80,
    # "ssl_port" => 80
  # }]

all_web_nodes = search("node", "role:web AND chef_environment:#{node.chef_environment}")

members = []

all_web_nodes.each do | web_node|
  member = {
    'hostname' => web_node['fqdn'],
    'ipaddress' => web_node['network']['ipaddress_eth1'],
    'port' => 80,
    #  'ipaddress' => web_node['network']['interfaces']['eth1']['routes']['src'],
    #    'port' => 800,
    'ssl_port' => 80
    #,
    #'my_routes' => web_node['network']['interfaces']['eth1']['routes'],
    #'my_ip_src' => web_node['network']['interfaces']['eth1']['routes']['src']
  }

members.push(member)

end

node.default['haproxy']['members'] = members

node.default['haproxy']['incoming_port'] = 8000

include_recipe 'haproxy::default'
