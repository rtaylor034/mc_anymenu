#> amenu:internal/api > host/get
#--------------------
# [DIRECT] -> identifier: obj
#--------------------
# <- result: Host
#--------------------
#> gets an active host by <identifier>
#--------------------

$return run data modify storage amenu:out _get.result set from storage amenu:data active_hosts[{identifier:$(identifier)}]
