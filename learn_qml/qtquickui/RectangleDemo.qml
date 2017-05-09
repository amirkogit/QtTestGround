// Demonstrates the usage of Rectangle properties and MouseArea properties within a Rectangle

import QtQuick 2.0

Rectangle {
    width: 500
    height: 500
    color:"green"
    radius:10

    onWidthChanged: console.log("Width has changed to:", width)
    onColorChanged: console.log("Color has changed to:", color)
    onHeightChanged: console.log("Height has changed to:",height)

    Text {
        id:menudescription
        text:"1. Single click to change to white. \n2. Double click to change to green"

    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton

        onClicked: {
            console.log("mouse button clicked")
            parent.color = "white"
            console.log("rectangle color changed to red")
        }

        onDoubleClicked: {
            console.log("mouse button double clicked")
            parent.color = "green"
            console.log("rectangle color changed to green")
        }

        onPressed: {
            console.log("mouse button pressed")
            console.log("mouse position: " + mouse.x + " " + mouse.y)

            if (mouse.button == Qt.LeftButton) {
                console.log("   left button pressed")
            }
            if(mouse.button == Qt.RightButton) {
                console.log("   right button pressed")
            }
        }

        onReleased: {
            console.log("mouse button released")
        }

        onPressAndHold: {
            console.log("mouse pressed and hold")
        }
    }

    // loads the image and displays in the center (even the window is resized)
    Image {
        source:"../images/rocket.png"
        anchors.centerIn: parent
    }
}
