import QtQuick 2.3
import QtQuick.Controls 1.2
//import "qrc:/asrqml/" as AsrQml

AsrWorkflowButton {
    AsrTheme { id: theme }

    anchors.bottom: parent.bottom
    anchors.top: parent.top

    id: main

    property bool selected: false

    defaultTextColor: theme.setupTabColors.TextDefault
    _textColor: defaultTextColor
    _borderColor: theme.setupTabColors.BorderDefault
    _backgroundColor: theme.setupTabColors.BackgroundDefault

    state: selected ? "current" : "waiting"

    states: [
        State {
            name: "waiting"
            PropertyChanges {
                target: main;
                _borderColor: theme.setupTabColors.BorderDefault
            }
        },
        State {
            name: "current"
            PropertyChanges {
                target: main;
                _borderColor: theme.setupTabColors.BorderCurrent
                _textColor: theme.setupTabColors.TextCurrent
            }
        }
    ]
}
