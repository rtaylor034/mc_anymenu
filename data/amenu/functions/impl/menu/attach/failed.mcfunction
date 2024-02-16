#> amenu:impl/menu/attach/failed
#--------------------
# - @api
#--------------------

data modify storage amenu:in detach.menu_id set from storage amenu:var attach.root.internal.menu_id
function amenu:api/menu/detach