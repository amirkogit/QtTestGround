import QtQuick 2.5
import QtQuick.Window 2.2
import org.qml_cpp_integration.example 1.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Integrating C++ and QML - Take 2")

    MouseArea {
        anchors.fill: parent
        onClicked: {
            Qt.quit();
        }
    }

    Message {
        id: msg
        author: "New author name set." // invokes Message::setAuthor()
        body: MessageBody {
            description: "MessageBody description set" // invokes Message::setBody()
        }
    }

    Column {
        Text {
            text: "Take 2"
        }

        Text {
            text: msg.author // invokes Message::author()
        }

        Text {
            text: msg.body.description // invokes Message::body()
        }
    }
}

