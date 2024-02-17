#> amenu:impl/menu/attach/each_item
#--------------------
# @api
#--------------------


$execute store success score *attach.exists amenu_var run data modify storage amenu:var attach.this_host.internal.stacks[{Slot:$(Slot)b}].stack append from storage amenu:var attach.stack_element
execute if score *attach.exists amenu_var matches 0 run function amenu:impl/menu/attach/create_stack

data remove storage amenu:var attach.menu_items[-1]
execute if data storage amenu:var attach.menu_items[] run function amenu:impl/menu/attach/each_item with storage amenu:var attach.menu_items[-1]