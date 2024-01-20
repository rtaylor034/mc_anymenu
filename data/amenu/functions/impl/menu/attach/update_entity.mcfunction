#> amenu:impl/menu/attach/update_entity
#--------------------
# ./entity_host
#--------------------

execute store result storage amenu:var attach.root.internal.index int 1 if data storage amenu:var attach.existing_host.menus[]

data modify storage amenu:var attach.existing_host.menus append from storage amenu:var attach.root
$execute unless data storage amenu:var attach.existing_host.internal.checked_containers[{path:"$(container_path)"}] run data modify storage amenu:var attach.existing_host.internal.checked_containers[{path:"$(container_path)"}] append value {path:"$(container_path)"}

data modify storage amenu:var attach.macro set from storage amenu:in attach
data modify storage amenu:var attach.macro.guuid set from storage amenu:var attach.existing_host.internal.guuid
#affects {var -> attach.save}
function amenu:impl/menu/attach/update_entity.1 with storage amenu:var attach.macro

#affects {var -> attach.existing_host}
function amenu:impl/menu/attach/update.1

$data modify storage amenu:data active_hosts.entities[$(host)] set from storage amenu:var attach.existing_host