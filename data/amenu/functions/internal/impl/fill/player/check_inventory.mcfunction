#> amenu:internal/impl/fill/player/check_inventory
#--------------------
# ./entry
#--------------------

data modify storage amenu:var fill.check set from storage amenu:in fill.container_path
return run data merge storage amenu:var {fill:{check:"Inventory"}}