#> amenu:impl/menu/attach/create_stack
#--------------------
# ./each_item
#--------------------


execute if data storage amenu:in attach.host.block run data modify storage amenu:var attach.create_stack set from storage amenu:in attach.host.block
execute if data storage amenu:in attach.host.entity run data modify storage amenu:var attach.create_stack set from storage amenu:var attach.this_host.internal
data modify storage amenu:var attach.create_stack.Slot set from storage amenu:var attach.menu_items[-1].Slot
data modify storage amenu:var attach.create_stack.container_path set from storage amenu:in attach.container_path
# affects {var -> attach.new_stack.saved}
execute if data storage amenu:in attach.host.block run function amenu:impl/menu/attach/get_block with storage amenu:var attach.create_stack
execute if data storage amenu:in attach.host.entity run function amenu:impl/menu/attach/get_entity with storage amenu:var attach.create_stack

execute unless data storage amenu:var attach.new_stack.saved run data modify storage amenu:var attach.new_stack.saved set value {id:"minecraft:air", Count:0b}
data modify storage amenu:var attach.new_stack.Slot set from storage amenu:var attach.menu_items[-1].Slot
data modify storage amenu:var attach.new_stack.stack append from storage amenu:var attach.stack_element

data modify storage amenu:var attach.this_host.internal.stacks append from storage amenu:var attach.new_stack
