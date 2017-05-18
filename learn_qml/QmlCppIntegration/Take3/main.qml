import QtQuick 2.5
import QtQuick.Window 2.2
import org.qml_cpp_integration.example 1.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Integrating C++ and QML - Take 3")

    MouseArea {
        anchors.fill: parent
        onClicked: {
            Qt.quit();
        }
    }

    Message {
        id: msg
    }

    Column {
        Text {
            text: "Take 3"
        }

        Text {
            text: 'name: ' + msg.author.name
        }

        Text {
            text: 'email: ' + msg.author.email
        }
    }
}

