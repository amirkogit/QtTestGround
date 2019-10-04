import QtQuick 2.0

DarkSquare {
    width: 200
    height: 400

    ListView {
        anchors.fill: parent
        anchors.margins: 20

        clip: true

        model: 100

        delegate: numberDelegate
        spacing: 4

        snapMode: ListView.SnapToItem
    }

    Component {
        id: numberDelegate

        GreenSquare {
            width: 40
            height: 40
            text: index
        }
    }
}
