#> amenu:impl/menu/detach/each_stack
#--------------------
# @api
#--------------------

data modify storage amenu:var detach.top set from storage amenu:var detach.stacks[-1].stack[-1]

$execute if data storage amenu:var detach.top{from:$(menu_id)} run data modify storage amenu:in fill.items append from storage amenu:var detach.stacks[-1].stack[-2]

data remove storage amenu:var detach.stacks[-1]
execute if data storage amenu:var detach.stacks[] run function amenu:impl/menu/detach/each_stack with storage amenu:in detach
