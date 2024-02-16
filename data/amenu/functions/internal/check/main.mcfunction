#> amenu:internal/check/main
#--------------------
# - amenu:internal/tick
#--------------------
execute store result storage gssen:in repeat.n int 1 if data storage amenu:data active_menus.blocks[]
data modify storage gssen:in repeat.function set value "amenu:internal/check/block/iter"
function gssen:api/inline/repeat

data remove storage amenu:var iter