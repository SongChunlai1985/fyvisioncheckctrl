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
                onClicked: rootstackview.pop()
            }
            Button {
                text: qsTr("Today Checklist")
                enabled: false
            }
        }
    }

    Rectangle {
        id: rectangle
        anchors.fill: parent

/*
        TableView {
            anchors.fill: parent
            columnSpacing: 1
            rowSpacing: 1
            clip: true

            model: TableModel {
                TableModelColumn { display: qsTr("Name") }
                TableModelColumn { display: qsTr("Student No") }
                TableModelColumn { display: qsTr("Class") }
                TableModelColumn { display: qsTr("Vision") }
                TableModelColumn { display: qsTr("Check Time") }

                rows: [
                    {
                        "Name": "leijiamin",
                        "Student No": "123456",
                        "Class": "1",
                        "Vision": "1.2/1.5",
                        "Check Time": "12:00AM 7/2/2020"
                    },
                    {
                        "Name": "leijiamin",
                        "Student No": "123456",
                        "Class": "1",
                        "Vision": "1.2/1.5",
                        "Check Time": "12:00AM 7/2/2020"
                    },
                    {
                        "Name": "leijiamin",
                        "Student No": "123456",
                        "Class": "1",
                        "Vision": "1.2/1.5",
                        "Check Time": "12:00AM 7/2/2020"
                    }
                ]
            }

            delegate: Rectangle {
                border.width: 1

                Text {
                    text: display
                    anchors.centerIn: parent
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: rootstackview.push("visioncheck.qml")
                }
            }
        }
*/
        Label {
            color: "#888888"
            text: "TableView Here"
            MouseArea {
                anchors.fill: parent
                onClicked: rootstackview.push("visioncheck.qml")
            }
        }

    }
}
