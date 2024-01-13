#> amenu:internal/impl/fill/entity
#--------------------
# @api
#--------------------

$execute as $(guuid) if entity @s[type=player] run function amenu:internal/impl/fill/player/entry with storage amenu:var fill.macros

$execute as $(guuid) if entity @s[type=!player] run function amenu:internal/impl/fill/player/non_player with storage amenu:var fill.macros