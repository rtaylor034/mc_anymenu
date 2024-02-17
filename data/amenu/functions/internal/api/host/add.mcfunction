#> amenu:internal/api > host/add
#--------------------
# -> identifier: HostIdentifier
#--------------------
# <- result: Host
#--------------------
#> adds a host with <identifier> and returns it
#--------------------

data modify storage amenu:out _add.result set value {identifier:{},menus:[],internal:{prev_items:[], checked_containers:[], stacks:[]}}
data modify storage amenu:out _add.result.identifier set from storage amenu:in _add.identifier

execute if data storage amenu:in _add.identifier.entity run function amenu:internal/impl/host/add/guuid

data modify storage amenu:data active_hosts append from storage amenu:out _add.result.identifier

data remove storage amenu:in _add