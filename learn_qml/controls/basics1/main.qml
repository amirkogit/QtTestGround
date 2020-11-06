import QtQuick 2.7
import QtQuick.Window 2.12
import "."

Window {
    visible: true
    width: 1024
    height: 900
    title: qsTr("Qml Playground")

    TestDisplay {
        x: 10; y: 10
    }

//    TestMouseArea {
//        x: 20; y: 20
//        width: 200; height: 200
//    }

//    TestCombo {
//        x: 10; y: 20
//    }

//    TestCombo {
//        x: 160; y: 50
//    }

    // ========================================================================================

//        Dummy {

//        }

    // ========================================================================================

    //    RepeaterTest1 {
    //        x: 10; y: 20
    //    }

    // ========================================================================================

    //    MyText {
    //        x: 20; y: 30
    //    }

    // ========================================================================================

    // Test customized slider
//    DarkSquare {
//        x: 20; y: 20
//        width: 800; height: 300
//        CustomizeSlider {
//            anchors.centerIn: parent
//            width: 300
//            //sliderWidth: 400
//        }
//    }

    // ========================================================================================

    //    DarkSquare {
    //        x: 20; y: 20
    //        width: 200
    //        height: 300

    //        SwitchCustomize {
    //            anchors.centerIn: parent
    //        }
    //    }

    // ========================================================================================


    //    SwitchCustomize {
    //        x: 20; y:20
    //    }

    // ========================================================================================


    //    SwitchDelegateCustomize {
    //        x: 20; y:20
    //    }

    //        MySwitch {
    //            x: 20; y:20
    //            property bool backend: false
    //            checked: backend
    //            onClicked: backend = checked
    //        }

    //    TabButton {
    //        x: 20; y:20
    //        width: parent.width
    //        height: parent.height

    //    }


    //    KeysTest {

    //    }

    // ========================================================================================

    //    AnchorsDemo {

    //    }

    // ========================================================================================

    //        RepeaterTest {
    //            z:2
    //        }

    // ========================================================================================

//        RowTest {
//            x: 10
//            y: 10
//            z:1
//        }

    //    Square {
    //        x: 10
    //        y: 10
    //    }

    //    GreenSquare {
    //        x: 50
    //        y: 60
    //    }

    //    RectangleEx {
    //    }

    //    SwipeTest {
    //    }

    //    RectangleEx2 {

    //    }

    //    MyButton {
    //        id: button1
    //        boxcolor: "green"
    //    }

    //    MyText {

    //    }

    //    MyButton {
    //        id: button2
    //        anchors.left: button1.right + 100
    //    }

    //    Rectangle {
    //        id: box
    //        width: 100
    //        height: 100
    //        radius: 10
    //        color: "blue"
    //    }
}

