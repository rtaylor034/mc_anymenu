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
    menus[]: RootMenu
    container_path: string
    internal: {
        prev_items[]: Item
        saved_items[]: Item
    }
}

RootMenu: {
    internal: {
        #-- for knowing what items to load if menu <a> is 'uncovered' by menu <b> being detached
        current_items[]: Item
        menu_id: int
    }
    (Menu)
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
        index? any
    }
}
Item: {
    id: string
    Count: byte
    Slot: byte
    tag: ITEM NBT
}

-- WHERE IM AT --
what to do/how to implement stacking/fluid menus (i.e. multiple menus in a single host that would overlap)

-- THOUGHTS --
- by default the menu last loaded should stack on-top of other menus
- menus should NOT be able to resize, the root menu slots define all submenu slots
- on death/block broken, dropped 'menu items' should be detected and their item data should be replaced with their corresponding Slot's saved item (opposed to just killing them and summoning new items)
- fliud menus will try to move out of the way if another menu would cover them

-- TODO --
- Implement stacking for 'api/load'
- attach
- detach

-- SHOULDS --
- anymenu's 'tick' should be before all dependent packs. (this primarily so menu items dropped on death can be killed before being detected)