name "web"
description "Web Server"
run_list "role[common]", "recipe[apache]"
default_attributes({
  "chef_client" => {
    "interval" => 120,
    "splay" => 30
  }
})
