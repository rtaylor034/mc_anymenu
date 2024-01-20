#> amenu:impl/menu/attach/shadow_menus
#--------------------
# ./update_block
# ./update_entity
#--------------------

$data modify storage amenu:var attach.shadowed_menu set from storage amenu:var attach.existing_host.menus[{internal:{index:$(i)}}]

data modify storage gssen:in intersection.in.a append from storage amenu:var attach.root.items[].item
data modify storage gssen:in intersection.in.b append from storage amenu:var attach.shadowed_menu.items[].item
data modify storage gssen:in intersection.in.compare.only set value ["Slot"]
function gssen:api/array/set/intersection with storage gssen:in intersection

#affects {var -> attach.save}
data modify storage gssen:in repeat.in.function set value "amenu:impl/menu/attach/shadow_iter"
execute store result storage gssen:in repeat.in.n int 1 if data storage gssen:out intersection.shared[]
function gssen:api/inline/repeat with storage gssen:in repeat

$data modify storage amenu:var attach.existing_host.menus[{internal:{index:$(i)}}] set from storage amenu:var attach.shadowed_menu
