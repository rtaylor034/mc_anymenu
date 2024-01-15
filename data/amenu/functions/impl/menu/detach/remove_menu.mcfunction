#> amenu:impl/menu/detach/remove_menu
#--------------------
# ./do
#--------------------

$data remove storage amenu:data active_hosts.$(host_pool)[{menus:[{internal:{menu_id:$(menu_id)}}]}].menus[{internal:{menu_id:$(menu_id)}}]

return 1