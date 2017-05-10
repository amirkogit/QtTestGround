// demonstrates how following object attributes work
// 1. id attributes
// 2. property attributes

import QtQuick 2.0

//Component {

//}

Column {
    width: 200; height: 300

    // define an inline component
    Component {
        id: inlineComponent // id attribute

        Rectangle {
            id: customSquare // id attribute
            color: "red"
            width: 50; height: 50

            // some property attributes
            property color previousColor
            property color nextColor

            // QML basic types can also be used as valid property declaration
            property int someNumber
            property string someString
            property url someUrl

            // var is a generic placeholder type holding any types of values
            property var someFloatingNumber: 1.5
            property var someConstString: "abc"
            property var someBool: true
            property var someList: [1, 2, "three", "four"]
            property var someObject: Rectangle { width: 100; height: 100; color: "red" }

            onNextColorChanged: {
                console.log("The next color will be: " + nextColor.toString())
            }
        }
    }

    // first item in the column
    TextInput {
        id: myTextInput
        text: "Hello World"
    }

    // second item in the column
    Text {
        text: myTextInput.text // can access the property of 'myTextInput'
        color: "green"
    }

    // dynamically load the component inline (3rd item in column)
    Loader {
        sourceComponent: inlineComponent
    }

    // dynamically load the component (4th item in column)
    Loader {
        sourceComponent: inlineComponent
    }
}
