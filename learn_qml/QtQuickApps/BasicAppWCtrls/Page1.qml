import QtQuick 2.7

Page1Form {
    // fill the combo box items
    comboBox1.model:["Item 1", "Item 2", "Item 3"]

    // all signal handlers for the controls in Page1 can be done here as follows
    comboBox1.onActivated: {
        console.log("ComboBox1 activated.")
    }

    button1.onClicked: {
        console.log("Button 1 clicked.");
    }

    button2.onClicked: {
        console.log("Button 2 clicked.");
    }
}
