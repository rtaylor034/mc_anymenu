#> amenu:impl/menu/detach/saved.1

$data modify storage amenu:in fill.items append from storage amenu:var detach.this_host.internal.saved_items[{Slot:$(Slot)b}]

$data remove storage amenu:var detach.this_host.internal.saved_items[{Slot:$(Slot)b}]