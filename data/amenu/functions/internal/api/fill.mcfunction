#> amenu:internal/api > fill
#--------------------
# -> target: {x: int, y: int, z: int} | {guuid: guuid}
# -> container_path: string
# -> items: Item[]
#--------------------
# <- ...
#--------------------
#> fills <target>'s <container_path> with <items> dynamically.
#--------------------
#- does not check for invalid slots
#--------------------
# ...
#--------------------

data modify storage amenu:var fill.macros set from storage amenu:in fill
data modify storage amenu:var fill.macros merge from storage amenu:in fill.target
execute if data storage amenu:in fill.target.x run function amenu:internal/impl/fill/block with storage amenu:var fill.macros
execute if data storage amenu:in fill.target.guuid run function amenu:internal/impl/fill/entity with storage amenu:var fill.macros

#resets
data remove storage amenu:in fill
data remove storage amenu:var fill
