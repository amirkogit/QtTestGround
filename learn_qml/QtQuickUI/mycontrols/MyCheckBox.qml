// Demonstrates how to built a basic control - CheckBox from scratch using only
// QML primitives like Item, Rectangle, Text, MouseArea, ListView, GridView,
// Row, Column, Grid, Repeater and Canvas
//
// https://www.ics.com/blog/creating-qml-controls-scratch

import QtQuick 2.0

Item {
    id: root

    // *********************************************************************
    // property declarations
    // *********************************************************************
    property string text: "check_box_text"
    property bool checked: false
    property real padding: 0.1
    property bool radio: false // false: check box, true: radio button
    property color box_color: 'orange'  // allows user to fine tune the display color of box portion of checkbox
    property color text_color: 'black'  // allows user to fine tune the text color displayed next to checkbox
                                        // This color property allows the user to configure the color which otherwise
                                        // would be impossible from the client code

    // *********************************************************************
    // signal declarations
    // *********************************************************************
    signal clicked(bool checked)

    // *********************************************************************
    // JavaScript functions
    // *********************************************************************


    // *********************************************************************
    // object properties
    // *********************************************************************
    width: 250
    height: 50
    opacity: enabled ? 1 : 0.3

    // *********************************************************************
    // child objects
    // *********************************************************************
    Rectangle {
        id: rectangle

        height: root.height * (1 - 2 * padding)
        width: height
        x: padding * root.height
        anchors.verticalCenter: parent.verticalCenter
        border.width: 0.05 * root.height
        radius: (radius ? 0.5 : 0.2) * height
        color: root.box_color

        Text {
            visible: checked && !radio
            anchors.centerIn: parent
            text: '\u2713' // http://www.fileformat.info/info/unicode/char/2713/index.htm
            font.pixelSize: parent.height
        }

        Rectangle {
            visible: checked && radio
            color: 'black'
            width: 0.5 * parent.width
            height: width
            radius: 0.5 * width
        }
    }

    Text {
        id: text
        text: root.text
        anchors {
            left: rectangle.right
            verticalCenter: rectangle.verticalCenter
            margins: padding * root.height
        }
        font.pixelSize: 0.5 * root.height
        color: root.text_color
    }

    MouseArea {
        anchors.fill: parent
        onPressed: parent.opacity = 0.5
        onReleased: parent.opacity = 1
        onCanceled: parent.opacity = 1
        onClicked: {
            if(!radio) checked = !checked
            root.clicked(checked) // emit signal
        }
    }


    // *********************************************************************
    // states
    // *********************************************************************


    // *********************************************************************
    // transitions
    // *********************************************************************
}
