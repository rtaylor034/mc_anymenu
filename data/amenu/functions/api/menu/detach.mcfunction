#> amenu:api > menu/detach
#--------------------
# -> host: {x: int, y: int, z: int} | {UUID: uuid}
# -> menu_id: Menu
#--------------------
# ...
#--------------------
#> detaches the menu specified by <menu_id> from <host>, freeing any slots used.
#--------------------
#- slots used by the detached menu are reverted to their previous state.
#--------------------
# 1 - success
# -1 - <host> does not exist or is invalid. 
# -2 - <menu_id> does not exist on <host> or is invalid.
#--------------------

$data modify storage amenu:in detach set value $(in)

function amenu:impl/menu/detach/do with storage amenu:in detach

scoreboard players reset *detach.this_index amenu_var
data remove storage amenu:var detach
data remove storage amenu:in detach