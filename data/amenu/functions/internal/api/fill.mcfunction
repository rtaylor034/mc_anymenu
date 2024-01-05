#> amenu:internal/api > fill
#--------------------
# -> target: string
# -> items: Item[]
#--------------------
# <- ...
#--------------------
#> fills <target>'s <path> container with <items> dynamically.
#> stores old items in <previous_items>
#--------------------
#- example <target>s :"block 1 2 3", "entity @s"
#--------------------
# 0 - container does not have the slots to support <items>, failure.
# 1 - success
#--------------------

$data modify storage amenu:in fill set value $(in)

execute store result storage gssen:in repeat.in.n int 1 if data storage amenu:in fill.items[]
data modify storage gssen:in repeat.in.function set value "amenu:internal/impl/fill/iter"
data modify storage gssen:in repeat.in.with set value "amenu:in fill"
execute store result score *fill amenu_return run function gssen:api/inline/repeat with storage gssen:in repeat

#resets
data remove storage amenu:in fill
data remove storage amenu:var fill

return run scoreboard players get *fill amenu_return