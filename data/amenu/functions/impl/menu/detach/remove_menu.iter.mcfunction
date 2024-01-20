#> amenu:impl/menu/detach/remove_menu.iter

$data modify storage amenu:var detach.remove.container set from storage amenu:var detach.temp[$(i)]
#affects {var -> detach.this_host}
function amenu:impl/menu/detach/remove_menu.iter.1 with storage amenu:var detach.remove.container