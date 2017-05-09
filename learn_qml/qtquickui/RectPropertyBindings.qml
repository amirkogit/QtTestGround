import QtQuick 2.0

// demonstrates how property bindings work
// resizing of parent rectangle automatically adjusts the size of its child rectangles also

Rectangle {
    id: root
    width: 500
    height:400

    Rectangle {
        id: child1
        width: parent.width / 2
        height: parent.height
        color:"orange"
    }

    Rectangle {
        id: child2
        width: parent.width /2
        height: parent.height
        x: parent.width / 2
        color: "green"
    }

    // Add some animated texts
    // the value will be displayed at the center that changes periodically between 0 to 150
    property int animatedValue: 0

    SequentialAnimation on animatedValue {
        loops: Animation.Infinite
        PropertyAnimation {to: 150; duration: 1000}
        PropertyAnimation {to: 0; duration: 1000}
    }

    Text {
        anchors.centerIn: parent
        text: parent.animatedValue
        color: "black"
        font.pointSize: 15

    }
}
