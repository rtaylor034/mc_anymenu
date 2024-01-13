#> amenu:internal/impl/fill/player/iter
#--------------------
# ./entry
#--------------------

$data modify storage amenu:var fill.macros merge from storage amenu:in fill.items[$(i)]
execute unless data storage amenu:var fill.macros.tag run data merge storage amenu:var {fill:{macros:{tag:""}}}

function amenu:internal/impl/fill/player/iter.1 with storage amenu:var fill.macros

return 1