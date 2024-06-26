import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        id: page
        anchors.fill: parent

        Text {
            id: hello
            text: qsTr("QWERTY")
            y: 30
            anchors.horizontalCenter: page.horizontalCenter
            font.pointSize: 24
            font.bold: true

            MouseArea {id: mouseArea; anchors.fill: parent}

            states: State {
                name: "down"
                when: mouseArea.pressed === true

                PropertyChanges {
                    target: hello
                    y: 160
                    rotation: 180
                    color: "red"
                }
            }

            transitions: Transition {
                from: ""; to: "down"; reversible: true
                ParallelAnimation {
                    NumberAnimation { properties: "y.rotation"; duration: 500; easing.type: Easing.InOutQuad }
                    ColorAnimation { duration: 500 }
                }
            }
        }

        Grid {
            id: colorPicker
            x: 4; anchors.bottom: page.bottom; anchors.bottomMargin: 4
            rows: 2; columns: 3; spacing: 3

            Cell { cellColor: "red"; onClicked: hello.color = cellColor }
            Cell { cellColor: "green"; onClicked: hello.color = cellColor }
            Cell { cellColor: "blue"; onClicked: hello.color = cellColor }
            Cell { cellColor: "yellow"; onClicked: hello.color = cellColor }
            Cell { cellColor: "steelblue"; onClicked: hello.color = cellColor }
            Cell { cellColor: "black"; onClicked: hello.color = cellColor }
        }
    }
}
