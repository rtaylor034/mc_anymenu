#> amenu:impl/menu/detach/rfill
#--------------------
# ./do (iter 'i' in {var -> detach.this_host.menus[]})
#--------------------

#literally copied from amenu:impl/menu/load/rfill

$execute if score *detach.this_index amenu_var matches ..$(i) run return 1

$data modify storage amenu:var detach.shadowing_menu set from storage amenu:var detach.this_host.menus[{internal:{index:$(i)}}]

data modify storage gssen:in repeat.in.function set value "amenu:impl/menu/detach/rfill.iter"
data modify storage gssen:in repeat.in.with set value "amenu:var detach.shadowing_menu"
execute store result storage gssen:in repeat.in.n int 1 if data storage amenu:var detach.shadowing_menu.items[]
function gssen:api/inline/repeat with storage gssen:in repeat