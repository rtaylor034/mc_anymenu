#> amenu:impl/menu/load/do
#--------------------
# - @api
#--------------------

$data modify storage amenu:var load.this_host set from storage amenu:data active_hosts[{menus:[{internal:{menu_id:$(menu_id)}}]}]
execute unless data storage amenu:var load.this_host run return -1

$data modify storage amenu:var load.this_menu set from storage amenu:var load.this_host.menus[{internal:{menu_id:$(menu_id)}}]
execute unless data storage amenu:var load.this_menu run return -1

# traverse path
data modify storage amenu:in traverse_path.path set from storage amenu:in load.path
data modify storage amenu:in traverse_path.menu set from storage amenu:var load.this_menu
execute store result score *load.success amenu_var run function amenu:internal/api/traverse_path
execute unless score *load.success amenu_var matches 1 run return -2
data modify storage amenu:var load.to_menu set from storage amenu:out traverse_path.result

# call 'on_load' functions
data modify storage amenu:var load.on_load.info.menu_id set from storage amenu:in load.menu_id
execute store result storage gssen:in repeat.n int 1 if data storage amenu:var load.to_menu.on_load[]
data modify storage gssen:in repeat.function set value "amenu:impl/menu/load/call_load"
function gssen:api/inline/repeat

# evaluate items
data modify storage amenu:in evaluate.items set from storage amenu:var load.to_menu.items
execute store result score *load.success amenu_var run function amenu:internal/api/evaluate
execute unless score *load.success amenu_var matches 1 run return -3


# affects {var -> load.this_host}
data modify storage amenu:var load.items set from storage amenu:out evaluate.result
data modify storage amenu:var load.each_item.menu_id set from storage amenu:var load.this_menu.internal.menu_id
data modify storage amenu:var load.each_item.location.container_path set from storage amenu:var load.this_menu.internal.container_path
data modify storage amenu:var load.each_item.location.Slot set from storage amenu:var load.items[-1].Slot
execute if data storage amenu:var load.items[] run function amenu:impl/menu/load/each_item with storage amenu:var load.each_item

data modify storage amenu:var load.set.menu_id set from storage amenu:var load.this_menu.internal.menu_id
function amenu:impl/menu/load/set_hostdata with storage amenu:var load.set

data modify storage amenu:in refresh.host set from storage amenu:var load.this_host.identifier
data modify storage amenu:in refresh.container_path set from storage amenu:var load.this_menu.internal.container_path
function amenu:api/host/refresh

return 1