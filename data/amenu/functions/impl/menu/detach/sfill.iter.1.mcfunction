#> amenu:impl/menu/detach/sfill.iter.1

$execute store result score *detach.sfill amenu_var run data remove storage amenu:var detach.items[{Slot:$(Slot)}]

execute if score *detach.sfill amenu_var matches 1.. run data modify storage amenu:in fill.in.items append from storage amenu:var detach.sfill.item