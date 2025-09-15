pragma ComponentBehavior: Bound

import Quickshell
import QtQuick
import Quickshell.Wayland
import "modules/bar"

ShellRoot {

    TopBar {}

    BottomBar {}

    LeftBar {}

    RightBar {}

    EdgeCorner {
        vertical: "top"
        horizontal: "left"
    }

    EdgeCorner {
        vertical: "top"
        horizontal: "right"
    }

    EdgeCorner {
        vertical: "bottom"
        horizontal: "left"
    }

    EdgeCorner {
        vertical: "bottom"
        horizontal: "right"
    }

}
