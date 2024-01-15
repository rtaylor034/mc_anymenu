#> amenu:impl/menu/detach/remove_host
#--------------------
# ./do
#--------------------

$data remove storage amenu:data active_hosts.$(host_pool)[{menus:[{internal:{menu_id:$(menu_id)}}]}]

return 1