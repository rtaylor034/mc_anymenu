#> amenu:internal/api > fill
#--------------------
# -> target: {block:{x: int, y: int, z: int}} | {entity: string (selector)}
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
#~ could technically *slightly* more efficient if <target> followed the same format as amenu:api/menu/load's, but this way its mOrE DYnaMiC
#--------------------

$data modify storage amenu:in fill set value $(in)

execute if data storage amenu:in fill.target.block run function amenu:internal/impl/fill/block with storage amenu:in fill.target.block
execute if data storage amenu:in fill.target.entity run function amenu:internal/impl/fill/entity with storage amenu:in fill.target

#resets
data remove storage amenu:in fill
data remove storage amenu:var fill

return run scoreboard players get *fill amenu_return