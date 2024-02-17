#> amenu:impl/menu/load/call_load
#--------------------
# - ./do
#--------------------

$data modify storage amenu:var load.call.function set from storage amenu:var load.this_menu.on_load[$(i)]
data modify storage amenu:var load.on_load.info.payload set from storage amenu:in load.payload
function amenu:impl/menu/load/call_load.1 with storage amenu:var load.call