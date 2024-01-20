#> amenu:api > menu/attach
#--------------------
# -> host: {x: int, y: int, z: int} | {UUID: uuid}
# -> container_path: string
# -> menu: Menu
#--------------------
# <- menu_id: MenuId
#--------------------
#> activates <menu> on the block or entity specified by <host>.
#> the NBT path that <host> uses to store their array of Items should be specified by <container_path>.
#> generates and returns the attached <menu>'s >menu_id<.
#--------------------
#- it is necessary to store >menu_id< for later use with amenu:api/menu/detach.
#- ex <container_path>: "Inventory" if the <host> is a player, or "Items" if the <host> is a chest block. (it should be clear what a host's container path can be from the output of a '/data get')
#- this function is relatively expensive; avoid unecessary calls.
#- automatically loads the menu (amenu:api/menu/load)
#--------------------
# 1 - success.
# 0 - could not load the menu, menu not attached. (<menu> failed with amenu:api/menu/load)
#--------------------

$data modify storage amenu:in attach set value $(in)

scoreboard players add *max_menuid amenu_data 1
data modify storage amenu:var attach.root set from storage amenu:in attach.menu
execute store result storage amenu:var attach.root.internal.menu_id int 1 run scoreboard players get *max_menuid amenu_data
data modify storage amenu:var attach.root.internal.container_path set from storage amenu:in attach.container_path

data modify storage amenu:var attach.root.internal.index set value 0

execute if data storage amenu:in attach.host.x run function amenu:impl/menu/attach/block_host with storage amenu:in attach
execute if data storage amenu:in attach.host.UUID run function amenu:impl/menu/attach/entity_host with storage amenu:in attach

data modify storage amenu:out attach.menu_id set from storage amenu:var attach.root.internal.menu_id

data modify storage amenu:in load.in.menu_id set from storage amenu:var attach.root.internal.menu_id
data modify storage amenu:in load.in.path set value []
execute store result score *attach.load_return amenu_var run function amenu:api/menu/load with storage amenu:in load

#detaches the menu
execute unless score *attach.load_return amenu_var matches 1 run function amenu:impl/menu/attach/failed
execute store success score *attach amenu_return if score *attach.load_return amenu_var matches 1

scoreboard players reset *attach.load_return amenu_var
scoreboard players reset *attach.host_exists amenu_var
data remove storage amenu:var attach
data remove storage amenu:in attach

return run scoreboard players get *attach amenu_return