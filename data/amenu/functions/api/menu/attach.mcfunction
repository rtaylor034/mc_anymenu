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
#--------------------

$data modify storage amenu:in attach set value $(in)

scoreboard players add *max_menuid amenu_data 1
data modify storage amenu:var attach.root set from storage amenu:in attach.menu
execute store result storage amenu:var attach.root.internal.menu_id int 1 run scoreboard players get *max_menuid amenu_data
data modify storage amenu:var attach.root.internal.container_path set from storage amenu:in attach.container_path

#TODOHERE: initialize host if it does not already exist; update 'checked_containers'

data modify storage amenu:in load.in.host set from storage amenu:in attach.host
data modify storage amenu:in load.in.menu_id set from storage amenu:var attach.root.internal.menu_id
data modify storage amenu:in load.in.path set value []
function amenu:api/menu/load with storage amenu:in load

#perhaps store the value returned by 'load' and detach if failed, returning the same value
