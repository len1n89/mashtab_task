import QtQuick 2.0
import QtQuick.Controls 2.12

Item {

    signal saveClicked()

    readonly property int fieldHeight: 50

    Column {
        width: 300
        height: 300
        spacing: 5
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        Label {
            text: "Picture Path:"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        TextField {
            id: pathInput

            text: ""
            width: parent.width
            height: fieldHeight
        }

        Label {
            text: "Command Name:"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        TextField {
            id: nameInput

            text: ""
            width: parent.width
            height: fieldHeight
        }
    }

    Button {
        id: saveButton

        text: "save"
        enabled: nameInput.text
        anchors.margins: 30
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        onClicked: {
            root.model.add(pathInput.text, nameInput.text)
            pathInput.text = ""
            nameInput.text = ""
            saveClicked()
        }
    }
}
