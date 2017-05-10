import QtQuick 2.5

Rectangle {
    property alias mouseArea: mouseArea

    width: 360
    height: 360

    MouseArea {
        id: mouseArea
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.fill: parent

        Rectangle {
            id: rectangle1
            x: 37
            y: 21
            width: 114
            height: 51
            color: "#55ffff"
        }

        Image {
            id: image1
            x: 205
            y: 26
            width: 100
            height: 100
            z: 1
            source: "../../images/symbol.png"
        }

        TextInput {
            id: textInput1
            x: 31
            y: 246
            width: 218
            height: 20
            text: qsTr("input some text here ...")
            cursorVisible: true
            inputMask: qsTr("")
            font.pixelSize: 12
        }
    }

    Text {
        anchors.centerIn: parent
        text: "Hello World"
    }
}
