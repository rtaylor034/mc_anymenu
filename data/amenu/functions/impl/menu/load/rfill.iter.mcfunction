#> amenu:impl/menu/load/rfill.iter
#--------------------
# ./rfill (iter 'i' in {var -> load.shadoving_menu.items[]})
#--------------------

$data modify storage amenu:var load.shadowing_item set from storage amenu:var load.shadowing_menu.items[$(i)]

function amenu:impl/menu/load/rfill.iter.1 with storage amenu:var load.shadowing_item