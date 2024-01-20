#> amenu:internal/impl/fill/player/iter
#--------------------
# ./entry
#--------------------

data merge storage amenu:var {fill:{macros:{tag:""}}}
$data modify storage amenu:var fill.macros merge from storage amenu:in fill.items[$(i)]

function amenu:internal/impl/fill/player/iter.1 with storage amenu:var fill.macros

return 1