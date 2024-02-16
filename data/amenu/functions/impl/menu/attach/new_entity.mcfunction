#> amenu:impl/menu/attach/new_entity
#--------------------
# ./entity_host
#--------------------

data merge storage amenu:var {attach:{new_host:{UUID:0,menus:[],internal:{guuid:"",checked_containers:[{path:""}],saved_items:[],prev_items:[]}}}}
data modify storage amenu:var attach.new_host.UUID set from storage amenu:in attach.host.UUID

data modify storage gssen:in guuid.UUID set from storage amenu:var attach.new_host.UUID
function gssen:api/inline/guuid
data modify storage amenu:var attach.new_host.internal.guuid set from storage gssen:out guuid.result

data modify storage amenu:var attach.new_host.menus append from storage amenu:var attach.root
data modify storage amenu:var attach.new_host.internal.checked_containers[0].path set from storage amenu:in attach.container_path

#save items
data modify storage gssen:in intersection.a append from storage amenu:var attach.root.items[].item
data modify storage amenu:var attach.macro set from storage amenu:in attach
data modify storage amenu:var attach.macro.guuid set from storage amenu:var attach.new_host.internal.guuid
#affects {gssen:in -> intersection.b}
function amenu:impl/menu/attach/new_entity.1 with storage amenu:var attach.macro
data modify storage gssen:in intersection.compare.only set value ["Slot"]
function gssen:api/array/set/intersection with storage gssen:in intersection

data modify storage amenu:in default.slots append from storage amenu:var attach.root.items[].item
data modify storage amenu:in default.items set from storage gssen:out intersection.shared_b
data modify storage amenu:in default.item set value {id:"minecraft:air",Count:1b}
function amenu:internal/api/items/default

data modify storage amenu:var attach.new_host.internal.saved_items set from storage amenu:out default.result

data modify storage amenu:data active_hosts.entities append from storage amenu:var attach.new_host