#> amenu:impl/menu/load/each_item
#--------------------
# ./do
#--------------------

data remove storage amenu:var load.item_entries[-1].menu_id
$data modify storage amenu:var load.this_host.internal.stacks[{slot:$(Slot)b}].stack[{from:$(menu_id)}].item set from storage amenu:var load.item_entries[-1]

data remove storage amenu:var load.item_entries[-1]
data modify storage amenu:var load.item_entries[-1].menu_id set from storage amenu:var load.this_menu.internal.menu_id
execute if data storage amenu:var load.item_entries[] run function amenu:impl/menu/load/each_item with storage amenu:var load.item_entries[-1]