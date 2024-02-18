#> amenu:impl/menu/detach/stack_iter
#--------------------
# ./remove_stacks
#--------------------

$execute store result score *detach.stack amenu_var if data storage amenu:out _get.host.internal.stacks[$(i)].stack[]
$execute if score *detach.stack amenu_var matches ..1 run data remove storage amenu:out _get.host.internal.stacks[$(i)]