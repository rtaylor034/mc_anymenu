#> amenu:impl/menu/attach/failed
#--------------------
# - @api
#--------------------

data modify storage amenu:in detach.in.menu_id set from storage amenu:var attach.root.internal.menu_id
function amenu:api/menu/detach with storage amenu:in detach