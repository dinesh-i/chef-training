name "common"
description "Common Items for Linux"
run_list "recipe[users]", "recipe[chef-client]", "recipe[ohai]"
