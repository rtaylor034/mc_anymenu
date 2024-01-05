#> amenu:internal/check/main
#--------------------
# - amenu:internal/tick
#--------------------
execute store result storage gssen:in repeat.in.n int 1 if data storage amenu:data active_menus.blocks[]
data modify storage gssen:in repeat.in.function set value "amenu:internal/check/block/iter"
function gssen:api/inline/repeat with storage gssen:in repeat

data remove storage amenu:var iter