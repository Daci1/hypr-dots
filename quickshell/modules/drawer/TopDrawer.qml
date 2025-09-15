import Quickshell
import QtQuick
import Quickshell.Wayland
import QtQuick.Layouts
import "root:modules/bar"
import "root:services"

PanelWindow {
    id: root
    exclusionMode: ExclusionMode.Ignore

    implicitWidth: 400
    implicitHeight: 200
    color: "transparent"

    visible: DrawerService.isDrawerOpen

    anchors {
        top: true
        left: true
    }

    margins {
        top: topBar.height
        left: leftBar.width + 90
    }

    Item {
        id: animatedRowWrapper
        Behavior on x {
            NumberAnimation { duration: 300; easing.type: Easing.OutQuad }
        }

        onVisibleChanged: {
            if (DrawerService.isDrawerOpen) {
                animatedRowWrapper.x = 0
                animatedRowWrapper.opacity = 1
            } else {
                animatedRowWrapper.x = -animatedRowWrapper.width
                animatedRowWrapper.opacity = 0
            }
        }

        RowLayout{
            spacing: 0

            BarCorner {
                id: test1 // TODO

                Layout.alignment: Qt.AlignTop
                position: "top-right"
                shapeColor: "red"
                cornerRadius: 20
            }

            Canvas {
                id: overlay
                width: 200
                height: 200

                onPaint: {
                    var ctx = getContext("2d");
                    ctx.clearRect(0, 0, width, height);

                    ctx.fillStyle = "red";
                    var radius = 20;

                    ctx.beginPath();
                    ctx.moveTo(0, 0);
                    ctx.lineTo(width, 0);
                    ctx.lineTo(width, height - radius);
                    ctx.quadraticCurveTo(width, height, width - radius, height);
                    ctx.lineTo(radius, height);
                    ctx.quadraticCurveTo(0, height, 0, height - radius);
                    ctx.closePath();
                    ctx.fill();
                }

                Text {
                    anchors.centerIn: parent
                    text: "Overlay Text"
                    color: "white"
                    font.pixelSize: 18
                }
            }

            BarCorner {
                id: test

                Layout.alignment: Qt.AlignTop
                position: "top-left"
                shapeColor: "red"
                cornerRadius: 20
            }
        }
    }
}
