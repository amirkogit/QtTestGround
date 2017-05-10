import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Item {
    property alias button1: button1
    property alias button2: button2
    property alias comboBox1: comboBox1

    RowLayout {
        anchors.verticalCenterOffset: 69
        anchors.horizontalCenterOffset: -28
        anchors.centerIn: parent

        Button {
            id: button1
            text: qsTr("Press Me 1")
        }

        Button {
            id: button2
            text: qsTr("Press Me 2")
        }
    }

    BusyIndicator {
        id: busyIndicator1
        x: 49
        y: 29
    }

    Button {
        id: button3
        x: 163
        y: 29
        text: qsTr("Button")
    }

    CheckBox {
        id: checkBox1
        x: 291
        y: 29
        text: qsTr("Check Box")
    }

    CheckDelegate {
        id: checkDelegate1
        x: 438
        y: 29
        text: qsTr('Check Delegate')
    }

    ComboBox {
        id: comboBox1
        x: 33
        y: 109
    }

    Dial {
        id: dial1
        x: 455
        y: 96
        width: 123
        height: 132
    }

    Switch {
        id: switch1
        x: 189
        y: 109
        text: qsTr("Switch")
    }
}
