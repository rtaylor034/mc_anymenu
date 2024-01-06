#> amenu:internal/impl/fill/block.1

data modify storage amenu:var fill.replacing set value "block ~ ~ ~"
execute store result storage gssen:in repeat.in.n int 1 if data storage amenu:in fill.items[]
data modify storage gssen:in repeat.in.function set value "amenu:internal/impl/fill/fill_iter"
execute store result score *fill amenu_return run function gssen:api/inline/repeat with storage gssen:in repeat