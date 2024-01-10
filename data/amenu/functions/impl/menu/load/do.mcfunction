#> amenu:impl/menu/load/do
#--------------------
# - @api
#--------------------

#kinda cheugy but not a huge deal
execute if data storage amenu:in load.host.UUID run data modify storage amenu:var load.container_pool set from storage amenu:data active_menus.entities
execute if data storage amenu:in load.host.x run data modify storage amenu:var load.container_pool set from storage amenu:data active_menus.blocks

$data modify storage amenu:var load.this_container set from storage amenu:var load.container_pool[$(host)]
execute unless data storage amenu:var load.this_container run return -1

$data modify storage amenu:var load.this_menu set from storage amenu:var load.this_container.menus[{internal:{menu_id:$(menu_id)}}]
execute unless data storage amenu:var load.this_menu run return -3

data modify storage amenu:in traverse_path.in.path set from storage amenu:in load.path
data modify storage amenu:in traverse_path.in.menu set from storage amenu:var load.this_menu
execute store result score *load.success amenu_var run function amenu:internal/api/traverse_path with storage amenu:in traverse_path
execute if score *load.success amenu_var matches 0 run return -2

data modify storage amenu:var load.to_menu set from storage amenu:out traverse_path.result

#call 'on_load' functions
execute store result storage gssen:in repeat.in.n int 1 if data storage amenu:var load.to_menu.on_load[]
data modify storage gssen:in repeat.in.function set value "amenu:internal/impl/menu/load/call_load"
function gssen:api/inline/repeat with storage gssen:in repeat

#evaluate items
data modify storage amenu:in evaluate.in.items set from storage amenu:var load.to_menu.items
function amenu:internal/api/evaluate with storage amenu:var evaluate
data modify storage amenu:var load.items set from storage amenu:out evaluate.result

#target set
execute if data storage amenu:in load.host.x run data modify storage amenu:in fill.in.target.block set from storage amenu:in load.host
execute if data storage amenu:in load.host.UUID run function amenu:impl/menu/load/entity_target with storage amenu:in load.host

data modify storage amenu:in fill.in.items set from storage amenu:var load.items
execute store result score *load.success amenu_var run function amenu:internal/api/fill with storage amenu:in fill
execute if score *load.success amenu_var matches 0 run return -4