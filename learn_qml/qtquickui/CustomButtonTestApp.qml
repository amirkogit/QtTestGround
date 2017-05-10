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

    // Notice that only orange button has signal handlers from CustomButton
    CustomButton {
        width: 50
        height:50
        color: "orange"

        // write signal handlers available in CustomButton
        onActivated: {
            console.log("(With double clicks) Activated at " + xPos + "," + yPos)
        }

        onDeactivated: {
            console.log("Deactivated!")
        }
    }
}
