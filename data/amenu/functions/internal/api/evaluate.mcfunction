#> amenu:internal/api > evaluate
#--------------------
# -> items: 'item entry'[]
#--------------------
# <- result: Item[]
#--------------------
#> evaluates item entries to real Items
#--------------------
#- example <target>s :"block 1 2 3", "entity @s"
#--------------------
# ...
#--------------------

$data modify storage amenu:in evaluate set value $(in)
data modify storage amenu:out evaluate.result set value []

data modify storage gssen:in repeat.in.function set value "amenu:internal/impl/evaluate/iter"
data modify storage gssen:in repeat.in.with set value "amenu:in evaluate"
execute store result storage gssen:in repeat.in.n int 1 if data storage amenu:in evaluate.items[]
function gssen:api/inline/repeat with storage gssen:in repeat

data remove storage amenu:var evaluate
data remove storage amenu:in evaluate