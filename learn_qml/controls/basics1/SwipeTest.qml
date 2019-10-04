import QtQuick 2.0
import QtQuick.Controls 2.5

Rectangle {
    width: parent.width
    height: parent.height

    SwipeView {
        id: view

        currentIndex: 0
        anchors.fill: parent

        Item {
            id: firstPage
            //anchors.centerIn: parent
            Text {
                id: firstText
                text: qsTr("Page 1")
            }
        }
        Item {
            id: secondPage
            Text {
                id: secondText
                text: qsTr("Page 2")
            }
        }
        Item {
            id: thirdPage
            Text {
                id: thirdText
                text: qsTr("Page 3")
            }
        }
    }

    PageIndicator {
        id: indicator

        count: view.count
        currentIndex: view.currentIndex

        anchors.bottom: view.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Button {
        anchors.bottom: view.bottom
        anchors.bottomMargin: 50
        anchors.right: view.right
        anchors.rightMargin: 50
        text: qsTr("Next")
        onClicked: view.incrementCurrentIndex()
        enabled: view.currentIndex < view.count - 1

    }

    Button {
        anchors.bottom: view.bottom
        anchors.bottomMargin: 50
        text: qsTr("Previous")
        onClicked: view.decrementCurrentIndex()
        enabled: view.currentIndex != 0
    }
}
