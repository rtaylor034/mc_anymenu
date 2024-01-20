#> amenu:impl/menu/load/do.1

$data modify storage amenu:data active_hosts.$(host_pool)[{menus:[{internal:{menu_id:$(menu_id)}}]}].menus[{internal:{menu_id:$(menu_id)}}].internal.last_loaded set from storage amenu:var load.items