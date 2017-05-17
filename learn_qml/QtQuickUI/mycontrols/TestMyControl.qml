import QtQuick 2.0

ListView {
    id: root

    // *********************************************************************
    // property declarations
    // *********************************************************************


    // *********************************************************************
    // signal declarations
    // *********************************************************************


    // *********************************************************************
    // JavaScript functions
    // *********************************************************************


    // *********************************************************************
    // object properties
    // *********************************************************************
    width: 300
    height: 300
    spacing: 10
    //enabled: false // disable all controls in this page

    // *********************************************************************
    // child objects
    // *********************************************************************
    model: VisualItemModel {
        MyButton {
            text: "Test Button"
            width: 0.98 * root.width
            height: 0.2 * root.height
            //enabled: false // disables the button
            color: "#00B000" // makes the background color green
            onClicked: console.log("Button clicked")
        }
    }

    // *********************************************************************
    // states
    // *********************************************************************


    // *********************************************************************
    // transitions
    // *********************************************************************
}
