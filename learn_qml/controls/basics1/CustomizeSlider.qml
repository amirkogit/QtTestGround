import QtQuick 2.12
import QtQuick.Controls 2.12

Item{
    //property  alias width: 200 // make width accessible to outside
    //property alias width: control.availableWidth
    property real sliderWidth: 400
    property alias mycurrentValue : control.value

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
        value: mycurrentValue//0.25 * control.to
        from: 30
        to: 350
        stepSize:5
        snapMode:Slider.SnapOnRelease
        live:false

        background: Rectangle {
            x: control.leftPadding
            y: control.topPadding + control.availableHeight / 2 - height / 2
            implicitWidth: sliderWidth//200
            implicitHeight: 6//4
            width: control.availableWidth
            height: implicitHeight
            radius: 2
            //color: "#bdbebf"
            color: "grey"//"#b40337" // red
            border.color: "blue"

//            Rectangle {
//                width: control.visualPosition * parent.width
//                height: parent.height
//                //color: "#21be2b"
//                color: "grey"//"grey"//"green"//"#BBCCEE" // blue
//                radius: 2
//            }

            // progress
            Rectangle {
                id: progressBar
                width: 0
                height: parent.height
                color: "#4471ff"//LightishBlue
                radius: 2
            }

            // red zone
            Rectangle {
                id: maxZone
                width: 50
                height: parent.height
                x: control.availableWidth - this.width
                color: "#b40337" // rose red
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
            border.color: "red"//"#bdbebf"

            // show current value on the top of slider knob
            Text {
                id: label
                anchors.top: parent.top
                anchors.topMargin: -20
                text: control.valueAt(control.visualPosition)
                color: "white"
            }
        }

//        onMoved: {
//            currentValue.text = control.valueAt(control.visualPosition)

//            // simulate the increment of flow rate
//            //progressBar.width = progressBar.width + 0.2
//            progressBar.width = 0;
//            //timer.start()
//            //console.log("Restarted timer ...");
//        }

//        MouseArea {
//            anchors.fill: parent
//            onPressed: {
//                console.log("+++++++ mouse area...");
//                mouse.accepted = false // don't obscure the request to move the slider
//            }
//        }

        onPressedChanged: {
            console.log(">>> on pressed...");
        }

        onValueChanged: {
            console.log(">>> onvalue changed ... value = ", control.value.toFixed(0))
        }
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

    Timer {
        id: timer
        running: false
        //interval: 500
        repeat: true
        onTriggered: {
            console.log(">>> updating progress bar...");
            console.log(">>> current value: ", control.valueAt(control.visualPosition));
            console.log(">>> low: ", control.from);
            //var i;
            var knobPosition = control.valueAt(control.visualPosition);
            for(var i = control.from; i < knobPosition; i++) {
                progressBar.width = progressBar.width + 0.2
                if(progressBar.width >= knobPosition) {
                    //progressBar.width = 0;
                    timer.stop();
                }
            }
        }
    }
}


