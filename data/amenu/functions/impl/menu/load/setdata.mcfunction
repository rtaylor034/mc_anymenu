#> amenu:impl/menu/load/setdata
#--------------------
# ./do
#--------------------

$execute if data storage amenu:in load.host.UUID run data modify storage amenu:data active_hosts.entities[$(this_host)].menus[{internal:{menu_id:$(menu_id)}}].internal.last_loaded set from storage amenu:var load.items

$execute if data storage amenu:in load.host.x run data modify storage amenu:data active_hosts.blocks[$(this_host)].menus[{internal:{menu_id:$(menu_id)}}].internal.last_loaded set from storage amenu:var load.items