#> amenu:internal/impl/host/add/guuid
#--------------------
# @api
#--------------------

data modify storage gssen:in guuid.UUID set from storage amenu:in _add.identifier.entity.UUID
function gssen:api/meta/guuid
data modify storage amenu:out _add.result.internal.guuid set from storage gssen:out guuid.result
