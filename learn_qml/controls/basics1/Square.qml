import QtQuick 2.5

Rectangle {
    width: 100
    height: width
    border.color: Qt.lighter(color)
    color: "#4471ff"
    property alias text: label.text

    Text {
        id: label
        anchors.centerIn: parent
        color: "#f0f0f0"
    }

    MouseArea {
        anchors.fill: parent
        drag.target: parent
    }
}
