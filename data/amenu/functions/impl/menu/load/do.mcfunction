#> amenu:impl/menu/load/do
#--------------------
# - amenu:api/menu/load
#--------------------

#kinda cheugy but not a huge deal
execute if data storage amenu:in load.identifier.UUID run data modify storage amenu:var load.container_pool set from storage amenu:data active_menus.entities
execute if data storage amenu:in load.identifier.x run data modify storage amenu:var load.container_pool set from storage amenu:data active_menus.blocks

$data modify storage amenu:var load.this_container set from storage amenu:var load.container_pool[$(identifier)]
execute unless data storage amenu:var load.this_container run return -1

$data modify storage amenu:var load.this_menu set from storage amenu:var load.this_container.menus[$(menu_index)]
execute unless data storage amenu:var load.this_menu run return -3

data modify storage amenu:in traverse_path.in.path set from storage amenu:in load.path
data modify storage amenu:in traverse_path.in.menu set from storage amenu:var load.this_menu
execute store result score *load.valid_path amenu_var run function amenu:internal/api/traverse_path with storage amenu:in traverse_path
execute if score *load.valid_path amenu_var matches 0 run return -2

data modify storage amenu:var load.to_menu set from storage amenu:out traverse_path.result

#call 'on_load' functions
execute store result storage gssen:in repeat.in.n int 1 if data storage amenu:var load.to_menu.on_load[]
data modify storage gssen:in repeat.in.function set value "amenu:internal/impl/menu/load/call_load"
function gssen:api/inline/repeat with storage gssen:in repeat

#evaluate items
data modify storage amenu:in evaluate.in.items set from storage amenu:var load.to_menu.items
function amenu:internal/api/evaluate with storage amenu:var evaluate

data modify storage gssen:in repeat.in.function set value "my:function"
data modify storage gssen:in repeat.in.with set value "my:storage path"
execute store result storage gssen:in repeat.in.n int 1 if data storage my:storage array[]
function gssen:api/inline/repeat with storage gssen:in repeat