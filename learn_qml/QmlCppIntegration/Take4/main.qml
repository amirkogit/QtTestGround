import QtQuick 2.5
import QtQuick.Window 2.2
import org.qml_cpp_integration.example 1.0

Window {
    id: root
    visible: true
    width: 640
    height: 480
    title: qsTr("Integrating C++ and QML - Take 4")

    MouseArea {
        anchors.fill: parent
    }

    Instantiable {
        id:instantiable
        name: "some name"
        objectId: 5647
        creationDate: new Date()
    }

    // following doesn't work
//    NonInstantiable {

//    }

    Column {
        Text {
            text: "Take 4 (Registering C++ types with QML type system)"
        }
        Text {
            text: "ID: " + instantiable.objectId
        }
        Text {
            text: "Name: " + instantiable.name
        }
        Text {
            text: "Date: " + instantiable.creationDate
        }
    }
}

