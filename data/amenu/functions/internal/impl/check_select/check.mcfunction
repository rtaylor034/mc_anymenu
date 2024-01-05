#> amenu:internal/impl/check_select/check
#--------------------
# - amenu:internal/api/check_select
#--------------------

$data modify storage amenu:var check_select.current_items set from $(target) $(container_path)
data modify storage gssen:in difference.in.a set from storage amenu:var check_select.current_items
data modify storage gssen:in difference.in.b set from storage amenu:var check_select.prev_items
function gssen:api/array/set/difference with storage gssen:in difference

