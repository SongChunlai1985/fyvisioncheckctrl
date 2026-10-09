import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Rectangle {
    id: systeminformation
    anchors.fill: parent

    GridLayout {
        columns: 2
        anchors.fill: parent
        rowSpacing: height * 0.05

        Rectangle {
            Layout.preferredWidth: parent.width * 0.3
            Layout.preferredHeight: parent.height * 0.05

            Text {
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("TV Information")
            }
        }
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.05
            border.color: "black"

            Text {
                anchors.verticalCenter: parent.verticalCenter
                text: "1"
            }
        }
        Rectangle {
            Layout.preferredWidth: parent.width * 0.3
            Layout.preferredHeight: parent.height * 0.05

            Text {
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("Distance to TV")
            }
        }
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.05
            border.color: "black"

            Text {
                anchors.verticalCenter: parent.verticalCenter
                text: "2"
            }

//            Slider {
//                id: slider
//                anchors.verticalCenter: parent.verticalCenter
//                width: parent.width

//                from: 2
//                to: 8
//                value: 5
//                stepSize: 0.1

//                handle: Rectangle {
//                        x: slider.leftPadding + slider.visualPosition * (slider.availableWidth - width)
//                        y: slider.topPadding + slider.availableHeight / 2 - height / 2
//                        implicitWidth: 10
//                        implicitHeight: 10
//                        radius: 10
//                        color: slider.pressed ? "#f0f0f0" : "#f6f6f6"
//                        border.color: "#bdbebf"
//                    }
//            }
        }
        Rectangle {
            Layout.fillHeight: true
        }
        Rectangle {
            Layout.fillHeight: true
        }
    }
}
