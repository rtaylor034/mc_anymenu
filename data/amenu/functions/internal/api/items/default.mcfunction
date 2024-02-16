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

data remove storage amenu:in default.item.Slot

data modify storage amenu:out default.result set value []
data modify storage amenu:out default.result append from storage amenu:in default.items[]

data modify storage gssen:in difference.a set from storage amenu:in default.items
data modify storage gssen:in difference.b set from storage amenu:in default.slots
data modify storage gssen:in difference.compare.only set value ["Slot"]
function gssen:api/array/set/difference

data modify storage gssen:in repeat.function set value "amenu:internal/impl/items/default/iter"
data modify storage gssen:in repeat.with set value "amenu:in default"
execute store result storage gssen:in repeat.n int 1 if data storage gssen:out difference.unique_b[]
function gssen:api/inline/repeat