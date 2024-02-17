#> amenu:internal/api > host/getm
#--------------------
# [DIRECT] -> menu_id: obj
#--------------------
# <- result: Host
#--------------------
#> gets an active host by <menu_id>
#--------------------

$return run data modify storage amenu:out _getm.result set from storage amenu:data active_hosts[menus:[{internal:{menu_id:$(menu_id)}}]]
