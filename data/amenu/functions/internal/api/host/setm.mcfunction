#> amenu:internal/api > host/setm
#--------------------
# [DIRECT] -> menu_id: MenuId
# [DIRECT] -> host: Host
#--------------------
# ...
#--------------------
#> sets the host with a menu matching <menu_id> to <host>
#--------------------

$data modify storage amenu:data active_hosts[menus:[{internal:{menu_id:$(menu_id)}}]] set value $(host)
