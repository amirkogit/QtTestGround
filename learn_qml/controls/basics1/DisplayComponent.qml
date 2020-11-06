import QtQuick 2.0

Rectangle {
    id: self

    property alias displayCaption: displayCaption.text
    property alias displayValue: displayValue.text

    property int fontSize: 16

    width: captionBackground.width + valueBackground.width
    height: 50

    border.color: "black"

    Rectangle {
        id: captionBackground
        color: "green";
        width: 300; height: parent.height
        border.color: "red"

        Text {
            id: displayCaption
            text: " "
            font.bold: true
            font.pointSize: fontSize
            color: "white"
        }
    }

    Rectangle {
        id: valueBackground
        color: "orange"
        width: 80; height: parent.height
        border.color: "red"
        anchors.left: captionBackground.right
        anchors.leftMargin: 5

        Text {
            id: displayValue
            text: " "
            font.bold: true
            font.pointSize: fontSize
            color: "white"
            elide: Text.ElideLeft
        }
    }
}
