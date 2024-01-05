
#> amenu:internal/impl/traverse_path/traverse.1

$data modify storage amenu:var traverse.try_result set from storage amenu:out traverse_path.result.sub_menus.$(step)

execute unless data storage amenu:var traverse.try_result run return fail
data modify storage amenu:out traverse_path.result set from storage amenu:var traverse.try_result

return 1