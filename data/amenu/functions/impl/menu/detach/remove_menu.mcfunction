#> amenu:impl/menu/detach/remove_menu
#--------------------
# ./do
#--------------------

$data remove storage amenu:var detach.this_host.menus[{internal:{menu_id:$(menu_id)}}]

#affects {var -> detach.this_host.internal.checked_containers}
data modify storage amenu:var detach.temp set from storage amenu:var detach.this_host.internal.checked_containers
data modify storage gssen:in repeat.function set value "amenu:impl/menu/detach/remove_menu.iter"
execute store result storage gssen:in repeat.n int 1 if data storage amenu:var detach.temp[]
function gssen:api/inline/repeat

$data modify storage amenu:data active_hosts.$(host_pool)[{menus:[{internal:{menu_id:$(menu_id)}}]}] set from storage amenu:var detach.this_host
return 1