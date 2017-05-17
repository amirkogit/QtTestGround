// Demonstrates how to built a basic control - Switch from scratch using only
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
    property bool checked: false

    // *********************************************************************
    // object properties
    // *********************************************************************
    width: 250; height: 50
    border.width: 0.05 * root.height
    radius: 0.5 * root.height
    color: checked ? 'white' : 'black'
    opacity: enabled ? 1 : 0.3

    // *********************************************************************
    // child objects
    // *********************************************************************
    Text {
        text:  checked?    'On': 'Off'
        color: checked? 'black': 'white'
        x:    (checked? 0: pill.width) + (parent.width - pill.width - width) / 2
        font.pixelSize: 0.5 * root.height
        anchors.verticalCenter: parent.verticalCenter
    }

    MouseArea {
        anchors.fill: parent
        onPressed:    parent.opacity = 0.5 // down state
        onReleased:   parent.opacity = 1
        onCanceled:   parent.opacity = 1
        onClicked:    checked = !checked
    }

    Rectangle {
        id: pill

        x: checked? root.width - pill.width: 0 // binding must not be broken with imperative x = ...
        width: root.height;  height: width // square
        border.width: parent.border.width
        radius:       parent.radius

        MouseArea {
            anchors.fill: parent

            drag {
                target:   pill
                axis:     Drag.XAxis
                minimumX: 0
                maximumX: root.width - pill.width
            }

            onPressed:    parent.opacity = 0.5 // down state
            onReleased: { // releasing at the end of drag
                parent.opacity = 1
                if( checked  &&  pill.x < root.width - pill.width)  checked = false // right to left
                if(!checked  &&  pill.x)                            checked = true  // left  to right
            }
            onCanceled:   parent.opacity = 1
            onClicked:  checked = !checked // clicking on pill
        }
    }
}
