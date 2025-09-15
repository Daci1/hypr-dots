import Quickshell
import QtQuick

import "root:services"

PanelWindow {
    id: root
    anchors {
        top: true
    }
    implicitWidth: Screen.width
    implicitHeight: 30
    color: "#222222"

    MouseArea {
        id: hoverArea
        anchors.fill: parent
        hoverEnabled: true

        onEntered: {
            DrawerService.setDrawerState(true)
        }
        onExited: {
            DrawerService.setDrawerState(false)
        }
    }
}
