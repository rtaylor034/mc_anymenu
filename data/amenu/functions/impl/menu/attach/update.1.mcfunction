#> amenu:impl/menu/attach/update.1
#--------------------
# ./update_entity
# ./update_block
#--------------------

data modify storage gssen:in intersection.a append from storage amenu:var attach.root.items[].item
data modify storage gssen:in intersection.b set from storage amenu:var attach.save
data modify storage gssen:in intersection.compare.only set value ["Slot"]
function gssen:api/array/set/intersection with storage gssen:in intersection

data modify storage amenu:in default.slots append from storage amenu:var attach.root.items[].item
data modify storage amenu:in default.items set from storage gssen:out intersection.shared_b
data modify storage amenu:in default.item set value {id:"minecraft:air",Count:1b}
function amenu:internal/api/items/default

data modify storage amenu:var attach.save set from storage amenu:out default.result

#affects {var -> attach.save}
data modify storage gssen:in repeat.function set value "amenu:impl/menu/attach/shadow_menus"
data modify storage gssen:in repeat.n set from storage amenu:var attach.root.internal.index
function gssen:api/inline/repeat

data modify storage amenu:var attach.existing_host.internal.saved_items append from storage amenu:var attach.save[]