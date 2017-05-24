import QtQuick 2.5
import QtQuick.Window 2.2
import org.qml_cpp_integration.example 1.0
import Qt.example.qjsvalueApi 1.0 as ExampleApi
import Qt.example.qjsmultiplevalueApi 1.0 as ExampleApiMultiple
import Qt.example.qobjectSingleton 1.0 as ExampleSingletonObj

Window {
    id: root
    visible: true
    width: 640
    height: 480
    title: qsTr("Integrating C++ and QML - Take 4")

    Item {
        id: singletonHolder
        property int intVal: ExampleSingletonObj.MySingletonObjApi.propertyInt
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            ExampleSingletonObj.MySingletonObjApi.propertyInt = ExampleSingletonObj.MySingletonObjApi.propertyInt + 1;
        }

        onDoubleClicked: {
           var result = ExampleSingletonObj.MySingletonObjApi.someInvokableFunction()
        }
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

    // following will give an error message: "Cannot create a class of type UncreatableType"
//    UncreatableType {

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
        Text {
            text: "From UncreatableType -> Value of Tuesday: " + UncreatableType.TUESDAY
        }
        Text {
            text: "Value of (someProperty): " + ExampleApi.MyApi.someProperty
        }
        Text {
            text: "MultiValue of (propertyInt): " + ExampleApiMultiple.MultipleValueProvider.propertyInt
        }
        Text {
            text: "MultiValue of (propertyString): " + ExampleApiMultiple.MultipleValueProvider.propertyString
        }
        Text {
            text: "MultiValue of (propertyDate): " + ExampleApiMultiple.MultipleValueProvider.propertyDate
        }
        Text {
            text: "Singleton type - [default val] (propertyInt): " + ExampleSingletonObj.MySingletonObjApi.propertyInt
        }
        Text {
            text: "Singleton type - [default val] (propertyString): " + ExampleSingletonObj.MySingletonObjApi.propertyString
        }
        Text {
            text: "Singleton value from local Item definition: " + singletonHolder.intVal
        }
        Text {
            text: ">>> Click anywhere on window to change the Singleton type value (propertyInt)"
            color:"red"
        }
        Text {
            text: ">>> Double click anywhere on window to rest the Singleton type value (propertyInt) back to 1000"
            color:"red"
        }
    }
}

