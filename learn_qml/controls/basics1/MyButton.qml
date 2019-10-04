import QtQuick 2.0

Item {
    property string boxcolor: "blue"
    Rectangle {
        id: box
        width: 100
        height: 100
        radius: 10
        color: boxcolor
    }
}
