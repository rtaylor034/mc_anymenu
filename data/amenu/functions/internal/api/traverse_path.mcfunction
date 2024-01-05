#> amenu:internal/api > traverse_path
#--------------------
# -> menu: obj (Menu object)
# -> path: string[]
#--------------------
# <- result: obj (Menu object)
#--------------------
#> traverses <path> through <menu> and returns the sub-menu
#--------------------
#- if <path> is '[]', will return the root menu (<menu> itself)
#--------------------
# 0 - <path> does not exist in <menu>
# 1 - success
#--------------------

$data modify storage amenu:in traverse_path set value $(in)

data modify storage amenu:out traverse_path.result set from storage amenu:in traverse_path.menu

execute store result storage gssen:in repeat.in.n int 1 if data storage amenu:in traverse_path.path[]
data modify storage gssen:in repeat.in.function set value "amenu:internal/impl/traverse_path/traverse"
data modify storage gssen:in repeat.in.with set value "amenu:in traverse_path.path"
execute if data storage amenu:in traverse_path.path[] run function gssen:api/inline/repeat with storage gssen:in repeat

data remove storage amenu:in traverse_path
data remove storage amenu:var traverse_path

#set in 'amenu:internal/impl/traverse/traverse'
return run scoreboard players get *traverse_path amenu_return