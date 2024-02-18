#> amenu:api > menu/attach
#--------------------
# -> host: HostIdentifier
# -> container_path: string
# -> menu: Menu
#--------------------
# <- result: MenuId
#--------------------
#> activates <menu> on the block or entity specified by <host>.
#> the NBT path that <host> uses to store their array of Items should be specified by <container_path>.
#> generates and returns the attached <menu>'s menu_id as >result<.
#--------------------
#- it is necessary to store >result< for later use with amenu:api/menu/detach.
#- ex <container_path>: "Inventory" if the <host> is a player, or "Items" if the <host> is a chest block. (it should be clear what a host's container path is from the output of a '/data get')
#- this function is relatively expensive; avoid unecessary calls.
#- automatically loads the menu (amenu:api/menu/load)
#--------------------
# 1 - success.
# 0 - could not load the menu, menu not attached. (<menu> failed with amenu:api/menu/load)
#--------------------

scoreboard players add *max_menuid amenu_data 1
data modify storage amenu:var attach.root set from storage amenu:in attach.menu
execute store result storage amenu:var attach.root.internal.menu_id int 1 run scoreboard players get *max_menuid amenu_data
data modify storage amenu:var attach.root.internal.container_path set from storage amenu:in attach.container_path

data modify storage amenu:out attach.result set from storage amenu:var attach.root.internal.menu_id

data modify storage amenu:var attach.call.identifier set from storage amenu:in attach.host
execute store result score *attach.exists amenu_var run function amenu:internal/api/host/get with storage amenu:var attach.call
data modify storage amenu:var attach.this_host set from storage amenu:out _get.result

execute unless score *attach.exists amenu_var matches 1.. run data modify storage amenu:in _add.identifier set from storage amenu:in attach.host
execute unless score *attach.exists amenu_var matches 1.. run function amenu:internal/api/host/add
execute unless score *attach.exists amenu_var matches 1.. run data modify storage amenu:var attach.this_host set from storage amenu:out _add.result

data modify storage amenu:var attach.this_host.menus append from storage amenu:var attach.root

data modify storage amenu:var attach.stack_element.from set from storage amenu:var attach.root.internal.menu_id
data modify storage amenu:var attach.stack_element.item set value {}
data modify storage amenu:var attach.menu_items set from storage amenu:var attach.root.items
data modify storage amenu:var attach.each_pass.location.container_path set from storage amenu:in attach.container_path
data modify storage amenu:var attach.each_pass.location.Slot set from storage amenu:var attach.menu_items[-1].item.Slot
execute if data storage amenu:var attach.menu_items[] run function amenu:impl/menu/attach/each_item with storage amenu:var attach.each_pass

data modify storage amenu:in _getcontainers.host set from storage amenu:var attach.this_host
function amenu:internal/api/host/getcontainers
data modify storage amenu:var attach.this_host.internal.checked_containers set from storage amenu:out _getcontainers.result

data modify storage amenu:var attach.call.identifier set from storage amenu:in attach.host
data modify storage amenu:var attach.call.host set from storage amenu:var attach.this_host
function amenu:internal/api/host/set with storage amenu:var attach.call

data modify storage amenu:in load.menu_id set from storage amenu:var attach.root.internal.menu_id
data modify storage amenu:in load.path set value []
execute store result score *attach.load_return amenu_var run function amenu:api/menu/load

#detaches the menu
execute unless score *attach.load_return amenu_var matches 1 run function amenu:impl/menu/attach/failed
execute store success score *attach amenu_return if score *attach.load_return amenu_var matches 1

scoreboard players reset *attach.load_return amenu_var
scoreboard players reset *attach.exists amenu_var
data remove storage amenu:var attach
data remove storage amenu:in attach

return run scoreboard players get *attach amenu_return