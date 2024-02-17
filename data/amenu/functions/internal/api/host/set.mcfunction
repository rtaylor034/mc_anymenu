#> amenu:internal/api > host/set
#--------------------
# [DIRECT] -> identifier: HostIdentifier
# [DIRECT] -> host: Host
#--------------------
# ...
#--------------------
#> sets the host with a menu matching <identifier> to <host>
#--------------------

$data modify storage amenu:data active_hosts[{identifier:$(identifier)}] set value $(host)
