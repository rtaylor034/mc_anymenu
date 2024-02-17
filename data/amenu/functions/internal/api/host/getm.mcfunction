#> amenu:internal/api > host/getm
#--------------------
# [DIRECT] -> menu_id: obj
#--------------------
# <- host: Host
# <- menu: RootMenu
#--------------------
#> gets an active host by <menu_id>
#--------------------

$data modify storage amenu:out _getm.host set from storage amenu:data active_hosts[menus:[{internal:{menu_id:$(menu_id)}}]]
$return run data modify storage amenu:out _getm.menu set from storage amenu:out _getm.host.menus[{internal:{menu_id:$(menu_id)}}]