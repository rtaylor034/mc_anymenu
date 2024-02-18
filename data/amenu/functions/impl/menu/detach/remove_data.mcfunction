#> amenu:impl/menu/detach/remove_data
#--------------------
# @api
#--------------------

$data remove storage amenu:out _getm.host.menus[{internal:{menu_id:$(menu_id)}}]
$data remove storage amenu:out _getm.host.internal.stacks[].stack[{from:$(menu_id)}]