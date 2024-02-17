#> amenu:impl/menu/load/set_hostdata
#--------------------
# ./do
#--------------------

$data modify storage amenu:data active_hosts.$(host_pool)[{menus:[{internal:{menu_id:$(menu_id)}}]}].internal.stacks set from storage amenu:var load.this_host.internal.stacks