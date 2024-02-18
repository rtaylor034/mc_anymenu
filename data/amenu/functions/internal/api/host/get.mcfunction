#> amenu:internal/api > host/get
#--------------------
# [DIRECT] -> identifier: obj
#--------------------
# <- result: Host
#--------------------
#> gets an active host by <identifier>
#--------------------

data remove storage amenu:out _get.result
$return run data modify storage amenu:out _get.result set from storage amenu:data active_hosts[{identifier:$(identifier)}]
