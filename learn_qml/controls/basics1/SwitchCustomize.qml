import QtQuick 2.12
import QtQuick.Controls 2.12

Switch {
    id: control
    text: qsTr("L1")
    //checked:true

    indicator: Rectangle {
        implicitWidth: 80//48
        implicitHeight: 26
        x: control.leftPadding
        y: parent.height / 2 - height / 2
        radius: 13
        //color: control.checked ? "#17a81a" : "#ffffff"
        color: control.checked ? "#04f3a7" : "#9e9e9e"

        //border.color: control.checked ? "#17a81a" : "#cccccc"
        border.color: control.checked ? "#04f3a7" : "#9e9e9e"

        Rectangle {
            x: control.checked ? parent.width - width : 0
            width: 26
            height: 26
            radius: 13
            //color: control.down ? "#cccccc" : "#ffffff"
            //color: control.down ? "yellow" : "#ffffff"

//            border.color: control.checked ? (control.down ? "#17a81a" : "#21be2b") : "#999999"
        }
    }

    contentItem: Text {
        text: control.text
        font: control.font
        opacity: enabled ? 1.0 : 0.3
        //color: control.down ? "#17a81a" : "#21be2b"
        color: control.checked ? "#616161" : "#616161"
        verticalAlignment: Text.AlignVCenter
        //leftPadding: control.indicator.width + control.spacing
        leftPadding: 30
    }
}
