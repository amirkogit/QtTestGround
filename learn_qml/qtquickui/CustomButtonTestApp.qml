// Uses CustomButton
// No need to import because CustomButton.qml is in the same folder

import QtQuick 2.3

Column {
    CustomButton {
        width:50
        height:50
        // this uses a default color
    }

    CustomButton {
        x: 50
        width: 100
        height: 50
        color: "green"
    }

    CustomButton {
        width: 50
        height:50
        color: "orange"
    }
}
