#> amenu:impl/menu/load/get_fill_items
#--------------------
# ./do
#--------------------

data modify storage amenu:var load.top_item set from storage amenu:var load.stacks[-1].stack[-1]
$execute if data storage amenu:var load.top_item{from:$(menu_id)} run data modify storage amenu:in fill.items append from storage load.top_item.item

data remove storage amenu:var load.stacks[-1]
execute if data storage amenu:var load.stacks[] run function amenu:impl/menu/load/get_fill_items with storage amenu:var load.this_menu.internal