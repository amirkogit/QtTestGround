import QtQuick 2.12
import QtQuick.Controls 2.12

Item{
    //property  alias width: 200 // make width accessible to outside
    //property alias width: control.availableWidth
    property real sliderWidth: 300

    // low range
    Label {
        id: from
        text: control.from
        color: "white"
        anchors.right: control.left
        anchors.rightMargin: 10
    }

    // current value
    Label {
        //x: control.leftPadding + control.visualPosition * (control.availableWidth - width)
        //y: control.topPadding + control.availableHeight / 2 - height / 2
        id: currentValue
        text: control.value
        color: "white"
        //anchors.top: control.top
        //anchors.topMargin: -50
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        visible: false
    }

    Slider {
        id: control
        value: 0.5 * control.to
        from: 30
        to: 350
        stepSize:10

        background: Rectangle {
            x: control.leftPadding
            y: control.topPadding + control.availableHeight / 2 - height / 2
            implicitWidth: sliderWidth//200
            implicitHeight: 4
            width: control.availableWidth
            height: implicitHeight
            radius: 2
            //color: "#bdbebf"
            color: "red"//"#b40337" // red

            Rectangle {
                width: control.visualPosition * parent.width
                height: parent.height
                //color: "#21be2b"
                color: "green"//"#BBCCEE" // blue
                radius: 2
            }
        }

        // slider knob
        handle: Rectangle {
            x: control.leftPadding + control.visualPosition * (control.availableWidth - width)
            y: control.topPadding + control.availableHeight / 2 - height / 2
            implicitWidth: 26
            implicitHeight: 26
            radius: 13
            //color: control.pressed ? "#f0f0f0" : "#f6f6f6"
            //color: control.pressed ? "#f0f0f0" : "#f6f6f6"
            color: "#f0f0f0"
            border.color: "#bdbebf"

            // show current value on the top of slider knob
            Text {
                id: label
                anchors.top: parent.top
                anchors.topMargin: -20
                text: control.valueAt(control.visualPosition)
                color: "white"
            }
        }

        onMoved: {
            currentValue.text = control.valueAt(control.visualPosition)

//            currentValue.x = 500
//            currentValue.y = 300
//            currentValue.forceLayout()
            //currentValue.visible = false
        }

//        MouseArea {
//            anchors.fill: parent
//            onReleased: {
//                console.log(">>>>> mouse released!! <<<<<<");
//            }
//        }
    }

    // max range
    Label {
        id: to
        text: control.to
        color: "white"
        anchors.left: control.right
        anchors.leftMargin: 10
        //anchors.top: control.top - 50
    }
}


