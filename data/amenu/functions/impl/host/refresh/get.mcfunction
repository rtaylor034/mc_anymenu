#> amenu:impl/host/refresh/get
#--------------------
# @api
#--------------------

$return run data modify storage amenu:var refresh.items append from storage amenu:data active_hosts[{identifier:$(host)}].internal.stacks[{location:{container_path:$(container_path)}}].stack[-1].item
