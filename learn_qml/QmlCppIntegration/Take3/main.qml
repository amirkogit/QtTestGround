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
            var result = msg_board.postMessage("Hello from QML") // invokes postMessage (Q_INVOKABLE) on C++ side
            console.log("Result of postMessage(): ", result)
            msg_board.refresh()
        }
    }

    Message {
        id: msg
    }

    MessageBoard {
        id: msg_board
        onNewMessagePosted: console.log("New message received:",subject) // invoked when 'newMessagePosted' signal is emitted from C++
    }

    Column {
        Text {
            text: "Take 3"
        }

        Text {
            text: 'name: ' + msg.author.name    // invokes name() of MessageAuthor on C++
                                                // Note here that we do not need to explicitly define MessageAuthor because
                                                // this is embedded in Message class (in C++) and exposed to QML as grouped property
        }

        Text {
            text: 'email: ' + msg.author.email // invokes email() of MessageAuthor on C++
        }
    }
}

