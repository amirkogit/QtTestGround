import QtQuick 2.0

Rectangle {
    id: mainDashboard

    color: "black"

    Column {
        spacing:5

        DisplayComponent {
            id: disp1
            displayCaption: "caption1"
            displayValue: "23"
        }

        DisplayComponent {
            id: disp2
            displayCaption: "caption2"
            displayValue: "233"
        }

        DisplayComponent {
            id: disp3
            displayCaption: "caption3"
            displayValue: "45"
        }
    }
}
