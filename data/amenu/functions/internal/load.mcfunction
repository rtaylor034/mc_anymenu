#>amenu:internal/load
#--------------------
# @LOAD
#--------------------

scoreboard players set *amenu load.status 1

#settings
execute unless data storage amenu:settings {PERSIST:true} run function amenu:settings

#declare storage amenu:var
#declare storage amenu:in
#declare storage amenu:out
#declare storage amenu:data
scoreboard objectives add amenu_var dummy
scoreboard objectives add amenu_return dummy
scoreboard objectives add amenu_data dummy

schedule clear amenu:internal/tick
schedule function amenu:internal/tick 1t