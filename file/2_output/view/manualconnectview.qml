import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Qt.labs.qmlmodels 1.0

Page {
    header: ToolBar {
        RowLayout {
            spacing: 0

            Button {
                text: qsTr("Home")
                onClicked: {
                    rootstackview.pop();
                    rootstackview.pop();
                }
            }
            Button {
                text: qsTr("Connect TV")
                onClicked: rootstackview.pop()
            }
            Button {
                text: qsTr("Manual Connect")
                enabled: false
            }
        }
    }

    Rectangle {
        id: rectangle
        anchors.fill: parent

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 10

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: parent.height * 0.7

                TableView {
                    anchors.fill: parent
                    columnSpacing: 1
                    rowSpacing: 1
                    clip: true

                    /*model: TableModel {
                        TableModelColumn { display: qsTr("IP") }
                        TableModelColumn { display: qsTr("Name") }

                        rows: [
                            {
                                "IP": "leijiamin",
                                "Name": "123456"
                            },
                            {
                                "IP": "leijiamin",
                                "Name": "123456"
                            },
                            {
                                "IP": "leijiamin",
                                "Name": "123456"
                            }
                        ]
                    }*/

                    delegate: Rectangle {
                        border.width: 1

                        Text {
                            text: display
                            anchors.centerIn: parent
                        }
                    }
                }
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true

                Rectangle {
                    width: parent.width * 0.5
                    height: parent.height * 0.8
                    anchors.centerIn: parent

                    Button {
                        anchors.centerIn: parent
                        text: qsTr("Pair")
                    }
                }
            }
        }
    }
}
