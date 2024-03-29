#> amenu:api > menu/load
#--------------------
# -> menu_id: MenuId
# -> path: string[]
# => payload: obj = {}
#--------------------
# ...
#--------------------
#> loads and displays the menu at the given <path> (and <menu_id>) with <payload> on an active <host>
#> IMPORTANT - Loading menus with items with duplicate Slots or Slots that are not contained in the root menu will cause undefined behavior and is NOT checked for.
#--------------------
#- expected slots are defined by the root menu's items.
#- under normal circumstances, this method is called automatically when a menu item (item with 'amenu' tag; i.e. non-real item) is selected.
#- this method should only be utilized for advanced custom behavior, from functions that are called via 'on_real_interact'
#- if anything other than 1 is returned, no items were replaced/displayed.
#--------------------
# 1 - success
# -1 - <host> is not an active host or is invalid. 
# -2 - <path> does not exist in the given menu.
# -3 - <menu_id> is invalid.
# -4 - failed to evaluate menu items (missing 'Slot' keys for one or more items)
#--------------------

$data modify storage amenu:in load set value $(in)
execute unless data storage amenu:in load.payload run data modify storage amenu:in load.payload set value {}

execute store result score *load amenu_return run function amenu:impl/menu/load/do with storage amenu:in load

scoreboard players reset *load.valid_path amenu_var
scoreboard players reset *load.this_index amenu_var
data remove storage amenu:in load
data remove storage amenu:var load

return run scoreboard players get *load amenu_return
