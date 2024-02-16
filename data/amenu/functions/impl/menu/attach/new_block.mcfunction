#> amenu:impl/menu/attach/new_block
#--------------------
# ./block_host
#--------------------

data merge storage amenu:var {attach:{new_host:{x:0,y:0,z:0,menus:[],internal:{checked_containers:[{path:""}],saved_items:[],prev_items:[]}}}}

data modify storage amenu:var attach.new_host.x set from storage amenu:in attach.host.x
data modify storage amenu:var attach.new_host.y set from storage amenu:in attach.host.y
data modify storage amenu:var attach.new_host.z set from storage amenu:in attach.host.z

data modify storage amenu:var attach.new_host.menus append from storage amenu:var attach.root
data modify storage amenu:var attach.new_host.internal.checked_containers[0].path set from storage amenu:in attach.container_path

#save items
data modify storage gssen:in intersection.a append from storage amenu:var attach.root.items[].item
data modify storage amenu:var attach.macro set from storage amenu:in attach
data modify storage amenu:var attach.macro merge from storage amenu:in attach.host
#affects {gssen:in -> intersection.b}
function amenu:impl/menu/attach/new_block.1 with storage amenu:var attach.macro
data modify storage gssen:in intersection.compare.only set value ["Slot"]
function gssen:api/array/set/intersection

data modify storage amenu:in default.slots append from storage amenu:var attach.root.items[].item
data modify storage amenu:in default.items set from storage gssen:out intersection.shared_b
data modify storage amenu:in default.item set value {id:"minecraft:air",Count:1b}
function amenu:internal/api/items/default

data modify storage amenu:var attach.new_host.internal.saved_items set from storage amenu:out default.result


data modify storage amenu:data active_hosts.blocks append from storage amenu:var attach.new_host