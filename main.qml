import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

import CommandModel 1.0

Window {
    id: root

    width: 480
    height: 720
    visible: true
    title: qsTr("Batogov")

    property CommandModel model: CommandModel {}

    Connections {
        target: commandScreen
        onOpenAddScreen: view.currentIndex = 1
    }

    Connections {
        target: addScreen
        onSaveClicked: view.currentIndex = 0
    }

    SwipeView {
        id: view

        currentIndex: 0
        anchors.fill: parent

        CommandScreen { id: commandScreen }

        AddScreen { id: addScreen }
    }

    PageIndicator {
        id: indicator

        count: view.count
        currentIndex: view.currentIndex
        anchors.bottom: view.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
