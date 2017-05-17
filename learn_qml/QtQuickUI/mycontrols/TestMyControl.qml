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
        // add a button
        MyButton {
            text: "Test Button"
            width: 0.98 * root.width
            height: 0.2 * root.height
            //enabled: false // disables the button
            color: "#00B000" // makes the background color green
            onClicked: console.log("Button clicked")
        }

        // add a checkbox
        MyCheckBox {
            text: "Test CheckBox"
            checked: true
            width: 0.98 * root.width
            height: 0.2 * root.width
            //box_color: 'green' // sets the color of the box portion in the check box
                                // if not specified would diplay the default color
            text_color: 'red' // sets the color of the text displayed next to the check box

            onCheckedChanged: console.log("OnCheckedChanged for a check box.")
        }
    }

    // *********************************************************************
    // states
    // *********************************************************************


    // *********************************************************************
    // transitions
    // *********************************************************************
}
