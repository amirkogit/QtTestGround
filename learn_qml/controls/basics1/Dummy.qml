import QtQuick 2.0
import QtQuick.Controls 2.5

DarkSquare {
    width: 200
    height: 400

    Row {
        id: row32
        spacing: 20
        width: parent.width
        height: parent.height

        Column {
            id: column1
            spacing: 20

            GreenSquare {
                x: 20; y: 20
            }

            GreenSquare {
                x: 20; y: 20
            }

            GreenSquare {
                x: 20; y: 20
            }

        }

        Column {
            id: column2
            spacing: 20

            RedSquare {
                x: 20; y: 20
            }

            RedSquare {
                x: 20; y: 20
            }

        }
    }


}



//import QtQuick 2.0
//import QtQuick.Controls 2.5

//DarkSquare {
//    width: 200
//    height: 400

//    ListView {
//        anchors.fill: parent
//        anchors.margins: 20

//        clip: true

//        model: 10

//        delegate: numberDelegate
//        spacing: 4

//        snapMode: ListView.SnapToItem
//    }

//    Component {
//        id: numberDelegate

//        Rectangle {
//            width: 40
//            height: 40
//            color: "green"

//            Label {
//                text: index
//                color: "white"
//            }
//        }
//    }
//}
