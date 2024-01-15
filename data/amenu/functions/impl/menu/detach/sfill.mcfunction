#> amenu:impl/menu/detach/sfill
#--------------------
# ./do (iter 'i' 0 -> *detach.this_index (-1))
#--------------------

#re-use of variable to iterate backwards
scoreboard players remove *detach.this_index amenu_var 1
execute store result storage amenu:var detach.i int 1 run scoreboard players get *detach.this_index amenu_var

function amenu:impl/menu/detach/sfill.1 with storage amenu:var detach
