#> amenu:impl/menu/detach/rfill.iter
#--------------------
# ./rfill (iter 'i' in {var -> detach.shadoving_menu.items[]})
#--------------------

$data modify storage amenu:var detach.shadowing_item set from storage amenu:var detach.shadowing_menu.items[$(i)]

function amenu:impl/menu/detach/rfill.iter.1 with storage amenu:var detach.shadowing_item