#> amenu:impl/menu/attach/each_item
#--------------------
# @api
#--------------------o

$execute store result score *attach.exists amenu_var if data storage amenu:var attach.this_host.internal.stacks[{location:$(location)}]
$execute if score *attach.exists amenu_var matches 1.. run data modify storage amenu:var attach.this_host.internal.stacks[{location:$(location)}].stack append from storage amenu:var attach.stack_element

execute unless score *attach.exists amenu_var matches 1.. run function amenu:impl/menu/attach/create_stack

data remove storage amenu:var attach.menu_items[-1]
data modify storage amenu:var attach.each_pass.location.Slot set from storage amenu:var attach.menu_items[-1].item.Slot
execute if data storage amenu:var attach.menu_items[] run function amenu:impl/menu/attach/each_item with storage amenu:var attach.each_pass