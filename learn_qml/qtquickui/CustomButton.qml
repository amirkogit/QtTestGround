// CustomButton.qml
// Defining Custom QML Types for Re-use
// This button can be used by other qml pages as
// CustomButton {width:50; height:50;}

import QtQuick 2.3

Rectangle {
    width: 100
    height: 100
    color: "blue"

    MouseArea {
        anchors.fill: parent
        onClicked: console.log("Button clicked")
    }
}
