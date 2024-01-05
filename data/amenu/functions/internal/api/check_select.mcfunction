#> amenu:internal/api > check_select
#--------------------
# -> active_obj: obj ({amenu:data -> active_menus.<blocks|entities>} entry)
# -> target: string
#--------------------
# <- ...
#--------------------
#> does the magic of checking and selecting
#--------------------
#- example <target>s :"block 1 2 3", "entity @s"
#--------------------
# ...
#--------------------

$data modify storage amenu:in check_select set value $(in)

data modify storage amenu:var check_select set from storage amenu:in check_select
data modify storage amenu:var check_select merge from storage amenu:var check_select.internal
function amenu:internal/impl/check_select/check with storage amenu:var check_select

#"on_load" is a set of functions that is called when a 'menu item' is selected, and a menu page is loaded. 'menu item's can hold a payload in their nbt to pass to these functions.
#"on_real_interact" is run when a non-'menu item' item is taken/placed in the menu page, and the entire item(s) are passed to these functions
#resets
data remove storage amenu:in check_select
data remove storage amenu:var check_select
