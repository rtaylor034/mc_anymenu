#> amenu:internal/api > items/default
#--------------------
# -> slots: {Slot: byte ...}
# -> items: Item[]
# -> item: Item[](- 'Slot')
#--------------------
# <- result: Item[]
#--------------------
#> fills the missing <slots> in <items> with <item>
#--------------------
# - default item entries are appended to <items>
#--------------------
# ...
#--------------------

$data modify storage amenu:in default set value $(in)
data remove storage amenu:in default.item.Slot

data modify storage amenu:out default.result set value []
data modify storage amenu:out default.result append from storage amenu:in default.items[]

data modify storage gssen:in difference.in.a set from storage amenu:in default.items
data modify storage gssen:in difference.in.b set from storage amenu:in default.slots
data modify storage gssen:in difference.in.compare.only set value ["Slot"]
function gssen:api/array/set/difference with storage gssen:in difference

data modify storage gssen:in repeat.in.function set value "amenu:internal/impl/items/default/iter"
data modify storage gssen:in repeat.in.with set value "amenu:in default"
execute store result storage gssen:in repeat.in.n int 1 if data storage gssen:out difference.unique_b[]
function gssen:api/inline/repeat with storage gssen:in repeat