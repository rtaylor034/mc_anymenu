#> amenu:impl/menu/attach/update_entity
#--------------------
# ./entity_host
#--------------------

data modify storage amenu:var attach.existing_host.menus append from storage amenu:var attach.root
$execute unless data storage amenu:var attach.existing_host.internal.checked_containers[{path:$(container_path)}] run data modify storage amenu:var attach.existing_host.internal.checked_containers[{path:$(container_path)}] append value {path:"$(container_path)"}

execute store result storage amenu:var attach.root.internal.index int 1 if data storage amenu:var attach.existing_host.menus[]

data modify storage gssen:in repeat.in.function set value "amenu:impl/menu/attach/shadow_menus"
data modify storage gssen:in repeat.in.n set from storage amenu:var attach.root.internal.index
function gssen:api/inline/repeat with storage gssen:in repeat

$data modify storage amenu:data active_hosts.entities[$(host)] set from storage amenu:var attach.existing_host