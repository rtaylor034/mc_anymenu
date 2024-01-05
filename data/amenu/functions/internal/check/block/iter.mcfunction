#> amenu:internal/check/block/iter
#--------------------
# - amenu:internal/check/main
#--------------------

$data modify storage amenu:var iter.current set from storage amenu:data active_menus.blocks[$(i)]
function amenu:internal/check/block/iter.1 with storage amenu:var iter.current

data modify storage gssen:in difference.in.a set from storage amenu:var iter.current_items
data modify storage gssen:in difference.in.b set from storage amenu:var iter.current.internal.prev_items
function gssen:api/array/set/difference with storage gssen:in difference
