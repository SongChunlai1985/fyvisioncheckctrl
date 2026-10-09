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
                text: qsTr("Software Version")
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
                text: qsTr("Server Information")
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
            Layout.fillHeight: true
        }
        Rectangle {
            Layout.fillHeight: true
        }
    }
}
