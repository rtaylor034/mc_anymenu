#> amenu:api > host/attach
#--------------------
# -> host: {x: int, y: int, z: int} | {UUID: uuid}
# -> container_path: string
# -> menu: Menu
# => fluid: bool = false
#--------------------
# <- menu_id: MenuId
#--------------------
#> activates <menu> on the block or entity specified by <host>.
#> the NBT path that <host> uses to store their array of Items should be specified by <container_path>.
#> if <fluid> = true: <menu> will dynamically move slots if it would be covered by another menu.
#--------------------
#- for example, <container_path> should be "Inventory" if the <host> is a player, and "Items" if the <host> is a chest block. (it should be clear what a host's container path is from the output of a '/data get')
#- <fluid> is best for menus that take up a small number of slots and are not meant to be "pretty".
#--------------------
