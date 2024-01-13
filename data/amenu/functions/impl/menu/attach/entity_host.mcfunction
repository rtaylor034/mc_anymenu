#> amenu:impl/menu/attach/entity_host
#--------------------
# @api
#--------------------

$execute store success score *attach.host_exists amenu_var run data modify storage amenu:var attach.existing_host set from storage amenu:data active_hosts.entities[$(host)]

execute if score *attach.host_exists amenu_var matches 1 run function amenu:impl/menu/attach/update_entity with storage amenu:in attach
execute if score *attach.host_exists amenu_var matches 0 run function amenu:impl/menu/attach/new_entity with storage amenu:in attach
