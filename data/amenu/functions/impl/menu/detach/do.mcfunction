#> amenu:impl/menu/detach/do
#--------------------
# @api
#--------------------

$data modify storage amenu:var detach.this_host set from storage amenu:data active_hosts.entities[{menus:[{internal:{menu_id:$(menu_id)}}]}]
$execute unless data storage amenu:var detach.this_host run data modify storage amenu:var detach.this_host set from storage amenu:data active_hosts.blocks[{menus:[{internal:{menu_id:$(menu_id)}}]}]
execute unless data storage amenu:var detach.this_host run return 0

$data modify storage amenu:var detach.this_menu set from storage amenu:var detach.this_host.menus[{internal:{menu_id:$(menu_id)}}]
data modify storage amenu:var detach.menu_id set from storage amenu:in detach.menu_id

data modify storage gssen:in difference.in.a set from storage amenu:var detach.this_menu.internal.shadowed_slots
data modify storage gssen:in difference.in.b append from storage amenu:var detach.this_menu.items[].item
data modify storage gssen:in difference.in.compare.only set value ["Slot"]
function gssen:api/array/set/difference with storage gssen:in difference

data modify storage amenu:var detach.items set from storage gssen:out difference.unique_b

execute store result score *detach.this_index amenu_var run data get storage amenu:var detach.this_menu.internal.index
data merge storage amenu:in {fill:{in:{items:[]}}}
#remaining slots (that may shadow other menus)
#affects {in -> fill.in.items} & {var -> detach.items}
data modify storage gssen:in repeat.in.function set value "amenu:impl/menu/detach/sfill"
execute store result storage gssen:in repeat.in.n int 1 run scoreboard players get *detach.this_index amenu_var
function gssen:api/inline/repeat with storage gssen:in repeat

#saved slots
#affects {in -> fill.in.items} & {var -> detach.this_host}
data modify storage gssen:in repeat.in.function set value "amenu:impl/menu/detach/saved"
execute store result storage gssen:in repeat.in.n int 1 if data storage amenu:var detach.items[]
function gssen:api/inline/repeat with storage gssen:in repeat

execute if data storage amenu:var detach.this_host.UUID run data modify storage amenu:in fill.in.target.guuid set from storage amenu:var detach.this_host.internal.guuid
execute if data storage amenu:var detach.this_host.x run data modify storage amenu:in fill.in.target set from storage amenu:var detach.this_host
data modify storage amenu:in fill.in.container_path set from storage amenu:var detach.this_menu.internal.container_path
function amenu:internal/api/fill with storage amenu:in fill

data modify storage amenu:out detach.host set from storage amenu:var detach.this_host

execute if data storage amenu:var detach.this_host.x run data merge storage amenu:var {detach:{host_pool:"blocks"}}
execute if data storage amenu:var detach.this_host.UUID run data merge storage amenu:var {detach:{host_pool:"entities"}}

execute store result score *detach.menu_count amenu_var if data storage amenu:var detach.this_host.menus[]

execute if score *detach.menu_count amenu_var matches ..1 run return run function amenu:impl/menu/detach/remove_host with storage amenu:var detach

function amenu:impl/menu/detach/remove_menu with storage amenu:var detach

return 1