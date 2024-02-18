#> amenu:api > menu/detach
#--------------------
# -> menu_id: Menu
#--------------------
# ...
#--------------------
#> detaches the menu specified by <menu_id> from the host it is attached too, freeing any slots used.
#--------------------
#- slots used by the detached menu are safely reverted to their previous state.
#- removes host from {data -> active_hosts} if there are no menus left after detachment.
#--------------------
# 1 - success
# 0 - no menu with <menu_id> exists on any host.
#--------------------

execute store result score *detach amenu_return run function amenu:internal/api/host/getm with storage amenu:in detach
execute if score *detach amenu_return matches 0 run return run function amenu:impl/menu/detach/failed

function amenu:impl/menu/detach/remove_data with storage amenu:in detach

data modify storage amenu:var detach.call.host set from storage amenu:out _getm.host
data modify storage amenu:var detach.call.identifier set from storage amenu:out _getm.host.identifier
function amenu:internal/api/host/set with storage amenu:var detach.call

data modify storage amenu:in refresh.container_path set from storage amenu:out _getm.menu.internal.container_path
data modify storage amenu:in refresh.host set from storage amenu:out _getm.host.identifier
function amenu:api/host/refresh

execute unless data storage amenu:out _getm.host.menus[] run function amenu:impl/menu/detach/remove_host with storage amenu:out _getm.host
execute if data storage amenu:out _getm.host.menus[] run function amenu:impl/menu/detach/remove_stacks with storage amenu:out _getm.host

scoreboard players reset *detach.stack amenu_var
data remove storage amenu:var detach
data remove storage amenu:in detach
return 1