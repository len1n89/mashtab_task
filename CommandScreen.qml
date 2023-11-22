import QtQuick 2.5
import QtQuick.Controls 2.12
import QtQml.Models 2.2
import QtQuick.Controls 1.4 as QtControls
import QtQuick.Layouts 1.3

Item {
    id: commandScreen

    readonly property int margin: 10

    signal openAddScreen()

    Button {
        id: addButton

        text: "add"
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: margin / 2
        onClicked: openAddScreen()
    }

    ListView {
        anchors.margins: margin / 2
        anchors.fill: parent
        anchors.topMargin: addButton.height + margin
        anchors.bottomMargin: margin * 2
        clip: true
        model: root.model
        delegate: delegate
    }

    Component {
        id: delegate

        Item {
            height: 50
            width: commandScreen.width - margin

            Rectangle {
                anchors.margins: 1
                anchors.fill: parent
                border {
                    color: "black"
                    width: 1
                }

                Image {
                    source: ipagePath
                    anchors.left: parent.left
                    anchors.leftMargin: margin
                    anchors.verticalCenter: parent.verticalCenter
                }

                Text {
                    width: 200
                    clip: true
                    text: commandName
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Switch {
                    anchors.right: parent.right
                }
            }
        }
    }
}
