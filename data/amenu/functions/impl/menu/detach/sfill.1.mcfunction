#> amenu:impl/menu/detach/sfill.1

#ITERATING BACKWARDS

$data modify storage amenu:var detach.shadowed_menu set from storage amenu:var detach.this_host.menus[{internal:{index:$(shadowed_index)}}]

$data remove storage amenu:var detach.this_host.menus[{internal:{index:$(shadowed_index)}}].internal.shadowed_slots[{from:$(menu_id)}]

data modify storage gssen:in repeat.function set value "amenu:impl/menu/detach/sfill.iter"
execute store result storage gssen:in repeat.n int 1 if data storage amenu:var detach.shadowed_menu.internal.last_loaded[]
function gssen:api/inline/repeat
