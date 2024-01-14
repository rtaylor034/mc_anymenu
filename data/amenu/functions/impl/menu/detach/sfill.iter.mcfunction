#> amenu:impl/menu/detach/sfill.iter
#--------------------
# ./sfill.1
#--------------------

$data modify storage amenu:var detach.sfill.item set from storage amenu:var detach.shadowed_menu.internal.last_loaded[$(i)]

function amenu:impl/menu/detach/sfill.iter.1 with storage amenu:var detach.sfill