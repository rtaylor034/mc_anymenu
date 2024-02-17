#> amenu:api > host/refresh
#--------------------
# -> host: HostIdentifier
# -> container_path: string
#--------------------
# ...
#--------------------
#> refreshes <host>'s <container_path>, displaying the latest-loaded menus
#--------------------
#- this is automatically called when menus are attach/loaded/detached, for advanced use only.
#--------------------
# 0.. - how many slots <host> is tracking in <container_path>
#--------------------

# affects {var -> items}
execute store result score *refresh amenu_return run function amenu:impl/host/refresh/get with storage amenu:in refresh

data modify storage amenu:var refresh.call.identifier set from storage amenu:in refresh.host
function amenu:internal/api/host/get with storage amenu:var refresh.call

execute if data storage amenu:in refresh.host.entity run data modify storage amenu:in fill.target.guuid set from storage amenu:var _get.result.internal.guuid
execute if data storage amenu:in refresh.host.block run data modify storage amenu:in fill.target set from storage amenu:in refresh.host.block
data modify storage amenu:in fill.container_path set from storage amenu:in refresh.container_path
data modify storage amenu:in fill.items set from storage amenu:var refresh.items
function amenu:internal/api/fill

data remove storage amenu:in refresh
data remove storage amenu:var refresh

return run scoreboard players get *refresh amenu_return