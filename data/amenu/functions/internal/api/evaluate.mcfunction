#> amenu:internal/api > evaluate
#--------------------
# -> items: MenuItem[]
#--------------------
# <- result: Item[]
#--------------------
#> evaluates <items> to real Items
#--------------------
#- ...
#--------------------
# 1 - success
# 0 - failure (one or more <items> did not evaluate to have a 'Slot' tag)
#--------------------

data modify storage amenu:out evaluate.result set value []

execute store result score *evaluate.count amenu_var if data storage amenu:in evaluate.items[]
data modify storage gssen:in repeat.function set value "amenu:internal/impl/evaluate/iter"
data modify storage gssen:in repeat.with set value "amenu:in evaluate"
execute store result storage gssen:in repeat.n int 1 run scoreboard players get *evaluate.count amenu_var

execute store result score *evaluate.successes amenu_var run function gssen:api/inline/repeat

execute store success score *evaluate amenu_return if score *evaluate.successes amenu_var = *evaluate.count amenu_var

data remove storage amenu:var evaluate
data remove storage amenu:in evaluate
scoreboard players reset *evaluate.successes amenu_var
scoreboard players reset *evaluate.count amenu_var

return run scoreboard players get *evaluate amenu_return