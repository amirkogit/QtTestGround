import QtQuick 2.0

BrightSquare {
    id: root
    width: 1000
    height: 120

    Row {
        id: row
        anchors.centerIn: parent
        spacing: 10
        GreenSquare {}
        BlueSquare {}
        RedSquare {}
        DarkSquare {}
        BlueSquare {}
    }
}
