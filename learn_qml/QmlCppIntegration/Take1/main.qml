import QtQuick 2.5
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Integrating C++ and QML")

    MouseArea {
        anchors.fill: parent
        onClicked: {
            Qt.quit();
        }
    }

    Text {
        text: msg.author // invokes Message::author() to get this value
        anchors.centerIn: parent
    }

    Text {
        text: msg.body.description // invokes Message::setBody() to get this value
    }

    Component.onCompleted: {
        msg.author = "New author name set from QML!" // this invokes Message::setAuthor()
        msg.body.description = "{Message description set in MessageBody}" // this invokes Message::setBody()
    }
}

