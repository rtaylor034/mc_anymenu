#> amenu:impl/menu/detach/do
#--------------------
# @api
#--------------------

execute if data storage amenu:in detach.host.UUID run data modify storage amenu:var detach.host_pool set from storage amenu:data active_hosts.entities
execute if data storage amenu:in detach.host.x run data modify storage amenu:var detach.host_pool set from storage amenu:data active_hosts.blocks

$data modify storage amenu:var detach.this_host set from storage amenu:var load.host_pool[$(host)]
execute unless data storage amenu:var detach.this_host run return -1

$data modify storage amenu:var detach.this_menu set from storage amenu:var detach.this_host.menus[{internal:{menu_id:$(menu_id)}}]
execute unless data storage amenu:var detach.this_menu run return -2

data modify storage amenu:var detach.items merge from storage amenu:var detach.this_menu.items

#slots that are shadowed by other active menus
#affects {var -> detach.items}
execute store result score *detach.this_index amenu_var run data get storage amenu:var detach.this_menu.index

data modify storage gssen:in repeat.in.function set value "amenu:impl/menu/detach/rfill"
execute store result storage gssen:in repeat.in.n int 1 if data storage amenu:var detach.this_host.menus[]
function gssen:api/inline/repeat with storage gssen:in repeat

data merge storage amenu:in {fill:{in:{items:[]}}}
#remaining slots (that may shadow other menus)
#affects {in -> fill.in.items}
data modify storage gssen:in repeat.in.function set value "amenu:impl/menu/detach/sfill"
execute store result storage gssen:in repeat.in.n int 1 run scoreboard players get *detach.this_index amenu_var
function gssen:api/inline/repeat with storage gssen:in repeat