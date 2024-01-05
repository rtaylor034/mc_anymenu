#> amenu:internal/impl/traverse_path/traverse
#--------------------
# - amenu:internal/api/traverse_path
#--------------------

data modify storage amenu:var traverse set from storage amenu:in traverse_path
$data modify storage amenu:var traverse.step set from storage amenu:in traverse_path.path[$(i)]
execute store result score *traverse_path amenu_return run function amenu:internal/impl/traverse_path/traverse.1 with storage amenu:var traverse

data remove storage amenu:var traverse

return run scoreboard players get *traverse_path amenu_return