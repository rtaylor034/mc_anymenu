#> amenu:internal/impl/evaluate/iter
#--------------------
# - amenu:internal/api/evaluate
#--------------------

$data modify storage amenu:var evaluate.current_item set from storage amenu:in evaluate.items[$(i)]
execute if data storage amenu:var evaluate.current_item.source run function amenu:internal/impl/evaluate/source with storage amenu:var evaluate.current_item.source

data modify storage amenu:out evaluate.result append from storage amenu:var evaluate.current_item.item