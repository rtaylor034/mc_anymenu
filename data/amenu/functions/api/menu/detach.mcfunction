#> amenu:api > menu/detach
#--------------------
# -> menu_id: Menu
#--------------------
# ...
#--------------------
#> detaches the menu specified by <menu_id> from the >host< it is attached too, freeing any slots used.
#--------------------
#- slots used by the detached menu are safely reverted to their previous state.
#--------------------
# 1 - success
# 0 - no menu with <menu_id> exists on any host.
#--------------------

execute store result score *detach amenu_return run function amenu:internal/api/host/getm with storage amenu:in detach
execute if score *detach amenu_return matches 0 run return run function amenu:impl/menu/detach/failed

function amenu:impl/menu/detach/remove_menu with storage amenu:in detach

data modify storage amenu:var detach.stacks set from storage amenu:out _getm.host.internal.stacks
execute if data storage amenu:var detach.stacks[] run function amenu:impl/menu/detach/each_stack with storage amenu:in detach



data remove storage amenu:var detach
data remove storage amenu:in detach

return 1