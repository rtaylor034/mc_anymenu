#> amenu:impl/menu/attach/new_block
#--------------------
# ./block_host
#--------------------

data merge storage amenu:var {attach:{new_host:{x:0,y:0,z:0,menus:[],internal:{checked_containers:[{path:""}],saved_items:[],prev_items:[]}}}}

data modify storage amenu:var attach.new_host.x set from storage amenu:in attach.host.x
data modify storage amenu:var attach.new_host.y set from storage amenu:in attach.host.y
data modify storage amenu:var attach.new_host.z set from storage amenu:in attach.host.z

data modify storage amenu:var attach.new_host.menus append from storage amenu:var attach.root
data modify storage amenu:var attach.new_host.internal.checked_containers[0] set from storage amenu:in attach.container_path

data modify storage amenu:data active_hosts.blocks append from storage amenu:var attach.new_host