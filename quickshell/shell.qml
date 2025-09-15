pragma ComponentBehavior: Bound

import Quickshell
import QtQuick
import Quickshell.Wayland
import QtQuick.Layouts
import "modules/bar"
import "modules/drawer"

ShellRoot {
    Item {
        anchors.fill: parent

        TopBar {
            id: topBar
        }

        BottomBar {}

        LeftBar {
            id: leftBar
        }

        RightBar {}

        EdgeCorner {
            id: topLeftCorner
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

        TopDrawer {}
    }
}
