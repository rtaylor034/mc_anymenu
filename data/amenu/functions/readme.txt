GENERAL USE INFO

dependencies:
- gssen

supports:


# EDGE CASES
- handle active menu entity death (ensure safety of saved items)

amenu:data {
    active_hosts: {
        entities[]: {
            UUID: uuid
            internal: {
                guuid: guuid
            }
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
    internal: {
        prev_items[]: Item
        saved_items[]: Item
        checked_containers[]: {path: string}
    }
}

RootMenu: {
    internal: {
        #-- for knowing what items to display if menu <a> is 'uncovered' by menu <b> being detached
        last_loaded[]: Item
        container_path: string
        menu_id: int
        #-- just so loading doesnt have to manually 'index_of' for figuring out layers
        index: int
        shadowed_slots[]: {
            from: MenuId
            slot: byte
        }
    }
    (Menu)
}

Menu: {
    #-- provided $(payload: any) $(menu_id: MenuId)
    on_load[]? string
    #-- provided $(interaction: InteractData) $(menu_id: MenuId)
    on_real_interact[]? string
    items[]: MenuItem
    sub_menus: {
        <ident...>? Menu
    }
}

InteractData: {
    removed[]: Item
    added[]: Item
}
MenuItem: {
    item: {
        Slot: byte
        (Item?)
    }
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
    tag? ItemNbt
}

ItemNbt: {
    amenu? {
        path[]: string
        payload? any
    }
    (ANY)
}

-- WHERE IM AT --
- adding more functionality to on_load.
  - on_load functions should run AS the 'selector' player and AT the host.
  - 2 solutions for menu loads not having a 'selector' (ex: when a menu is just attached):
    - have an 'on_attach' root-exclusive field that is called instead of 'on_load' when a menu is attached.
    - have a 'method' parameter to 'menu/load' that provides how the menu was loaded (attach or selected)
     ~ having 'method' could potentially be used for more selection types like 'drop' 'offhand' 'click'.

-- THOUGHTS --
^ menus attached last are always on top
^ menus should NOT be able to resize, the root menu slots define all submenu slots
- on death/block broken, dropped 'menu items' should be detected and their item data should be replaced with their corresponding Slot's saved item (opposed to just killing them and summoning new items)
- ensure that block host menu items CANNOT be hoppered (or find some way to support hopper behavior)

-- TODO --

-- SHOULDS --
- anymenu's 'tick' should be before all dependent packs. (this primarily so menu items dropped on death can be killed before being detected)