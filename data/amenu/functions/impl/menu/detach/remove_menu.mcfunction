#> amenu:impl/menu/detach/remove_menu
#--------------------
# ./do
#--------------------

$data modify storage amenu:data active_hosts.$(host_pool)[{menus:[{internal:{menu_id:$(menu_id)}}]}].internal.saved_items set from storage amenu:var detach.this_host.internal.saved_items

$data remove storage amenu:data active_hosts.$(host_pool)[{menus:[{internal:{menu_id:$(menu_id)}}]}].menus[{internal:{menu_id:$(menu_id)}}]

return 1