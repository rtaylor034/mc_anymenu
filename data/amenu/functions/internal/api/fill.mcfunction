#> amenu:internal/api > fill
#--------------------
# -> target: {x: int, y: int, z: int} | {guuid: guuid}
# -> container_path: string
# -> items: Item[]
#--------------------
# <- ...
#--------------------
#> fills <target>'s container with <items> dynamically.
#> stores old items in <previous_items>
#--------------------
#- ...
#--------------------
# 0 - container does not have the slots to support <items>, failure.
# 1 - success
#--------------------

#TODO: now with multiple container paths possible, do the player-other container implementation split, and hardcode the differentiation between "Inventory" and "EnderItems" for players.
$data modify storage amenu:in fill set value $(in)

data modify storage amenu:var fill.macros set from storage amenu:in fill
data modify storage amenu:var fill.macros merge from storage amenu:in fill.target
execute if data storage amenu:in fill.target.x run function amenu:internal/impl/fill/block with storage amenu:var fill.macros
execute if data storage amenu:in fill.target.guuid run function amenu:internal/impl/fill/entity with storage amenu:var fill.macros

#resets
data remove storage amenu:in fill
data remove storage amenu:var fill

return run scoreboard players get *fill amenu_return

#WAS HERE - refactor this so container paths are respected and supports guuid input