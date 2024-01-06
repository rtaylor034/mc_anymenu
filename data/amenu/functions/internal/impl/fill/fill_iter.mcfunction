#> amenu:internal/impl/fill/fill_iter
#--------------------
# - ./block.2
#--------------------

$data modify storage amenu:var fill merge from storage amenu:in fill.items[$(i)]
execute unless data storage amenu:var fill.tag run data modify storage amenu:var fill.tag set value {}
return run function amenu:internal/impl/fill/fill_iter.1 with storage amenu:var fill