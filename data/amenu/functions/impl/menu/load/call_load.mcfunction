#> amenu:impl/menu/load/call_load
#--------------------
# - amenu:impl/menu/load/do
#--------------------

$data modify storage amenu:var load.call.function set from storage amenu:var load.this_menu.on_load[$(i)]
function amenu:impl/menu/load/call_load.1 with storage amenu:var load.call