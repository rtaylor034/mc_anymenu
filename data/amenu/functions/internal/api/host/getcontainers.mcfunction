#> amenu:internal/api > host/getcontainers
#--------------------
# -> host: Host
#--------------------
# <- result: {path: string}[]
#--------------------
#> gets <host>'s used containers
#--------------------

#>---- D E B U G --------
data modify storage loggr:in log.message set from storage amenu:in _getcontainers
function loggr:api/log
#>--------------

data modify storage gssen:in ensure.array set value []
data modify storage gssen:in ensure.array append from storage amenu:in _getcontainers.host.menus[].internal

#>---- D E B U G --------
data modify storage loggr:in log.message set from storage gssen:in ensure
function loggr:api/log
#>--------------
data modify storage gssen:in ensure.compare.only set value ["container_path"]
function gssen:api/array/set/ensure

#>---- D E B U G --------
data modify storage loggr:in log.message set from storage gssen:out ensure
function loggr:api/log
#>--------------

data modify storage amenu:out _getcontainers.result set from storage gssen:out ensure.compared

data remove storage amenu:in _getcontainers