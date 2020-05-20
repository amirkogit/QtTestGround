import QtQuick 2.0

Rectangle {
    color: "yellow"
    width: 100; height: 100

    MouseArea {
        anchors.fill: parent
        onClicked: console.log("clicked yellow")
    }

    Rectangle {
        color: "blue"
        width: 50; height: 50

        MouseArea {
            anchors.fill: parent
            propagateComposedEvents: true
            onClicked: {
                console.log("clicked blue")
                mouse.accepted = false
            }
        }
    }
}
