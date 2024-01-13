#> amenu:api > host/attach
#--------------------
# -> host: {x: int, y: int, z: int} | {UUID: uuid}
# -> container_path: string
# -> menu: Menu
#--------------------
# <- menu_id: MenuId
#--------------------
#> activates <menu> on the block or entity specified by <host>.
#> the NBT path that <host> uses to store their array of Items should be specified by <container_path>.
#--------------------
#- for example, <container_path> should be "Inventory" if the <host> is a player, and "Items" if the <host> is a chest block. (it should be clear what a host's container path is from the output of a '/data get')
#- note that this function is relatively expensive; avoid unecessary calls.
#--------------------

$data modify storage amenu:in attach set value $(in)

scoreboard players add *max_menuid amenu_data 1
data modify storage amenu:var attach.root set from storage amenu:in attach.menu
execute store result storage amenu:var attach.root.internal.menu_id int 1 run scoreboard players get *max_menuid amenu_data
data modify storage amenu:var attach.root.internal.container_path set from storage amenu:in attach.container_path

execute if data storage amenu:in attach.host.x run function amenu:impl/menu/attach/block_host with storage amenu:in attach
execute if data storage amenu:in attach.host.UUID run function amenu:impl/menu/attach/entity_host with storage amenu:in attach

data modify storage amenu:var attach.root.internal.index set value 0

data modify storage amenu:in load.in.host set from storage amenu:in attach.host
data modify storage amenu:in load.in.menu_id set from storage amenu:var attach.root.internal.menu_id
data modify storage amenu:in load.in.path set value []
execute store result score *attach.load_return amenu_var run function amenu:api/menu/load with storage amenu:in load

#detaches the menu
execute unless score *attach.load_return amenu_var matches 1 run function amenu:impl/menu/attach/failed

scoreboard players reset *attach.load_return amenu_var
scoreboard players reset *attach.host_exists amenu_var
data remove storage amenu:var attach
data remove storage amenu:in attach