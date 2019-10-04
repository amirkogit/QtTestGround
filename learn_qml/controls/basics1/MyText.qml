import QtQuick 2.0

Item {
    Text {
        id: msg
        text: qsTr("Some message")
        color:"red"
    }

    Rectangle {
        id: menuPanel
        color: "#1d1f24" // dark :#1d1f24 // #30333b
        width: 200
        height: 300
    }

    Rectangle {
        id: workFlow
        color: "#30333b" // dark :#1d1f24 // #30333b
        width: 200
        height: 300
        anchors.left: menuPanel.right
        anchors.leftMargin: 0
    }
}
