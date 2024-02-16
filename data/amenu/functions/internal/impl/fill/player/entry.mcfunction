#> amenu:internal/impl/fill/player/entry
#--------------------
# ../entity
#--------------------

execute unless function amenu:internal/impl/fill/player/check_inventory run data modify storage amenu:var fill.macros.replacer set value "container"
execute unless function amenu:internal/impl/fill/player/check_echest run data modify storage amenu:var fill.macros.replacer set value "enderchest"

data modify storage gssen:in repeat.function set value "amenu:internal/impl/fill/player/iter"
data modify storage gssen:in repeat.with set value "amenu:var fill.macros"
execute store result storage gssen:in repeat.n int 1 if data storage amenu:in fill.items[]
function gssen:api/inline/repeat