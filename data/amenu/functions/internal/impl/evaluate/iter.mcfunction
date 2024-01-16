#> amenu:internal/impl/evaluate/iter
#--------------------
# - amenu:internal/api/evaluate
#--------------------

$data modify storage amenu:var evaluate.current_item set from storage amenu:in evaluate.items[$(i)]

execute if score *evaluate.strict amenu_var matches 1 unless data storage amenu:var evaluate.current_item.item.Slot run return 0

execute if data storage amenu:var evaluate.current_item.source run function amenu:internal/impl/evaluate/source with storage amenu:var evaluate.current_item.source

execute unless data storage amenu:var evaluate.current_item.item.Slot run return 0

data modify storage amenu:out evaluate.result append from storage amenu:var evaluate.current_item.item