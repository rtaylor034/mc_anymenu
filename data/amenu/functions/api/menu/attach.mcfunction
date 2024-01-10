#> amenu:api > host/attach
#--------------------
# -> host: {x: int, y: int, z: int} | {UUID: uuid}
# -> container_path: string
# -> menu: Menu
#--------------------
# <- menu_id: MenuId
#--------------------
#> activates <menu> on the block or entity specified by <host>.
#> the NBT path that <host> uses to store their array of Items should be specified by <container_path>.
#--------------------
#- for example, <container_path> should be "Inventory" if the <host> is a player, and "Items" if the <host> is a chest block. (it should be clear what a host's container path is from the output of a '/data get')
#--------------------
