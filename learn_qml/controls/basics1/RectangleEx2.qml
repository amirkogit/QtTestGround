import QtQuick 2.0

Rectangle {
    id: root

    property var colorPalette: {
        "BrightSeaGreen" : "#04f3a7",
        "CharcoalGrey" : "#292c33",
        "BattleshipGrey" : "#666e7f",
        "Dark" : "#1d1f24",
        "RoseRed" : "#b40337",
        "Black" : "#000000",
        "LightishBlue" : "#4471ff",
        "DarkishBlue" : "#00228d",
        "MonarchGold" : "#daa824",
        "BlueBlue" : "#2450da",
        "BarneyPurple" : "#8e0ba7",
        "Purple" : "#79108d",
        "PeachyPink" : "#ff9c89",
        "CharcoalGrey" : "#333740",
        "NeonPurple" : "#d328f3",
        "White" : "#ffffff",
        "Grey" : "#9aa5bf"
    }

    Rectangle {
        id: rect1
        x: 12; y: 12
        width: 76; height: 96
        color: colorPalette.BattleshipGrey

        MouseArea {
            id: mouseArea1
            anchors.fill: parent
            onClicked: {
                status.text = mouseArea1.mouseX + " " + mouseArea1.mouseY
            }
        }
    }

    Rectangle {
        id: rect2
        x: 120; y: 12
        width: 76; height: 96
        border.color: "lightsteelblue"
        border.width: 4
        radius: 6

        MouseArea {
            id: mouseArea2
            anchors.fill: parent
            onClicked: {
                status.text = mouseArea2.mouseX + " " + mouseArea2.mouseY
            }
        }
    }

    Rectangle {
        id: rect3
        x: 260
        y: 12
        width: 76
        height: 96
        gradient: Gradient {
            GradientStop { position:  0.0; color: "lightsteelblue" }
            GradientStop { position: 1.0; color: "slategray" }
        }
        border.color: "slategray"

        MouseArea {
            id: mouseArea3
            anchors.fill: parent
            onClicked: {
                status.text = mouseArea3.mouseX + " " + mouseArea3.mouseY
            }
        }
    }

    Text {
        id: status
        text: "test"
        color: "blue"
        font.family: "Ubuntu"
        font.pixelSize: 24
        anchors.left: rect3.right
        anchors.top: rect3.bottom
    }
}


