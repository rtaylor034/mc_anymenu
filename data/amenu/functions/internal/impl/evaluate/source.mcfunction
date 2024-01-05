#> amenu:internal/impl/evaluate/source
#--------------------
# - amenu:internal/impl/evaluate/iter
#--------------------

$execute if data storage amenu:var evaluate.current_item.source.index run data modify storage amenu:var evaluate.current_item.item merge from storage $(storage) $(path)[$(index)]
$execute unless data storage amenu:var evaluate.current_item.source.index run data modify storage amenu:var evaluate.current_item.item merge from storage $(storage) $(path)
