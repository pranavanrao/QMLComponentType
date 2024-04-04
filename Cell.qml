import QtQuick

Item {
    id: container
    property alias cellColor: rect.color
    signal clicked(cellColor: color)

    width: 40; height: 25

    Rectangle {
        id: rect
        border.color: "white"
        anchors.fill: parent
    }

    MouseArea {
        anchors.fill: parent
        onClicked: container.clicked(container.cellColor)
    }

}
