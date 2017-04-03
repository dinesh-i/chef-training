name "lb"
description "haproxy load balancer"
run_list "recipe[myhaproxy]", "role[common]"
default_attributes({
  "chef_client" => {
    "interval" => 60,
    "splay" => 20
  }
})
