#> amenu:api > menu/load
#--------------------
# -> path: string[]
# -> identifier: {UUID: uuid} | {x: int, y: int, z: int}
# -> menu_index: int
# -> payload: obj
#--------------------
# 1 - success
# -1 - <identifier> is not an active menu or is invalid. 
# -2 - <path> does not exist in the given menu.
# -3 - <menu_index> is invalid.
# -4 - container specified by <identifier> does not have the slots to support the specified menu.
#--------------------
#> loads and displays the menu at the given <path> (and <menu_index>) with <payload> on an active menu container (<identifier>)
#> IMPORTANT - loaded menu is NOT checked for validity. Duplicate/missing slots may cause undefined behavior.
#--------------------
#- expected slots are defined by the root menu's items.
#- under normal circumstances, this method is called automatically when a menu item (item with 'amenu' tag; i.e. non-real item) is selected.
#- this method should only be utilized for advanced custom behavior, from functions that are called via 'on_real_interact'
#--------------------

$data modify storage amenu:in load set value $(in)

execute store result score *load amenu_return run function amenu:impl/menu/load/do with storage amenu:in load

scoreboard players reset *load.valid_path amenu_var
data remove storage amenu:in load
data remove storage amenu:var load

return run scoreboard players get *load amenu_return
