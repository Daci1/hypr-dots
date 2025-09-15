pragma Singleton
pragma ComponentBehavior: Bound

import Quickshell

Singleton {
    id: root

    property bool isDrawerOpen: false

    function setDrawerState(isOpen: bool) {
        root.isDrawerOpen = isOpen
    }
}