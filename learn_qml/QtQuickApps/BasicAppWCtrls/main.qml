import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1 {

        }

        Page {
            Label {
                text: qsTr("Second page")
                anchors.centerIn: parent
            }

            // controls can also be added here directly
            ComboBox {
                id: comboBox2
                x: 33
                y: 109
                model: ["First", "Second", "Third"]
            }

            Dial {
                id: dial2
                x: 455
                y: 96
                width: 123
                height: 132
            }
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
        TabButton {
            text: qsTr("First")
        }
        TabButton {
            text: qsTr("Second")
        }
    }
}
