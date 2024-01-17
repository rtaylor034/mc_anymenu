#> amenu:internal/impl/items/default/iter
#--------------------
# @api
#--------------------

data modify storage amenu:var default.add set from storage amenu:in default.item
$data modify storage amenu:var default.add.Slot set from storage gssen:out difference.unique_b[$(i)].Slot

data modify storage amenu:out default.result append from storage amenu:var default.add