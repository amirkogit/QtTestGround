// Demonstrates how to built a basic control - Button from scratch using only
// QML primitives like Item, Rectangle, Text, MouseArea, ListView, GridView,
// Row, Column, Grid, Repeater and Canvas
//
// https://www.ics.com/blog/creating-qml-controls-scratch

import QtQuick 2.0

Rectangle {
    id: root

    // *********************************************************************
    // property declarations
    // *********************************************************************
    property string text: "button_text"

    // *********************************************************************
    // signal declarations
    // *********************************************************************
    signal clicked()

    // *********************************************************************
    // JavaScript functions
    // *********************************************************************


    // *********************************************************************
    // object properties
    // *********************************************************************
    width: 250
    height: 50
    border.width: 0.05 * root.height
    radius: 0.5 * root.height
    opacity: enabled ? 1 : 0.3


    // *********************************************************************
    // child objects
    // *********************************************************************
    Text {
        text: root.text
        font.pixelSize: 0.5 * root.height
        anchors.centerIn: parent
    }

    MouseArea {
        anchors.fill: parent
        onPressed: parent.opacity = 0.5
        onReleased: parent.opacity = 1
        onCanceled: parent.opacity = 1
        onClicked: root.clicked() // emit signal
    }

    // *********************************************************************
    // states
    // *********************************************************************


    // *********************************************************************
    // transitions
    // *********************************************************************
}
