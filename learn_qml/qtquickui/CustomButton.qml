// CustomButton.qml
// Defining Custom QML Types for Re-use
// This button can be used by other qml pages as
// CustomButton {width:50; height:50;}

import QtQuick 2.3

Rectangle {
    id: root
    property int side: 100
    width: side
    height: side
    color: "blue"

    // signal handler attributes
    // these signals could be received by any CustomButton objects in another QML file in the same directory
    // handlers for these signals could be written in myapplication.qml file as:
    // onActivated: ....
    signal activated(real xPos, real yPos)
    signal deactivated // when there is no parameters, you can omit ()

    MouseArea {
        anchors.fill: parent

        // following are signal handlers for signals that are defined in MouseArea
        onClicked: console.log("Button clicked")

        onDoubleClicked: root.activated(mouse.x, mouse.y)   // when the user double clicks on the button, 'activated' signal
                                                            // is raised
        onReleased: root.deactivated()                      // when the user releases the mouse, 'deactivated' signal is raised
    }
}
