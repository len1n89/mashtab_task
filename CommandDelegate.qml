import QtQuick 2.0
import QtQuick.Controls 2.12

Item {

    anchors.left: parent.left
    anchors.right: parent.right
    width: 200; height: 50

    Row {
        Text {
            id: picture
            text: commandPicture
        }
        Text {
            id: name
            text: commandName
        }
        Switch {
            text: qsTr("Wi-Fi")
        }
    }
}
