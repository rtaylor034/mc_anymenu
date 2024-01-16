#> amenu:impl/menu/attach/new_entity
#--------------------
# ./entity_host
#--------------------

data merge storage amenu:var {attach:{new_host:{UUID:0,menus:[],internal:{guuid:"",checked_containers:[{path:""}],saved_items:[],prev_items:[]}}}}
data modify storage amenu:var attach.new_host.UUID set from storage amenu:in attach.host.UUID

data modify storage gssen:in guuid.in.UUID set from storage amenu:var attach.new_host.UUID
function gssen:api/inline/guuid with storage gssen:in guuid
data modify storage amenu:var attach.new_host.internal.guuid set from storage gssen:out guuid.result

data modify storage amenu:var attach.new_host.menus append from storage amenu:var attach.root
data modify storage amenu:var attach.new_host.internal.checked_containers[0] set from storage amenu:in attach.container_path

#save items
data modify storage gssen:in intersection.in.a append from storage amenu:var attach.root.items[].item
data modify storage amenu:var attach.macro merge from storage amenu:in attach
data modify storage amenu:var attach.macro.guuid merge from storage amenu:var attach.new_host.internal.guuid
#affects {gssen:in -> intersection.in.b}
function amenu:impl/menu/attach/new_entity.1 with storage amenu:var attach.macro
data modify storage gssen:in intersection.in.compare.only set value ["Slot"]
function gssen:api/array/set/intersection with storage gssen:in intersection

data modify storage amenu:var attach.new_host.internal.saved_items set from storage gssen:out intersection.shared_b

data modify storage amenu:data active_hosts.entities append from storage amenu:var attach.new_host