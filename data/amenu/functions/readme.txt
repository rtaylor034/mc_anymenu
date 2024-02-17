GENERAL USE INFO

dependencies:
- gssen

supports:


# EDGE CASES
- handle active menu entity death (ensure safety of saved items)

amenu:data {
    active_hosts[]: Host
}

Host: {
    identifier: HostIdentifier
    menus[]: RootMenu
    internal: {
        prev_items[]: Item
        checked_containers[]: {path: string}
        stacks[]: {
            location: {
                Slot: byte
                container: string
            }
            saved: Item
            stack[]: {
                item: Item
                from: MenuId
            }
       }
       # present if host is type 'entity'
       guuid? guuid
    }
}

HostIdentifier: BlockIdentifier | EntityIdentifier

BlockIdentifier: {
    block: {
        x: int
        y: int
        z: int
    }
}

EntityIdentifier: {
    UUID: uuid
}

RootMenu: {
    internal: {
        container_path: string
        menu_id: MenuId
    }
    (Menu)
}

Menu: {
    #-- gvent : -> menu_id: MenuId ; -> payload: any
    on_load[]? mstring<Function>
    #-- gvent : -> interaction: InteractData, -> menu_id: MenuId
    on_real_interact[]? mstring<Function>
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

MenuId: int

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