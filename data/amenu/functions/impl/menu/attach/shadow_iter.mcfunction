#> amenu:impl/menu/attach/shadow_iter
#--------------------
# ./shadow_menus
#--------------------

#affects {var -> attach.save}
function amenu:impl/menu/attach/shadow_iter.1 with storage gssen:out intersection.shared[-1]
data modify storage gssen:out intersection.shared[-1].from set from storage amenu:var attach.root.internal.menu_id
data modify storage amenu:var attach.shadowed_menu.internal.shadowed_slots append from storage gssen:out intersection.shared[-1]
data remove storage gssen:out intersection.shared[-1]