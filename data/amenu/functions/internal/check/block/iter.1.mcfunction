#> amenu:internal/check/block/iter.1

$execute positioned $(x) $(y) $(z) if loaded ~ ~ ~ run data modify storage amenu:var iter.diff.a set from block ~ ~ ~ $(container_path)
data modify storage amenu:var iter.diff.b set from storage amenu:var iter.current.internal.prev_items

function gssen:api/array/set/difference with storage amenu:var iter.diff