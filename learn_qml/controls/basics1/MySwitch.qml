import QtQuick 2.0

Rectangle {
    id: root

    // public
    property bool checked: false

    signal clicked(bool checked);  // onClicked:{root.checked = checked;  print('onClicked', checked)}

    // private
    width: 250;  height: 50 // default size
    //border.width: 0.05 * root.height
    border.width: 0.05
    radius:       0.5  * root.height
    color:        checked? '#04f3a7' : '#9e9e9e' // background  "BrightSeaGreen" : "#04f3a7",#151515
    opacity:      enabled  &&  !mouseArea.pressed? 1: 0.3// disabled/pressed state

    Text {
        //text:  checked?    'On': 'Off'
        text: checked? 'L1' : 'L1'
        color: checked? '#616161': '#616161'
        x:    (checked? 0: pill.width) + (parent.width - pill.width - width) / 2
        font.pixelSize: 0.5 * root.height
        anchors.verticalCenter: parent.verticalCenter
    }

    Rectangle { // pill
        id: pill

        x: checked? root.width - pill.width: 0 // binding must not be broken with imperative x = ...
        width: root.height;  height: width // square
        //border.width: parent.border.width
        border.width: 0.05
        radius:       parent.radius
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent

        drag {
            target:   pill
            axis:     Drag.XAxis
            minimumX: 0
            maximumX: root.width - pill.width
        }

        onReleased: { // releasing at the end of drag
            if( checked  &&  pill.x < root.width - pill.width)  root.clicked(false) // right to left
            if(!checked  &&  pill.x)                            root.clicked(true ) // left  to right
        }

        onClicked: root.clicked(!checked) // emit
    }
}
