#> amenu:impl/host/refresh/get
#--------------------
# @api
#--------------------

$return run data modify storage amenu:var refresh.items append from storage amenu:data active_hosts[{identifier:$(identifier)}].internal.stacks[{location:{container:$(container_path)}}].stack[-1].item
