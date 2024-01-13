#> amenu:impl/menu/load/rfill
#--------------------
# ./do (iter 'i' in {var -> load.this_host.menus[]})
#--------------------

#only excluding slots from menus that have indexes GREATER than the menu being loaded
$execute if score *load.this_index amenu_var matches ..$(i) run return 1

$data modify storage amenu:var load.shadowing_menu set from storage amenu:var load.this_host.menus[$(i)]

data modify storage gssen:in repeat.in.function set value "amenu:impl/menu/load/rfill.iter"
data modify storage gssen:in repeat.in.with set value "amenu:var load.shadowing_menu"
execute store result storage gssen:in repeat.in.n int 1 if data storage amenu:var load.shadowing_menu.items[]
function gssen:api/inline/repeat with storage gssen:in repeat