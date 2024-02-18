#> amenu:impl/menu/detach/remove_stacks
#--------------------
# @api
#--------------------

data modify storage gssen:in repeat.function set value "amenu:impl/menu/detach/stack_iter"
execute store result storage gssen:in repeat.n int 1 if data storage amenu:out _get.host.internal.stacks[]
function gssen:api/inline/repeat

$data modify storage amenu:data active_hosts[{identifier:$(identifier)}] set from storage amenu:out _get.host