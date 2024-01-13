#> amenu:impl/menu/load/rfill
#--------------------
# ./do (iter 'i')
#--------------------

#only excluding slots from menus that have indexes GREATER than the menu being loaded
$execute if score *load.this_index amenu_var matches ..$(i) run return 1

#LEFTOFF HERE