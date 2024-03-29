#> amenu:impl/menu/load/do
#--------------------
# - @api
#--------------------

$data modify storage amenu:var load.this_host set from storage amenu:data active_hosts.entities[{menus:[{internal:{menu_id:$(menu_id)}}]}]
$execute unless data storage amenu:var load.this_host run data modify storage amenu:var load.this_host set from storage amenu:data active_hosts.blocks[{menus:[{internal:{menu_id:$(menu_id)}}]}]
execute unless data storage amenu:var load.this_host run return -1

$data modify storage amenu:var load.this_menu set from storage amenu:var load.this_host.menus[{internal:{menu_id:$(menu_id)}}]
execute unless data storage amenu:var load.this_menu run return -3

data modify storage amenu:in traverse_path.in.path set from storage amenu:in load.path
data modify storage amenu:in traverse_path.in.menu set from storage amenu:var load.this_menu
execute store result score *load.success amenu_var run function amenu:internal/api/traverse_path with storage amenu:in traverse_path
execute unless score *load.success amenu_var matches 1 run return -2

data modify storage amenu:var load.to_menu set from storage amenu:out traverse_path.result

#call 'on_load' functions
data modify storage amenu:var load.on_load.menu_id set from storage amenu:in load.menu_id
execute store result storage gssen:in repeat.in.n int 1 if data storage amenu:var load.to_menu.on_load[]
data modify storage gssen:in repeat.in.function set value "amenu:impl/menu/load/call_load"
function gssen:api/inline/repeat with storage gssen:in repeat

#evaluate items
data modify storage amenu:in evaluate.in.items set from storage amenu:var load.to_menu.items
execute store result score *load.success amenu_var run function amenu:internal/api/evaluate with storage amenu:in evaluate
execute unless score *load.success amenu_var matches 1 run return -4
data modify storage amenu:var load.items set from storage amenu:out evaluate.result

execute if data storage amenu:var load.this_host.UUID run data merge storage amenu:var {load:{host_pool:"entities"}}
execute if data storage amenu:var load.this_host.x run data merge storage amenu:var {load:{host_pool:"blocks"}}
data modify storage amenu:var load.menu_id set from storage amenu:in load.menu_id
function amenu:impl/menu/load/do.1 with storage amenu:var load

#shadowed slots
data modify storage gssen:in ensure.in.array set from storage amenu:var load.this_menu.internal.shadowed_slots
data modify storage gssen:in ensure.in.compare.only set value ["Slot"]
function gssen:api/array/set/ensure with storage gssen:in ensure

data modify storage gssen:in difference.in.a set from storage gssen:out ensure.result
data modify storage gssen:in difference.in.b set from storage amenu:var load.items
data modify storage gssen:in difference.in.compare.only set value ["Slot"]
function gssen:api/array/set/difference with storage gssen:in difference

execute if data storage amenu:var load.this_host.UUID run data modify storage amenu:in fill.in.target.guuid set from storage amenu:var load.this_host.internal.guuid
execute if data storage amenu:var load.this_host.x run data modify storage amenu:in fill.in.target set from storage amenu:var load.this_host
data modify storage amenu:in fill.in.items set from storage gssen:out difference.unique_b
data modify storage amenu:in fill.in.container_path set from storage amenu:var load.this_menu.internal.container_path
function amenu:internal/api/fill with storage amenu:in fill

return 1