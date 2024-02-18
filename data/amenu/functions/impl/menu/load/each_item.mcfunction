#> amenu:impl/menu/load/each_item
#--------------------
# ./do
#--------------------

$data modify storage amenu:var load.this_host.internal.stacks[{location:$(location)}].stack[{from:$(menu_id)}].item set from storage amenu:var load.items[-1]

data remove storage amenu:var load.items[-1]
data modify storage amenu:var load.each_item.location.Slot set from storage amenu:var load.items[-1].Slot
execute if data storage amenu:var load.items[] run function amenu:impl/menu/load/each_item with storage amenu:var load.each_item