import QtQuick
import Quickshell
import Quickshell.Wayland

PanelWindow {
    id: root

    exclusionMode: ExclusionMode.Auto
    focusable: false
    aboveWindows: true

    WlrLayershell.namespace: "NibrasShell:EdgeCorner"
    WlrLayershell.keyboardFocus: WlrKeyboardFocus.None
    mask: Region {}

    color: "transparent"
    property real cornerRadius: 12 * 2

    // Acceptable strings
    property string vertical: "top"    // "top" or "bottom"
    property string horizontal: "left" // "left" or "right"
    property string _color: "#222222"

    // Validate input
    Component.onCompleted: {
        if (["top","bottom"].indexOf(vertical) === -1) vertical = "top";
        if (["left","right"].indexOf(horizontal) === -1) horizontal = "left";
    }

    // Derived position string
    property string positionStr: `${vertical}-${horizontal}`

    // Anchors
    anchors.top: vertical === "top"
    anchors.bottom: vertical === "bottom"
    anchors.left: horizontal === "left"
    anchors.right: horizontal === "right"

    BarCorner {
        id: barCorner

        anchors.top: vertical === "top" ? parent.top : undefined
        anchors.bottom: vertical === "bottom" ? parent.bottom : undefined
        anchors.left: horizontal === "left" ? parent.left : undefined
        anchors.right: horizontal === "right" ? parent.right : undefined

        position: positionStr
        cornerRadius: root.cornerRadius
        shapeColor: root._color
    }
}
