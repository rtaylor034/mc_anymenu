#> amenu:impl/menu/attach/entity_host
#--------------------
# @api
#--------------------

#cheugy-ish, probs not a big deal but can prob be optimized
$execute unless data storage amenu:data active_hosts.entities[$(host)] run data modify storage amenu:data active_hosts.entities append value $(host)

data modify storage amenu:var attach.root.internal.index set value 0
$execute store result storage amenu:var attach.root.internal.index int 1 if data storage amenu:data active_hosts.entities[$(host)].menus[]

$data modify storage amenu:data active_hosts.entities[$(host)].menus append from storage amenu:var attach.root

$execute unless data storage amenu:data active_hosts.entities[$(host)].internal.checked_containers[{path:$(container_path)}] run data modify storage amenu:data active_hosts.entities[$(host)].internal.checked_containers[{path:$(container_path)}] append value {path:"$(container_path)"}