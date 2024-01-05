#> amenu:internal/impl/fill/iter
#--------------------
# - amenu:internal/impl/api/fill
#--------------------

$data modify storage amenu:in fill merge from storage amenu:in fill.items[$(i)]
execute unless data storage amenu:in fill.tag run data modify storage amenu:in fill.tag set value {}
return run function amenu:internal/impl/fill/iter.1 with storage amenu:in fill