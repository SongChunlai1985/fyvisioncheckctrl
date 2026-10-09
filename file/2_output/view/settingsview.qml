import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "subview"

Page {
    header: ToolBar {
        RowLayout {
            spacing: 0

            Button {
                text: qsTr("Home")
                onClicked: rootstackview.pop()
            }
            Button {
                text: qsTr("Settings")
                enabled: false
            }
        }
    }

    Rectangle {
        anchors.fill: parent

        RowLayout {
            id: rowlayout
            anchors.fill: parent
            spacing: 0

            Rectangle {
                Layout.preferredWidth: parent.width * 0.2
                Layout.fillHeight: true

                ColumnLayout {
                    id: columnlayout
                    anchors.fill: parent
                    spacing: 0

                    Button {
                        Layout.preferredWidth: parent.width
                        text: qsTr("System Information")

                        onClicked: {
                            loader.source = "subview/systeminformation.qml"
                        }
                    }

                    Button {
                        Layout.preferredWidth: parent.width
                        text: qsTr("TV Settings")

                        onClicked: {
                            loader.source = "subview/tvinformation.qml"
                        }
                    }

                    Rectangle {
                        Layout.fillHeight: true
                    }
                }
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true

                Loader {
                    id: loader
                    anchors.fill: parent
                    anchors.margins: 10
                    source: "subview/systeminformation.qml"
                }
            }
        }
    }
}
