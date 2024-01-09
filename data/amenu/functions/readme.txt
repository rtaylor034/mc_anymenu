GENERAL USE INFO

# EDGE CASES
- handle active menu entity death (ensure safety of saved items)

amenu:data {
    active_hosts: {
        entities[]: {
            UUID: uuid
            (Host)
        }
        blocks[]: {
            x: int
            y: int
            z: int
            (Host)
        }
    }
}

Host: {
    menus[]: Menu
    container_path: string
    internal: {
        saved_items[]: Item
        prev_items[]: Item
    }
}

Menu: {
    on_load[]: string
    items[]: MenuItem
    sub_menus: {
        <ident...>? Menu
    }
}

MenuItem: {
    item: Item
    source? {
        storage: string
        path: string
        index? int
    }
}
Item: {
    id: string
    Count: byte
    Slot: byte
    tag: ITEM NBT
}

