#> amenu:impl/menu/attach/shadow_menus
#--------------------
# ./update_block
# ./update_entity
#--------------------

$data modify storage amenu:var attach.shadowed_menu set from storage amenu:var attach.existing_host.menus[$(i)]

data modify storage gssen:in intersection.in.a set from storage amenu:var attach.root.items
data modify storage gssen:in intersection.in.b set from storage amenu:var attach.shadowed_menu.items
data modify storage gssen:in intersection.in.compare.only set value ["Slot"]
function gssen:api/array/set/intersection with storage gssen:in intersection

data modify storage gssen:in repeat.in.function set value "amenu:impl/menu/attach/shadow_iter"
execute store result storage gssen:in repeat.in.n int 1 if data storage gssen:out intersection.shared[]
function gssen:api/inline/repeat with storage gssen:in repeat

$data modify storage amenu:var attach.existing_host.menus[$(i)] set from storage amenu:var attach.shadowed_menu
