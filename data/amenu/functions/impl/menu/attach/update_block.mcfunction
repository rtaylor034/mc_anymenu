#> amenu:impl/menu/attach/update_block
#--------------------
# ./block_host
#--------------------

data modify storage amenu:var attach.existing_host.menus append from storage amenu:var attach.root
$execute unless data storage amenu:var attach.existing_host.internal.checked_containers[{path:$(container_path)}] run data modify storage amenu:var attach.existing_host.internal.checked_containers[{path:$(container_path)}] append value {path:"$(container_path)"}

execute store result storage amenu:var attach.root.internal.index int 1 if data storage amenu:var attach.existing_host.menus[]

data modify storage amenu:var attach.macro merge from storage amenu:in attach
data modify storage amenu:var attach.macro merge from storage amenu:in attach.host
#affects {var -> attach.save}
function amenu:impl/menu/attach/update_block.1 with storage amenu:var attach.macro

data modify storage gssen:in intersection.in.a append from storage amenu:var attach.root.items[].item
data modify storage gssen:in intersection.in.b set from storage amenu:var attach.save
data modify storage gssen:in intersection.in.compare.only set value ["Slot"]
function gssen:api/array/set/intersection with storage gssen:in intersection


data modify storage amenu:in default.in.slots append from storage amenu:var attach.root.items[].item
data modify storage amenu:in default.in.items set from storage gssen:out intersection.shared_b
data modify storage amenu:in default.in.item set value {id:"minecraft:air",Count:1b}
function amenu:internal/api/items/default with storage amenu:in default

data modify storage amenu:var attach.save set from storage amenu:out default.result


#affects {var -> attach.save}
data modify storage gssen:in repeat.in.function set value "amenu:impl/menu/attach/shadow_menus"
data modify storage gssen:in repeat.in.n set from storage amenu:var attach.root.internal.index
function gssen:api/inline/repeat with storage gssen:in repeat

data modify storage amenu:var attach.existing_host.internal.saved_items append from storage amenu:var attach.save[]

$data modify storage amenu:data active_hosts.blocks[$(host)] set from storage amenu:var attach.existing_host