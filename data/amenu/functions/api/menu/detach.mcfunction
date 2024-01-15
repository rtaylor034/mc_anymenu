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

$data modify storage amenu:in detach set value $(in)

execute store result score *detach amenu_return run function amenu:impl/menu/detach/do with storage amenu:in detach

scoreboard players reset *detach.this_index amenu_var
data remove storage amenu:var detach
data remove storage amenu:in detach

return run scoreboard players get *detach amenu_return