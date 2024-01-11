#> amenu:internal/impl/fill/entity
#--------------------
# - @api
#--------------------

#TODO: make this implementation specific to players, and then just do direct NBT modification for non-players and blocks
$execute as @e[nbt={UUID:$(UUID)},limit=1] at @s run function amenu:internal/impl/fill/entity.1